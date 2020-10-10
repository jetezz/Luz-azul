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
	.globl _initGameobjest
	.globl _dibujarGameObject
	.globl _limpiarRastro
	.globl _moverGameObject
	.globl _moverElEspejo
	.globl _cambiarPosicion
	.globl _moverYdibujar
	.globl _taparHole
	.globl _moverTipoPlayer
	.globl _moverTipoRoca
	.globl _mover1casilla
	.globl _movimientoLineal
	.globl _colisionesSiguientePosicion
	.globl _comprobarRocas
	.globl _comprobarPortales
	.globl _comprobarPuertas
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_P_portal:
	.ds 2
_P_puertas:
	.ds 2
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
;src/gameObject/gameObject.c:23: void initGameobjest(TGameObject* portales,TGameObject* puertas){
;	---------------------------------
; Function initGameobjest
; ---------------------------------
_initGameobjest::
;src/gameObject/gameObject.c:24: P_portal=portales;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	(#_P_portal + 0),a
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	ld	(#_P_portal + 1),a
;src/gameObject/gameObject.c:25: P_puertas=puertas;
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	ld	(#_P_puertas + 0),a
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	ld	(#_P_puertas + 1),a
	ret
;src/gameObject/gameObject.c:28: void dibujarGameObject(TGameObject* objeto){
;	---------------------------------
; Function dibujarGameObject
; ---------------------------------
_dibujarGameObject::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:29: if(objeto->posx!=0){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, a
	jp	Z, 00123$
;src/gameObject/gameObject.c:30: if(objeto->sprite==sprite_Player){
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
;src/gameObject/gameObject.c:31: cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
;src/gameObject/gameObject.c:30: if(objeto->sprite==sprite_Player){
	ld	a, e
	dec	a
	jr	NZ,00119$
;src/gameObject/gameObject.c:31: cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
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
	jp	00123$
00119$:
;src/gameObject/gameObject.c:32: }else if(objeto->sprite==sprite_Rock){
	ld	a, e
	sub	a, #0x02
	jr	NZ,00116$
;src/gameObject/gameObject.c:33: cpct_drawSprite(rock_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00123$
00116$:
;src/gameObject/gameObject.c:34: }else if(objeto->sprite==sprite_RockInmovil){
	ld	a, e
	sub	a, #0x03
	jr	NZ,00113$
;src/gameObject/gameObject.c:35: cpct_drawSprite(rockInmovil_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jr	00123$
00113$:
;src/gameObject/gameObject.c:36: }else if(objeto->sprite==sprite_RockLineal){
	ld	a, e
	sub	a, #0x04
	jr	NZ,00110$
;src/gameObject/gameObject.c:37: cpct_drawSprite(rockLineal_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_rockLineal_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jr	00123$
00110$:
;src/gameObject/gameObject.c:38: }else if(objeto->sprite==sprite_Portal){
	ld	a, e
	sub	a, #0x05
	jr	NZ,00107$
;src/gameObject/gameObject.c:39: cpct_drawSprite(portalSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_portalSprite_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jr	00123$
00107$:
;src/gameObject/gameObject.c:40: }else if(objeto->sprite==sprite_Puerta){
	ld	a, e
	sub	a, #0x06
	jr	NZ,00104$
;src/gameObject/gameObject.c:41: cpct_drawSprite(puertalSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_puertalSprite_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jr	00123$
00104$:
;src/gameObject/gameObject.c:42: }else if(objeto->sprite==sprite_hole){
	ld	a, e
	sub	a, #0x07
	jr	NZ,00123$
;src/gameObject/gameObject.c:43: cpct_drawSprite(hole_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_hole_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
00123$:
	pop	ix
	ret
;src/gameObject/gameObject.c:48: void limpiarRastro(u8 posx, u8 posy){
;	---------------------------------
; Function limpiarRastro
; ---------------------------------
_limpiarRastro::
;src/gameObject/gameObject.c:49: cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
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
;src/gameObject/gameObject.c:51: u8 moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
;	---------------------------------
; Function moverGameObject
; ---------------------------------
_moverGameObject::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:52: if(objeto->sprite==sprite_Player){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	dec	e
	jr	NZ,00102$
;src/gameObject/gameObject.c:53: return moverTipoPlayer(objeto,movimiento,rocasCol,rocasEspejo,posicion);
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, 6 (ix)
	push	af
	inc	sp
	push	bc
	call	_moverTipoPlayer
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	jr	00104$
00102$:
;src/gameObject/gameObject.c:55: return moverTipoRoca(objeto,movimiento,rocasCol,rocasEspejo,posicion);
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, 6 (ix)
	push	af
	inc	sp
	push	bc
	call	_moverTipoRoca
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
00104$:
	pop	ix
	ret
;src/gameObject/gameObject.c:59: void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocasEspejo,u8 posicion,u8 numMovimientos){
;	---------------------------------
; Function moverElEspejo
; ---------------------------------
_moverElEspejo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-13
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:61: u8 nextMovimiento=movimiento;
	ld	c, 5 (ix)
;src/gameObject/gameObject.c:66: if(movimiento==mover_Izquierda){
	ld	a, c
	dec	a
	jr	NZ,00102$
;src/gameObject/gameObject.c:67: nextMovimiento=mover_Derecha;
	ld	c, #0x03
00102$:
;src/gameObject/gameObject.c:68: }if(movimiento==mover_Derecha){
	ld	a, 5 (ix)
	sub	a, #0x03
	jr	NZ,00104$
;src/gameObject/gameObject.c:69: nextMovimiento=mover_Izquierda;
	ld	c, #0x01
00104$:
;src/gameObject/gameObject.c:72: if(posicion==posicion_Izquieda){
	ld	a, 8 (ix)
	or	a, a
	jr	NZ,00106$
;src/gameObject/gameObject.c:73: posicion=posicion_Derecha;
	ld	8 (ix), #0x01
	jr	00145$
00106$:
;src/gameObject/gameObject.c:75: posicion=posicion_Izquieda;
	ld	8 (ix), #0x00
;src/gameObject/gameObject.c:78: for(u8 i=0;i<RocasMaximas;i++){
00145$:
	ld	b, #0x00
00128$:
	ld	a, b
	sub	a, #0x28
	jp	NC, 00130$
;src/gameObject/gameObject.c:79: if(rocasEspejo[i].num==num){
	ld	e,b
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de,hl
	ld	a, 6 (ix)
	add	a, e
	ld	e, a
	ld	a, 7 (ix)
	adc	a, d
	ld	d, a
	ld	a, (de)
	ld	-7 (ix), a
	ld	a, 4 (ix)
	sub	a, -7 (ix)
	jp	NZ,00129$
;src/gameObject/gameObject.c:80: objetoEspejo=&rocasEspejo[i];              
;src/gameObject/gameObject.c:82: nextPosx=objetoEspejo->posx;
	ld	-12 (ix), e
	ld	-11 (ix), d
	inc	de
	ld	a, (de)
	ld	-7 (ix), a
	ld	-8 (ix), a
;src/gameObject/gameObject.c:83: nextPosy=objetoEspejo->posy;
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
;src/gameObject/gameObject.c:84: if(objetoEspejo->posx!=0){
	ld	a, -7 (ix)
	or	a, a
	jp	Z, 00129$
;src/gameObject/gameObject.c:85: posicionObjeto=SinColision;
	ld	-10 (ix), #0x32
;src/gameObject/gameObject.c:86: for(u8 i=0;i<numMovimientos;i++){
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	-2 (ix), e
	ld	-1 (ix), d
	ld	-13 (ix), #0x00
00125$:
	ld	a, -13 (ix)
	sub	a, 9 (ix)
	jp	NC, 00129$
;src/gameObject/gameObject.c:87: if(posicionObjeto==SinColision){
	ld	a, -10 (ix)
	sub	a, #0x32
	jp	NZ,00126$
;src/gameObject/gameObject.c:88: nextMovimiento=calcularMaximosyMinimos(nextMovimiento,objetoEspejo->posx,objetoEspejo->posy,posicion);            
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	e, (hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d, (hl)
	push	bc
	ld	a, 8 (ix)
	push	af
	inc	sp
	ld	a, e
	push	af
	inc	sp
	ld	e, c
	push	de
	call	_calcularMaximosyMinimos
	pop	af
	pop	af
	pop	bc
	ld	c, l
;src/gameObject/gameObject.c:89: if(nextMovimiento!=mover_SinMovimiento){
	ld	a, c
	or	a, a
	jp	Z, 00126$
;src/gameObject/gameObject.c:90: posicionObjeto=colisionesSiguientePosicion(objetoEspejo,objetoEspejo->posx,objetoEspejo->posy,nextMovimiento,rocasEspejo,posicion);                                          
	ld	a, 8 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	e, (hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d, (hl)
	push	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a, c
	push	af
	inc	sp
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_colisionesSiguientePosicion
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	bc
;src/gameObject/gameObject.c:87: if(posicionObjeto==SinColision){
	ld	-10 (ix), l
	ld	a, l
	sub	a, #0x32
	jr	NZ,00198$
	ld	a,#0x01
	jr	00199$
00198$:
	xor	a,a
00199$:
;src/gameObject/gameObject.c:91: if(posicionObjeto==SinColision){
	or	a, a
	jr	Z,00112$
;src/gameObject/gameObject.c:92: mover1casilla(&nextPosx,&nextPosy,nextMovimiento);                                                                                 
	ld	hl, #0x0004
	add	hl, sp
	ex	de,hl
	ld	hl, #0x0005
	add	hl, sp
	push	bc
	ld	a, c
	push	af
	inc	sp
	push	de
	push	hl
	call	_mover1casilla
	pop	af
	inc	sp
	ld	h, -9 (ix)
	ld	l, -8 (ix)
	ex	(sp),hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_moverYdibujar
	pop	af
	pop	af
	pop	bc
	jr	00126$
00112$:
;src/gameObject/gameObject.c:95: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
	or	a, a
	jr	NZ,00126$
	ld	a, -10 (ix)
	sub	a, #0x33
	jr	Z,00126$
;src/gameObject/gameObject.c:96: taparHole(objetoEspejo,&rocasEspejo[posicionObjeto]);                                
	ld	e,-10 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de,hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, de
	push	bc
	push	hl
	ld	l,-12 (ix)
	ld	h,-11 (ix)
	push	hl
	call	_taparHole
	pop	af
	pop	af
	pop	bc
00126$:
;src/gameObject/gameObject.c:86: for(u8 i=0;i<numMovimientos;i++){
	inc	-13 (ix)
	jp	00125$
00129$:
;src/gameObject/gameObject.c:78: for(u8 i=0;i<RocasMaximas;i++){
	inc	b
	jp	00128$
00130$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:108: void cambiarPosicion(u8* posicion){    
;	---------------------------------
; Function cambiarPosicion
; ---------------------------------
_cambiarPosicion::
;src/gameObject/gameObject.c:109: if(*posicion==posicion_Izquieda){
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, (hl)
	or	a, a
	jr	NZ,00102$
;src/gameObject/gameObject.c:110: *posicion=posicion_Derecha;        
	ld	(hl), #0x01
	ret
00102$:
;src/gameObject/gameObject.c:112: *posicion=posicion_Izquieda;       
	ld	(hl), #0x00
	ret
;src/gameObject/gameObject.c:117: void moverYdibujar(TGameObject* objeto,u8 posx,u8 posy){
;	---------------------------------
; Function moverYdibujar
; ---------------------------------
_moverYdibujar::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/gameObject/gameObject.c:118: limpiarRastro(objeto->posx,objeto->posy);    
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl, #0x0002
	add	hl,bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	e, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	ld	d, (hl)
	push	hl
	push	bc
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_limpiarRastro
	pop	af
	pop	bc
	pop	hl
;src/gameObject/gameObject.c:119: objeto->posx=posx;
	ld	a, 6 (ix)
	ld	(hl), a
;src/gameObject/gameObject.c:120: objeto->posy=posy;
	pop	hl
	push	hl
	ld	a, 7 (ix)
	ld	(hl), a
;src/gameObject/gameObject.c:121: dibujarGameObject(objeto);
	push	bc
	call	_dibujarGameObject
	ld	sp,ix
	pop	ix
	ret
;src/gameObject/gameObject.c:123: void taparHole(TGameObject* roca,TGameObject* hole){
;	---------------------------------
; Function taparHole
; ---------------------------------
_taparHole::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:124: if(hole->sprite==sprite_hole){
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, #0x07
	jr	NZ,00103$
;src/gameObject/gameObject.c:125: limpiarRastro(roca->posx,roca->posy);
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	hl, #0x0002
	add	hl,de
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	a, (hl)
	ld	-6 (ix), a
	inc	de
	ld	-2 (ix), e
	ld	-1 (ix), d
	ld	l, e
	ld	h, d
	ld	d, (hl)
	push	bc
	ld	a, -6 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_limpiarRastro
	pop	af
	pop	bc
;src/gameObject/gameObject.c:126: limpiarRastro(hole->posx,hole->posy);
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	ld	-6 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-3 (ix), a
	push	bc
	push	de
	ld	h, -6 (ix)
	ld	l, -3 (ix)
	push	hl
	call	_limpiarRastro
	pop	af
	pop	de
	pop	bc
;src/gameObject/gameObject.c:127: roca->posx=0;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	(hl), #0x00
;src/gameObject/gameObject.c:128: roca->posy=0;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	(hl), #0x00
;src/gameObject/gameObject.c:129: hole->posx=0;
	xor	a, a
	ld	(bc), a
;src/gameObject/gameObject.c:130: hole->posy=0;
	xor	a, a
	ld	(de), a
00103$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:140: u8 moverTipoPlayer(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
;	---------------------------------
; Function moverTipoPlayer
; ---------------------------------
_moverTipoPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-17
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:141: if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){    
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	add	a, #0x05
	ld	-9 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	Z,00116$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	b, (hl)
	dec	b
	jp	Z,00117$
00116$:
;src/gameObject/gameObject.c:142: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);            
	ld	c,11 (ix)
	ld	b,12 (ix)
	ld	a, (bc)
	ld	-7 (ix), a
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-6 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-5 (ix), a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	ld	-10 (ix), a
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	inc	de
	ld	a, (de)
	ld	-11 (ix), a
	push	bc
	push	de
	ld	h, -7 (ix)
	ld	l, -10 (ix)
	push	hl
	ld	h, -11 (ix)
	ld	l, 6 (ix)
	push	hl
	call	_calcularMaximosyMinimos
	pop	af
	pop	af
	ld	-11 (ix), l
	pop	de
	pop	bc
;src/gameObject/gameObject.c:143: if(movimiento!=mover_SinMovimiento){                  
	ld	a, -11 (ix)
	or	a, a
	jp	Z, 00118$
;src/gameObject/gameObject.c:144: u8 nextPosx=objeto->posx;
	ld	a, (de)
	ld	-17 (ix), a
;src/gameObject/gameObject.c:145: u8 nextPosy=objeto->posy;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	ld	-15 (ix), a
;src/gameObject/gameObject.c:148: u8 moverRoca=mover_roca;
	ld	e, #0x00
;src/gameObject/gameObject.c:152: mover1casilla(&nextPosx,&nextPosy,movimiento);            
	ld	hl, #0x0002
	add	hl, sp
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	a, -6 (ix)
	ld	-13 (ix), a
	ld	a, -5 (ix)
	ld	-12 (ix), a
	ld	hl, #0x0000
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	pop	iy
	pop	hl
	push	bc
	push	de
	ld	a, -11 (ix)
	push	af
	inc	sp
	ld	l,-13 (ix)
	ld	h,-12 (ix)
	push	hl
	push	iy
	call	_mover1casilla
	pop	af
	inc	sp
	ld	h, -15 (ix)
	ld	l, -17 (ix)
	ex	(sp),hl
	call	_comprobarPuertas
	pop	af
	pop	de
	pop	bc
;src/gameObject/gameObject.c:155: if(colisionPuerta!=seguir_En_Nivel){
	ld	-14 (ix), l
	ld	a, l
	or	a, a
	jr	Z,00102$
;src/gameObject/gameObject.c:156: return colisionPuerta;
	ld	l, -14 (ix)
	jp	00120$
00102$:
;src/gameObject/gameObject.c:158: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);            
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	pop	iy
	ld	d, -4 (ix)
	ld	l, -3 (ix)
	ld	-4 (ix), d
	ld	-3 (ix), l
	push	bc
	push	de
	push	bc
	ld	a, -11 (ix)
	push	af
	inc	sp
	push	iy
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_comprobarPortales
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	de
	pop	bc
	ld	d, l
;src/gameObject/gameObject.c:159: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);            
	push	bc
	push	de
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	h, -15 (ix)
	ld	l, -17 (ix)
	push	hl
	call	_comprobarRocas
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	-16 (ix), l
;src/gameObject/gameObject.c:160: if(colisionPortales==hay_Colision){
	dec	d
	jr	NZ,00107$
;src/gameObject/gameObject.c:161: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasEspejo);
	push	bc
	push	de
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	h, -15 (ix)
	ld	l, -17 (ix)
	push	hl
	call	_comprobarRocas
	pop	af
	pop	af
	pop	de
	pop	bc
;src/gameObject/gameObject.c:162: if(ObjetoColisionado!=SinColision){
	ld	-16 (ix), l
	ld	a, l
	sub	a, #0x32
	jr	Z,00104$
;src/gameObject/gameObject.c:163: moverRoca=no_mover_roca;
	ld	e, #0x01
	jr	00107$
00104$:
;src/gameObject/gameObject.c:165: cambiarPosicion(posicion);
	push	bc
	push	de
	push	bc
	call	_cambiarPosicion
	pop	af
	pop	de
	pop	bc
00107$:
;src/gameObject/gameObject.c:168: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision){             
	ld	a, -16 (ix)
	sub	a, #0x32
	jr	NZ,00111$
	ld	a, -14 (ix)
	or	a, a
	jr	NZ,00111$
;src/gameObject/gameObject.c:169: moverYdibujar(objeto,nextPosx,nextPosy);                             
	ld	h, -15 (ix)
	ld	l, -17 (ix)
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_moverYdibujar
	pop	af
	pop	af
	jr	00112$
00111$:
;src/gameObject/gameObject.c:172: if(moverRoca==mover_roca)          
	ld	a, e
	or	a, a
	jr	NZ,00112$
;src/gameObject/gameObject.c:173: moverGameObject(&rocasCol[ObjetoColisionado],movimiento,rocasCol,rocasEspejo,posicion);                      
	ld	e,-16 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de,hl
	ld	a, 7 (ix)
	add	a, e
	ld	e, a
	ld	a, 8 (ix)
	adc	a, d
	ld	d, a
	push	bc
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, -11 (ix)
	push	af
	inc	sp
	push	de
	call	_moverGameObject
	ld	hl, #9
	add	hl, sp
	ld	sp, hl
00112$:
;src/gameObject/gameObject.c:175: objeto->cronoMovimiento=retardoMovimiento;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl), #0xff
	jr	00118$
00117$:
;src/gameObject/gameObject.c:178: objeto->cronoMovimiento-=1;
	dec	c
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	(hl), c
00118$:
;src/gameObject/gameObject.c:180: return seguir_En_Nivel;
	ld	l, #0x00
00120$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:182: u8 moverTipoRoca(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
;	---------------------------------
; Function moverTipoRoca
; ---------------------------------
_moverTipoRoca::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-13
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:184: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);
	ld	a, 11 (ix)
	ld	-3 (ix), a
	ld	a, 12 (ix)
	ld	-2 (ix), a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	d, (hl)
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl, #0x0002
	add	hl,bc
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	e, (hl)
	ld	hl, #0x0001
	add	hl,bc
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	a, (hl)
	ld	-1 (ix), a
	push	bc
	push	de
	inc	sp
	ld	d, e
	ld	e, -1 (ix)
	push	de
	ld	a, 6 (ix)
	push	af
	inc	sp
	call	_calcularMaximosyMinimos
	pop	af
	pop	af
	ld	e, l
	pop	bc
;src/gameObject/gameObject.c:186: if(movimiento!=mover_SinMovimiento && objeto->movimiento != sin_Movimiento){                  
	ld	a, e
	or	a, a
	jp	Z, 00123$
	ld	hl, #0x0004
	add	hl,bc
	ld	-9 (ix), l
	ld	-8 (ix), h
	ld	d, (hl)
	ld	a, d
	or	a, a
	jp	Z, 00123$
;src/gameObject/gameObject.c:187: u8 nextPosx=objeto->posx;
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	a, (hl)
	ld	-12 (ix), a
;src/gameObject/gameObject.c:188: u8 nextPosy=objeto->posy;
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a, (hl)
	ld	-13 (ix), a
;src/gameObject/gameObject.c:189: u8 numMovimientos=0;
	ld	-1 (ix), #0x00
;src/gameObject/gameObject.c:193: if(objeto->movimiento==mover_1){
	ld	a, d
	dec	a
	jr	NZ,00104$
;src/gameObject/gameObject.c:194: mover1casilla(&nextPosx,&nextPosy,movimiento);
	ld	hl, #0x0000
	add	hl, sp
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	iy,#0x0001
	add	iy,sp
	push	bc
	push	de
	ld	a, e
	push	af
	inc	sp
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	push	iy
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/gameObject/gameObject.c:195: numMovimientos=1;                 
	ld	-1 (ix), #0x01
	jr	00105$
00104$:
;src/gameObject/gameObject.c:196: }else if(objeto->movimiento==mover_Linea){
	ld	a, d
	sub	a, #0x02
	jr	NZ,00105$
;src/gameObject/gameObject.c:197: numMovimientos=movimientoLineal(objeto,&nextPosx,&nextPosy,movimiento,rocasCol,*posicion);
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	d, (hl)
	ld	hl, #0x0000
	add	hl, sp
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	iy,#0x0001
	add	iy,sp
	push	bc
	push	de
	push	de
	inc	sp
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, e
	push	af
	inc	sp
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	push	iy
	push	bc
	call	_movimientoLineal
	ld	iy, #10
	add	iy, sp
	ld	sp, iy
	pop	de
	pop	bc
	ld	-1 (ix), l
00105$:
;src/gameObject/gameObject.c:199: posicionObjeto=colisionesSiguientePosicion(objeto,objeto->posx,objeto->posy,movimiento,rocasCol,posicion);                                      
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	d, (hl)
	push	bc
	push	de
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, e
	push	af
	inc	sp
	ld	a, -11 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_colisionesSiguientePosicion
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	de
	pop	bc
	ld	a, l
;src/gameObject/gameObject.c:200: if(posicionObjeto==SinColision){
	cp	a, #0x32
	jp	NZ,00120$
;src/gameObject/gameObject.c:201: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);             
	push	bc
	push	de
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	d, e
	ld	e, -13 (ix)
	push	de
	ld	a, -12 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_colisionesSiguientePosicion
	ld	hl, #9
	add	hl, sp
	ld	sp, hl
	ld	h, -13 (ix)
	ld	l, -12 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverYdibujar
	pop	af
	pop	af
	pop	de
	pop	bc
;src/gameObject/gameObject.c:203: moverElEspejo(objeto->num,movimiento,rocasEspejo,*posicion,numMovimientos);
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	d, (hl)
	ld	a, (bc)
	ld	-11 (ix), a
	push	bc
	push	de
	ld	a, -1 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	d, e
	ld	e, -11 (ix)
	push	de
	call	_moverElEspejo
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;src/gameObject/gameObject.c:204: if(objeto->movimiento==mover_1){
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	a, (hl)
	cp	a, #0x01
	jr	NZ,00115$
;src/gameObject/gameObject.c:205: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,mover_SinMovimiento,rocasCol,posicion);
	push	bc
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, -13 (ix)
	ld	l, -12 (ix)
	push	hl
	push	bc
	call	_colisionesSiguientePosicion
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	bc
	ld	a, l
;src/gameObject/gameObject.c:206: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
	cp	a, #0x32
	jp	Z,00123$
	cp	a, #0x33
	jp	Z,00123$
;src/gameObject/gameObject.c:207: taparHole(objeto,&rocasCol[posicionObjeto]);
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de,hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	add	hl, de
	push	hl
	push	bc
	call	_taparHole
	pop	af
	pop	af
	jr	00123$
00115$:
;src/gameObject/gameObject.c:209: }else if(objeto->movimiento==mover_Linea){
	sub	a, #0x02
	jr	NZ,00123$
;src/gameObject/gameObject.c:210: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);
	push	bc
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	d, e
	ld	e, -13 (ix)
	push	de
	ld	a, -12 (ix)
	push	af
	inc	sp
	push	bc
	call	_colisionesSiguientePosicion
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	bc
	ld	a, l
;src/gameObject/gameObject.c:211: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
	cp	a, #0x32
	jr	Z,00123$
	cp	a, #0x33
	jr	Z,00123$
;src/gameObject/gameObject.c:212: taparHole(objeto,&rocasCol[posicionObjeto]);
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de,hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	add	hl, de
	push	hl
	push	bc
	call	_taparHole
	pop	af
	pop	af
	jr	00123$
00120$:
;src/gameObject/gameObject.c:216: if(posicionObjeto!=ColisionNoRocas){
	cp	a, #0x33
	jr	Z,00123$
;src/gameObject/gameObject.c:217: taparHole(objeto,&rocasCol[posicionObjeto]);
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,7 (ix)
	ld	h,8 (ix)
	add	hl, bc
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_taparHole
	pop	af
	pop	af
00123$:
;src/gameObject/gameObject.c:223: return seguir_En_Nivel;
	ld	l, #0x00
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:231: void mover1casilla(u8* posx, u8* posy,u8 movimiento){
;	---------------------------------
; Function mover1casilla
; ---------------------------------
_mover1casilla::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:233: *posx-=1;
	ld	c,4 (ix)
	ld	b,5 (ix)
;src/gameObject/gameObject.c:232: if(movimiento==mover_Izquierda){
	ld	a, 8 (ix)
	dec	a
	jr	NZ,00110$
;src/gameObject/gameObject.c:233: *posx-=1;
	ld	a, (bc)
	add	a, #0xff
	ld	(bc), a
	jr	00112$
00110$:
;src/gameObject/gameObject.c:235: *posy-=1;
	ld	l,6 (ix)
	ld	h,7 (ix)
;src/gameObject/gameObject.c:234: }else if(movimiento==mover_Arriba){
	ld	a, 8 (ix)
	sub	a, #0x02
	jr	NZ,00107$
;src/gameObject/gameObject.c:235: *posy-=1;
	ld	c, (hl)
	dec	c
	ld	(hl), c
	jr	00112$
00107$:
;src/gameObject/gameObject.c:236: }else if(movimiento==mover_Derecha){
	ld	a, 8 (ix)
	sub	a, #0x03
	jr	NZ,00104$
;src/gameObject/gameObject.c:237: *posx+=1;
	ld	a, (bc)
	inc	a
	ld	(bc), a
	jr	00112$
00104$:
;src/gameObject/gameObject.c:238: }else if(movimiento==mover_Abajo){
	ld	a, 8 (ix)
	sub	a, #0x04
	jr	NZ,00112$
;src/gameObject/gameObject.c:239: *posy+=1;
	ld	c, (hl)
	inc	c
	ld	(hl), c
00112$:
	pop	ix
	ret
;src/gameObject/gameObject.c:243: u8 movimientoLineal(TGameObject* objeto,u8* posx, u8* posy,u8 movimiento,TGameObject* objetosCol,u8 posicion){    
;	---------------------------------
; Function movimientoLineal
; ---------------------------------
_movimientoLineal::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/gameObject/gameObject.c:246: while (colisionesSiguientePosicion(objeto,*posx,*posy,movimiento,objetosCol,posicion)==SinColision && movimiento!=mover_SinMovimiento)
	ld	a, 8 (ix)
	ld	-2 (ix), a
	ld	a, 9 (ix)
	ld	-1 (ix), a
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	-5 (ix), #0x00
00102$:
	ld	a, 13 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e, (hl)
	ld	a, (bc)
	ld	d, a
	push	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	a, 10 (ix)
	push	af
	inc	sp
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_colisionesSiguientePosicion
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	bc
	ld	a, l
	sub	a, #0x32
	jr	NZ,00104$
	ld	a, 10 (ix)
	or	a, a
	jr	Z,00104$
;src/gameObject/gameObject.c:248: movimiento=calcularMaximosyMinimos(movimiento,*posx,*posy,posicion);       
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d, (hl)
	ld	a, (bc)
	ld	e, a
	push	bc
	ld	a, 13 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	d, e
	ld	e, 10 (ix)
	push	de
	call	_calcularMaximosyMinimos
	pop	af
	pop	af
	ld	d, l
	pop	bc
	ld	10 (ix), d
;src/gameObject/gameObject.c:249: mover1casilla(posx,posy,movimiento);
	push	bc
	push	de
	inc	sp
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	push	bc
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/gameObject/gameObject.c:250: contador++;                    
	inc	-5 (ix)
	jp	00102$
00104$:
;src/gameObject/gameObject.c:254: return contador;             
	ld	l, -5 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:262: u8 colisionesSiguientePosicion(TGameObject* objeto,u8 posx,u8 posy,u8 movimiento, TGameObject* rocasCol,u8* posicion){
;	---------------------------------
; Function colisionesSiguientePosicion
; ---------------------------------
_colisionesSiguientePosicion::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-7
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:263: u8 nextPosx=posx;
	ld	a, 6 (ix)
	ld	-6 (ix), a
;src/gameObject/gameObject.c:264: u8 nextPosy=posy;
	ld	a, 7 (ix)
	ld	-7 (ix), a
;src/gameObject/gameObject.c:269: mover1casilla(&nextPosx,&nextPosy,movimiento);
	ld	hl, #0x0000
	add	hl, sp
	ld	-3 (ix), l
	ld	-2 (ix), h
	ex	de,hl
	ld	hl, #0x0001
	add	hl, sp
	ld	-5 (ix), l
	ld	-4 (ix), h
	ld	c, l
	ld	b, h
	ld	a, 8 (ix)
	push	af
	inc	sp
	push	de
	push	bc
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
;src/gameObject/gameObject.c:270: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	h, -7 (ix)
	ld	l, -6 (ix)
	push	hl
	call	_comprobarRocas
	pop	af
	pop	af
;src/gameObject/gameObject.c:271: if(ObjetoColisionado!=SinColision){
	ld	a, l
	sub	a, #0x32
	jr	NZ,00125$
	ld	a,#0x01
	jr	00126$
00125$:
	xor	a,a
00126$:
	ld	-1 (ix), a
	bit	0, -1 (ix)
;src/gameObject/gameObject.c:272: return ObjetoColisionado;
	jr	Z,00107$
;src/gameObject/gameObject.c:274: colisionPuerta=comprobarPuertas(nextPosx,nextPosy);                      
	ld	h, -7 (ix)
	ld	l, -6 (ix)
	push	hl
	call	_comprobarPuertas
	pop	af
	ld	c, l
;src/gameObject/gameObject.c:275: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);                 
	ld	e,-3 (ix)
	ld	d,-2 (ix)
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	push	hl
	pop	iy
	push	bc
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	a, 8 (ix)
	push	af
	inc	sp
	push	de
	push	iy
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_comprobarPortales
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	bc
;src/gameObject/gameObject.c:279: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision && colisionPortales==no_Hay_Colision){        
	bit	0, -1 (ix)
	jr	Z,00104$
	ld	a, c
	or	a,a
	jr	NZ,00104$
	or	a,l
	jr	NZ,00104$
;src/gameObject/gameObject.c:280: return SinColision;
	ld	l, #0x32
	jr	00107$
00104$:
;src/gameObject/gameObject.c:282: return ColisionNoRocas;
	ld	l, #0x33
00107$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:285: u8 comprobarRocas(u8 posx,u8 posy,TGameObject* rocas){
;	---------------------------------
; Function comprobarRocas
; ---------------------------------
_comprobarRocas::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:286: u8 colision=SinColision;   
;src/gameObject/gameObject.c:287: for(u8 i=0;i<RocasMaximas;i++){
	ld	bc,#0x0032
00107$:
	ld	a, b
	sub	a, #0x28
	jr	NC,00105$
;src/gameObject/gameObject.c:288: if(rocas[i].posx!=0){
	ld	e,b
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
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
;src/gameObject/gameObject.c:289: if(comprobarColisiones1vs1(posx,posy,rocas[i].posx,rocas[i].posy)==hay_Colision){                          
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
;src/gameObject/gameObject.c:290: colision=i;
	ld	c, b
00108$:
;src/gameObject/gameObject.c:287: for(u8 i=0;i<RocasMaximas;i++){
	inc	b
	jr	00107$
00105$:
;src/gameObject/gameObject.c:294: return colision;
	ld	l, c
	pop	ix
	ret
;src/gameObject/gameObject.c:297: u8 comprobarPortales(TGameObject* objeto,u8* posx,u8* posy,u8 movimiento,u8* posicion){    
;	---------------------------------
; Function comprobarPortales
; ---------------------------------
_comprobarPortales::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-11
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:298: if(*posx==P_portal[0].posx ){
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	a, (bc)
	ld	-5 (ix), a
	ld	hl, (_P_portal)
	ld	-9 (ix), l
	ld	-8 (ix), h
	pop	de
	pop	hl
	push	hl
	push	de
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
;src/gameObject/gameObject.c:299: if(*posy==P_portal[0].posy ){
	ld	e,8 (ix)
	ld	d,9 (ix)
;src/gameObject/gameObject.c:300: if(objeto->sprite==sprite_Player){                
	ld	a, 4 (ix)
	ld	-11 (ix), a
	ld	a, 5 (ix)
	ld	-10 (ix), a
;src/gameObject/gameObject.c:301: *posx=P_portal[1].posx;
	ld	iy, #_P_portal
	ld	a, 0 (iy)
	add	a, #0x06
	ld	-4 (ix), a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	-3 (ix), a
;src/gameObject/gameObject.c:300: if(objeto->sprite==sprite_Player){                
	ld	a, -11 (ix)
	add	a, #0x03
	ld	-11 (ix), a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
;src/gameObject/gameObject.c:301: *posx=P_portal[1].posx;
	ld	a, -4 (ix)
	add	a, #0x01
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;src/gameObject/gameObject.c:298: if(*posx==P_portal[0].posx ){
	ld	a, -5 (ix)
	sub	a, -7 (ix)
	jr	NZ,00106$
;src/gameObject/gameObject.c:299: if(*posy==P_portal[0].posy ){
	ld	a, (de)
	ld	-6 (ix), a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-9 (ix), a
	ld	a, -6 (ix)
	sub	a, -9 (ix)
	jr	NZ,00106$
;src/gameObject/gameObject.c:300: if(objeto->sprite==sprite_Player){                
	pop	hl
	push	hl
	ld	l, (hl)
	dec	l
	jr	NZ,00102$
;src/gameObject/gameObject.c:301: *posx=P_portal[1].posx;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	ld	(bc), a
;src/gameObject/gameObject.c:302: *posy=P_portal[1].posy;
	ld	iy, #0x0006
	push	bc
	ld	bc, (_P_portal)
	add	iy, bc
	pop	bc
	ld	a, 2 (iy)
	ld	(de), a
;src/gameObject/gameObject.c:303: mover1casilla(posx,posy,movimiento);                
	ld	a, 10 (ix)
	push	af
	inc	sp
	push	de
	push	bc
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
00102$:
;src/gameObject/gameObject.c:305: return hay_Colision;               
	ld	l, #0x01
	jr	00113$
00106$:
;src/gameObject/gameObject.c:308: if(*posx==P_portal[1].posx){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	ld	a, -5 (ix)
	sub	a, -6 (ix)
	jr	NZ,00112$
;src/gameObject/gameObject.c:309: if(*posy==P_portal[1].posy){
	ld	a, (de)
	ld	-6 (ix), a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, -6 (ix)
	sub	a, -2 (ix)
	jr	NZ,00112$
;src/gameObject/gameObject.c:310: if(objeto->sprite==sprite_Player){
	pop	hl
	push	hl
	ld	l, (hl)
	dec	l
	jr	NZ,00108$
;src/gameObject/gameObject.c:311: *posx=P_portal[0].posx;
	ld	a, -7 (ix)
	ld	(bc), a
;src/gameObject/gameObject.c:312: *posy=P_portal[0].posy;
	ld	hl, (_P_portal)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(de), a
;src/gameObject/gameObject.c:313: mover1casilla(posx,posy,movimiento);                
	ld	a, 10 (ix)
	push	af
	inc	sp
	push	de
	push	bc
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
00108$:
;src/gameObject/gameObject.c:315: return hay_Colision;                   
	ld	l, #0x01
	jr	00113$
00112$:
;src/gameObject/gameObject.c:318: return no_Hay_Colision;        
	ld	l, #0x00
00113$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:320: u8 comprobarPuertas(u8 posx, u8 posy){
;	---------------------------------
; Function comprobarPuertas
; ---------------------------------
_comprobarPuertas::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:321: for(u8 i=0;i<3;i++){
	ld	c, #0x00
00106$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00104$
;src/gameObject/gameObject.c:322: if(posx==P_puertas[i].posx && posy==P_puertas[i].posy){
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	b, l
	ld	d, h
	ld	iy, #_P_puertas
	ld	a, 0 (iy)
	add	a, b
	ld	e, a
	ld	a, 1 (iy)
	adc	a, d
	ld	d, a
	ld	l, e
	ld	h, d
	inc	hl
	ld	a,4 (ix)
	sub	a,(hl)
	jr	NZ,00107$
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,5 (ix)
	sub	a,(hl)
	jr	NZ,00107$
;src/gameObject/gameObject.c:323: return P_puertas[i].num;
	ld	a, (de)
	ld	l, a
	jr	00108$
00107$:
;src/gameObject/gameObject.c:321: for(u8 i=0;i<3;i++){
	inc	c
	jr	00106$
00104$:
;src/gameObject/gameObject.c:326: return seguir_En_Nivel;
	ld	l, #0x00
00108$:
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
