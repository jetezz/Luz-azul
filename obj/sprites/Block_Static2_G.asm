;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module Block_Static2_G
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Block_Static2_G_1
	.globl _Block_Static2_G_0
	.globl _Block_Static2_G
	.globl _Block_Static2_GPALETTE
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
_Block_Static2_GPALETTE:
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
_Block_Static2_G:
	.dw _Block_Static2_G_0
	.dw _Block_Static2_G_1
_Block_Static2_G_0:
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x36	; 54	'6'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x36	; 54	'6'
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0x19	; 25
	.db #0x2c	; 44
	.db #0xf0	; 240
	.db #0x78	; 120	'x'
	.db #0x19	; 25
	.db #0x2c	; 44
	.db #0xf0	; 240
	.db #0x78	; 120	'x'
	.db #0x39	; 57	'9'
	.db #0x36	; 54	'6'
	.db #0xf0	; 240
	.db #0x78	; 120	'x'
	.db #0x39	; 57	'9'
	.db #0x36	; 54	'6'
	.db #0xf0	; 240
_Block_Static2_G_1:
	.db #0x78	; 120	'x'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x78	; 120	'x'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x0c	; 12
	.db #0xc0	; 192
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
