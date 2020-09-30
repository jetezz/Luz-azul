;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module player
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _array_1
	.globl _array_0
	.globl _playerSprite
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
	.db #0x5d	; 93
	.db #0x4e	; 78	'N'
	.db #0x44	; 68	'D'
	.db #0x46	; 70	'F'
	.db #0x42	; 66	'B'
	.db #0x5c	; 92
	.db #0x47	; 71	'G'
	.db #0x45	; 69	'E'
	.db #0x58	; 88	'X'
	.db #0x5d	; 93
	.db #0x43	; 67	'C'
	.db #0x4f	; 79	'O'
	.db #0x40	; 64
	.db #0x4c	; 76	'L'
	.db #0x4b	; 75	'K'
_playerSprite:
	.dw _array_0
	.dw _array_1
_array_0:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0xf3	; 243
	.db #0xa2	; 162
	.db #0xfd	; 253
	.db #0xaa	; 170
	.db #0xf3	; 243
	.db #0x54	; 84	'T'
	.db #0xfd	; 253
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfd	; 253
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x55	; 85	'U'
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x55	; 85	'U'
	.db #0xfb	; 251
	.db #0x30	; 48	'0'
	.db #0xfc	; 252
	.db #0x75	; 117	'u'
_array_1:
	.db #0xfb	; 251
	.db #0x30	; 48	'0'
	.db #0xfc	; 252
	.db #0x75	; 117	'u'
	.db #0xfb	; 251
	.db #0x30	; 48	'0'
	.db #0xfc	; 252
	.db #0x75	; 117	'u'
	.db #0xaa	; 170
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xf6	; 246
	.db #0xfc	; 252
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xfc	; 252
	.db #0xf3	; 243
	.db #0x55	; 85	'U'
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.area _INITIALIZER
	.area _CABS (ABS)
