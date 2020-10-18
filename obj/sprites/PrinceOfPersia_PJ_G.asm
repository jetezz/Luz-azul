;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module PrinceOfPersia_PJ_G
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PrinceOfPersia_PJ_G_1
	.globl _PrinceOfPersia_PJ_G_0
	.globl _PrinceOfPersia_PJ_G
	.globl _PrinceOfPersia_PJ_GPALETTE
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
_PrinceOfPersia_PJ_GPALETTE:
	.db #0x54	; 84	'T'
	.db #0x5b	; 91
	.db #0x4f	; 79	'O'
	.db #0x5d	; 93
	.db #0x44	; 68	'D'
	.db #0x5f	; 95
	.db #0x4b	; 75	'K'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x40	; 64
	.db #0x5c	; 92
	.db #0x46	; 70	'F'
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x5e	; 94
_PrinceOfPersia_PJ_G:
	.dw _PrinceOfPersia_PJ_G_0
	.dw _PrinceOfPersia_PJ_G_1
_PrinceOfPersia_PJ_G_0:
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2e	; 46
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2e	; 46
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x3c	; 60
_PrinceOfPersia_PJ_G_1:
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x28	; 40
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8a	; 138
	.db #0x00	; 0
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8a	; 138
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x8a	; 138
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0x8a	; 138
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
