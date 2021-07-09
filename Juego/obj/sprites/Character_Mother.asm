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
_Character_Mother:
	.dw _Character_Mother_0
	.dw _Character_Mother_1
_Character_Mother_0:
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x3f	; 63
	.db #0x2a	; 42
	.db #0x3c	; 60
	.db #0x15	; 21
	.db #0x2c	; 44
	.db #0x28	; 40
	.db #0x3c	; 60
	.db #0x15	; 21
	.db #0x2c	; 44
	.db #0x28	; 40
	.db #0x3c	; 60
	.db #0x15	; 21
	.db #0x0c	; 12
	.db #0x2a	; 42
	.db #0x3c	; 60
	.db #0x15	; 21
	.db #0x0c	; 12
	.db #0x2a	; 42
	.db #0x04	; 4
	.db #0x15	; 21
	.db #0x03	; 3
	.db #0x2a	; 42
	.db #0x04	; 4
	.db #0x15	; 21
	.db #0x03	; 3
	.db #0x2a	; 42
_Character_Mother_1:
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x41	; 65	'A'
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
