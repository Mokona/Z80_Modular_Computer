;==================================================================================
; LINER.ASM - TEST FOR CONSOLE MANAGER FOR MONITOR 2.0 - USE WITH VT100 TEMINAL
; (Should behave like CCP on CP/M)
;
; Backspace = delete last character
;   ^U = ^X = delete all the line
;
; After user types <ENTER>, the line is saved in line_buffer and control returns
; to Monitor program.
;==================================================================================
TPA			.EQU	0100H		; Transient Programs Area
MONITOR		.EQU	0D000H		; Monitor entry point
BIOS		.EQU	0E600H		; BIOS entry point
DMA			.EQU	0080H		; Buffer user by liner

;================================================================================================
; BIOS functions.
;================================================================================================
BOOT:		.EQU	BIOS				;  0 Initialize.
WBOOT:		.EQU	BIOS+(3*1)			;  1 Warm boot.
CONST:		.EQU	BIOS+(3*2)			;  2 Console status.
CONIN:		.EQU	BIOS+(3*3)			;  3 Console input.
CONOUT:		.EQU	BIOS+(3*4)			;  4 Console OUTput.
LIST:		.EQU	BIOS+(3*5)			;  5 List OUTput.
PUNCH:		.EQU	BIOS+(3*6)			;  6 Punch OUTput.
READER:		.EQU	BIOS+(3*7)			;  7 Reader input.
HOME:		.EQU	BIOS+(3*8)			;  8 Home disk.
SELDSK:		.EQU	BIOS+(3*9)			;  9 Select disk.
SETTRK:		.EQU	BIOS+(3*10)			; 10 Select track.
SETSEC:		.EQU	BIOS+(3*11)			; 11 Select sector.
SETDMA:		.EQU	BIOS+(3*12)			; 12 Set DMA ADDress.
READ:		.EQU	BIOS+(3*13)			; 13 Read 128 bytes.
WRITE:		.EQU	BIOS+(3*14)			; 14 Write 128 bytes.
LISTST:		.EQU	BIOS+(3*15)			; 15 List status.
SECTRAN:	.EQU	BIOS+(3*16)			; 16 Sector translate.
PRINTSEQ:	.EQU	BIOS+(3*17)			; not a BIOS function

;================================================================================================
; ASCII characters.
;================================================================================================
NUL			.EQU	00H
SOH			.EQU	01H
STX			.EQU	02H
ETX			.EQU	03H
EOT			.EQU	04H
ENQ			.EQU	05H
QCK			.EQU	06H
BEL			.EQU	07H
BS			.EQU	08H			; ^H
HT			.EQU	09H
LF			.EQU	0AH
VT			.EQU	0BH
FF			.EQU	0CH
CR			.EQU	0DH
SO			.EQU	0EH
SI			.EQU	0FH
DLE			.EQU	10H
DC1			.EQU	11H
DC2			.EQU	12H
DC3			.EQU	13H
DC4			.EQU	14H
NAK			.EQU	15H			; ^U
SYN			.EQU	16H
ETB			.EQU	17H
CAN			.EQU	18H			; ^X
EM			.EQU	19H
SUB			.EQU	1AH
ESC			.EQU	1BH
FS			.EQU	1CH
GS			.EQU	1DH
RS			.EQU	1EH
US			.EQU	1FH

;================================================================================================
; Some constants
;================================================================================================
MAXLBUFPTR	.EQU	DMA+80

;================================================================================================
			.ORG TPA

			LD	HL,DMA
			LD	(LBUFPTR),HL
			LD	(HL),0
			LD	C,CR
			CALL CONOUT
			LD	C,LF
			CALL CONOUT
			LD	C,'}'
			CALL CONOUT
WAITCHAR:	CALL CONIN
			CP	CAN
			JR	Z,GOTCAN
			CP	CR
			JR	Z,GOTCR
			CP	BS
			JR	Z,GOTBS
			LD	HL,(LBUFPTR)
			LD	BC,MAXLBUFPTR
			SCF
			CCF
			SBC	HL,BC
			JR	Z,LBUFFULL
			LD	HL,(LBUFPTR)
			LD	(HL),A
			INC	HL
			LD	(LBUFPTR),HL
			LD	C,A
OUTWAIT:	CALL CONOUT
			JR	WAITCHAR
LBUFFULL:	LD	C,BEL
			JR	OUTWAIT
GOTBS:		LD	D,1
AFTGOTBS:	CALL BSPROC
			JR	WAITCHAR
GOTCR:		LD	HL,(LBUFPTR)
			LD	A,0
			LD	(HL),A
			LD	C,CR
			CALL CONOUT
			LD	C,LF
			CALL CONOUT
			JP	WBOOT
GOTCAN:		LD	D,0
			JR	AFTGOTBS
BSPROC:		LD	HL,(LBUFPTR)
			LD	BC,DMA
			SCF
			CCF
			SBC	HL,BC
			JR	Z,LBUFEMPTY
			LD	HL,(LBUFPTR)
			DEC	HL
			LD	(LBUFPTR),HL
			LD	C,BS
			CALL CONOUT
			LD	A,D
			CP	1
			RET	Z
			JR	BSPROC
LBUFEMPTY:	LD	C,BEL
			CALL CONOUT
			RET
			

;================================================================================================
LBUFPTR		.DW		0


			.END
