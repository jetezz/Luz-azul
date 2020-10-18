;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _game
	.globl _cpct_setPalette
	.globl _cpct_setVideoMode
	.globl _cpct_disableFirmware
	.globl _game_palette
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_P_portal:
	.ds 2
_P_puertas:
	.ds 2
_P_col:
	.ds 2
_P_luz:
	.ds 2
_P_fam:
	.ds 2
_P_ams:
	.ds 2
_P_colList:
	.ds 2
_movimientoGuardado:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/main.c:12: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:13: cpct_disableFirmware();
	call	_cpct_disableFirmware
;src/main.c:14: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:15: cpct_setPalette(Block_HolePALETTE, 16);   
	ld	hl, #0x0010
	push	hl
	ld	hl, #_Block_HolePALETTE
	push	hl
	call	_cpct_setPalette
;src/main.c:16: game();
	call	_game
	ret
_game_palette:
	.db #0x54	; 84	'T'
	.db #0x5c	; 92
	.db #0x5e	; 94
	.db #0x5d	; 93
	.db #0x5f	; 95
	.db #0x4f	; 79	'O'
	.db #0x44	; 68	'D'
	.db #0x55	; 85	'U'
	.db #0x57	; 87	'W'
	.db #0x47	; 71	'G'
	.db #0x5b	; 91
	.db #0x56	; 86	'V'
	.db #0x40	; 64
	.db #0x4b	; 75	'K'
	.db 0x00
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
