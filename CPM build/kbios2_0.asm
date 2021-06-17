;==================================================================================
; Contents of this file are copyright Grant Searle
; Blocking/unblocking routines are the published version by Digital Research
; (bugfixed, as found on the web)
;
; You have permission to use this for NON COMMERCIAL USE ONLY
;
; Customized by Kaltchuk for use with Z80 Modular Computer, december/2020.
; CP/M is booted from ROM.
; 04/02/21 - version B corrects a bug in wboot.
; 09/06/21 - version C sets serial comm to 38.4kbps 
;            and puts IOBYTE set in cold boot.
; 12/06/21 - version D fixes a bug with CONIN.
; 16/06/21 - version 2.0 is mainly about the new serial communication card,
;            which doesn't use interrupt signal because all the buffering is
;            done by the card instead of the CPU. So check CONST, CONIN and
;            CONOUT. There are also some "cosmetic" changes on the boot msg.
;==================================================================================
#INCLUDE	"equates.h"

; Set CP/M low memory data, vector and buffer addresses.

iobyte			.EQU	03h				; Intel standard I/O definition byte.
userdrv			.EQU	04h				; Current user number and drive.
tpabuf			.EQU	80h				; Default I/O buffer and command line storage.

blksiz			.equ	4096			;CP/M allocation size
hstsiz			.equ	512				;host disk sector size
hstspt			.equ	32				;host disk sectors/trk
hstblk			.equ	hstsiz/128		;CP/M sects/host buff
cpmspt			.equ	hstblk * hstspt	;CP/M sectors/track
secmsk			.equ	hstblk-1		;sector mask
										;compute sector mask
;secshf			.equ	2				;log2(hstblk)
	
wrall			.equ	0				;write to allocated
wrdir			.equ	1				;write to directory
wrual			.equ	2				;write to unallocated

; MEM card stuff
MEM_ADDR		.EQU	0F0H			; MEM card address
ROM_RAM0		.EQU	MEM_ADDR		; ROM + RAM bank 0
NOROM_RAM0		.EQU	MEM_ADDR+1		; no ROM + RAM bank 0 (full RAM)
ROM_RAM1		.EQU	MEM_ADDR+2		; ROM + RAM bank 1
NOROM_RAM1		.EQU	MEM_ADDR+3		; no ROM + RAM bank 1 (full RAM)

; USART card stuff (addr00=serial 0 or 1, addr01=cmd/status or data)
USART_ADDR		.EQU	0D0H			; USART card address
SER0_DAT		.EQU	USART_ADDR+2	; Serial 0 data addr
SER0_CMD		.EQU	USART_ADDR		; Serial 0 command addr
SER0_STA		.EQU	USART_ADDR		; Serial 0 status addr

; LCD card address list.
LCD_ADDR		.EQU	0E0H				; LCD card address
DAT_WR			.EQU	LCD_ADDR+1
DAT_RD			.EQU	LCD_ADDR+3
CMD_WR			.EQU	LCD_ADDR
CMD_RD			.EQU	LCD_ADDR+2


; FLASH card stuff
FLASH_ADDR		.EQU	0B0H			; FLASH card address
CF_DATA			.EQU	(FLASH_ADDR+0)	; R/W
CF_FEATURES		.EQU	(FLASH_ADDR+1)	; W
CF_ERROR		.EQU	(FLASH_ADDR+1)	; R
CF_SECCOUNT		.EQU	(FLASH_ADDR+2)	; W

CF_SECTOR		.EQU	(FLASH_ADDR+3)	; W
CF_CYL_LOW		.EQU	(FLASH_ADDR+4)	; W
CF_CYL_HI		.EQU	(FLASH_ADDR+5)	; W
CF_HEAD			.EQU	(FLASH_ADDR+6)	; W

CF_LBA0			.EQU	(FLASH_ADDR+3)	; W
CF_LBA1			.EQU	(FLASH_ADDR+4)	; W
CF_LBA2			.EQU	(FLASH_ADDR+5)	; W
CF_LBA3			.EQU	(FLASH_ADDR+6)	; W

