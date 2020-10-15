;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module PrinceOfPersia_Tape
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PrinceOfPersia_Tape_1
	.globl _PrinceOfPersia_Tape_0
	.globl _PrinceOfPersia_Tape
	.globl _PrinceOfPersia_TapePALETTE
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
	.area _CODE
_PrinceOfPersia_TapePALETTE:
	.db #0x54	; 84	'T'
	.db #0x44	; 68	'D'
	.db #0x55	; 85	'U'
	.db #0x5d	; 93
	.db #0x56	; 86	'V'
	.db #0x46	; 70	'F'
	.db #0x57	; 87	'W'
	.db #0x5e	; 94
	.db #0x40	; 64
	.db #0x5f	; 95
	.db #0x4f	; 79	'O'
	.db #0x5b	; 91
	.db #0x4b	; 75	'K'
_PrinceOfPersia_Tape:
	.dw _PrinceOfPersia_Tape_0
	.dw _PrinceOfPersia_Tape_1
_PrinceOfPersia_Tape_0:
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x14	; 20
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x28	; 40
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
_PrinceOfPersia_Tape_1:
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x40	; 64
	.area _INITIALIZER
	.area _CABS (ABS)
