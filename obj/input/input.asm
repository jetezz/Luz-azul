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
	.globl _keyFire
	.globl _movimientoPlayer
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
;src/input/input.c:4: void scanKey(){
;	---------------------------------
; Function scanKey
; ---------------------------------
_scanKey::
;src/input/input.c:5: cpct_scanKeyboard_f();
	jp  _cpct_scanKeyboard_f
;src/input/input.c:8: u8 keyScape(){
;	---------------------------------
; Function keyScape
; ---------------------------------
_keyScape::
;src/input/input.c:9: u8 pulsada=0;
	ld	l, #0x00
;src/input/input.c:10: if(cpct_isKeyPressed (Key_Esc))
	push	hl
	ld	hl, #0x0408
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	ret	Z
;src/input/input.c:11: pulsada=1;
	ld	l, #0x01
;src/input/input.c:12: return pulsada;    
	ret
;src/input/input.c:14: u8 keyFire(){
;	---------------------------------
; Function keyFire
; ---------------------------------
_keyFire::
;src/input/input.c:15: u8 pulsada=0;
	ld	l, #0x00
;src/input/input.c:16: if(cpct_isKeyPressed (Key_Space))
	push	hl
	ld	hl, #0x8005
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	ret	Z
;src/input/input.c:17: pulsada=1;
	ld	l, #0x01
;src/input/input.c:18: return pulsada; 
	ret
;src/input/input.c:22: u8 movimientoPlayer(){
;	---------------------------------
; Function movimientoPlayer
; ---------------------------------
_movimientoPlayer::
;src/input/input.c:23: u8 pulsada=0;
;src/input/input.c:24: u8 movimiento=mover_SinMovimiento;
	ld	hl,#0x0000
;src/input/input.c:25: if(cpct_isKeyPressed (Key_CursorUp)){
	push	hl
	ld	hl, #0x0100
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	jr	Z,00102$
;src/input/input.c:26: movimiento=mover_Arriba;
;src/input/input.c:27: pulsada=1;
	ld	hl,#0x0102
00102$:
;src/input/input.c:29: if(cpct_isKeyPressed (Key_CursorDown)){
	push	hl
	ld	hl, #0x0400
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	jr	Z,00106$
;src/input/input.c:30: movimiento=mover_Abajo;
	ld	l, #0x04
;src/input/input.c:31: if(pulsada==1)
	dec	h
	jr	NZ,00104$
;src/input/input.c:32: return mover_SinMovimiento;
	ld	l, #0x00
	ret
00104$:
;src/input/input.c:33: pulsada=1;
	ld	h, #0x01
00106$:
;src/input/input.c:35: if(cpct_isKeyPressed (Key_CursorLeft)){
	push	hl
	ld	hl, #0x0101
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	jr	Z,00110$
;src/input/input.c:36: movimiento=mover_Izquierda;
	ld	l, #0x01
;src/input/input.c:37: if(pulsada==1)
	dec	h
	jr	NZ,00108$
;src/input/input.c:38: return mover_SinMovimiento;
	ld	l, #0x00
	ret
00108$:
;src/input/input.c:39: pulsada=1;
	ld	h, #0x01
00110$:
;src/input/input.c:41: if(cpct_isKeyPressed (Key_CursorRight)){
	push	hl
	ld	hl, #0x0200
	call	_cpct_isKeyPressed
	ld	a, l
	pop	hl
	or	a, a
	ret	Z
;src/input/input.c:42: movimiento=mover_Derecha;
	ld	l, #0x03
;src/input/input.c:43: if(pulsada==1)
	dec	h
	ret	NZ
;src/input/input.c:44: return mover_SinMovimiento;         
	ld	l, #0x00
;src/input/input.c:46: return movimiento;
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
