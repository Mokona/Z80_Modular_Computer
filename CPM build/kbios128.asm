;==================================================================================
; Contents of this file are copyright Grant Searle
; Blocking/unblocking routines are the published version by Digital Research
; (bugfixed, as found on the web)
;
; You have permission to use this for NON COMMERCIAL USE ONLY
; If you wish to use it elsewhere, please include an acknowledgement to myself.
;
; http://searle.hostei.com/grant/index.html
;
; eMail: home.micros01@btinternet.com
;
; If the above don't work, please perform an Internet search to see if I have
; updated the web page hosting service.
;
; Customized by Kaltchuk for use with Z80 Modular Computer, december/2020.
;
;==================================================================================

ccp				.EQU	0D000h			; Base of CCP.
bdos			.EQU	ccp + 0806h		; Base of BDOS.
bios			.EQU	ccp + 1600h		; Base of BIOS.

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
ROM_RAM0		.EQU	0F0H			; ROM + RAM bank 0
NOROM_RAM0		.EQU	0F1H			; no ROM + RAM bank 0 (full RAM)
ROM_RAM1		.EQU	0F2H			; ROM + RAM bank 1
NOROM_RAM1		.EQU	0F3H			; no ROM + RAM bank 1 (full RAM)

; USART card stuff
USART_DAT		.EQU	0D0H			; USART data addr
USART_CMD		.EQU	0D1H			; USART command addr
USART_STA		.EQU	0D1H			; USART status addr
UMODE			.EQU	06FH			; 8N1 (8 bit, no parity, 1 stop), baud=clock/64
UCMD0			.EQU	015H			; initial command: Rx enable, Tx enable, reset error flags

; FLASH card stuff
FLASH_ADDR		.EQU	0B0H			; Base I/O address for compact flash card
; CF registers
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

LF				.EQU	0AH				;line feed
FF				.EQU	0CH				;form feed
CR				.EQU	0DH				;carriage RETurn

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

		CALL USARTINIT			; Initialize USART

		LD	BC,BUFINI			; Initialize pointers for USART buffer
		LD	(WRPTR),BC
		LD	(RDPTR),BC

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

		XOR	A					; set drive byte to A:
		LD	(userdrv),A

		CALL	PRINTSEQ
		.TEXT "Z80 Modular Computer BIOS 1.0 by Kaltchuk 2020"
		.DB CR,LF,CR,LF
		.TEXT "CP/M 2.2 Copyright 1979 (c) by Digital Research"
		.DB CR,LF,CR,LF,0

		JP	gocpm

;================================================================================================
; Warm boot
;================================================================================================

wboot:
		DI						; Disable interrupts.
		LD	SP,BIOSSTACK		; Set default stack.

		LD	B,11 				; Number of sectors to reload

		LD	A,0
		LD	(hstsec),A
		LD	HL,ccp
rdSectors:

		CALL	cfWait
		LD	A,(hstsec)
		OUT 	(CF_LBA0),A
		LD	A,0
		OUT 	(CF_LBA1),A
		OUT 	(CF_LBA2),A
		LD	A,0E0H
		OUT 	(CF_LBA3),A
		LD 	A,1
		OUT 	(CF_SECCOUNT),A
		PUSH 	BC
		CALL 	cfWait
		LD 	A,CF_READ_SEC
		OUT 	(CF_COMMAND),A
		CALL 	cfWait
		LD 	C,4
rd4secs512:
		LD 	B,128
rdByte512:
		IN 	A,(CF_DATA)
		LD 	(HL),A
		INC 	HL
		DEC 	B
		JR 	NZ, rdByte512
		DEC 	C
		JR 	NZ,rd4secs512
		POP 	BC
		LD	A,(hstsec)
		INC	A
		LD	(hstsec),A
		DJNZ	rdSectors


;================================================================================================
; Common code for cold and warm boot
;================================================================================================

