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
_PrinceOfPersia_Tape:
	.dw _PrinceOfPersia_Tape_0
	.dw _PrinceOfPersia_Tape_1
_PrinceOfPersia_Tape_0:
	.db #0x45	; 69	'E'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xa8	; 168
	.db #0x45	; 69	'E'
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xa8	; 168
	.db #0x8a	; 138
	.db #0x54	; 84	'T'
	.db #0xa8	; 168
	.db #0x54	; 84	'T'
	.db #0x8a	; 138
	.db #0x54	; 84	'T'
	.db #0xa8	; 168
	.db #0x54	; 84	'T'
	.db #0xa8	; 168
	.db #0x82	; 130
	.db #0x41	; 65	'A'
	.db #0x54	; 84	'T'
	.db #0xa8	; 168
	.db #0x82	; 130
	.db #0x41	; 65	'A'
	.db #0x54	; 84	'T'
	.db #0xe9	; 233
	.db #0x41	; 65	'A'
	.db #0x82	; 130
	.db #0xd6	; 214
	.db #0xe9	; 233
	.db #0x41	; 65	'A'
	.db #0x82	; 130
	.db #0xd6	; 214
_PrinceOfPersia_Tape_1:
	.db #0xa8	; 168
	.db #0x82	; 130
	.db #0x41	; 65	'A'
	.db #0x54	; 84	'T'
	.db #0xa8	; 168
	.db #0x82	; 130
	.db #0x41	; 65	'A'
	.db #0x54	; 84	'T'
	.db #0xa8	; 168
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xa8	; 168
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x54	; 84	'T'
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xa8	; 168
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x54	; 84	'T'
	.db #0xa8	; 168
	.db #0xfc	; 252
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.area _INITIALIZER
	.area _CABS (ABS)
