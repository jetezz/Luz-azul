;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module player
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _playerSprite_1
	.globl _playerSprite_0
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
	.dw _playerSprite_0
	.dw _playerSprite_1
_playerSprite_0:
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0xf3	; 243
	.db #0xa2	; 162
	.db #0xa8	; 168
	.db #0x2a	; 42
	.db #0xf3	; 243
	.db #0x54	; 84	'T'
	.db #0xa8	; 168
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xa8	; 168
	.db #0x51	; 81	'Q'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xa8	; 168
	.db #0x51	; 81	'Q'
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x51	; 81	'Q'
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x51	; 81	'Q'
	.db #0x30	; 48	'0'
	.db #0xfc	; 252
	.db #0x20	; 32
_playerSprite_1:
	.db #0x51	; 81	'Q'
	.db #0x30	; 48	'0'
	.db #0xfc	; 252
	.db #0x20	; 32
	.db #0x51	; 81	'Q'
	.db #0x30	; 48	'0'
	.db #0xfc	; 252
	.db #0x20	; 32
	.db #0x2a	; 42
	.db #0xf3	; 243
	.db #0xf3	; 243
	.db #0x15	; 21
	.db #0x2a	; 42
	.db #0xf6	; 246
	.db #0xfc	; 252
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0x51	; 81	'Q'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xa8	; 168
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _INITIALIZER
	.area _CABS (ABS)
