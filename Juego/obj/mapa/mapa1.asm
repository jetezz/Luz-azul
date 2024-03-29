;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module mapa1
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _map
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
_map:
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x0d	; 13
	.db #0x17	; 23
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x12	; 18
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x1d	; 29
	.db #0x1f	; 31
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x1b	; 27
	.db #0x14	; 20
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x20	; 32
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1b	; 27
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x1f	; 31
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x2a	; 42
	.db #0x24	; 36
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x26	; 38
	.db #0x28	; 40
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x33	; 51	'3'
	.db #0x2d	; 45
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x2f	; 47
	.db #0x31	; 49	'1'
	.area _INITIALIZER
	.area _CABS (ABS)