CF_STATUS		.EQU	(FLASH_ADDR+7)	; R
CF_COMMAND		.EQU	(FLASH_ADDR+7)	; W

;CF Features
CF_8BIT			.EQU	1
CF_NOCACHE		.EQU	082H

;CF Commands
CF_READ_SEC		.EQU	020H
CF_WRITE_SEC	.EQU	030H
CF_SET_FEAT		.EQU 	0EFH

;================================================================================================
; ASCII characters.
;================================================================================================
NUL			.EQU	00H
LF			.EQU	0AH
FF			.EQU	0CH
CR			.EQU	0DH
DC1			.EQU	11H
DC2			.EQU	12H
DC3			.EQU	13H
DC4			.EQU	14H
;================================================================================================

		.ORG	bios					; BIOS origin.

;================================================================================================
; BIOS jump table.
;================================================================================================
		JP	boot						;  0 Initialize.
wboote:	JP	wboot						;  1 Warm boot.
		JP	CONST						;  2 Console status.
		JP	CONIN						;  3 Console input.
		JP	CONOUT						;  4 Console OUTput.
		JP	LIST						;  5 List OUTput.
		JP	PUNCH						;  6 punch OUTput.
		JP	READER						;  7 Reader input.
		JP	home						;  8 Home disk.
		JP	seldsk						;  9 Select disk.
		JP	settrk						; 10 Select track.
		JP	setsec						; 11 Select sector.
		JP	setdma						; 12 Set DMA ADDress.
		JP	read						; 13 Read 128 bytes.
		JP	write						; 14 Write 128 bytes.
		JP	LISTST						; 15 List status.
		JP	sectran						; 16 Sector translate.
		JP	PRINTSEQ					; not a BIOS function

;================================================================================================
; Disk parameter headers for disk 0 to 15
;================================================================================================
dpbase:
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb0,0000h,alv00
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv01
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv02
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv03
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv04
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv05
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv06
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv07
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv08
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv09
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv10
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv11
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv12
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv13
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpb,0000h,alv14
	 	.DW 0000h,0000h,0000h,0000h,dirbuf,dpbLast,0000h,alv15

; First drive has a reserved track for CP/M
dpb0:
		.DW 128 ;SPT - sectors per track
		.DB 5   ;BSH - block shift factor
		.DB 31  ;BLM - block mask
		.DB 1   ;EXM - Extent mask
		.DW 2043 ; (2047-4) DSM - Storage size (blocks - 1)
		.DW 511 ;DRM - Number of directory entries - 1
		.DB 240 ;AL0 - 1 bit set per directory block
		.DB 0   ;AL1 -            "
		.DW 0   ;CKS - DIR check vector size (DRM+1)/4 (0=fixed disk)
		.DW 1   ;ON  - Reserved tracks

dpb:
		.DW 128 ;SPT - sectors per track
		.DB 5   ;BSH - block shift factor
		.DB 31  ;BLM - block mask
		.DB 1   ;EXM - Extent mask
		.DW 2047 ;DSM - Storage size (blocks - 1)
		.DW 511 ;DRM - Number of directory entries - 1
		.DB 240 ;AL0 - 1 bit set per directory block
		.DB 0   ;AL1 -            "
		.DW 0   ;CKS - DIR check vector size (DRM+1)/4 (0=fixed disk)
		.DW 0   ;OFF - Reserved tracks

; Last drive is smaller because CF is never full 64MB or 128MB
dpbLast:
		.DW 128 ;SPT - sectors per track
		.DB 5   ;BSH - block shift factor
		.DB 31  ;BLM - block mask
		.DB 1   ;EXM - Extent mask
		.DW 511 ;DSM - Storage size (blocks - 1)  ; 511 = 2MB (for 128MB card), 1279 = 5MB (for 64MB card)
		.DW 511 ;DRM - Number of directory entries - 1
		.DB 240 ;AL0 - 1 bit set per directory block
		.DB 0   ;AL1 -            "
		.DW 0   ;CKS - DIR check vector size (DRM+1)/4 (0=fixed disk)
		.DW 0   ;OFF - Reserved tracks

;================================================================================================
; Cold boot
;================================================================================================

