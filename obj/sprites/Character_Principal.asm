;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module Character_Principal
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Character_Principal_1
	.globl _Character_Principal_0
	.globl _Character_Principal
	.globl _PALETTE
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
_PALETTE:
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
_Character_Principal:
	.dw _Character_Principal_0
	.dw _Character_Principal_1
_Character_Principal_0:
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0xd4	; 212
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x96	; 150
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x61	; 97	'a'
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x61	; 97	'a'
	.db #0xd6	; 214
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xb8	; 184
	.db #0x30	; 48	'0'
	.db #0xa8	; 168
	.db #0x20	; 32
	.db #0xb8	; 184
	.db #0x30	; 48	'0'
	.db #0xa8	; 168
_Character_Principal_1:
	.db #0x20	; 32
	.db #0xfc	; 252
	.db #0x30	; 48	'0'
	.db #0x9e	; 158
	.db #0x20	; 32
	.db #0xfc	; 252
	.db #0x30	; 48	'0'
	.db #0x9e	; 158
	.db #0x30	; 48	'0'
	.db #0xd4	; 212
	.db #0xc0	; 192
	.db #0xbc	; 188
	.db #0x30	; 48	'0'
	.db #0xd4	; 212
	.db #0xc0	; 192
	.db #0xbc	; 188
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0xfc	; 252
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
