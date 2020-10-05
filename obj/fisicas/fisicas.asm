;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module fisicas
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _calcularPosicionEnPantalla
	.globl _calcularMaximosyMinimos
	.globl _comprobarColisiones1vs1
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
;src/fisicas/fisicas.c:13: u8* calcularPosicionEnPantalla(u8 posx, u8 posy){
;	---------------------------------
; Function calcularPosicionEnPantalla
; ---------------------------------
_calcularPosicionEnPantalla::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/fisicas/fisicas.c:15: return cpctm_screenPtr(CPCT_VMEM_START, posx*4, posy*16);
	ld	l, 5 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	c, e
	ld	b, d
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0xc000
	add	hl, bc
	ld	a, e
	and	a, #0x07
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	b, a
	ld	c, #0x00
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	l, 4 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	pop	ix
	ret
;src/fisicas/fisicas.c:17: u8 calcularMaximosyMinimos(u8 movimiento,u8 posx, u8 posy){      
;	---------------------------------
; Function calcularMaximosyMinimos
; ---------------------------------
_calcularMaximosyMinimos::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/fisicas/fisicas.c:18: if(movimiento!=mover_SinMovimiento){
	ld	a, 4 (ix)
	or	a, a
	jr	Z,00121$
;src/fisicas/fisicas.c:20: if(posx-1<posMin)
	ld	e, 5 (ix)
	ld	d, #0x00
;src/fisicas/fisicas.c:19: if(movimiento==mover_Izquierda){
	ld	a, 4 (ix)
	dec	a
	jr	NZ,00118$
;src/fisicas/fisicas.c:20: if(posx-1<posMin)
	dec	de
	ld	a, e
	sub	a, #0x01
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00121$
;src/fisicas/fisicas.c:21: movimiento=mover_SinMovimiento;
	ld	4 (ix), #0x00
	jr	00121$
00118$:
;src/fisicas/fisicas.c:23: if(posy-1<posMin)
	ld	c, 6 (ix)
	ld	b, #0x00
;src/fisicas/fisicas.c:22: }else if(movimiento==mover_Arriba){
	ld	a, 4 (ix)
	sub	a, #0x02
	jr	NZ,00115$
;src/fisicas/fisicas.c:23: if(posy-1<posMin)
	dec	bc
	ld	a, c
	sub	a, #0x01
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00121$
;src/fisicas/fisicas.c:24: movimiento=mover_SinMovimiento;
	ld	4 (ix), #0x00
	jr	00121$
00115$:
;src/fisicas/fisicas.c:25: }else if(movimiento==mover_Derecha){
	ld	a, 4 (ix)
	sub	a, #0x03
	jr	NZ,00112$
;src/fisicas/fisicas.c:26: if(posx+1>posxMax)
	inc	de
	ld	c, e
	ld	a, #0x07
	cp	a, c
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00166$
	xor	a, #0x80
00166$:
	jp	P, 00121$
;src/fisicas/fisicas.c:27: movimiento=mover_SinMovimiento;
	ld	4 (ix), #0x00
	jr	00121$
00112$:
;src/fisicas/fisicas.c:28: }else if(movimiento==mover_Abajo){
	ld	a, 4 (ix)
	sub	a, #0x04
	jr	NZ,00121$
;src/fisicas/fisicas.c:29: if(posy+1>posyMax)
	inc	bc
	ld	a, #0x09
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00169$
	xor	a, #0x80
00169$:
	jp	P, 00121$
;src/fisicas/fisicas.c:30: movimiento=mover_SinMovimiento;
	ld	4 (ix), #0x00
00121$:
;src/fisicas/fisicas.c:33: return movimiento;
	ld	l, 4 (ix)
	pop	ix
	ret
;src/fisicas/fisicas.c:35: u8 comprobarColisiones1vs1(u8 posx, u8 posy,u8 posxRock, u8 posyRock){    
;	---------------------------------
; Function comprobarColisiones1vs1
; ---------------------------------
_comprobarColisiones1vs1::
;src/fisicas/fisicas.c:36: if(posx==posxRock && posy==posyRock){        
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #4
	add	iy, sp
	sub	a, 0 (iy)
	jr	NZ,00102$
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #5
	add	iy, sp
	sub	a, 0 (iy)
	jr	NZ,00102$
;src/fisicas/fisicas.c:37: return hay_Colision;
	ld	l, #0x01
	ret
00102$:
;src/fisicas/fisicas.c:39: return no_Hay_Colision;
	ld	l, #0x00
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