boot:
		DI						; Disable interrupts.
		LD	SP,BIOSSTACK		; Set default stack.

		OUT (NOROM_RAM0),A		; Turn off ROM. Doesn't matter what we output

		CALL	cfWait			; Initialize FLASH
		LD 	A,CF_8BIT			; Set IDE to be 8bit
		OUT	(CF_FEATURES),A
		LD	A,CF_SET_FEAT
		OUT	(CF_COMMAND),A

		CALL	cfWait
		LD 	A,CF_NOCACHE		; No write cache
		OUT	(CF_FEATURES),A
		LD	A,CF_SET_FEAT
		OUT	(CF_COMMAND),A

		XOR	A
		LD	(userdrv),A			; set drive byte to A:
		LD	(iobyte),A			; Set IOBYTE to 00

		CALL	PRINTSEQ
		.DB CR,LF,"Z80 Modular Computer by Kaltchuk 2020.",CR,LF
		.DB "BIOS 2.0 - 128MB Compact Flash, LCD drive.",CR,LF
		.DB "CP/M 2.2+ Copyright 1979 (c) by Digital Research",CR,LF,CR,LF,0

		JP	gocpm

;================================================================================================
; Warm boot
;================================================================================================

wboot:
		DI						; Disable interrupts.
		LD	SP,BIOSSTACK		; Set default stack.

		OUT (ROM_RAM0),A		; Turn on ROM. Doesn't matter what we output

		LD	BC,BIOS-CCP			; Copy CP/M ROM (01000h) to RAM (0D000h)
		LD	DE,CCP				; Don't copy the BIOS!!!
		LD	HL,ROM_CCP
		LDIR

		OUT (NOROM_RAM0),A		; Turn off ROM. Doesn't matter what we output


;================================================================================================
; Common code for cold and warm boot
;================================================================================================

gocpm:
		XOR	A					; 0 to accumulator
		LD	(hstact),A			; host buffer inactive
		LD	(unacnt),A			; clear unalloc count

		LD	HL,tpabuf			; ADDress of BIOS DMA buffer.
		LD	(dmaAddr),HL
		
		LD	A,0C3h				; Opcode for 'JP'.
		LD	(00h),A				; Load at start of RAM.
		LD	HL,wboote			; ADDress of jump for a warm boot.
		LD	(01h),HL
		LD	(05h),A				; Opcode for 'JP'.
		LD	HL,(BIOS-2)			; ADDress of jump for the BDOS.
		LD	(06h),HL
		LD	A,(userdrv)			; Save new drive number (0).
		LD	C,A					; Pass drive number in C.

		IM	0
		EI
	
		JP	ccp					; Start CP/M by jumping to the CCP.
;================================================================================================
; Console I/O routines
;================================================================================================
;================================================================================================
; Console Status (Return A=0FFh if character waiting. Otherwise, A=0)
;================================================================================================
CONST:
		IN	A,(SER0_STA)
		AND	02				; get only the inBuffer flag
		RET	Z
		LD	A,0FFH
	  	RET

;================================================================================================
; Console Input (Wait for input and return character in A)
;================================================================================================
CONIN:
		CALL CONST
		CP	0
		JR	Z,CONIN
		IN	A,(SER0_DAT)
		RET					; Char read returns in A

;================================================================================================
; Console Output (Send character in reg C)
;================================================================================================
CONOUT:
		IN	A,(SER0_STA)	; read USART status byte
		AND	01				; get only the outBuffer flag
		JR	NZ,CONOUT
		LD	A,C
		OUT	(SER0_DAT),A	; send character
		RET

;================================================================================================
; Reader Input
;================================================================================================
READER:	JP CONIN	

;================================================================================================
; List Output
;================================================================================================
LIST:		LD	A,(iobyte)
			AND	0C0H			; Get LIST portion of IOBYTE
			CP	0C0H
			JP	Z,LCD
			JP CONOUT

;================================================================================================
; Punch Output
;================================================================================================
PUNCH:	JP CONOUT	

;================================================================================================
; List Status (List = Console)
;================================================================================================
LISTST:		LD	A,(iobyte)
			AND	0C0H			; Get LIST portion of IOBYTE
			CP	0C0H
			JP	Z,LCDST
			JP CONST

