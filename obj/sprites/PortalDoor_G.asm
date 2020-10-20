;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module PortalDoor_G
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _PortalDoor_G_1
	.globl _PortalDoor_G_0
	.globl _PortalDoor_G
	.globl _PortalDoor_GPALETTE
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
_PortalDoor_GPALETTE:
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
_PortalDoor_G:
	.dw _PortalDoor_G_0
	.dw _PortalDoor_G_1
_PortalDoor_G_0:
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xa8	; 168
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xa8	; 168
	.db #0x10	; 16
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x10	; 16
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x10	; 16
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x10	; 16
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
_PortalDoor_G_1:
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xa8	; 168
	.db #0xa8	; 168
	.db #0x10	; 16
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x10	; 16
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.db #0x54	; 84	'T'
	.area _INITIALIZER
	.area _CABS (ABS)