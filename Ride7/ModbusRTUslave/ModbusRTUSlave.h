// ModbusRTUSlave.h

// Create a main.c for DI16 and DO8 based on sources from ModbusRTUSlave

// Bit Addresses
at 0xB7 sbit pinDE
at 0xB5 sbit SEL1
at 0xB4 sbit SEL0
at 0xB3 sbit pinFactory

#define MAXBUF	10

// Global Variables
char buf[MAXBUF];
char numCoils = 0;
char numDiscreteInputs = 0;
char numHoldingRegisters = 0;
char numInputRegisters = 0;
unsigned int charTimeout;
unsigned int frameTimeout;

unsigned int milli;
char id = 7;
unsigned int baud = 9600;

// Function Prototyping
void ModbusRTUslaveBegin(char id, unsigned int baud);
void ModbusRTUslavePoll();
void exceptionResponse(uint8_t code);
void write(char len);
unsigned int crc(char len);
unsigned int div8RndUp(unsigned int value);
unsigned int bytesToWord(char high, char low);
void serialInit(unsigned int baud);
void serialTX(char x)
unsigned char serialRX(void);