;================================================================================================
; LCD STATUS. Return A=LCD_card_addr. A=0 if no card initialized.
;================================================================================================
LCDST:		CALL BWAIT
			RET

;================================================================================================
; LCD OUTPUT. Send C to LCD, if C>1FH (printable range). 
; Accepts also LF, CR and FF (Form Feed = clear LCD).
; If C=DC1, initialize LCD card.
; If C=DC2, position cursor as indicated in regB.
;================================================================================================
LCD:		PUSH HL
			LD	A,C
			CP	20
			JP	M,ASCIILO
			CALL LCDPUT
			JR	GETOUT
ASCIILO:	CP	LF
			CALL Z,LCDLF			; Line Feed
			CP	CR
			CALL Z,LCDCR			; Carriage Return
			CP	FF
			CALL Z,LCDCLEAR			; Form Feed, which is a 'clear LCD'
			CP	DC1
			CALL Z,LCDINIT			; Initialize LCD card.
			CP	DC2
			CALL Z,LCDPOS			; Cursor reposition request. New position in regB
GETOUT:		POP	HL
			RET

;================================================================================================
; Initialize LCD
;================================================================================================
LCDINIT:	LD	B,15			; wait 15ms
			CALL DELAYMS
			LD	A,030H			; write command 030h
			OUT	(CMD_WR),A
			LD	B,5				; wait 5ms
			CALL DELAYMS
			LD	A,030H			; write command 030h
			OUT	(CMD_WR),A
			LD	C,20			; wait (5X20) 100us
			CALL DELAY5US
			LD	A,030H			; write command 030h
			OUT	(CMD_WR),A
			LD	C,20			; wait (5X20) 100us
			CALL DELAY5US
			LD	A,038H			; write command 038h = function set (8-bits, 2-lines, 5x7dots)
			OUT	(CMD_WR),A
			CALL BWAIT
			LD	A,08H			; write command 08h = display (off)
			OUT	(CMD_WR),A
			CALL BWAIT
			LD	A,01H			; write command 01h = clear display
			OUT	(CMD_WR),A
			CALL BWAIT
			LD	A,06H			; write command 06h = entry mode (increment)
			OUT	(CMD_WR),A
			CALL BWAIT
			LD	A,0CH			; write command 0Ch = display (on)
			OUT	(CMD_WR),A
			LD	A,LCD_ADDR
			LD	(LCDSTATUS),A
			LD	A,0
			RET

;================================================================================================
; Wait until Busy flag = 0
;================================================================================================
BWAIT:		IN	A,(CMD_RD)
			RLCA
			JR	C,BWAIT
			SRL	A
			RET
			
;================================================================================================
; Clear LCD and goto line 1, column 1.
;================================================================================================
LCDCLEAR:	CALL BWAIT
			LD	A,01H
			OUT	(CMD_WR),A
			LD	A,0
			RET

;================================================================================================
; Send to LCD char in regC. Print at current position (what ever it is)
;================================================================================================
LCDPUT:		CALL BWAIT
			LD	A,C	
			OUT	(DAT_WR),A
			LD	A,0
			RET

;================================================================================================
; Position LCD cursor at regB.
;================================================================================================
LCDPOS:		CALL BWAIT
			LD	A,B
			OR	80H
			OUT	(CMD_WR),A
			LD	A,0
			RET

;================================================================================================
; Do CR (Carriage Return)
;================================================================================================
LCDCR:		CALL BWAIT
			AND	0F0H			; Keep line info, set column to 1.
			OR	080H
			OUT	(CMD_WR),A
			LD	A,0
			RET
			
;================================================================================================
; Do LF (Line Feed)
;================================================================================================
LCDLF:		CALL BWAIT			; regA holds LCD address counter
			LD	D,A
			AND	40H				; get only the 7th bit to see on which line the cursor is.
			JR	Z,LN11
			CALL BWAIT
			LD	A,0C0H
			OUT	(CMD_WR),A		; set addr counter to source position (2,1)
			LD	HL,BUF
			LD	B,10H
