;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module gameObject
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _comprobarColisiones1vs1
	.globl _calcularMaximosyMinimos
	.globl _calcularPosicionEnPantalla
	.globl _cpct_drawSprite
	.globl _cpct_drawSolidBox
	.globl _dibujarGameObject
	.globl _limpiarRastro
	.globl _moverGameObject
	.globl _comprobarColisiones
	.globl _moverElEspejo
	.globl _movimientoSimple
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
;src/gameObject/gameObject.c:18: void dibujarGameObject(TGameObject* objeto){
;	---------------------------------
; Function dibujarGameObject
; ---------------------------------
_dibujarGameObject::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:19: if(objeto->posx!=0){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, a
	jr	Z,00111$
;src/gameObject/gameObject.c:20: if(objeto->sprite==sprite_Player){
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
;src/gameObject/gameObject.c:21: cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
;src/gameObject/gameObject.c:20: if(objeto->sprite==sprite_Player){
	ld	a, e
	dec	a
	jr	NZ,00107$
;src/gameObject/gameObject.c:21: cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_playerSprite_0
	push	hl
	call	_cpct_drawSprite
	jr	00111$
00107$:
;src/gameObject/gameObject.c:22: }else if(objeto->sprite==sprite_Rock){
	ld	a, e
	sub	a, #0x02
	jr	NZ,00104$
;src/gameObject/gameObject.c:23: cpct_drawSprite(rock_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_rock_0
	push	hl
	call	_cpct_drawSprite
	jr	00111$
00104$:
;src/gameObject/gameObject.c:24: }else if(objeto->sprite==sprite_RockInmovil){
	ld	a, e
	sub	a, #0x03
	jr	NZ,00111$
;src/gameObject/gameObject.c:25: cpct_drawSprite(rockInmovil_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_rockInmovil_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
00111$:
	pop	ix
	ret
;src/gameObject/gameObject.c:30: void limpiarRastro(u8 posx, u8 posy){
;	---------------------------------
; Function limpiarRastro
; ---------------------------------
_limpiarRastro::
;src/gameObject/gameObject.c:31: cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #0x1004
	push	bc
	ld	bc, #0x0000
	push	bc
	push	hl
	call	_cpct_drawSolidBox
	ret
;src/gameObject/gameObject.c:33: void moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8 posicion){       
;	---------------------------------
; Function moverGameObject
; ---------------------------------
_moverGameObject::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-13
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:34: if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){    
	ld	a, 4 (ix)
	ld	-11 (ix), a
	ld	a, 5 (ix)
	ld	-10 (ix), a
	ld	a, -11 (ix)
	add	a, #0x04
	ld	-2 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c, (hl)
	ld	a, -11 (ix)
	add	a, #0x03
	ld	-4 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	a, c
	or	a, a
	jr	Z,00113$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b, (hl)
	dec	b
	jp	Z,00114$
00113$:
;src/gameObject/gameObject.c:35: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy);            
	ld	a, -11 (ix)
	add	a, #0x02
	ld	-6 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	d, (hl)
	ld	a, -11 (ix)
	add	a, #0x01
	ld	-8 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	e, (hl)
	push	de
	ld	a, 6 (ix)
	push	af
	inc	sp
	call	_calcularMaximosyMinimos
	pop	af
	inc	sp
;src/gameObject/gameObject.c:36: if(movimiento!=mover_SinMovimiento){                  
	ld	-9 (ix), l
	ld	a, l
	or	a, a
	jp	Z, 00117$
;src/gameObject/gameObject.c:37: u8 nextPosx=objeto->posx;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a, (hl)
	ld	-12 (ix), a
;src/gameObject/gameObject.c:38: u8 nextPosy=objeto->posy;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	ld	-13 (ix), a
;src/gameObject/gameObject.c:41: if(objeto->sprite==sprite_Player|| objeto->sprite==sprite_Rock){
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	cp	a, #0x01
	jr	Z,00101$
	sub	a, #0x02
	jr	NZ,00102$
00101$:
;src/gameObject/gameObject.c:42: movimientoSimple(&nextPosx,&nextPosy,movimiento); 
	ld	hl, #0x0000
	add	hl, sp
	ex	de,hl
	ld	hl, #0x0001
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	a, -9 (ix)
	push	af
	inc	sp
	push	de
	push	bc
	call	_movimientoSimple
	pop	af
	pop	af
	inc	sp
00102$:
;src/gameObject/gameObject.c:45: ObjetoColisionado=comprobarColisiones(nextPosx,nextPosy,rocasCol);               
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	h, -13 (ix)
	ld	l, -12 (ix)
	push	hl
	call	_comprobarColisiones
	pop	af
	pop	af
	ld	c, l
;src/gameObject/gameObject.c:47: if(ObjetoColisionado==SinColision){             
	ld	a, c
	sub	a, #0x32
	jr	NZ,00109$
;src/gameObject/gameObject.c:48: limpiarRastro(objeto->posx,objeto->posy);
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	b, (hl)
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	c, (hl)
	push	bc
	call	_limpiarRastro
	pop	af
;src/gameObject/gameObject.c:49: objeto->posx=nextPosx;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a, -12 (ix)
	ld	(hl), a
;src/gameObject/gameObject.c:50: objeto->posy=nextPosy;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, -13 (ix)
	ld	(hl), a
;src/gameObject/gameObject.c:51: dibujarGameObject(objeto);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_dibujarGameObject
	pop	af
;src/gameObject/gameObject.c:52: if(objeto->sprite!=sprite_Player)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c, (hl)
	dec	c
	jr	Z,00110$
;src/gameObject/gameObject.c:53: moverElEspejo(objeto->num,movimiento,rocasCol,rocasEspejo,posicion);                 
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	b, (hl)
	ld	a, 11 (ix)
	push	af
	inc	sp
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, -9 (ix)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_moverElEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	jr	00110$
00109$:
;src/gameObject/gameObject.c:55: if(objeto->sprite==sprite_Player)          
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	b, (hl)
	djnz	00110$
;src/gameObject/gameObject.c:56: moverGameObject(&rocasCol[ObjetoColisionado],movimiento,rocasCol,rocasEspejo,posicion);                      
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, c
	add	a, 7 (ix)
	ld	c, a
	ld	a, b
	adc	a, 8 (ix)
	ld	b, a
	ld	a, 11 (ix)
	push	af
	inc	sp
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, -9 (ix)
	push	af
	inc	sp
	push	bc
	call	_moverGameObject
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
00110$:
;src/gameObject/gameObject.c:58: objeto->cronoMovimiento=retardoMovimiento;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl), #0xff
	jr	00117$
00114$:
;src/gameObject/gameObject.c:61: objeto->cronoMovimiento-=1;
	dec	c
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl), c
00117$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:64: u8 comprobarColisiones(u8 posx,u8 posy,TGameObject* rocas){
;	---------------------------------
; Function comprobarColisiones
; ---------------------------------
_comprobarColisiones::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:65: u8 colision=SinColision;
;src/gameObject/gameObject.c:67: for(u8 i=0;i<RocasMaximas;i++){
	ld	bc,#0x0032
00107$:
	ld	a, b
	sub	a, #0x05
	jr	NC,00105$
;src/gameObject/gameObject.c:68: if(rocas[i].posx!=0){
	ld	e,b
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	de,hl
	ld	a, 6 (ix)
	add	a, e
	ld	e, a
	ld	a, 7 (ix)
	adc	a, d
	ld	d, a
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z,00108$
;src/gameObject/gameObject.c:69: if(comprobarColisiones1vs1(posx,posy,rocas[i].posx,rocas[i].posy)==hay_Colision){           
	ex	de,hl
	inc	hl
	inc	hl
	ld	d, (hl)
	push	bc
	ld	e, a
	push	de
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	call	_comprobarColisiones1vs1
	pop	af
	pop	af
	pop	bc
	dec	l
	jr	NZ,00108$
;src/gameObject/gameObject.c:70: colision=i;
	ld	c, b
00108$:
;src/gameObject/gameObject.c:67: for(u8 i=0;i<RocasMaximas;i++){
	inc	b
	jr	00107$
00105$:
;src/gameObject/gameObject.c:74: return colision;
	ld	l, c
	pop	ix
	ret
;src/gameObject/gameObject.c:76: void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocas,TGameObject* rocasEspejo,u8 posicion){
;	---------------------------------
; Function moverElEspejo
; ---------------------------------
_moverElEspejo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-10
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:80: u8 nextMovimiento=movimiento;   
	ld	e, 5 (ix)
;src/gameObject/gameObject.c:83: objetoEspejo=&rocasEspejo[num];
	ld	c,4 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;src/gameObject/gameObject.c:82: if(posicion==posicion_Izquieda){
	ld	a, 10 (ix)
	or	a, a
	jr	NZ,00102$
;src/gameObject/gameObject.c:83: objetoEspejo=&rocasEspejo[num];
	ld	l,8 (ix)
	ld	h,9 (ix)
	add	hl, bc
	ld	c, l
	ld	b, h
;src/gameObject/gameObject.c:84: objetosColisionables=rocasEspejo;        
	ld	a, 8 (ix)
	ld	-8 (ix), a
	ld	a, 9 (ix)
	ld	-7 (ix), a
	jr	00103$
00102$:
;src/gameObject/gameObject.c:86: objetoEspejo=&rocas[num];
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, bc
	ld	c, l
	ld	b, h
;src/gameObject/gameObject.c:87: objetosColisionables=rocas;        
	ld	a, 6 (ix)
	ld	-8 (ix), a
	ld	a, 7 (ix)
	ld	-7 (ix), a
00103$:
;src/gameObject/gameObject.c:90: if(movimiento==mover_Izquierda){
	ld	a, e
	dec	a
	jr	NZ,00105$
;src/gameObject/gameObject.c:91: nextMovimiento=mover_Derecha;
	ld	e, #0x03
00105$:
;src/gameObject/gameObject.c:92: }if(movimiento==mover_Derecha){
	ld	a, 5 (ix)
	sub	a, #0x03
	jr	NZ,00107$
;src/gameObject/gameObject.c:93: nextMovimiento=mover_Izquierda;
	ld	e, #0x01
00107$:
;src/gameObject/gameObject.c:98: if(nextMovimiento!=mover_SinMovimiento){                  
	ld	a, e
	or	a, a
	jp	Z, 00112$
;src/gameObject/gameObject.c:99: u8 nextPosx=objetoEspejo->posx;
	ld	hl, #0x0001
	add	hl,bc
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, (hl)
	ld	-9 (ix), a
;src/gameObject/gameObject.c:100: u8 nextPosy=objetoEspejo->posy;
	ld	hl, #0x0002
	add	hl,bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	a, (hl)
	ld	-10 (ix), a
;src/gameObject/gameObject.c:103: movimientoSimple(&nextPosx,&nextPosy,nextMovimiento);           
	ld	hl, #0x0000
	add	hl, sp
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	hl, #0x0001
	add	hl, sp
	push	bc
	ld	a, e
	push	af
	inc	sp
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	push	de
	push	hl
	call	_movimientoSimple
	pop	af
	pop	af
	inc	sp
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	ld	h, -10 (ix)
	ld	l, -9 (ix)
	push	hl
	call	_comprobarColisiones
	pop	af
	pop	af
	pop	bc
;src/gameObject/gameObject.c:107: if(ObjetoColisionado==SinColision){             
	ld	a, l
	sub	a, #0x32
	jr	NZ,00112$
;src/gameObject/gameObject.c:108: limpiarRastro(objetoEspejo->posx,objetoEspejo->posy);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d, (hl)
	push	bc
	push	af
	inc	sp
	push	de
	inc	sp
	call	_limpiarRastro
	pop	af
	pop	bc
;src/gameObject/gameObject.c:109: objetoEspejo->posx=nextPosx;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, -9 (ix)
	ld	(hl), a
;src/gameObject/gameObject.c:110: objetoEspejo->posy=nextPosy;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, -10 (ix)
	ld	(hl), a
;src/gameObject/gameObject.c:111: dibujarGameObject(objetoEspejo);                             
	push	bc
	call	_dibujarGameObject
	pop	af
00112$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:117: void movimientoSimple(u8* posx, u8* posy,u8 movimiento){
;	---------------------------------
; Function movimientoSimple
; ---------------------------------
_movimientoSimple::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:119: *posx-=1;
	ld	c,4 (ix)
	ld	b,5 (ix)
;src/gameObject/gameObject.c:118: if(movimiento==mover_Izquierda){
	ld	a, 8 (ix)
	dec	a
	jr	NZ,00110$
;src/gameObject/gameObject.c:119: *posx-=1;
	ld	a, (bc)
	add	a, #0xff
	ld	(bc), a
	jr	00112$
00110$:
;src/gameObject/gameObject.c:121: *posy-=1;
	ld	l,6 (ix)
	ld	h,7 (ix)
;src/gameObject/gameObject.c:120: }else if(movimiento==mover_Arriba){
	ld	a, 8 (ix)
	sub	a, #0x02
	jr	NZ,00107$
;src/gameObject/gameObject.c:121: *posy-=1;
	ld	c, (hl)
	dec	c
	ld	(hl), c
	jr	00112$
00107$:
;src/gameObject/gameObject.c:122: }else if(movimiento==mover_Derecha){
	ld	a, 8 (ix)
	sub	a, #0x03
	jr	NZ,00104$
;src/gameObject/gameObject.c:123: *posx+=1;
	ld	a, (bc)
	inc	a
	ld	(bc), a
	jr	00112$
00104$:
;src/gameObject/gameObject.c:124: }else if(movimiento==mover_Abajo){
	ld	a, 8 (ix)
	sub	a, #0x04
	jr	NZ,00112$
;src/gameObject/gameObject.c:125: *posy+=1;
	ld	c, (hl)
	inc	c
	ld	(hl), c
00112$:
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
