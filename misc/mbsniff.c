/* MBSNIFF.C - DEC/2022 			*/
/* Modbus sniffer for slave device detection	*/
/* Compliant with firmware ModbusMaster v1 	*/

#include <stdio.h>

#define setBaud		1
#define getBaud		2
#define clrRXbuf	3
#define clrTXbuf	4
#define flushBuf	5
#define enableCRC	6
#define disableCRC	7
#define sizeBuf		8
#define readBuf		9
#define writeBuf	10

#define MAXTRY		5
#define ON		0xff00

char buffer[10];

void msDelay(t)
int t; {
	int i, j;

	for(i=0; i<t; i++)
		for(j=0; j<24; j++);
	return;
}

char asc2hex(str)
char *str; {
	char i, r;
	
	for(i=0; i<2; i++) {
		if((str[i] >= '0') && (str[i] <= '9'))
			str[i] -= '0';
		else if((str[i] >= 'A') && (str[i] <= 'F'))
			str[i] -= '7';
		else if((str[i] >= 'a') && (str[i] <= 'f'))
			str[i] -= 'W';
		else {
			printf("Invalid argument.\n");
			exit();
		}
	}
	r = (str[0]<<4) | str[1];
	return r;
}

void sendReq(p)
char p; {
	int i;

	outp(p+2, clrRXbuf);
	outp(p+2, writeBuf); 
	for(i=0; i<6; i++)
		outp(p, buffer[i]);
	outp(p+2, flushBuf);
}

int getRep(p, s, f, a)
char p, s, f, *a; {
	char bs, i, try;
	int rep;

	*a = 0;
	try = 0;
	do {
		msDelay(2);
		outp(p+2, sizeBuf);
		bs = inp(p);
		i++;
	} while((i < MAXTRY) & (bs < 5));
	if(i==MAXTRY) {
		*a = 7;							/* timeout */
		rep = 0xffff;
	} else {
		for(i=0; i<bs; i++){					/* get reply string */
			outp(p+2, readBuf);
			buffer[i] = inp(p);
		}
		for(i=0; i<bs; i++) {					/* find slave in string */
			if(buffer[i] == s) {				/* slave found */
				if(buffer[i+1] == f) {			/* fuction returned */
					if(f < 3) 			/* it's a bit tag */
						rep = buffer[i+3] * ON;
					else 				/* it's a 16 bit tag */
						rep = buffer[i+4] | (buffer[i+3]<<8);
				} else if(buffer[i+1] == (f||0x80)) {	/* function error returned */
					*a = buffer[i+2];
					rep = 0xffff;
				}
				i = bs;
			} else if(i == (bs-1)) {			/* inconsistent string returned */
				*a = 0xc;
				rep = 0xffff;
			}
		}
	}
	return rep;
}

void setBaud(p, b)
char p, b; {
	outp(p+2, setBaud);
	outp(p, b);
}

void initPort(p)
chap p; {
	outp(p+2, clrRXbuf);
	outp(p+2, clrTXbuf);
	outp(p+2, enableCRC);
}

main () {
	int *ans, rep;
	char port;
	char baud;
	char slave;
	char linea[8];

	buffer[1] = 5;
	buffer[2] = 0;
	buffer[3] = 0;
	buffer[4] = 0xff;
	buffer[5] = 0;

	printf("Port (two digit hex)? ");
	getline(linea,7);
	port = asc2hex(linea);
	printf("Port 0x%x configured. Starting device search...\n", port);
	
	initPort(port);
	
	for(baud=0; baud<10; baud++) {
		printf("Baud enum = %d of 9. Searching...\n", baud);
		setBaud(port, baud);
		for(slave=1; slave != 0; slave++) {
			buffer[0] = slave;
			sendReq(port);
			msDelay(10);
			rep = getRep(port, slave, 5, ans);
			if(ans != 7)
				printf("Slave %d found.\n", slave);
		}
	}
	printf("\nEnd of search.\n");
	exit();
}