NEWSRC:		CALL BWAIT
			IN	A,(DAT_RD)		; get data from source position
			LD	(HL),A			; Store char in buffer
			INC	HL
			DJNZ NEWSRC
			CALL LCDCLEAR
			LD	HL,BUF
			LD	B,10H
NEWTGT:		CALL BWAIT
			LD	A,(HL)
			INC	HL
			OUT	(DAT_WR),A
			DJNZ NEWTGT

LN11:		CALL BWAIT
			LD	A,D
			AND	0FH
			OR	0C0H
			OUT	(CMD_WR),A
			LD	A,0
			RET

;================================================================================================
; Delay X seconds, with X passed on reg B
;================================================================================================
DELAYS:		PUSH BC
			PUSH HL
LOOP0:		LD	HL,655		;2.5				\
LOOP1:		LD	C,255		;1.75	\			|
LOOP2:		DEC	C			;1		|			|
			NOP				;1		| t=6C+0.5	| 
			LD	A,C			;1		|			| t=HL(6C+6.5)+1.25
			JR	NZ,LOOP2	;3/1.75	/			|
			DEC	HL			;1					| with HL=655 and c=255, t=1.006sec (WOW!!!)
			LD	A,H			;1					|
			OR	L			;1					|
			JR	NZ,LOOP1	;3/1.75				/
			DJNZ LOOP0		;3.25/2
			POP	HL
			POP	BC
			RET

;================================================================================================
; Delay X miliseconds, with X passed on reg B
;================================================================================================
DELAYMS:	PUSH BC
DECB:		LD	C,0C8H
DECC:		NOP
			DEC	C
			JR	NZ,DECC
			DEC	B
			JR	NZ,DECB
			POP	BC
			RET

;================================================================================================
; Delay 5*X microseconds, with X passed on reg C
;================================================================================================
DELAY5US:	PUSH BC
DEC:		NOP
			DEC	C
			JR	NZ,DEC
			POP	BC
			RET

;================================================================================================
LCDSTATUS	.DB	0			; After LCD has been initialized, it will hold card addr.
BUF			.DS	10H			; Buffer for Line Feed operation
;================================================================================================
; Disk processing entry points
;================================================================================================
seldsk:
		LD	HL,$0000
		LD	A,C
		CP	16		; 16 for 128MB disk, 8 for 64MB disk
		jr	C,chgdsk	; if invalid drive will give BDOS error
		LD	A,(userdrv)	; so set the drive back to a:
		CP	C		; If the default disk is not the same as the
		RET	NZ		; selected drive then return, 
		XOR	A		; else reset default back to a:
		LD	(userdrv),A	; otherwise will be stuck in a loop
		LD	(sekdsk),A
		ret

chgdsk:		LD 	(sekdsk),A
		RLC	a		;*2
		RLC	a		;*4
		RLC	a		;*8
		RLC	a		;*16
		LD 	HL,dpbase
		LD	b,0
		LD	c,A	
		ADD	HL,BC

		RET

;------------------------------------------------------------------------------------------------
home:
		ld	a,(hstwrt)	;check for pending write
		or	a
		jr	nz,homed
		ld	(hstact),a	;clear host active flag
homed:
		LD 	BC,0000h

;------------------------------------------------------------------------------------------------
settrk:		LD 	(sektrk),BC	; Set track passed from BDOS in register BC.
		RET

;------------------------------------------------------------------------------------------------
setsec:		LD 	(seksec),BC	; Set sector passed from BDOS in register BC.
		RET

;------------------------------------------------------------------------------------------------
setdma:		LD 	(dmaAddr),BC	; Set DMA ADDress given by registers BC.
		RET

;------------------------------------------------------------------------------------------------
sectran:	PUSH 	BC
		POP 	HL
		RET

;------------------------------------------------------------------------------------------------
read:
		;read the selected CP/M sector
		xor	a
		ld	(unacnt),a
		ld	a,1
		ld	(readop),a		;read operation
		ld	(rsflag),a		;must read data
		ld	a,wrual
		ld	(wrtype),a		;treat as unalloc
		jp	rwoper			;to perform the read


