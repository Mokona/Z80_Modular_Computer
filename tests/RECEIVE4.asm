;==================================================================================
; Receive version 4
;
; RECEIVE is a program that runs on CP/M. On the Windows console there's a 
; counterpart program called SEND.PY.
;
;==================================================================================
REBOOT		.EQU	0H
BDOS		.EQU	5H
TPA			.EQU	0100H
BIOS		.EQU	0E600h			; Base of BIOS.

CONIN		.EQU	BIOS+(3*3)		; BIOS entry for Console Input (console --> regA)
CONOUT		.EQU	BIOS+(3*4)		; BIOS entry for Console Output (regC --> console)
C_STRING	.EQU	9
F_CLOSE		.EQU	16
F_DELETE	.EQU	19
F_WRITE		.EQU	21
F_MAKE		.EQU	22
F_DMAOFF	.EQU	26

EOT			.EQU	04H
ACK			.EQU	06H
LF			.EQU	0AH
CR			.EQU	0DH
NAK			.EQU	015H
EM			.EQU	019H
		
FCB			.EQU	0005CH
DMA			.EQU	080H
;==================================================================================
			.ORG TPA

			LD	SP,STACK			; Set default stack.
			LD	A,(FCB+1)
			CP	' '					; Test if program has argument (file name)
			JR	NZ,START
			LD	DE,MSG
			LD	C,C_STRING
			CALL BDOS
			JP	REBOOT

START:		LD	HL,DMA
			LD	(BuffPtr),HL
			LD	A,0
			LD	(CheckSum),A
			
			CALL DELFILE
			CALL MAKEFILE
			CP	0FFH				; Was file created ok? (0FFH = error)
			JR	NZ,GETHEX
			CALL SENDNAK
			JP	REBOOT
		
GETHEX:		CALL SENDACK
			CALL CONIN				; Get 1st char
			CP	EOT
			JR	Z,CLOSE
			LD	B,A
			PUSH BC
			CALL CONIN				; Get 2nd char
			POP	BC
			LD	C,A
			CALL BC2A				; Convert ASCII to byte
			LD	B,A
			LD	A,(CheckSum)
			ADD A,B
			LD	(CheckSum),A
			LD	HL,(BuffPtr)
			LD	(HL),B				; Put byte in buffer
			INC	HL
			LD	(BuffPtr),HL
			LD	A,H
			CP	1					; Check if we reached the end of the buffer
			JR	NZ,GETHEX
			CALL SENDEM				; Tell SEND to wait
			LD	HL,DMA
			LD	(BuffPtr),HL
			CALL WRITEBLK
			CP	0					; 0 = write OK
			JR	Z,GETHEX
CLOSENAK:	CALL CLOSFILE
EXIT:		CALL SENDNAK
			JP	REBOOT

CLOSE:		LD	HL,(BuffPtr)
			LD	A,L
			CP	DMA
			JR	Z,BUFVOID
			CALL WRITEBLK
			CP	0
			JR	Z,BUFVOID
			CALL CONIN
			CALL CONIN
			JR	CLOSENAK
			
BUFVOID:	LD	C,F_CLOSE			; Close the file.
			LD	DE,FCB
			CALL BDOS
			CP	4					; 0, 1, 2 or 3 = OK
			JP	M,CHKSM
			CALL CONIN
			CALL CONIN
			JR	EXIT

CHKSM:		CALL CONIN				; Get 1st checksum char
			LD	B,A
			PUSH BC
			CALL CONIN				; Get 2nd checksum char
			POP	BC
			LD	C,A
			CALL BC2A				; Convert ASCII to byte
			LD	HL,CheckSum
			CP	(HL)				; test checksum
			JR	NZ,EXIT
			CALL SENDACK
			JP	REBOOT

;==================================================================================
; Delete file
;==================================================================================
DELFILE:	LD	C,F_DELETE			; Delete file
			LD	DE,FCB
			CALL BDOS
			RET
			
;==================================================================================
; Make file
;==================================================================================
MAKEFILE:	LD	C,F_MAKE			; Create file
			LD	DE,FCB
			CALL BDOS
			RET

;==================================================================================
; Close file
;==================================================================================
CLOSFILE:	LD	C,F_CLOSE			; Close file
			LD	DE,FCB
			CALL BDOS
			
;==================================================================================
; Send ACK
;==================================================================================
SENDACK:	LD C,ACK
			CALL CONOUT
			RET

;==================================================================================
; Send NAK
;==================================================================================
SENDNAK:	LD C,NAK
			CALL CONOUT
			RET

;==================================================================================
; Send EM
;==================================================================================
SENDEM	:	LD C,EM
			CALL CONOUT
			RET

;==================================================================================
; Write block to file
;==================================================================================
WRITEBLK:	LD	C,F_WRITE			; Write buffer to disk.
			LD	DE,FCB
			CALL BDOS
			RET

;==================================================================================
; Convert ASCII characters in BC to a byte in A
;==================================================================================
BC2A:		LD   A,B				
			SUB  $30
			CP   $0A
			JR   C,BC2A1
			SUB  $07
BC2A1:		RLCA
			RLCA
			RLCA
			RLCA
			LD   B,A
			LD   A,C
			SUB  $30
			CP   $0A
			JR   C,BC2A2
			SUB  $07
BC2A2:		ADD  A,B
			RET
			
;==================================================================================
MSG:		.DB	"RECEIVE 2.0 - Receive file from console and store on disk."
			.DB	CR,LF
			.DB	"Use 'SEND.PY' on Windows console to start this program.$"
BuffPtr		.DW	0000H
CheckSum 	.DB	0H

			.DS	020h			; Start of stack area.
STACK		.EQU	$

			.END
