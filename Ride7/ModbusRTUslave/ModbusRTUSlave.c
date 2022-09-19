/*
Base for 2 modbus remote I/O cards - 16 digital inputs and 8 digital outputs.
 
Port1 is connected to the I/O bus. P1.0 and P1.1 need external pullup resistors.

Port3 has several especial pins:

P3.0: RX
P3.1: TX
P3.2: not used
P3.3: not used
P3.4: SEL0 (select lower word of digital input)
P3.5: SEL1 (select higher word of digital input)
P3.7: DE (RS485 drive enable)


*/

void timer0_isr() interrupt 1
{
    TH0 = 0xfc;        //Reload the timer value.
    TL0 = 0x66;

    milli++;
}

void milliStart(void) {
	ET0 = 0				//Disable TIMER0 interrupt while configuring it.
    TMOD |= 0x01;      //TIMER0 = mode_1.
    TH0 = 0xfc;        //Load the timer value for 1ms tick (crystal = 11.059MHz).
    TL0 = 0x66;
    TR0 = 1;           //Turn ON TIMER0.
    ET0 = 1;           //Enable TIMER0 Interrupt.
    EA = 1;            //Enable Global Interrupt.
	milli = 0;
}

void ModbusRTUslaveBegin(uint8_t id, uint32_t baud, uint8_t config) {
  if (baud >= 19200) {
    _charTimeout = 1;
    _frameTimeout = 2;
  }
  else {
    _charTimeout = 15000/baud;
    _frameTimeout = 35000/baud;
  }

  if (_dePin != 255) {		// <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
    digitalWrite(_dePin, LOW);
    pinMode(_dePin, OUTPUT);
  }
  
  do {
    if (RI != 0) {
		milliStart();
		RI = 0;
    }
  } while (milli < _frameTimeout);
}

void ModbusRTUslavePoll() {
  if (RI != 0) {				// serial read available?
    uint8_t i = 0;
    uint32_t startTime;
    do {
      if (Serial.available() > 0) {
        startTime = micros();
        _buf[i] = Serial.read();
        i++;
      }
    } while (micros() - startTime < _charTimeout && i < _bufSize);
    while (micros() - startTime < _frameTimeout);
    if (Serial.available() == 0 && (_buf[0] == _id || _buf[0] == 0) && _crc(i - 2) == _bytesToWord(_buf[i - 1], _buf[i - 2])) {
      switch (_buf[1]) {
        case 1: /* Read Coils */
          _processBoolRead(_numCoils, _coilRead);
          break;
        case 2: /* Read Discrete Inputs */
          _processBoolRead(_numDiscreteInputs, _discreteInputRead);
          break;
        case 3: /* Read Holding Registers */
          _processWordRead(_numHoldingRegisters, _holdingRegisterRead);
          break;
        case 4: /* Read Input Registers */
          _processWordRead(_numInputRegisters, _inputRegisterRead);
          break;
        case 5: /* Write Single Coil */
          {
            uint16_t address = _bytesToWord(_buf[2], _buf[3]);
            uint16_t value = _bytesToWord(_buf[4], _buf[5]);
            if (value != 0 && value != 0xFF00) _exceptionResponse(3);
            else if (address >= _numCoils) _exceptionResponse(2);
            else if (!_coilWrite(address, value)) _exceptionResponse(4);
            else _write(6);
          }
          break;
        case 6: /* Write Single Holding Register */
          {
            uint16_t address = _bytesToWord(_buf[2], _buf[3]);
            uint16_t value = _bytesToWord(_buf[4], _buf[5]);
            if (address >= _numHoldingRegisters) _exceptionResponse(2);
            else if (!_holdingRegisterWrite(address, value)) _exceptionResponse(4);
            else _write(6);
          }
          break;
        case 15: /* Write Multiple Coils */
          {
            uint16_t startAddress = _bytesToWord(_buf[2], _buf[3]);
            uint16_t quantity = _bytesToWord(_buf[4], _buf[5]);
            if (quantity == 0 || quantity > ((_bufSize - 10) << 3) || _buf[6] != _div8RndUp(quantity)) _exceptionResponse(3);
            else if ((startAddress + quantity) > _numCoils) _exceptionResponse(2);
            else {
              for (uint8_t j = 0; j < quantity; j++) {
                if (!_coilWrite(startAddress + j, bitRead(_buf[7 + (j >> 3)], j & 7))) {
                  _exceptionResponse(4);
                  return;
                }
              }
              _write(6);
            }
          }
          break;
        case 16: /* Write Multiple Holding Registers */
          {
            uint16_t startAddress = _bytesToWord(_buf[2], _buf[3]);
            uint16_t quantity = _bytesToWord(_buf[4], _buf[5]);
            if (quantity == 0 || quantity > ((_bufSize - 10) >> 1) || _buf[6] != (quantity * 2)) _exceptionResponse(3);
            else if (startAddress + quantity > _numHoldingRegisters) _exceptionResponse(2);
            else {
              for (uint8_t j = 0; j < quantity; j++) {
                if (!_holdingRegisterWrite(startAddress + j, _bytesToWord(_buf[j * 2 + 7], _buf[j * 2 + 8]))) {
                  _exceptionResponse(4);
                  return;
                }
              }
              _write(6);
            }
          }
          break;
        default:
          _exceptionResponse(1);
          break;
      }
    }
  }
}

