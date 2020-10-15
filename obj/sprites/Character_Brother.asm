;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module Character_Brother
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Character_Brother_1
	.globl _Character_Brother_0
	.globl _Character_Brother
	.globl _Character_BrotherPALETTE
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
_Character_BrotherPALETTE:
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
_Character_Brother:
	.dw _Character_Brother_0
	.dw _Character_Brother_1
_Character_Brother_0:
	.db #0xf0	; 240
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0xb1	; 177
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0xb1	; 177
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0x5a	; 90	'Z'
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0xc0	; 192
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0xc0	; 192
	.db #0x05	; 5
_Character_Brother_1:
	.db #0x48	; 72	'H'
	.db #0xc0	; 192
	.db #0x1b	; 27
	.db #0x48	; 72	'H'
	.db #0xc0	; 192
	.db #0x1b	; 27
	.db #0x4a	; 74	'J'
	.db #0xc0	; 192
	.db #0x11	; 17
	.db #0x4a	; 74	'J'
	.db #0xc0	; 192
	.db #0x11	; 17
	.db #0x85	; 133
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x85	; 133
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xa8	; 168
	.db #0xfc	; 252
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
