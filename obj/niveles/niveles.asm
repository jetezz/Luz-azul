;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module niveles
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _crearMapa
	.globl _initNiveles
	.globl _crearNivel
	.globl _resetLevel
	.globl _createMarco
	.globl _createPlayer
	.globl _createRoca
	.globl _createRocaEspejo
	.globl _createPuerta
	.globl _createPortal
	.globl _createHoleIzquierda
	.globl _createHoleDerecha
	.globl _createColeccionabeLuz
	.globl _createColeccionabeFamilia
	.globl _createColeccionabeAmstr
	.globl _crearNivel1
	.globl _crearNivel2
	.globl _crearNivel3
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_niveles:
	.ds 100
_contadorRocas:
	.ds 1
_contadorRocasEspejo:
	.ds 1
_contadorPuertas:
	.ds 1
_contadorColeccionables:
	.ds 1
_P_colList2:
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
;src/niveles/niveles.c:8: void initNiveles(u8* collist){
;	---------------------------------
; Function initNiveles
; ---------------------------------
_initNiveles::
;src/niveles/niveles.c:10: niveles[nivel_0]=crearNivel1;
	ld	hl, #_crearNivel1
	ld	((_niveles + 0x0002)), hl
;src/niveles/niveles.c:11: niveles[nivel_1]=crearNivel2;    
	ld	hl, #_crearNivel2
	ld	((_niveles + 0x0004)), hl
;src/niveles/niveles.c:12: niveles[nivel_2]=crearNivel3;    
	ld	hl, #_crearNivel3
	ld	((_niveles + 0x0006)), hl
;src/niveles/niveles.c:14: P_colList2=collist;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	(#_P_colList2 + 0),a
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	ld	(#_P_colList2 + 1),a
;src/niveles/niveles.c:15: contadorRocas=0;
	ld	hl,#_contadorRocas + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:16: contadorRocasEspejo=0;
	ld	hl,#_contadorRocasEspejo + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:17: contadorPuertas=0;
	ld	hl,#_contadorPuertas + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:18: contadorColeccionables=0;
	ld	hl,#_contadorColeccionables + 0
	ld	(hl), #0x00
	ret
;src/niveles/niveles.c:22: void crearNivel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables,u8* posicion,u8 nivel){
;	---------------------------------
; Function crearNivel
; ---------------------------------
_crearNivel::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:23: resetLevel(player,rocas,rocasEspejo,puertas,portales,coleccionables);    
	ld	l,14 (ix)
	ld	h,15 (ix)
	push	hl
	ld	l,12 (ix)
	ld	h,13 (ix)
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_resetLevel
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:24: niveles[nivel](player,rocas,rocasEspejo,puertas,portales,coleccionables,posicion);
	ld	bc, #_niveles+0
	ld	l, 18 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	e,16 (ix)
	ld	d,17 (ix)
	push	de
	ld	e,14 (ix)
	ld	d,15 (ix)
	push	de
	ld	e,12 (ix)
	ld	d,13 (ix)
	push	de
	ld	e,10 (ix)
	ld	d,11 (ix)
	push	de
	ld	e,8 (ix)
	ld	d,9 (ix)
	push	de
	ld	e,6 (ix)
	ld	d,7 (ix)
	push	de
	ld	e,4 (ix)
	ld	d,5 (ix)
	push	de
	ld	l, c
	call	___sdcc_call_hl
	ld	hl, #14
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
;src/niveles/niveles.c:28: void resetLevel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables){
;	---------------------------------
; Function resetLevel
; ---------------------------------
_resetLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:29: player->posx=0;
	ld	c,4 (ix)
	ld	b,5 (ix)
	inc	bc
	xor	a, a
	ld	(bc), a
;src/niveles/niveles.c:30: for(u8 i =0;i<RocasMaximas;i++){
	ld	c, #0x00
00106$:
	ld	a, c
	sub	a, #0x28
	jr	NC,00101$
;src/niveles/niveles.c:31: rocas[i].posx=0; 
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ex	de,hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, de
	inc	hl
	ld	(hl), #0x00
;src/niveles/niveles.c:30: for(u8 i =0;i<RocasMaximas;i++){
	inc	c
	jr	00106$
00101$:
;src/niveles/niveles.c:33: for(u8 i =0;i<RocasMaximas;i++){
	ld	c, #0x00
00109$:
	ld	a, c
	sub	a, #0x28
	jr	NC,00102$
;src/niveles/niveles.c:34: rocasEspejo[i].posx=0; 
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ex	de,hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	add	hl, de
	inc	hl
	ld	(hl), #0x00
;src/niveles/niveles.c:33: for(u8 i =0;i<RocasMaximas;i++){
	inc	c
	jr	00109$
00102$:
;src/niveles/niveles.c:36: for(u8 i =0;i<PuertasMaximas;i++){
	ld	c, #0x00
00112$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00103$
;src/niveles/niveles.c:37: puertas[i].posx=0; 
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ex	de,hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	add	hl, de
	inc	hl
	ld	(hl), #0x00
;src/niveles/niveles.c:36: for(u8 i =0;i<PuertasMaximas;i++){
	inc	c
	jr	00112$
00103$:
;src/niveles/niveles.c:39: portales[0].posx=0;
	ld	c,12 (ix)
	ld	b,13 (ix)
	ld	e, c
	ld	d, b
	inc	de
	xor	a, a
	ld	(de), a
;src/niveles/niveles.c:40: portales[1].posx=0;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x00
;src/niveles/niveles.c:42: for(u8 i =0;i<ColeccionablesMaximos;i++){
	ld	c, #0x00
00115$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00104$
;src/niveles/niveles.c:43: coleccionables[i].posx=0; 
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	l,14 (ix)
	ld	h,15 (ix)
	add	hl, de
	inc	hl
	ld	(hl), #0x00
;src/niveles/niveles.c:42: for(u8 i =0;i<ColeccionablesMaximos;i++){
	inc	c
	jr	00115$
00104$:
;src/niveles/niveles.c:46: contadorRocas=0;
	ld	hl,#_contadorRocas + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:47: contadorRocasEspejo=0;
	ld	hl,#_contadorRocasEspejo + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:48: contadorPuertas=0;
	ld	hl,#_contadorPuertas + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:49: contadorColeccionables=0;
	ld	hl,#_contadorColeccionables + 0
	ld	(hl), #0x00
	pop	ix
	ret
;src/niveles/niveles.c:52: void createMarco(u8 hay){
;	---------------------------------
; Function createMarco
; ---------------------------------
_createMarco::
;src/niveles/niveles.c:53: if (hay==si){
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	ret	NZ
;src/niveles/niveles.c:54: crearMapa(0);  
	xor	a, a
	push	af
	inc	sp
	call	_crearMapa
	inc	sp
	ret
;src/niveles/niveles.c:59: void createPlayer(TGameObject* player,u8 posx, u8 posy,u8* posicion){
;	---------------------------------
; Function createPlayer
; ---------------------------------
_createPlayer::
;src/niveles/niveles.c:61: *posicion=posicion_Izquieda;
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;src/niveles/niveles.c:60: if(posx<9){
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	sub	a, #0x09
	jr	NC,00102$
;src/niveles/niveles.c:61: *posicion=posicion_Izquieda;
	xor	a, a
	ld	(bc), a
	jr	00103$
00102$:
;src/niveles/niveles.c:63: *posicion=posicion_Derecha;        
	ld	a, #0x01
	ld	(bc), a
00103$:
;src/niveles/niveles.c:65: player->num=-1;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a, #0xff
	ld	(bc), a
;src/niveles/niveles.c:66: player->posx=posx;
	ld	e, c
	ld	d, b
	inc	de
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	ld	(de), a
;src/niveles/niveles.c:67: player->posy=posy;   
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
	ld	(de), a
;src/niveles/niveles.c:68: player->sprite=sprite_Player;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x01
;src/niveles/niveles.c:69: player->movimiento=mover_1;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x01
	ret
;src/niveles/niveles.c:71: void createRoca(TGameObject* rocas,TGameObject* rocasEspejo,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria,u8 simetrico){
;	---------------------------------
; Function createRoca
; ---------------------------------
_createRoca::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:72: rocas[contadorRocas].num=simetria;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	a, 12 (ix)
	ld	(hl), a
;src/niveles/niveles.c:73: rocas[contadorRocas].posx=posx;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	ld	a, 8 (ix)
	ld	(hl), a
;src/niveles/niveles.c:74: rocas[contadorRocas].posy=posy;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 9 (ix)
	ld	(hl), a
;src/niveles/niveles.c:75: rocas[contadorRocas].sprite=sprite;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	a, 11 (ix)
	ld	(hl), a
;src/niveles/niveles.c:76: rocas[contadorRocas].movimiento=mivimiento;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	bc, #0x0004
	add	hl, bc
	ld	a, 10 (ix)
	ld	(hl), a
;src/niveles/niveles.c:77: contadorRocas++;
	ld	hl, #_contadorRocas+0
	inc	(hl)
;src/niveles/niveles.c:78: if(simetrico==si){
	ld	a, 13 (ix)
	or	a, a
	jp	NZ, 00103$
;src/niveles/niveles.c:79: rocasEspejo[contadorRocas].num=simetria;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, bc
	ld	a, 12 (ix)
	ld	(hl), a
;src/niveles/niveles.c:80: rocasEspejo[contadorRocas].posx=16-posx;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, bc
	inc	hl
	ld	a, #0x10
	sub	a, 8 (ix)
	ld	(hl), a
;src/niveles/niveles.c:81: rocasEspejo[contadorRocas].posy=posy;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 9 (ix)
	ld	(hl), a
;src/niveles/niveles.c:82: rocasEspejo[contadorRocas].sprite=sprite;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	a, 11 (ix)
	ld	(hl), a
;src/niveles/niveles.c:83: rocasEspejo[contadorRocas].movimiento=mivimiento;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, bc
	ld	bc, #0x0004
	add	hl, bc
	ld	a, 10 (ix)
	ld	(hl), a
00103$:
	pop	ix
	ret
;src/niveles/niveles.c:86: void createRocaEspejo(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria){
;	---------------------------------
; Function createRocaEspejo
; ---------------------------------
_createRocaEspejo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:87: rocasEspejo[contadorRocasEspejo].num=simetria;
	ld	bc, (_contadorRocasEspejo)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	a, 10 (ix)
	ld	(hl), a
;src/niveles/niveles.c:88: rocasEspejo[contadorRocasEspejo].posx=posx;
	ld	bc, (_contadorRocasEspejo)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;src/niveles/niveles.c:89: rocasEspejo[contadorRocasEspejo].posy=posy;
	ld	bc, (_contadorRocasEspejo)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 7 (ix)
	ld	(hl), a
;src/niveles/niveles.c:90: rocasEspejo[contadorRocasEspejo].sprite=sprite;
	ld	bc, (_contadorRocasEspejo)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	a, 9 (ix)
	ld	(hl), a
;src/niveles/niveles.c:91: rocasEspejo[contadorRocasEspejo].movimiento=mivimiento;
	ld	bc, (_contadorRocasEspejo)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	bc, #0x0004
	add	hl, bc
	ld	a, 8 (ix)
	ld	(hl), a
;src/niveles/niveles.c:92: contadorRocasEspejo++;
	ld	hl, #_contadorRocasEspejo+0
	inc	(hl)
	pop	ix
	ret
;src/niveles/niveles.c:94: void createPuerta(TGameObject* puertas,u8 posx,u8 posy,u8 sprite,u8 nivel){
;	---------------------------------
; Function createPuerta
; ---------------------------------
_createPuerta::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:95: puertas[contadorPuertas].num=nivel;
	ld	bc, (_contadorPuertas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	a, 9 (ix)
	ld	(hl), a
;src/niveles/niveles.c:96: puertas[contadorPuertas].posx=posx;
	ld	bc, (_contadorPuertas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;src/niveles/niveles.c:97: puertas[contadorPuertas].posy=posy;
	ld	bc, (_contadorPuertas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 7 (ix)
	ld	(hl), a
;src/niveles/niveles.c:98: puertas[contadorPuertas].sprite=sprite;
	ld	bc, (_contadorPuertas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	a, 8 (ix)
	ld	(hl), a
;src/niveles/niveles.c:99: contadorPuertas++;
	ld	hl, #_contadorPuertas+0
	inc	(hl)
	pop	ix
	ret
;src/niveles/niveles.c:101: void createPortal(TGameObject* portal,TGameObject* roca,TGameObject* rocasEspejo,u8 hay){
;	---------------------------------
; Function createPortal
; ---------------------------------
_createPortal::
;src/niveles/niveles.c:102: if(hay==si){
	ld	hl, #8+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	ret	NZ
;src/niveles/niveles.c:103: portal[0].posx=7;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x07
;src/niveles/niveles.c:104: portal[0].posy=4;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x04
;src/niveles/niveles.c:105: portal[0].sprite=sprite_PuertaPortal_G;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x10
;src/niveles/niveles.c:107: portal[1].posx=9;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x09
;src/niveles/niveles.c:108: portal[1].posy=4;
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x04
;src/niveles/niveles.c:109: portal[1].sprite=sprite_PuertaPortal_B;
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0x11
;src/niveles/niveles.c:110: createRoca(roca,rocasEspejo,8,4,sin_Movimiento,sprite_PortalMuro,1,no);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0f00
	push	hl
	ld	hl, #0x0408
	push	hl
	ld	hl, #12
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #12
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	ret
;src/niveles/niveles.c:115: void createHoleIzquierda(TGameObject* rocas,u8 posx, u8 posy,u8 sprite, u8 simetria){
;	---------------------------------
; Function createHoleIzquierda
; ---------------------------------
_createHoleIzquierda::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:116: rocas[contadorRocas].num=simetria;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	a, 9 (ix)
	ld	(hl), a
;src/niveles/niveles.c:117: rocas[contadorRocas].posx=posx;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;src/niveles/niveles.c:118: rocas[contadorRocas].posy=posy;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 7 (ix)
	ld	(hl), a
;src/niveles/niveles.c:119: rocas[contadorRocas].sprite=sprite;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	a, 8 (ix)
	ld	(hl), a
;src/niveles/niveles.c:120: rocas[contadorRocas].movimiento=sin_Movimiento;
	ld	bc, (_contadorRocas)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	bc, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;src/niveles/niveles.c:121: contadorRocas++;
	ld	hl, #_contadorRocas+0
	inc	(hl)
	pop	ix
	ret
;src/niveles/niveles.c:123: void createHoleDerecha(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 sprite, u8 simetria){
;	---------------------------------
; Function createHoleDerecha
; ---------------------------------
_createHoleDerecha::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:124: rocasEspejo[contadorRocasEspejo].num=simetria;
	ld	bc, (_contadorRocasEspejo)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	a, 9 (ix)
	ld	(hl), a
;src/niveles/niveles.c:125: rocasEspejo[contadorRocasEspejo].posx=posx;
	ld	bc, (_contadorRocasEspejo)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;src/niveles/niveles.c:126: rocasEspejo[contadorRocasEspejo].posy=posy;
	ld	bc, (_contadorRocasEspejo)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 7 (ix)
	ld	(hl), a
;src/niveles/niveles.c:127: rocasEspejo[contadorRocasEspejo].sprite=sprite;
	ld	bc, (_contadorRocasEspejo)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	a, 8 (ix)
	ld	(hl), a
;src/niveles/niveles.c:128: rocasEspejo[contadorRocasEspejo].movimiento=sin_Movimiento;
	ld	bc, (_contadorRocasEspejo)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	bc, #0x0004
	add	hl, bc
	ld	(hl), #0x00
;src/niveles/niveles.c:129: contadorRocasEspejo++;
	ld	hl, #_contadorRocasEspejo+0
	inc	(hl)
	pop	ix
	ret
;src/niveles/niveles.c:131: void createColeccionabeLuz(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
;	---------------------------------
; Function createColeccionabeLuz
; ---------------------------------
_createColeccionabeLuz::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:132: if(P_colList2[id]==coleccionable_activo){
	ld	iy, #_P_colList2
	ld	a, 0 (iy)
	add	a, 8 (ix)
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	NZ,00103$
;src/niveles/niveles.c:133: coleccionable[contadorColeccionables].num=id;
	ld	iy, #_contadorColeccionables
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	a, 8 (ix)
	ld	(hl), a
;src/niveles/niveles.c:134: coleccionable[contadorColeccionables].posx=posx;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;src/niveles/niveles.c:135: coleccionable[contadorColeccionables].posy=posy;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 7 (ix)
	ld	(hl), a
;src/niveles/niveles.c:136: coleccionable[contadorColeccionables].sprite=sprite_luz;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x15
00103$:
	pop	ix
	ret
;src/niveles/niveles.c:139: void createColeccionabeFamilia(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 sprite,u8 id){
;	---------------------------------
; Function createColeccionabeFamilia
; ---------------------------------
_createColeccionabeFamilia::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:140: if(P_colList2[id]==coleccionable_activo){
	ld	iy, #_P_colList2
	ld	a, 0 (iy)
	add	a, 9 (ix)
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	NZ,00103$
;src/niveles/niveles.c:141: coleccionable[contadorColeccionables].num=id;
	ld	iy, #_contadorColeccionables
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	a, 9 (ix)
	ld	(hl), a
;src/niveles/niveles.c:142: coleccionable[contadorColeccionables].posx=posx;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;src/niveles/niveles.c:143: coleccionable[contadorColeccionables].posy=posy;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 7 (ix)
	ld	(hl), a
;src/niveles/niveles.c:144: coleccionable[contadorColeccionables].sprite=sprite;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	a, 8 (ix)
	ld	(hl), a
00103$:
	pop	ix
	ret
;src/niveles/niveles.c:147: void createColeccionabeAmstr(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
;	---------------------------------
; Function createColeccionabeAmstr
; ---------------------------------
_createColeccionabeAmstr::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:148: if(P_colList2[id]==coleccionable_activo){
	ld	iy, #_P_colList2
	ld	a, 0 (iy)
	add	a, 8 (ix)
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	NZ,00103$
;src/niveles/niveles.c:149: coleccionable[contadorColeccionables].num=id;
	ld	iy, #_contadorColeccionables
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	ld	a, 8 (ix)
	ld	(hl), a
;src/niveles/niveles.c:150: coleccionable[contadorColeccionables].posx=posx;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;src/niveles/niveles.c:151: coleccionable[contadorColeccionables].posy=posy;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 7 (ix)
	ld	(hl), a
;src/niveles/niveles.c:152: coleccionable[contadorColeccionables].sprite=sprite_amstradTape;
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x1b
00103$:
	pop	ix
	ret
;src/niveles/niveles.c:158: void crearNivel1(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNivel1
; ---------------------------------
_crearNivel1::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:160: createPlayer(player,3,4,posicion);
	ld	l,16 (ix)
	ld	h,17 (ix)
	push	hl
	ld	hl, #0x0403
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_createPlayer
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:161: createMarco(si);
	xor	a, a
	push	af
	inc	sp
	call	_createMarco
	inc	sp
;src/niveles/niveles.c:162: createPortal(portales,rocas,rocasEspejo,si);
	xor	a, a
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,12 (ix)
	ld	h,13 (ix)
	push	hl
	call	_createPortal
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:163: createPuerta(puertas,3,7,sprite_Puerta_G,nivel_0);
	ld	hl, #0x0112
	push	hl
	ld	hl, #0x0703
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:164: createPuerta(puertas,13,7,sprite_Puerta_B,nivel_0);
	ld	hl, #0x0113
	push	hl
	ld	hl, #0x070d
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:167: createRoca(rocas,rocasEspejo,2,4,mover_1,sprite_Rock_G,2,no);
	ld	hl, #0x0102
	push	hl
	ld	hl, #0x0201
	push	hl
	ld	hl, #0x0402
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:168: createRocaEspejo(rocasEspejo,14,4,sin_Movimiento,sprite_Rock_nomove_B,2);
	ld	hl, #0x0204
	push	hl
	ld	h, #0x00
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:171: createColeccionabeLuz(col,15,4,0);
	ld	hl, #0x0004
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	ld	l,14 (ix)
	ld	h,15 (ix)
	push	hl
	call	_createColeccionabeLuz
	pop	af
;src/niveles/niveles.c:174: createRoca(rocas,rocasEspejo,1,2,sin_Movimiento,sprite_RockInmovil3_G,1,no);
	inc	sp
	ld	hl,#0x0101
	ex	(sp),hl
	ld	hl, #0x0900
	push	hl
	ld	hl, #0x0201
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:175: createRoca(rocas,rocasEspejo,2,2,sin_Movimiento,sprite_RockInmovil4_G,1,no);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0b00
	push	hl
	ld	hl, #0x0202
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:176: createRoca(rocas,rocasEspejo,1,3,sin_Movimiento,sprite_RockInmovil1_G,1,no);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0500
	push	hl
	ld	hl, #0x0301
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:177: createRoca(rocas,rocasEspejo,6,3,sin_Movimiento,sprite_RockInmovil1_G,1,no);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0500
	push	hl
	ld	hl, #0x0306
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:178: createRoca(rocas,rocasEspejo,1,5,sin_Movimiento,sprite_RockInmovil1_G,1,no);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0500
	push	hl
	ld	l, #0x01
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:179: createRoca(rocas,rocasEspejo,6,5,sin_Movimiento,sprite_RockInmovil1_G,1,no);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0500
	push	hl
	ld	l, #0x06
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:180: createRoca(rocas,rocasEspejo,7,1,sin_Movimiento,sprite_RockInmovil2_G,1,no);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0700
	push	hl
	ld	hl, #0x0107
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:181: createRoca(rocas,rocasEspejo,7,7,sin_Movimiento,sprite_RockInmovil2_G,1,no);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0700
	push	hl
	ld	l, #0x07
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:182: createRoca(rocas,rocasEspejo,1,4,sin_Movimiento,sprite_amstrad,1,no);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x1a00
	push	hl
	ld	hl, #0x0401
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:183: createRoca(rocas,rocasEspejo,1,1,sin_Movimiento,sprite_PrinceofPersia2_G,1,no);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x1e00
	push	hl
	ld	hl, #0x0101
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:184: createRoca(rocas,rocasEspejo,2,1,sin_Movimiento,sprite_PrinceofPersia1_G,1,no);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x1c00
	push	hl
	ld	hl, #0x0102
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:188: createRocaEspejo(rocasEspejo,14,2,sin_Movimiento,sprite_RockInmovil3_B,1);
	ld	hl, #0x010a
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:189: createRocaEspejo(rocasEspejo,15,2,sin_Movimiento,sprite_RockInmovil4_B,1);
	ld	hl, #0x010c
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:190: createRocaEspejo(rocasEspejo,15,3,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0106
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:191: createRocaEspejo(rocasEspejo,10,3,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0106
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:192: createRocaEspejo(rocasEspejo,15,5,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0106
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:193: createRocaEspejo(rocasEspejo,10,5,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0106
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x0a
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:194: createRocaEspejo(rocasEspejo,9,1,sin_Movimiento,sprite_RockInmovil2_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:195: createRocaEspejo(rocasEspejo,9,7,sin_Movimiento,sprite_RockInmovil2_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:196: createRocaEspejo(rocasEspejo,14,1,sin_Movimiento,sprite_PrinceofPersia1_B,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:197: createRocaEspejo(rocasEspejo,15,1,sin_Movimiento,sprite_PrinceofPersia2_B,1);
	ld	hl, #0x011f
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x0f
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
;src/niveles/niveles.c:199: void crearNivel2(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNivel2
; ---------------------------------
_crearNivel2::
;src/niveles/niveles.c:202: }
	ret
;src/niveles/niveles.c:203: void crearNivel3(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNivel3
; ---------------------------------
_crearNivel3::
;src/niveles/niveles.c:205: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
