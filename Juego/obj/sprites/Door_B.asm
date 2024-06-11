;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module Door_B
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Door_B_1
	.globl _Door_B_0
	.globl _Door_B
	.globl _Door_BPALETTE
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
_Door_BPALETTE:
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
_Door_B:
	.dw _Door_B_0
	.dw _Door_B_1
_Door_B_0:
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
_Door_B_1:
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0xcc	; 204
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0xcc	; 204
	.db #0x88	; 136
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0x88	; 136
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x44	; 68	'D'
	.db #0xcc	; 204
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0xcc	; 204
	.area _INITIALIZER
	.area _CABS (ABS)