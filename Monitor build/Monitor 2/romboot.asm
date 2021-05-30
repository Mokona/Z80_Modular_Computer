;==================================================================================
; ROM Bootloader for CP/M
;==================================================================================
#INCLUDE	"equates.h"

;================================================================================================
			.ORG	0

			LD	BC,03000H			; Copy CP/M and BIOS from ROM (01000h) to RAM (0D000h)
			LD	DE,CCP				; DE = target addr
			LD	HL,ROM_CCP			; HL = source addr
			LDIR

			JP	BIOS

			.END