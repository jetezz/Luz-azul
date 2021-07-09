;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module enemigos
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _abs
	.globl _mover1casilla
	.globl _moverYdibujar
	.globl _dibujarGameObject
	.globl _contadorEnemigosDe
	.globl _contadorEnemigosIz
	.globl _enemigosDerecha
	.globl _enemigosIzquierda
	.globl _initEnemigos
	.globl _crearEnemigos
	.globl _dibujarEnemigos
	.globl _resetEnemigos
	.globl _activarIAS
	.globl _iaEnemigo1
	.globl _iaEnemigo2
	.globl _crearEnemigoIzquierda
	.globl _crearEnemigoDerecha
	.globl _sinEnemigos
	.globl _enemigosNivel01
	.globl _enemigosNvel_trap_01
	.globl _enemigosNvel_04
	.globl _enemigosNvel_04_01
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_creadorDeEnemigos:
	.ds 100
_P_portal:
	.ds 2
_P_puertas:
	.ds 2
_P_col:
	.ds 2
_P_luz:
	.ds 2
_P_fam:
	.ds 2
_P_ams:
	.ds 2
_P_colList:
	.ds 2
_enemigosIzquierda::
	.ds 35
_enemigosDerecha::
	.ds 35
_contadorEnemigosIz::
	.ds 1
