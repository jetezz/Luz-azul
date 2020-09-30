;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module input
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _scanKey
	.globl _keyScape
	.globl _keyUp
	.globl _keyDown
	.globl _keyLeft
	.globl _keyRight
	.globl _keyFire
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
;src/input/input.c:3: void scanKey(){
;	---------------------------------
; Function scanKey
; ---------------------------------
_scanKey::
;src/input/input.c:4: cpct_scanKeyboard_f();
	jp  _cpct_scanKeyboard_f
;src/input/input.c:7: u8 keyScape(){
;	---------------------------------
; Function keyScape
; ---------------------------------
_keyScape::
;src/input/input.c:8: u8 pulsada=0;
	ld	l, #0x00
;src/input/input.c:9: if(cpct_isKeyPressed (Key_Esc))
	push	hl
	ld	hl, #0x0408
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	ret	Z
;src/input/input.c:10: pulsada=1;
	ld	l, #0x01
;src/input/input.c:11: return pulsada;    
	ret
;src/input/input.c:13: u8 keyUp(){
;	---------------------------------
; Function keyUp
; ---------------------------------
_keyUp::
;src/input/input.c:14: u8 pulsada=0;
	ld	l, #0x00
;src/input/input.c:15: if(cpct_isKeyPressed (Key_CursorUp))
	push	hl
	ld	hl, #0x0100
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	ret	Z
;src/input/input.c:16: pulsada=1;
	ld	l, #0x01
;src/input/input.c:17: return pulsada; 
	ret
;src/input/input.c:19: u8 keyDown(){
;	---------------------------------
; Function keyDown
; ---------------------------------
_keyDown::
;src/input/input.c:20: u8 pulsada=0;
	ld	l, #0x00
;src/input/input.c:21: if(cpct_isKeyPressed (Key_CursorDown))
	push	hl
	ld	hl, #0x0400
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	ret	Z
;src/input/input.c:22: pulsada=1;
	ld	l, #0x01
;src/input/input.c:23: return pulsada; 
	ret
;src/input/input.c:25: u8 keyLeft(){
;	---------------------------------
; Function keyLeft
; ---------------------------------
_keyLeft::
;src/input/input.c:26: u8 pulsada=0;
	ld	l, #0x00
;src/input/input.c:27: if(cpct_isKeyPressed (Key_CursorLeft))
	push	hl
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	ret	Z
;src/input/input.c:28: pulsada=1;
	ld	l, #0x01
;src/input/input.c:29: return pulsada; 
	ret
;src/input/input.c:31: u8 keyRight(){
;	---------------------------------
; Function keyRight
; ---------------------------------
_keyRight::
;src/input/input.c:32: u8 pulsada=0;
	ld	l, #0x00
;src/input/input.c:33: if(cpct_isKeyPressed (Key_CursorRight))
	push	hl
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	ret	Z
;src/input/input.c:34: pulsada=1;
	ld	l, #0x01
;src/input/input.c:35: return pulsada; 
	ret
;src/input/input.c:37: u8 keyFire(){
;	---------------------------------
; Function keyFire
; ---------------------------------
_keyFire::
;src/input/input.c:38: u8 pulsada=0;
	ld	l, #0x00
;src/input/input.c:39: if(cpct_isKeyPressed (Key_Space))
	push	hl
	ld	hl, #0x8005
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	ret	Z
;src/input/input.c:40: pulsada=1;
	ld	l, #0x01
;src/input/input.c:41: return pulsada; 
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
