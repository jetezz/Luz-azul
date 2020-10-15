;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module Character_Mother
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Character_Mother_1
	.globl _Character_Mother_0
	.globl _Character_Mother
	.globl _Character_MotherPALETTE
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
_Character_MotherPALETTE:
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
_Character_Mother:
	.dw _Character_Mother_0
	.dw _Character_Mother_1
_Character_Mother_0:
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0xa8	; 168
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0xa8	; 168
	.db #0x33	; 51	'3'
	.db #0x54	; 84	'T'
	.db #0x27	; 39
	.db #0x22	; 34
	.db #0x33	; 51	'3'
	.db #0x54	; 84	'T'
	.db #0x27	; 39
	.db #0x22	; 34
	.db #0x33	; 51	'3'
	.db #0x54	; 84	'T'
	.db #0x0f	; 15
	.db #0xa8	; 168
	.db #0x33	; 51	'3'
	.db #0x54	; 84	'T'
	.db #0x0f	; 15
	.db #0xa8	; 168
	.db #0x05	; 5
	.db #0x54	; 84	'T'
	.db #0x30	; 48	'0'
	.db #0xa8	; 168
	.db #0x05	; 5
	.db #0x54	; 84	'T'
	.db #0x30	; 48	'0'
	.db #0xa8	; 168
_Character_Mother_1:
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x30	; 48	'0'
	.db #0x74	; 116	't'
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x30	; 48	'0'
	.db #0x74	; 116	't'
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x25	; 37
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