_contadorEnemigosDe::
	.ds 1
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
;src/enemigos/enemigos.c:15: void initEnemigos(){
;	---------------------------------
; Function initEnemigos
; ---------------------------------
_initEnemigos::
;src/enemigos/enemigos.c:16: creadorDeEnemigos[nivel_01]=sinEnemigos;
	ld	hl, #_sinEnemigos
	ld	((_creadorDeEnemigos + 0x0002)), hl
;src/enemigos/enemigos.c:17: creadorDeEnemigos[nivel_TRAP_01]=enemigosNvel_trap_01;
	ld	hl, #_enemigosNvel_trap_01
	ld	((_creadorDeEnemigos + 0x0006)), hl
;src/enemigos/enemigos.c:18: creadorDeEnemigos[nivel_02]=sinEnemigos;
	ld	hl, #_sinEnemigos
	ld	((_creadorDeEnemigos + 0x0008)), hl
;src/enemigos/enemigos.c:19: creadorDeEnemigos[nivel_01_01]=sinEnemigos;
	ld	((_creadorDeEnemigos + 0x0004)), hl
;src/enemigos/enemigos.c:20: creadorDeEnemigos[nivel_03]=sinEnemigos;
	ld	((_creadorDeEnemigos + 0x000a)), hl
;src/enemigos/enemigos.c:21: creadorDeEnemigos[nivel_04]=enemigosNvel_04;
	ld	hl, #_enemigosNvel_04
	ld	((_creadorDeEnemigos + 0x000c)), hl
;src/enemigos/enemigos.c:22: creadorDeEnemigos[nivel_04_01]=enemigosNvel_04_01;
	ld	hl, #_enemigosNvel_04_01
	ld	((_creadorDeEnemigos + 0x000e)), hl
;src/enemigos/enemigos.c:23: creadorDeEnemigos[nivel_05]=sinEnemigos;
	ld	hl, #_sinEnemigos
	ld	((_creadorDeEnemigos + 0x0010)), hl
;src/enemigos/enemigos.c:29: contadorEnemigosIz=0;
	ld	hl,#_contadorEnemigosIz + 0
	ld	(hl), #0x00
;src/enemigos/enemigos.c:30: contadorEnemigosDe=0;
	ld	hl,#_contadorEnemigosDe + 0
	ld	(hl), #0x00
	ret
;src/enemigos/enemigos.c:32: void crearEnemigos(u8 nivel){
;	---------------------------------
; Function crearEnemigos
; ---------------------------------
_crearEnemigos::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/enemigos/enemigos.c:33: resetEnemigos();
	call	_resetEnemigos
;src/enemigos/enemigos.c:34: creadorDeEnemigos[nivel]();
	ld	bc, #_creadorDeEnemigos+0
	ld	l, 4 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	call	___sdcc_call_hl
;src/enemigos/enemigos.c:35: dibujarEnemigos();
	pop	ix
	jp	_dibujarEnemigos
;src/enemigos/enemigos.c:38: void dibujarEnemigos(){
;	---------------------------------
; Function dibujarEnemigos
; ---------------------------------
_dibujarEnemigos::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/enemigos/enemigos.c:39: for(u8 i=0;i<enemigosMaximos ;i++){
	ld	c, #0x00
00111$:
	ld	a, c
	sub	a, #0x05
	jr	NC,00113$
;src/enemigos/enemigos.c:40: if(enemigosIzquierda[i].posx>0){
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ex	de,hl
	ld	iy, #_enemigosIzquierda
	add	iy, de
	push	iy
	pop	hl
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z,00104$
;src/enemigos/enemigos.c:41: if (enemigosIzquierda[i].sprite==sprite_enemigo1){
	push	iy
	pop	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, #0x2a
	jr	NZ,00104$
;src/enemigos/enemigos.c:42: dibujarGameObject(&enemigosIzquierda[i]);
	push	iy
	pop	hl
	push	bc
	push	de
	push	hl
	call	_dibujarGameObject
	pop	af
	pop	de
	pop	bc
00104$:
;src/enemigos/enemigos.c:45: if(enemigosDerecha[i].posx>0){
	ld	hl, #_enemigosDerecha
	add	hl,de
	ex	(sp), hl
	pop	hl
	push	hl
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z,00112$
;src/enemigos/enemigos.c:46: if (enemigosDerecha[i].sprite==sprite_enemigo1){
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, #0x2a
	jr	NZ,00112$
;src/enemigos/enemigos.c:47: dibujarGameObject(&enemigosDerecha[i]);                
	pop	de
	push	de
	push	bc
	push	de
	call	_dibujarGameObject
	pop	af
	pop	bc
00112$:
;src/enemigos/enemigos.c:39: for(u8 i=0;i<enemigosMaximos ;i++){
	inc	c
	jr	00111$
00113$:
	ld	sp, ix
	pop	ix
	ret
;src/enemigos/enemigos.c:53: void resetEnemigos(){
;	---------------------------------
; Function resetEnemigos
; ---------------------------------
_resetEnemigos::
;src/enemigos/enemigos.c:54: for (u8 i=0;i<enemigosMaximos;i++){
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x05
	ret	NC
;src/enemigos/enemigos.c:55: enemigosIzquierda[i].posx=0;
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ex	de,hl
	ld	hl,#_enemigosIzquierda+1
	add	hl,de
	ld	(hl), #0x00
;src/enemigos/enemigos.c:56: enemigosDerecha[i].posx=0;
	ld	hl,#_enemigosDerecha+1
	add	hl,de
	ld	(hl), #0x00
;src/enemigos/enemigos.c:54: for (u8 i=0;i<enemigosMaximos;i++){
	inc	c
	jr	00103$
;src/enemigos/enemigos.c:60: u8 activarIAS(u8 posx, u8 posy,u8 posicion,TGameObject* rocas,TGameObject* rocasEspejo, u8 frecuencias){
;	---------------------------------
; Function activarIAS
; ---------------------------------
_activarIAS::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;src/enemigos/enemigos.c:61: u8 estado=no_pasa_nada;
	ld	-4 (ix), #0x00
;src/enemigos/enemigos.c:62: if(frecuencias==0){        
	ld	a, 11 (ix)
	or	a, a
	jp	NZ, 00121$
;src/enemigos/enemigos.c:63: for(u8 i=0;i<enemigosMaximos;i++){
	ld	a, 6 (ix)
	dec	a
	jr	NZ,00172$
	ld	a,#0x01
	jr	00173$
00172$:
	xor	a,a
00173$:
	ld	-3 (ix), a
	ld	-5 (ix), a
	ld	-8 (ix), #0x00
00123$:
	ld	a, -8 (ix)
	sub	a, #0x05
	jp	NC, 00121$
;src/enemigos/enemigos.c:64: if(enemigosIzquierda[i].posx>0){
	ld	c,-8 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_enemigosIzquierda
	add	hl,bc
	ld	e,l
	ld	d,h
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z,00109$
;src/enemigos/enemigos.c:65: if(enemigosIzquierda[i].sprite==sprite_enemigo1){
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, #0x2a
	jr	NZ,00106$
;src/enemigos/enemigos.c:66: if(posicion==posicion_Izquieda)
	ld	a, 6 (ix)
	or	a, a
	jr	NZ,00109$
;src/enemigos/enemigos.c:67: estado=iaEnemigo1(&enemigosIzquierda[i],posx,posy,rocas);
	push	bc
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	push	de
	call	_iaEnemigo1
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	-4 (ix), l
	jr	00109$
00106$:
;src/enemigos/enemigos.c:69: if(posicion==posicion_Izquieda)
	ld	a, 6 (ix)
	or	a, a
	jr	NZ,00109$
;src/enemigos/enemigos.c:70: estado=iaEnemigo2(&enemigosIzquierda[i],posx,posy,rocas);
	push	bc
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	push	de
	call	_iaEnemigo2
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	-4 (ix), l
00109$:
;src/enemigos/enemigos.c:74: if(enemigosDerecha[i].posx>0){
	ld	hl, #_enemigosDerecha
	add	hl,bc
	ld	-7 (ix), l
	ld	-6 (ix), h
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z,00124$
;src/enemigos/enemigos.c:75: if(enemigosDerecha[i].sprite==sprite_enemigo1){
	ld	a, -7 (ix)
	ld	-2 (ix), a
	ld	a, -6 (ix)
	ld	-1 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, #0x2a
	jr	NZ,00115$
;src/enemigos/enemigos.c:76: if(posicion==posicion_Derecha)
	ld	a, -5 (ix)
	or	a, a
	jr	Z,00124$
;src/enemigos/enemigos.c:77: estado=iaEnemigo1(&enemigosDerecha[i],posx,posy,rocasEspejo);                    
	ld	c,-7 (ix)
	ld	b,-6 (ix)
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	push	bc
	call	_iaEnemigo1
	pop	af
	pop	af
	pop	af
	ld	-4 (ix), l
	jr	00124$
00115$:
;src/enemigos/enemigos.c:79: if(posicion==posicion_Derecha)
	ld	a, -3 (ix)
	or	a, a
	jr	Z,00124$
;src/enemigos/enemigos.c:80: estado=iaEnemigo2(&enemigosDerecha[i],posx,posy,rocasEspejo);
	ld	c,-7 (ix)
	ld	b,-6 (ix)
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	push	bc
	call	_iaEnemigo2
	pop	af
	pop	af
	pop	af
	ld	-4 (ix), l
00124$:
;src/enemigos/enemigos.c:63: for(u8 i=0;i<enemigosMaximos;i++){
	inc	-8 (ix)
	jp	00123$
00121$:
;src/enemigos/enemigos.c:86: return estado;
	ld	l, -4 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/enemigos/enemigos.c:89: u8 iaEnemigo1(TGameObject* objeto,u8 posx, u8 posy,TGameObject* rocas){
;	---------------------------------
; Function iaEnemigo1
; ---------------------------------
_iaEnemigo1::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
;src/enemigos/enemigos.c:93: if(objeto->posx != posx && objeto->posy != posy){
	ld	b, 4 (ix)
	ld	d, 5 (ix)
	ld	l, b
	ld	h, d
	inc	hl
	ld	c, (hl)
	ld	a, 6 (ix)
	sub	a, c
	jr	NZ,00198$
	ld	a,#0x01
	jr	00199$
00198$:
	xor	a,a
00199$:
	ld	e, a
	ld	a, b
	add	a, #0x02
	ld	-4 (ix), a
	ld	a, d
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	bit	0, e
	jr	NZ,00102$
	ld	a, 7 (ix)
	sub	a, -5 (ix)
	jr	Z,00102$
;src/enemigos/enemigos.c:94: return no_pasa_nada;
	ld	l, #0x00
	jp	00132$
00102$:
;src/enemigos/enemigos.c:96: if(objeto->posx==posx){        
	bit	0, e
	jr	Z,00114$
;src/enemigos/enemigos.c:99: posmenor=posy;
	ld	b, 7 (ix)
;src/enemigos/enemigos.c:97: if(objeto->posy>posy){
	ld	a, 7 (ix)
	sub	a, -5 (ix)
	jr	NC,00105$
;src/enemigos/enemigos.c:98: posmayor=objeto->posy;
	ld	a, -5 (ix)
	ld	-2 (ix), a
;src/enemigos/enemigos.c:99: posmenor=posy;
	ld	-1 (ix), b
	jr	00142$
00105$:
;src/enemigos/enemigos.c:101: posmayor=posy;
	ld	-2 (ix), b
;src/enemigos/enemigos.c:102: posmenor=objeto->posy;
	ld	a, -5 (ix)
	ld	-1 (ix), a
;src/enemigos/enemigos.c:104: for(u8 i=0;i<RocasMaximas;i++){
00142$:
	ld	b, #0x00
00127$:
	ld	a, b
	sub	a, #0x28
	jr	NC,00114$
;src/enemigos/enemigos.c:105: if(rocas[i].posx==posx){
	ld	e,b
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ex	de,hl
	ld	a, 8 (ix)
	add	a, e
	ld	e, a
	ld	a, 9 (ix)
	adc	a, d
	ld	d, a
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	a, 6 (ix)
	sub	a, -5 (ix)
	jr	NZ,00128$
;src/enemigos/enemigos.c:106: if(rocas[i].posy>posmenor && rocas[i].posy<posmayor){                    
	ex	de,hl
	inc	hl
	inc	hl
	ld	e, (hl)
	ld	a, -1 (ix)
	sub	a, e
	jr	NC,00128$
	ld	a, e
	sub	a, -2 (ix)
	jr	NC,00128$
;src/enemigos/enemigos.c:107: return no_pasa_nada;
	ld	l, #0x00
	jr	00132$
00128$:
;src/enemigos/enemigos.c:104: for(u8 i=0;i<RocasMaximas;i++){
	inc	b
	jr	00127$
00114$:
;src/enemigos/enemigos.c:112: if(objeto->posy==posy){        
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,7 (ix)
	sub	a,(hl)
	jr	NZ,00125$
;src/enemigos/enemigos.c:115: posmenor=posx;
	ld	e, 6 (ix)
;src/enemigos/enemigos.c:113: if(objeto->posx>posx){
	ld	a, 6 (ix)
	sub	a, c
	jr	NC,00116$
;src/enemigos/enemigos.c:114: posmayor=objeto->posx;
	ld	-6 (ix), c
;src/enemigos/enemigos.c:115: posmenor=posx;
	ld	c, e
	jr	00149$
00116$:
;src/enemigos/enemigos.c:117: posmayor=posx;
	ld	-6 (ix), e
;src/enemigos/enemigos.c:118: posmenor=objeto->posx;
;src/enemigos/enemigos.c:120: for(u8 i=0;i<RocasMaximas;i++){
00149$:
	ld	b, #0x00
00130$:
	ld	a, b
	sub	a, #0x28
	jr	NC,00125$
;src/enemigos/enemigos.c:121: if(rocas[i].posy==posy){
	ld	e,b
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ex	de,hl
	ld	a, 8 (ix)
	add	a, e
	ld	e, a
	ld	a, 9 (ix)
	adc	a, d
	ld	d, a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	ld	a, 7 (ix)
	sub	a, -1 (ix)
	jr	NZ,00131$
;src/enemigos/enemigos.c:122: if(rocas[i].posx>posmenor && rocas[i].posx<posmayor){                
	ex	de,hl
	inc	hl
	ld	e, (hl)
	ld	a, c
	sub	a, e
	jr	NC,00131$
	ld	a, e
	sub	a, -6 (ix)
	jr	NC,00131$
;src/enemigos/enemigos.c:123: return no_pasa_nada;
	ld	l, #0x00
	jr	00132$
00131$:
;src/enemigos/enemigos.c:120: for(u8 i=0;i<RocasMaximas;i++){
	inc	b
	jr	00130$
00125$:
;src/enemigos/enemigos.c:128: return player_muere;
	ld	l, #0x01
00132$:
	ld	sp, ix
	pop	ix
	ret
;src/enemigos/enemigos.c:131: u8 iaEnemigo2(TGameObject* objeto,u8 posx, u8 posy,TGameObject* rocas){
;	---------------------------------
; Function iaEnemigo2
; ---------------------------------
_iaEnemigo2::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-11
	add	hl, sp
	ld	sp, hl
;src/enemigos/enemigos.c:135: u8 nextPosx=0;
	ld	-9 (ix), #0x00
;src/enemigos/enemigos.c:136: u8 nextPosy=0;
	ld	-10 (ix), #0x00
;src/enemigos/enemigos.c:140: distanciax=posx-objeto->posx;
	ld	e, 6 (ix)
	ld	d, #0x00
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl, #0x0001
	add	hl,bc
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	l, (hl)
	ld	h, #0x00
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	-8 (ix), e
	ld	-7 (ix), a
;src/enemigos/enemigos.c:141: distanciay=posy-objeto->posy;
	ld	e, 7 (ix)
	ld	d, #0x00
	ld	hl, #0x0002
	add	hl,bc
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	l, (hl)
	ld	h, #0x00
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	d, a
;src/enemigos/enemigos.c:143: if(abs(distanciax)>abs(distanciay)){
	push	de
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	_abs
	pop	af
	ld	-3 (ix), h
	ld	-4 (ix), l
	pop	de
	push	de
	push	de
	call	_abs
	pop	af
	pop	de
	ld	a, l
	sub	a, -4 (ix)
	ld	a, h
	sbc	a, -3 (ix)
	jp	PO, 00158$
	xor	a, #0x80
00158$:
	jp	P, 00108$
;src/enemigos/enemigos.c:144: if(distanciax<0){
	bit	7, -7 (ix)
	jr	Z,00102$
;src/enemigos/enemigos.c:145: nextMovimiento=mover_Izquierda;
	ld	e, #0x01
	jr	00109$
00102$:
;src/enemigos/enemigos.c:147: nextMovimiento=mover_Derecha;
	ld	e, #0x03
	jr	00109$
00108$:
;src/enemigos/enemigos.c:150: if(distanciay<0){
	bit	7, d
	jr	Z,00105$
;src/enemigos/enemigos.c:151: nextMovimiento=mover_Arriba;
	ld	e, #0x02
	jr	00109$
00105$:
;src/enemigos/enemigos.c:153: nextMovimiento=mover_Abajo;
	ld	e, #0x04
00109$:
;src/enemigos/enemigos.c:157: nextPosx=objeto->posx;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	ld	-9 (ix), a
;src/enemigos/enemigos.c:158: nextPosy=objeto->posy;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	ld	-10 (ix), a
;src/enemigos/enemigos.c:159: mover1casilla(&nextPosx,&nextPosy,nextMovimiento);
	ld	hl, #0x0001
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	hl, #0x0002
	add	hl, sp
	push	bc
	ld	a, e
	push	af
	inc	sp
	ld	e,-4 (ix)
	ld	d,-3 (ix)
	push	de
	push	hl
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/enemigos/enemigos.c:160: for (u8 i=0;i<RocasMaximas;i++){
	ld	-11 (ix), #0x00
00118$:
	ld	a, -11 (ix)
	sub	a, #0x28
	jr	NC,00113$
;src/enemigos/enemigos.c:161: if(rocas[i].posx==nextPosx && rocas[i].posy==nextPosy){
	ld	e,-11 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ex	de,hl
	ld	a, 8 (ix)
	add	a, e
	ld	e, a
	ld	a, 9 (ix)
	adc	a, d
	ld	d, a
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl)
	ld	-4 (ix), a
	ld	a, -9 (ix)
	sub	a, -4 (ix)
	jr	NZ,00119$
	ex	de,hl
	inc	hl
	inc	hl
	ld	a,-10 (ix)
;src/enemigos/enemigos.c:162: return no_pasa_nada;
	sub	a,(hl)
	jr	NZ,00119$
	ld	l,a
	jr	00120$
00119$:
;src/enemigos/enemigos.c:160: for (u8 i=0;i<RocasMaximas;i++){
	inc	-11 (ix)
	jr	00118$
00113$:
;src/enemigos/enemigos.c:165: moverYdibujar(objeto,nextPosx,nextPosy);
	ld	h, -10 (ix)
	ld	l, -9 (ix)
	push	hl
	push	bc
	call	_moverYdibujar
	pop	af
	pop	af
;src/enemigos/enemigos.c:166: if(nextPosx==posx && nextPosy==posy){
	ld	a, -9 (ix)
	sub	a, 6 (ix)
	jr	NZ,00115$
	ld	a, -10 (ix)
	sub	a, 7 (ix)
	jr	NZ,00115$
;src/enemigos/enemigos.c:167: return player_muere;
	ld	l, #0x01
	jr	00120$
00115$:
;src/enemigos/enemigos.c:169: return no_pasa_nada;
	ld	l, #0x00
00120$:
	ld	sp, ix
	pop	ix
	ret
;src/enemigos/enemigos.c:177: void crearEnemigoIzquierda(u8 posx,u8 posy, u8 sprite){
;	---------------------------------
; Function crearEnemigoIzquierda
; ---------------------------------
_crearEnemigoIzquierda::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/enemigos/enemigos.c:178: enemigosIzquierda[contadorEnemigosIz].posx=posx;
	ld	bc, #_enemigosIzquierda+0
	ld	de, (_contadorEnemigosIz)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	ld	a, 4 (ix)
	ld	(hl), a
;src/enemigos/enemigos.c:179: enemigosIzquierda[contadorEnemigosIz].posy=posy;
	ld	de, (_contadorEnemigosIz)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 5 (ix)
	ld	(hl), a
;src/enemigos/enemigos.c:180: enemigosIzquierda[contadorEnemigosIz].sprite=sprite;
	ld	de, (_contadorEnemigosIz)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;src/enemigos/enemigos.c:181: contadorEnemigosIz++;
	ld	hl, #_contadorEnemigosIz+0
	inc	(hl)
	pop	ix
	ret
;src/enemigos/enemigos.c:183: void crearEnemigoDerecha(u8 posx,u8 posy, u8 sprite){
;	---------------------------------
; Function crearEnemigoDerecha
; ---------------------------------
_crearEnemigoDerecha::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/enemigos/enemigos.c:184: enemigosDerecha[contadorEnemigosDe].posx=posx;
	ld	bc, #_enemigosDerecha+0
	ld	de, (_contadorEnemigosDe)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	ld	a, 4 (ix)
	ld	(hl), a
;src/enemigos/enemigos.c:185: enemigosDerecha[contadorEnemigosDe].posy=posy;
	ld	de, (_contadorEnemigosDe)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 5 (ix)
	ld	(hl), a
;src/enemigos/enemigos.c:186: enemigosDerecha[contadorEnemigosDe].sprite=sprite;
	ld	de, (_contadorEnemigosDe)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;src/enemigos/enemigos.c:187: contadorEnemigosDe++;
	ld	hl, #_contadorEnemigosDe+0
	inc	(hl)
	pop	ix
	ret
;src/enemigos/enemigos.c:190: void sinEnemigos(){
;	---------------------------------
; Function sinEnemigos
; ---------------------------------
_sinEnemigos::
;src/enemigos/enemigos.c:192: }
	ret
;src/enemigos/enemigos.c:195: void enemigosNivel01(){
;	---------------------------------
; Function enemigosNivel01
; ---------------------------------
_enemigosNivel01::
;src/enemigos/enemigos.c:196: crearEnemigoDerecha(14,3,sprite_enemigo1);
	ld	hl, #0x2a03
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	call	_crearEnemigoDerecha
	pop	af
	inc	sp
	ret
;src/enemigos/enemigos.c:198: void enemigosNvel_trap_01(){
;	---------------------------------
; Function enemigosNvel_trap_01
; ---------------------------------
_enemigosNvel_trap_01::
;src/enemigos/enemigos.c:199: crearEnemigoIzquierda(2,2,sprite_enemigo1);
	ld	hl, #0x2a02
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_crearEnemigoIzquierda
;src/enemigos/enemigos.c:200: crearEnemigoIzquierda(2,6,sprite_enemigo1);
	inc	sp
	ld	hl,#0x2a06
	ex	(sp),hl
	ld	a, #0x02
	push	af
	inc	sp
	call	_crearEnemigoIzquierda
;src/enemigos/enemigos.c:201: crearEnemigoIzquierda(6,2,sprite_enemigo1);
	inc	sp
	ld	hl,#0x2a02
	ex	(sp),hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_crearEnemigoIzquierda
;src/enemigos/enemigos.c:202: crearEnemigoIzquierda(6,6,sprite_enemigo1);
	inc	sp
	ld	hl,#0x2a06
	ex	(sp),hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_crearEnemigoIzquierda
	pop	af
	inc	sp
	ret
;src/enemigos/enemigos.c:204: void enemigosNvel_04(){
;	---------------------------------
; Function enemigosNvel_04
; ---------------------------------
_enemigosNvel_04::
;src/enemigos/enemigos.c:205: crearEnemigoDerecha(12,3,sprite_enemigo1);
	ld	hl, #0x2a03
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_crearEnemigoDerecha
;src/enemigos/enemigos.c:206: crearEnemigoDerecha(12,5,sprite_enemigo1);
	inc	sp
	ld	hl,#0x2a05
	ex	(sp),hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_crearEnemigoDerecha
	pop	af
	inc	sp
	ret
;src/enemigos/enemigos.c:208: void enemigosNvel_04_01(){
;	---------------------------------
; Function enemigosNvel_04_01
; ---------------------------------
_enemigosNvel_04_01::
;src/enemigos/enemigos.c:209: crearEnemigoIzquierda(4,4,sprite_enemigo1);
	ld	hl, #0x2a04
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_crearEnemigoIzquierda
	pop	af
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