gocpm:
		XOR	A					; 0 to accumulator
		LD	(hstact),A			; host buffer inactive
		LD	(unacnt),A			;clear unalloc count

		LD	HL,tpabuf			; ADDress of BIOS DMA buffer.
		LD	(dmaAddr),HL
		
		LD	A,0C3h				; Opcode for 'JP'.
		LD	(00h),A				; Load at start of RAM.
		LD	HL,wboote			; ADDress of jump for a warm boot.
		LD	(01h),HL
		LD	(05h),A				; Opcode for 'JP'.
		LD	HL,bdos				; ADDress of jump for the BDOS.
		LD	(06h),HL
		LD	(038H),A			; at 038h write "JP UINT"
		LD	HL,UINT			; which is the interrupt routine to catch incoming
		LD	(039H),HL			; character on the USART
		LD	A,(userdrv)			; Save new drive number (0).
		LD	C,A					; Pass drive number in C.

		IM	1
		EI
	
		JP	ccp					; Start CP/M by jumping to the CCP.

;================================================================================================
; Interrupt routine for USART
;================================================================================================
UINT:
		PUSH	BC
		PUSH	HL

		IN	A,(USART_DAT)		; read incoming byte
;		OUT	(USART_DAT),A		; send character
		LD	BC,(WRPTR)
		LD	(BC),A
		INC	BC
		LD	HL,BUFEND
		SCF
		CCF
		SBC	HL,BC
		JR	NZ,EOINT
		LD	BC,BUFINI
EOINT:	LD	(WRPTR),BC

		POP	HL
		POP	BC
		IM	1
		EI
		RETI

;================================================================================================
; Initialize USART
;================================================================================================
USARTINIT:
		LD 	A,0					; Worst case init: put in SYNC mode, 
		OUT	(USART_CMD),A		; send 2 dummy 00 sync chars and reset
		NOP
		OUT	(USART_CMD),A
		NOP
		OUT	(USART_CMD),A
		LD 	A,040H				; Reset USART
		OUT	(USART_CMD),A
		LD 	A,UMODE				; Set USART mode
		OUT	(USART_CMD),A
		LD 	A,UCMD0				; Set USART initial command
		OUT	(USART_CMD),A
		RET

;================================================================================================
; Console I/O routines
;================================================================================================
;================================================================================================
; Console Status (Return A=0FFh if character waiting. Otherwise, A=0)
;================================================================================================
CONST:
		PUSH	BC
		PUSH	HL
		LD	BC,(WRPTR)
		LD	HL,(RDPTR)
		XOR	A
		SBC	HL,BC
		JR	Z,CONVOID
		LD	A,0FFH
CONVOID:
		POP	HL
		POP	BC
	  	RET

;================================================================================================
; Console Input (Wait for input and return character in A)
;================================================================================================
CONIN:
		PUSH	BC	
		PUSH	HL	
AGAIN:	CALL	CONST
		CP	0
		JR	Z,AGAIN			; Keep trying till we receive something
		LD	BC,(RDPTR)
		LD	A,(BC)
		INC	BC
		LD	HL,BUFEND
		SCF
		CCF
		SBC	HL,BC
		JR	NZ,EOCONIN
		LD	BC,BUFINI
EOCONIN:	LD	(RDPTR),BC
		POP	HL
		POP	BC
		RET					; Char read returns in A

;================================================================================================
; Console Output (Send character in reg C)
;================================================================================================
CONOUT:
		IN	A,(USART_STA)		; read USART status byte
		AND	04H				; get only the TxEMPTY bit
		JR	Z,CONOUT
		LD	A,C
		OUT	(USART_DAT),A		; send character
		RET

;================================================================================================
; Reader Input
;================================================================================================
READER:	JP CONIN	

;================================================================================================
; List Output
;================================================================================================
LIST:		JP CONOUT

;================================================================================================
; Punch Output
;================================================================================================
PUNCH:	JP CONOUT	

;================================================================================================
; List Status (List = Console)
;================================================================================================
LISTST:	IN	A,(USART_CMD)
		AND	00000001b			; Get the TxReady bit
		JR	Z,listvoid
		LD	A,0FFh
listvoid:	RET

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

BUFINI		.EQU	$
			.DS	050H
BUFEND		.EQU	$
WRPTR:		.DS	2			; write pointer
RDPTR:		.DS	2			; read pointer

			.DS	020h			; Start of BIOS stack area.
BIOSSTACK:	.EQU	$

biosEnd:	.EQU	$

		.END