;------------------------------------------------------------------------------------------------
write:
		;write the selected CP/M sector
		xor	a		;0 to accumulator
		ld	(readop),a	;not a read operation
		ld	a,c		;write type in c
		ld	(wrtype),a
		cp	wrual		;write unallocated?
		jr	nz,chkuna	;check for unalloc
;
;		write to unallocated, set parameters
		ld	a,blksiz/128	;next unalloc recs
		ld	(unacnt),a
		ld	a,(sekdsk)		;disk to seek
		ld	(unadsk),a		;unadsk = sekdsk
		ld	hl,(sektrk)
		ld	(unatrk),hl		;unatrk = sectrk
		ld	a,(seksec)
		ld	(unasec),a		;unasec = seksec
;
chkuna:
;		check for write to unallocated sector
		ld	a,(unacnt)		;any unalloc remain?
		or	a	
		jr	z,alloc		;skip if not
;
;		more unallocated records remain
		dec	a		;unacnt = unacnt-1
		ld	(unacnt),a
		ld	a,(sekdsk)		;same disk?
		ld	hl,unadsk
		cp	(hl)		;sekdsk = unadsk?
		jp	nz,alloc		;skip if not
;
;		disks are the same
		ld	hl,unatrk
		call	sektrkcmp	;sektrk = unatrk?
		jp	nz,alloc		;skip if not
;
;		tracks are the same
		ld	a,(seksec)		;same sector?
		ld	hl,unasec
		cp	(hl)		;seksec = unasec?
		jp	nz,alloc		;skip if not
;
;		match, move to next sector for future ref
		inc	(hl)		;unasec = unasec+1
		ld	a,(hl)		;end of track?
		cp	cpmspt		;count CP/M sectors
		jr	c,noovf		;skip if no overflow
;
;		overflow to next track
		ld	(hl),0		;unasec = 0
		ld	hl,(unatrk)
		inc	hl
		ld	(unatrk),hl		;unatrk = unatrk+1
;
noovf:
		;match found, mark as unnecessary read
		xor	a		;0 to accumulator
		ld	(rsflag),a		;rsflag = 0
		jr	rwoper		;to perform the write
;
alloc:
		;not an unallocated record, requires pre-read
		xor	a		;0 to accum
		ld	(unacnt),a		;unacnt = 0
		inc	a		;1 to accum
		ld	(rsflag),a		;rsflag = 1

;------------------------------------------------------------------------------------------------
rwoper:
		;enter here to perform the read/write
		xor	a		;zero to accum
		ld	(erflag),a		;no errors (yet)
		ld	a,(seksec)		;compute host sector
		or	a		;carry = 0
		rra			;shift right
		or	a		;carry = 0
		rra			;shift right
		ld	(sekhst),a		;host sector to seek
;
;		active host sector?
		ld	hl,hstact	;host active flag
		ld	a,(hl)
		ld	(hl),1		;always becomes 1
		or	a		;was it already?
		jr	z,filhst		;fill host if not
;
;		host buffer active, same as seek buffer?
		ld	a,(sekdsk)
		ld	hl,hstdsk	;same disk?
		cp	(hl)		;sekdsk = hstdsk?
		jr	nz,nomatch
;
;		same disk, same track?
		ld	hl,hsttrk
		call	sektrkcmp	;sektrk = hsttrk?
		jr	nz,nomatch
;
;		same disk, same track, same buffer?
		ld	a,(sekhst)
		ld	hl,hstsec	;sekhst = hstsec?
		cp	(hl)
		jr	z,match		;skip if match
;
nomatch:
		;proper disk, but not correct sector
		ld	a,(hstwrt)		;host written?
		or	a
		call	nz,writehst	;clear host buff
;
filhst:
		;may have to fill the host buffer
		ld	a,(sekdsk)
		ld	(hstdsk),a
		ld	hl,(sektrk)
		ld	(hsttrk),hl
		ld	a,(sekhst)
		ld	(hstsec),a
		ld	a,(rsflag)		;need to read?
		or	a
		call	nz,readhst		;yes, if 1
		xor	a		;0 to accum
		ld	(hstwrt),a		;no pending write