void processBoolRead(uint16_t numBools, BoolRead boolRead) {
  uint16_t startAddress = _bytesToWord(_buf[2], _buf[3]);
  uint16_t quantity = _bytesToWord(_buf[4], _buf[5]);
  if (quantity == 0 || quantity > ((_bufSize - 6) * 8)) _exceptionResponse(3);
  else if ((startAddress + quantity) > numBools) _exceptionResponse(2);
  else {
    for (uint8_t j = 0; j < quantity; j++) {
      int8_t value = boolRead(startAddress + j);
      if (value < 0) {
        _exceptionResponse(4);
        return;
      }
      bitWrite(_buf[3 + (j >> 3)], j & 7, value);
    }
    _buf[2] = _div8RndUp(quantity);
    _write(3 + _buf[2]);
  }
}

void processWordRead(uint16_t numWords, WordRead wordRead) {
  uint16_t startAddress = _bytesToWord(_buf[2], _buf[3]);
  uint16_t quantity = _bytesToWord(_buf[4], _buf[5]);
  if (quantity == 0 || quantity > ((_bufSize - 6) >> 1)) _exceptionResponse(3);
  else if ((startAddress + quantity) > numWords) _exceptionResponse(2);
  else {
    for (uint8_t j = 0; j < quantity; j++) {
      int32_t value = wordRead(startAddress + j);
      if (value < 0) {
        _exceptionResponse(4);
        return;
      }
      _buf[3 + (j * 2)] = highByte(value);
      _buf[4 + (j * 2)] = lowByte(value);
    }
    _buf[2] = quantity * 2;
    _write(3 + _buf[2]);
  }
}

void exceptionResponse(uint8_t code) {
  _buf[1] |= 0x80;
  _buf[2] = code;
  _write(3);
}

void write(uint8_t len) {
  delay(responseDelay);
  if (buf[0] != 0) {
    uint16_t crc = _crc(len);
    buf[len] = lowByte(crc);
    buf[len + 1] = highByte(crc);
    digitalWrite(_dePin, HIGH);
    Serial.write(_buf, len + 2);
    Serial.flush();
    digitalWrite(_dePin, LOW);
  }
}

unsigned int crc(char len) {
  unsigned int crc = 0xFFFF;
  for (char i = 0; i < len; i++) {
    crc ^= (unsigned int)buf[i];
    for (char j = 0; j < 8; j++) {
      bool lsb = crc & 1;
      crc >>= 1;
      if (lsb == true) {
        crc ^= 0xA001;
      }
    }
  }
  return crc;
}

unsigned int div8RndUp(unsigned int value) {
  return (value + 7) >> 3;
}

unsigned int bytesToWord(char high, char low) {
  return (high << 8) | low;
}
