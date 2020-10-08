;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module portal
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _portalSprite_1
	.globl _portalSprite_0
	.globl _portalSprite
	.globl _portalPALETTE
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
_portalPALETTE:
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
_portalSprite:
	.dw _portalSprite_0
	.dw _portalSprite_1
_portalSprite_0:
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x2e	; 46
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x4d	; 77	'M'
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0x2e	; 46
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xbf	; 191
	.db #0x2e	; 46
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xbf	; 191
_portalSprite_1:
	.db #0x2e	; 46
	.db #0xcf	; 207
	.db #0xcf	; 207
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x4d	; 77	'M'
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x2e	; 46
	.db #0xbf	; 191
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.area _INITIALIZER
	.area _CABS (ABS)