;
match:
		;copy data to or from buffer
		ld	a,(seksec)		;mask buffer number
		and	secmsk		;least signif bits
		ld	l,a		;ready to shift
		ld	h,0		;double count
		add	hl,hl
		add	hl,hl
		add	hl,hl
		add	hl,hl
		add	hl,hl
		add	hl,hl
		add	hl,hl
;		hl has relative host buffer address
		ld	de,hstbuf
		add	hl,de		;hl = host address
		ex	de,hl			;now in DE
		ld	hl,(dmaAddr)		;get/put CP/M data
		ld	c,128		;length of move
		ld	a,(readop)		;which way?
		or	a
		jr	nz,rwmove		;skip if read
;
;	write operation, mark and switch direction
		ld	a,1
		ld	(hstwrt),a		;hstwrt = 1
		ex	de,hl			;source/dest swap
;
rwmove:
		;C initially 128, DE is source, HL is dest
		ld	a,(de)		;source character
		inc	de
		ld	(hl),a		;to dest
		inc	hl
		dec	c		;loop 128 times
		jr	nz,rwmove
;
;		data has been moved to/from host buffer
		ld	a,(wrtype)		;write type
		cp	wrdir		;to directory?
		ld	a,(erflag)		;in case of errors
		ret	nz			;no further processing
;
;		clear host buffer for directory write
		or	a		;errors?
		ret	nz			;skip if so
		xor	a		;0 to accum
		ld	(hstwrt),a		;buffer written
		call	writehst
		ld	a,(erflag)
		ret

;------------------------------------------------------------------------------------------------
;Utility subroutine for 16-bit compare
sektrkcmp:
		;HL = .unatrk or .hsttrk, compare with sektrk
		ex	de,hl
		ld	hl,sektrk
		ld	a,(de)		;low byte compare
		cp	(HL)		;same?
		ret	nz			;return if not
;		low bytes equal, test high 1s
		inc	de
		inc	hl
		ld	a,(de)
		cp	(hl)	;sets flags
		ret

;================================================================================================
; Convert track/head/sector into LBA for physical access to the disk
;================================================================================================
setLBAaddr:	
		LD	HL,(hsttrk)
		RLC	L
		RLC	L
		RLC	L
		RLC	L
		RLC	L
		LD	A,L
		AND	0E0H
		LD	L,A
		LD	A,(hstsec)
		ADD	A,L
		LD	(lba0),A

		LD	HL,(hsttrk)
		RRC	L
		RRC	L
		RRC	L
		LD	A,L
		AND	01FH
		LD	L,A
		RLC	H
		RLC	H
		RLC	H
		RLC	H
		RLC	H
		LD	A,H
		AND	020H
		LD	H,A
		LD	A,(hstdsk)
		RLC	a
		RLC	a
		RLC	a
		RLC	a
		RLC	a
		RLC	a
		AND	0C0H
		ADD	A,H
		ADD	A,L
		LD	(lba1),A
		

		LD	A,(hstdsk)
		RRC	A
		RRC	A
		AND	03H
		LD	(lba2),A

; LBA Mode using drive 0 = E0
		LD	a,0E0H
		LD	(lba3),A


		LD	A,(lba0)
		OUT 	(CF_LBA0),A

		LD	A,(lba1)
		OUT 	(CF_LBA1),A

		LD	A,(lba2)
		OUT 	(CF_LBA2),A

		LD	A,(lba3)
		OUT 	(CF_LBA3),A

		LD 	A,1
		OUT 	(CF_SECCOUNT),A

		RET				

;================================================================================================
; Read physical sector from host
;================================================================================================
readhst:
		PUSH 	AF
		PUSH 	BC
		PUSH 	HL

		CALL 	cfWait

		CALL 	setLBAaddr

		LD 	A,CF_READ_SEC
		OUT 	(CF_COMMAND),A

		CALL 	cfWait

		LD 	c,4
		LD 	HL,hstbuf
rd4secs:
		LD 	b,128
