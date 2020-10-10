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
;src/fisicas/fisicas.c:18: u8* calcularPosicionEnPantalla(u8 posx, u8 posy){
;	---------------------------------
; Function calcularPosicionEnPantalla
; ---------------------------------
_calcularPosicionEnPantalla::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/fisicas/fisicas.c:20: return cpctm_screenPtr(CPCT_VMEM_START, posx*4, posy*16);
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
;src/fisicas/fisicas.c:22: u8 calcularMaximosyMinimos(u8 movimiento,u8 posx, u8 posy,u8 posicion){   
;	---------------------------------
; Function calcularMaximosyMinimos
; ---------------------------------
_calcularMaximosyMinimos::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/fisicas/fisicas.c:25: if(posicion==posicion_Izquieda){        
	ld	a, 7 (ix)
	or	a, a
	jr	NZ,00102$
;src/fisicas/fisicas.c:26: maximox=posxMax;
	ld	c, #0x07
;src/fisicas/fisicas.c:27: minimox=posMin;
	ld	e, #0x01
	jr	00103$
00102$:
;src/fisicas/fisicas.c:29: maximox=posxMaxEspejo;
	ld	c, #0x0f
;src/fisicas/fisicas.c:30: minimox=posxminEspejo;
	ld	e, #0x09
00103$:
;src/fisicas/fisicas.c:33: if(movimiento!=mover_SinMovimiento){
	ld	a, 4 (ix)
	or	a, a
	jr	Z,00124$
;src/fisicas/fisicas.c:35: if(posx-1<minimox)
	ld	l, 5 (ix)
	ld	h, #0x00
;src/fisicas/fisicas.c:34: if(movimiento==mover_Izquierda){
	ld	a, 4 (ix)
	dec	a
	jr	NZ,00121$
;src/fisicas/fisicas.c:35: if(posx-1<minimox)
	dec	hl
	ld	c, #0x00
	ld	a, l
	sub	a, e
	ld	a, h
	sbc	a, c
	jp	PO, 00169$
	xor	a, #0x80
00169$:
	jp	P, 00124$
;src/fisicas/fisicas.c:36: movimiento=mover_SinMovimiento;
	ld	4 (ix), #0x00
	jr	00124$
00121$:
;src/fisicas/fisicas.c:38: if(posy-1<posMin)
	ld	e, 6 (ix)
	ld	d, #0x00
;src/fisicas/fisicas.c:37: }else if(movimiento==mover_Arriba){
	ld	a, 4 (ix)
	sub	a, #0x02
	jr	NZ,00118$
;src/fisicas/fisicas.c:38: if(posy-1<posMin)
	dec	de
	ld	a, e
	sub	a, #0x01
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00124$
;src/fisicas/fisicas.c:39: movimiento=mover_SinMovimiento;
	ld	4 (ix), #0x00
	jr	00124$
00118$:
;src/fisicas/fisicas.c:40: }else if(movimiento==mover_Derecha){
	ld	a, 4 (ix)
	sub	a, #0x03
	jr	NZ,00115$
;src/fisicas/fisicas.c:41: if(posx+1>maximox)
	inc	hl
	ld	b, #0x00
	ld	a, c
	sub	a, l
	ld	a, b
	sbc	a, h
	jp	PO, 00174$
	xor	a, #0x80
00174$:
	jp	P, 00124$
;src/fisicas/fisicas.c:42: movimiento=mover_SinMovimiento;
	ld	4 (ix), #0x00
	jr	00124$
00115$:
;src/fisicas/fisicas.c:43: }else if(movimiento==mover_Abajo){
	ld	a, 4 (ix)
	sub	a, #0x04
	jr	NZ,00124$
;src/fisicas/fisicas.c:44: if(posy+1>posyMax)
	inc	de
	ld	c, e
	ld	a, #0x07
	cp	a, c
	ld	a, #0x00
	sbc	a, d
	jp	PO, 00177$
	xor	a, #0x80
00177$:
	jp	P, 00124$
;src/fisicas/fisicas.c:45: movimiento=mover_SinMovimiento;
	ld	4 (ix), #0x00
00124$:
;src/fisicas/fisicas.c:48: return movimiento;
	ld	l, 4 (ix)
	pop	ix
	ret
;src/fisicas/fisicas.c:50: u8 comprobarColisiones1vs1(u8 posx, u8 posy,u8 posxRock, u8 posyRock){    
;	---------------------------------
; Function comprobarColisiones1vs1
; ---------------------------------
_comprobarColisiones1vs1::
;src/fisicas/fisicas.c:51: if(posx==posxRock && posy==posyRock){        
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
;src/fisicas/fisicas.c:52: return hay_Colision;
	ld	l, #0x01
	ret
00102$:
;src/fisicas/fisicas.c:54: return no_Hay_Colision;
	ld	l, #0x00
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
