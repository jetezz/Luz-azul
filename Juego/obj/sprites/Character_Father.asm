;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module Character_Father
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Character_Father_1
	.globl _Character_Father_0
	.globl _Character_Father
	.globl _Character_FatherPALETTE
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
_Character_FatherPALETTE:
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
_Character_Father:
	.dw _Character_Father_0
	.dw _Character_Father_1
_Character_Father_0:
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x96	; 150
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x96	; 150
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x86	; 134
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
_Character_Father_1:
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x14	; 20
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x8a	; 138
	.db #0x8a	; 138
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8a	; 138
	.db #0x8a	; 138
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x82	; 130
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x82	; 130
	.db #0xc3	; 195
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
