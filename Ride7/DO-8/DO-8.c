/*
 DO-8.c - Modbus RTU Slave controller (AT89C4051) for DO-8 Card. By Kaltchuk, Sep/2022.
*/

#include <REG51.h>
#include "Serial.h"
#include "EEPROM.h"
#include "ModbusSlave.h"

void main() {
    blink(5);

	numCoils = 8;
	numDiscreteInputs = 0;
	numHoldingRegisters = 4;

    P1 = 0;         // turn off all outputs.
	
	baud = 9600;	// factory set baud rate.
	id = 7;			// factory set modbus slave id.

	if (_FS == 1) {
		baud = EEPROMread(0);
		id =  EEPROMread(1);
        blink(2);
	}
	serialInit(baud);
	modbusBegin(baud);
	
	while (1) {
        modbusPoll();
	}
}