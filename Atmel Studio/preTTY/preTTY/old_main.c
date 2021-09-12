/*
 * preTTY.c
 *
 * Created: 29/08/2021 17:29:23
 * Author : kaltchuk
 */ 


#define F_CPU	20000000UL

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define BAUD		250000
#define MYUBRR		((F_CPU/16/BAUD)-1)

#define CS			(PIND&(1<<INT0))
#define RSM			3
#define RSM_LO		(PORTC &= ~(1<<RSM))
#define RSM_HI		(PORTC |= (1<<RSM))

#define asInput		1
#define asOutput	2

#define WR_DATA		2
#define WR_COMMAND	3
#define RD_DATA		4
#define RD_STATUS	5

#define CR			0x0d
#define LF			0x0a

#define MAXBUFF		256

char	uBuffRX[MAXBUFF]; 					// Buffer for chars that arrived through serial port.
int		uBuffRX_inPtr=0, uBuffRX_outPtr=0;

char	uBuffTX[MAXBUFF]; 					// Buffer for chars to be sent through serial port.
int		uBuffTX_inPtr=0, uBuffTX_outPtr=0;

void setDataBus(int modus)
{
	if (modus == asInput)	// Write zeros to PORTs
	{
		DDRB &= ~0x07;
		DDRD &= ~0xf8;
	}
	else					// Write ones to PORTs
	{
		DDRB |= 0x07;
		DDRD |= 0xf8;
	}
}

void xmit(char toSend)
{
	while ( !( UCSR0A & (1<<UDRE0)) )
	{}
	UDR0 = toSend;
}

void reply(char toPost)
{
	setDataBus(asOutput);
	PORTB = (PINB&~0x7)|(toPost&0x7);
	PORTD = (PIND&~0xf8)|(toPost&0xf8);

	RSM_LO;							// Release wait line
	RSM_HI;

	while (CS == 0)					// Wait till CS is high
	{
	}

	setDataBus(asInput);
}

void hex2ascii(char original)
{
	char nibble;
	
	nibble = original>>4;
	if (nibble > 9)
		nibble += 0x37;
	else
		nibble += 0x30;
	xmit(nibble);
	
	nibble = original&0xf;
	if (nibble > 9)
	nibble += 0x37;
	else
	nibble += 0x30;
	xmit(nibble);
}
void USART_Init(unsigned int ubrr)
{
	/* Set baud rate */
	UBRR0H = (unsigned char)(ubrr>>8);
	UBRR0L = (unsigned char)ubrr;

	/* Enable receiver, transmitter and also RX_complete_interrupt */
	UCSR0B = (1<<RXCIE0)|(1<<RXEN0)|(1<<TXEN0);

	/* Set frame format: 8N1 */
	UCSR0C = (3<<UCSZ00);
}

ISR(USART_RX_vect)
{
	uBuffRX[uBuffRX_inPtr++] = UDR0;
	if (uBuffRX_inPtr == MAXBUFF)
		uBuffRX_inPtr = 0;
}

ISR(INT0_vect)									// We got a chip_select (CPU wants something)
{
	char			operation;
	char			dataByte;
	unsigned long	newBaud=38400;
	
	operation = PINC & 0x7;						// Snapshots from I/O pins
	dataByte = (PIND & 0xf8)|(PINB & 0x07);

	switch (operation)
	{
		case RD_DATA:							// Read data request
			if (uBuffRX_inPtr != uBuffRX_outPtr)
			{
				reply(uBuffRX[uBuffRX_outPtr++]);
				if (uBuffRX_outPtr == MAXBUFF)
					uBuffRX_outPtr = 0;
			}
			else
			{
				RSM_LO;							// Release wait line
				RSM_HI;
			}
		break;
		
		case RD_STATUS:							// Read status request
			setDataBus(asOutput);
			if (uBuffRX_inPtr != uBuffRX_outPtr)	// Put 0xff on data bus
			{
				PORTB |= 0x07;
				PORTD |= 0xf8;
			}
			else								// Put 00 on data bus
			{
				PORTB &= ~0x07;
				PORTD &= ~0xf8;
			}
			RSM_LO;								// Release wait line
			RSM_HI;
		
			while (CS == 0)						// Wait till CS is high
			{
			}

			setDataBus(asInput);
		break;
		
		case WR_DATA:							// write data request
			uBuffTX[uBuffTX_inPtr++] = dataByte;
			if (uBuffTX_inPtr == MAXBUFF)
				uBuffTX_inPtr = 0;
			RSM_LO;								// Release wait line
			RSM_HI;
		break;
		
		case WR_COMMAND:						// write command request
			switch (dataByte)
			{
				case '0':
					newBaud = 300;
					break;
				case '1':
					newBaud = 600;
					break;
				case '2':
					newBaud = 1200;
					break;
				case '3':
					newBaud = 2400;
					break;
				case '4':
					newBaud = 4800;
					break;
				case '5':
					newBaud = 9600;
					break;
				case '6':
					newBaud = 19200;
					break;
				case '7':
					newBaud = 38400;
					break;
				case '8':
					newBaud = 125000;
					break;
				case '9':
					newBaud = 1250000;
					break;
			}
			USART_Init((F_CPU/16/newBaud)-1);
			RSM_LO;								// Release wait line
			RSM_HI;
		break;
	}
}

int main(void)
{
	char	iniMsg[] = "\r\n*** TTY card, 250kbps 8N1. ***\r\n*** by Kaltchuk, sep/2021. ***\r\n\r\n\0";
	int		i=0;
	
	USART_Init(MYUBRR);		// Initialize USART
	while ( iniMsg[i] != 0)	
	{
		xmit(iniMsg[i++]);
	}
	DDRC |= (1<<RSM);		// Configure RSM pin as output
	RSM_HI;					// Turn off RSM (active low)
	EIMSK = (1<<INT0);		// Enable INT0 (chip select)
	
	sei();
	while (1) 				// If we're not busy attending a service request
	{						// from CPU, let's empty the TX buffer.
		if (uBuffTX_inPtr != uBuffTX_outPtr)
		{
			xmit(uBuffTX[uBuffTX_outPtr++]);
			if (uBuffTX_outPtr == MAXBUFF)
				uBuffTX_outPtr = 0;
		}
	}
}