rdByte:
		in 	A,(CF_DATA)
		LD 	(HL),A
		iNC 	HL
		dec 	b
		JR 	NZ, rdByte
		dec 	c
		JR 	NZ,rd4secs

		POP 	HL
		POP 	BC
		POP 	AF

		XOR 	a
		ld	(erflag),a
		RET

;================================================================================================
; Write physical sector to host
;================================================================================================
writehst:
		PUSH 	AF
		PUSH 	BC
		PUSH 	HL

		CALL 	cfWait

		CALL 	setLBAaddr

		LD 	A,CF_WRITE_SEC
		OUT 	(CF_COMMAND),A

		CALL 	cfWait

		LD 	c,4
		LD 	HL,hstbuf
wr4secs:
		LD 	b,128
wrByte:		LD 	A,(HL)
		OUT 	(CF_DATA),A
		iNC 	HL
		dec 	b
		JR 	NZ, wrByte

		dec 	c
		JR 	NZ,wr4secs

		POP 	HL
		POP 	BC
		POP 	AF

		XOR 	a
		ld	(erflag),a
		RET

;================================================================================================
; Wait for disk to be ready (busy=0,ready=1)
;================================================================================================
cfWait:
		PUSH 	AF
cfWait1:
		in 	A,(CF_STATUS)
		AND 	080H
		cp 	080H
		JR	Z,cfWait1
		POP 	AF
		RET

;================================================================================================
; Print (on console) a sequence of characters ending with zero
;================================================================================================
PRINTSEQ:
		EX 	(SP),HL 		; Push HL and put RET address into HL
		PUSH 	AF
		PUSH 	BC
NEXTCHAR:
		LD 	A,(HL)
		CP	0
		JR	Z,ENDOFPRINT
		LD  	C,A
		CALL 	CONOUT		; Print to console
		INC 	HL
		JR	NEXTCHAR
ENDOFPRINT:
		INC 	HL 			; Get past "null" terminator
		POP 	BC
		POP 	AF
		EX 	(SP),HL 		; Push new RET address on stack and restore HL
		RET

;================================================================================================
; Data storage
;================================================================================================
dirbuf: 	.ds 128 		;scratch directory area
alv00: 		.ds 257			;allocation vector 0
alv01: 		.ds 257			;allocation vector 1
alv02: 		.ds 257			;allocation vector 2
alv03: 		.ds 257			;allocation vector 3
alv04: 		.ds 257			;allocation vector 4
alv05: 		.ds 257			;allocation vector 5
alv06: 		.ds 257			;allocation vector 6
alv07: 		.ds 257			;allocation vector 7
alv08: 		.ds 257			;allocation vector 8
alv09: 		.ds 257			;allocation vector 9
alv10: 		.ds 257			;allocation vector 10
alv11: 		.ds 257			;allocation vector 11
alv12: 		.ds 257			;allocation vector 12
alv13: 		.ds 257			;allocation vector 13
alv14: 		.ds 257			;allocation vector 14
alv15: 		.ds 257			;allocation vector 15

lba0		.DB	00h
lba1		.DB	00h
lba2		.DB	00h
lba3		.DB	00h

sekdsk:		.ds	1		;seek disk number
sektrk:		.ds	2		;seek track number
seksec:		.ds	2		;seek sector number
;
hstdsk:		.ds	1		;host disk number
hsttrk:		.ds	2		;host track number
hstsec:		.ds	1		;host sector number
;
sekhst:		.ds	1		;seek shr secshf
hstact:		.ds	1		;host active flag
hstwrt:		.ds	1		;host written flag
;
unacnt:		.ds	1		;unalloc rec cnt
unadsk:		.ds	1		;last unalloc disk
unatrk:		.ds	2		;last unalloc track
unasec:		.ds	1		;last unalloc sector
;
erflag:		.ds	1		;error reporting
rsflag:		.ds	1		;read sector flag
readop:		.ds	1		;1 if read operation
wrtype:		.ds	1		;write operation type
dmaAddr:	.ds	2		;last dma address
hstbuf:		.ds	512		;host buffer
hstBufEnd:	.EQU	$

			.DS	020h			; Start of BIOS stack area.
BIOSSTACK:	.EQU	$

biosEnd:	.EQU	$

		.END
