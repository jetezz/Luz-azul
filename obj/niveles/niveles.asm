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
	.globl _cpct_drawSolidBox
	.globl _initNiveles
	.globl _crearNivel
	.globl _resetLevel
	.globl _limpiarPantalla
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
	.globl _crearNivel01_01
	.globl _crearNivel2
	.globl _crearNivelTRAP01
	.globl _crearNievel3
	.globl _crearNievel4
	.globl _crearNievel4_01
	.globl _crearNievel5
	.globl _crearNievel6
	.globl _crearNievel7
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
;src/niveles/niveles.c:9: void initNiveles(u8* collist){
;	---------------------------------
; Function initNiveles
; ---------------------------------
_initNiveles::
;src/niveles/niveles.c:11: niveles[nivel_01]=crearNivel1;
	ld	hl, #_crearNivel1
	ld	((_niveles + 0x0002)), hl
;src/niveles/niveles.c:12: niveles[nivel_01_01]=crearNivel01_01;    
	ld	hl, #_crearNivel01_01
	ld	((_niveles + 0x0004)), hl
;src/niveles/niveles.c:13: niveles[nivel_02]=crearNivel2;
	ld	hl, #_crearNivel2
	ld	((_niveles + 0x0008)), hl
;src/niveles/niveles.c:14: niveles[nivel_TRAP_01]=crearNivelTRAP01;  
	ld	hl, #_crearNivelTRAP01
	ld	((_niveles + 0x0006)), hl
;src/niveles/niveles.c:15: niveles[nivel_03]=crearNievel3;
	ld	hl, #_crearNievel3
	ld	((_niveles + 0x000a)), hl
;src/niveles/niveles.c:16: niveles[nivel_04]=crearNievel4;
	ld	hl, #_crearNievel4
	ld	((_niveles + 0x000c)), hl
;src/niveles/niveles.c:17: niveles[nivel_04_01]=crearNievel4_01;
	ld	hl, #_crearNievel4_01
	ld	((_niveles + 0x000e)), hl
;src/niveles/niveles.c:18: niveles[nivel_05]=crearNievel5;
	ld	hl, #_crearNievel5
	ld	((_niveles + 0x0010)), hl
;src/niveles/niveles.c:19: niveles[nivel_06]=crearNievel6;
	ld	hl, #_crearNievel6
	ld	((_niveles + 0x0012)), hl
;src/niveles/niveles.c:20: niveles[nivel_07]=crearNievel7;
	ld	hl, #_crearNievel7
	ld	((_niveles + 0x0014)), hl
;src/niveles/niveles.c:25: P_colList2=collist;
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	ld	(#_P_colList2 + 0),a
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	ld	(#_P_colList2 + 1),a
;src/niveles/niveles.c:26: contadorRocas=0;
	ld	hl,#_contadorRocas + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:27: contadorRocasEspejo=0;
	ld	hl,#_contadorRocasEspejo + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:28: contadorPuertas=0;
	ld	hl,#_contadorPuertas + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:29: contadorColeccionables=0;
	ld	hl,#_contadorColeccionables + 0
	ld	(hl), #0x00
	ret
;src/niveles/niveles.c:33: void crearNivel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables,u8* posicion,u8 nivel){
;	---------------------------------
; Function crearNivel
; ---------------------------------
_crearNivel::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:34: limpiarPantalla();
	call	_limpiarPantalla
;src/niveles/niveles.c:35: resetLevel(player,rocas,rocasEspejo,puertas,portales,coleccionables);    
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
;src/niveles/niveles.c:36: niveles[nivel](player,rocas,rocasEspejo,puertas,portales,coleccionables,posicion);
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
;src/niveles/niveles.c:40: void resetLevel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables){
;	---------------------------------
; Function resetLevel
; ---------------------------------
_resetLevel::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:41: player->posx=0;
	ld	c,4 (ix)
	ld	b,5 (ix)
	inc	bc
	xor	a, a
	ld	(bc), a
;src/niveles/niveles.c:42: for(u8 i =0;i<RocasMaximas;i++){
	ld	c, #0x00
00106$:
	ld	a, c
	sub	a, #0x28
	jr	NC,00101$
;src/niveles/niveles.c:43: rocas[i].posx=0; 
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
;src/niveles/niveles.c:42: for(u8 i =0;i<RocasMaximas;i++){
	inc	c
	jr	00106$
00101$:
;src/niveles/niveles.c:45: for(u8 i =0;i<RocasMaximas;i++){
	ld	c, #0x00
00109$:
	ld	a, c
	sub	a, #0x28
	jr	NC,00102$
;src/niveles/niveles.c:46: rocasEspejo[i].posx=0; 
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
;src/niveles/niveles.c:45: for(u8 i =0;i<RocasMaximas;i++){
	inc	c
	jr	00109$
00102$:
;src/niveles/niveles.c:48: for(u8 i =0;i<PuertasMaximas;i++){
	ld	c, #0x00
00112$:
	ld	a, c
	sub	a, #0x06
	jr	NC,00103$
;src/niveles/niveles.c:49: puertas[i].posx=0; 
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
;src/niveles/niveles.c:48: for(u8 i =0;i<PuertasMaximas;i++){
	inc	c
	jr	00112$
00103$:
;src/niveles/niveles.c:51: portales[0].posx=0;
	ld	c,12 (ix)
	ld	b,13 (ix)
	ld	e, c
	ld	d, b
	inc	de
	xor	a, a
	ld	(de), a
;src/niveles/niveles.c:52: portales[1].posx=0;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x00
;src/niveles/niveles.c:54: for(u8 i =0;i<ColeccionablesMaximos;i++){
	ld	c, #0x00
00115$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00104$
;src/niveles/niveles.c:55: coleccionables[i].posx=0; 
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
;src/niveles/niveles.c:54: for(u8 i =0;i<ColeccionablesMaximos;i++){
	inc	c
	jr	00115$
00104$:
;src/niveles/niveles.c:58: contadorRocas=0;
	ld	hl,#_contadorRocas + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:59: contadorRocasEspejo=0;
	ld	hl,#_contadorRocasEspejo + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:60: contadorPuertas=0;
	ld	hl,#_contadorPuertas + 0
	ld	(hl), #0x00
;src/niveles/niveles.c:61: contadorColeccionables=0;
	ld	hl,#_contadorColeccionables + 0
	ld	(hl), #0x00
	pop	ix
	ret
;src/niveles/niveles.c:63: void limpiarPantalla(){
;	---------------------------------
; Function limpiarPantalla
; ---------------------------------
_limpiarPantalla::
;src/niveles/niveles.c:64: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 0),0x00,36,144);
	ld	hl, #0x9024
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	h, #0xc0
	push	hl
	call	_cpct_drawSolidBox
;src/niveles/niveles.c:65: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 36, 0),0x00,33,144);
	ld	hl, #0x9021
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xc024
	push	hl
	call	_cpct_drawSolidBox
	ret
;src/niveles/niveles.c:69: void createMarco(u8 hay){
;	---------------------------------
; Function createMarco
; ---------------------------------
_createMarco::
;src/niveles/niveles.c:70: if (hay==si){
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	ret	NZ
;src/niveles/niveles.c:71: crearMapa(0);  
	xor	a, a
	push	af
	inc	sp
	call	_crearMapa
	inc	sp
	ret
;src/niveles/niveles.c:76: void createPlayer(TGameObject* player,u8 posx, u8 posy,u8* posicion){
;	---------------------------------
; Function createPlayer
; ---------------------------------
_createPlayer::
;src/niveles/niveles.c:78: *posicion=posicion_Izquieda;
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;src/niveles/niveles.c:77: if(posx<9){
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	sub	a, #0x09
	jr	NC,00102$
;src/niveles/niveles.c:78: *posicion=posicion_Izquieda;
	xor	a, a
	ld	(bc), a
	jr	00103$
00102$:
;src/niveles/niveles.c:80: *posicion=posicion_Derecha;        
	ld	a, #0x01
	ld	(bc), a
00103$:
;src/niveles/niveles.c:82: player->num=-1;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	a, #0xff
	ld	(bc), a
;src/niveles/niveles.c:83: player->posx=posx;
	ld	e, c
	ld	d, b
	inc	de
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	ld	(de), a
;src/niveles/niveles.c:84: player->posy=posy;   
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
	ld	(de), a
;src/niveles/niveles.c:85: player->sprite=sprite_Player;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x01
;src/niveles/niveles.c:86: player->movimiento=mover_1;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x01
	ret
;src/niveles/niveles.c:88: void createRoca(TGameObject* rocas,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria){
;	---------------------------------
; Function createRoca
; ---------------------------------
_createRoca::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:89: rocas[contadorRocas].num=simetria;
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
	ld	a, 10 (ix)
	ld	(hl), a
;src/niveles/niveles.c:90: rocas[contadorRocas].posx=posx;
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
;src/niveles/niveles.c:91: rocas[contadorRocas].posy=posy;
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
;src/niveles/niveles.c:92: rocas[contadorRocas].sprite=sprite;
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
	ld	a, 9 (ix)
	ld	(hl), a
;src/niveles/niveles.c:93: rocas[contadorRocas].movimiento=mivimiento;
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
	ld	a, 8 (ix)
	ld	(hl), a
;src/niveles/niveles.c:94: contadorRocas++;    
	ld	hl, #_contadorRocas+0
	inc	(hl)
	pop	ix
	ret
;src/niveles/niveles.c:96: void createRocaEspejo(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria){
;	---------------------------------
; Function createRocaEspejo
; ---------------------------------
_createRocaEspejo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:97: rocasEspejo[contadorRocasEspejo].num=simetria;
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
;src/niveles/niveles.c:98: rocasEspejo[contadorRocasEspejo].posx=posx;
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
;src/niveles/niveles.c:99: rocasEspejo[contadorRocasEspejo].posy=posy;
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
;src/niveles/niveles.c:100: rocasEspejo[contadorRocasEspejo].sprite=sprite;
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
;src/niveles/niveles.c:101: rocasEspejo[contadorRocasEspejo].movimiento=mivimiento;
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
;src/niveles/niveles.c:102: contadorRocasEspejo++;
	ld	hl, #_contadorRocasEspejo+0
	inc	(hl)
	pop	ix
	ret
;src/niveles/niveles.c:104: void createPuerta(TGameObject* puertas,u8 posx,u8 posy,u8 sprite,u8 nivel){
;	---------------------------------
; Function createPuerta
; ---------------------------------
_createPuerta::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:105: puertas[contadorPuertas].num=nivel;
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
;src/niveles/niveles.c:106: puertas[contadorPuertas].posx=posx;
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
;src/niveles/niveles.c:107: puertas[contadorPuertas].posy=posy;
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
;src/niveles/niveles.c:108: puertas[contadorPuertas].sprite=sprite;
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
;src/niveles/niveles.c:109: contadorPuertas++;
	ld	hl, #_contadorPuertas+0
	inc	(hl)
	pop	ix
	ret
;src/niveles/niveles.c:111: void createPortal(TGameObject* portal,TGameObject* roca,TGameObject* rocasEspejo,u8 hay){
;	---------------------------------
; Function createPortal
; ---------------------------------
_createPortal::
;src/niveles/niveles.c:112: if(hay==si){
	ld	hl, #8+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	ret	NZ
;src/niveles/niveles.c:113: portal[0].posx=7;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x07
;src/niveles/niveles.c:114: portal[0].posy=4;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x04
;src/niveles/niveles.c:115: portal[0].sprite=sprite_PuertaPortal_G;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x1a
;src/niveles/niveles.c:117: portal[1].posx=9;
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x09
;src/niveles/niveles.c:118: portal[1].posy=4;
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x04
;src/niveles/niveles.c:119: portal[1].sprite=sprite_PuertaPortal_B;
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0x1b
;src/niveles/niveles.c:120: createRoca(roca,8,4,sin_Movimiento,sprite_PortalMuro,1);
	ld	hl, #0x0119
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	hl, #9
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	ret
;src/niveles/niveles.c:125: void createHoleIzquierda(TGameObject* rocas,u8 posx, u8 posy,u8 sprite, u8 simetria){
;	---------------------------------
; Function createHoleIzquierda
; ---------------------------------
_createHoleIzquierda::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:126: rocas[contadorRocas].num=simetria;
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
;src/niveles/niveles.c:127: rocas[contadorRocas].posx=posx;
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
;src/niveles/niveles.c:128: rocas[contadorRocas].posy=posy;
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
;src/niveles/niveles.c:129: rocas[contadorRocas].sprite=sprite;
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
;src/niveles/niveles.c:130: rocas[contadorRocas].movimiento=sin_Movimiento;
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
;src/niveles/niveles.c:131: contadorRocas++;
	ld	hl, #_contadorRocas+0
	inc	(hl)
	pop	ix
	ret
;src/niveles/niveles.c:133: void createHoleDerecha(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 sprite, u8 simetria){
;	---------------------------------
; Function createHoleDerecha
; ---------------------------------
_createHoleDerecha::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:134: rocasEspejo[contadorRocasEspejo].num=simetria;
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
;src/niveles/niveles.c:135: rocasEspejo[contadorRocasEspejo].posx=posx;
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
;src/niveles/niveles.c:136: rocasEspejo[contadorRocasEspejo].posy=posy;
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
;src/niveles/niveles.c:137: rocasEspejo[contadorRocasEspejo].sprite=sprite;
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
;src/niveles/niveles.c:138: rocasEspejo[contadorRocasEspejo].movimiento=sin_Movimiento;
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
;src/niveles/niveles.c:139: contadorRocasEspejo++;
	ld	hl, #_contadorRocasEspejo+0
	inc	(hl)
	pop	ix
	ret
;src/niveles/niveles.c:141: void createColeccionabeLuz(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
;	---------------------------------
; Function createColeccionabeLuz
; ---------------------------------
_createColeccionabeLuz::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:142: if(P_colList2[id]==coleccionable_activo){
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
;src/niveles/niveles.c:143: coleccionable[contadorColeccionables].num=id;
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
;src/niveles/niveles.c:144: coleccionable[contadorColeccionables].posx=posx;
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
;src/niveles/niveles.c:145: coleccionable[contadorColeccionables].posy=posy;
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
;src/niveles/niveles.c:146: coleccionable[contadorColeccionables].sprite=sprite_luz;
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
	ld	(hl), #0x25
00103$:
	pop	ix
	ret
;src/niveles/niveles.c:149: void createColeccionabeFamilia(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 sprite,u8 id){
;	---------------------------------
; Function createColeccionabeFamilia
; ---------------------------------
_createColeccionabeFamilia::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:150: if(P_colList2[id]==coleccionable_activo){
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
;src/niveles/niveles.c:151: coleccionable[contadorColeccionables].num=id;
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
;src/niveles/niveles.c:152: coleccionable[contadorColeccionables].posx=posx;
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
;src/niveles/niveles.c:153: coleccionable[contadorColeccionables].posy=posy;
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
;src/niveles/niveles.c:154: coleccionable[contadorColeccionables].sprite=sprite;
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
;src/niveles/niveles.c:157: void createColeccionabeAmstr(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
;	---------------------------------
; Function createColeccionabeAmstr
; ---------------------------------
_createColeccionabeAmstr::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:158: if(P_colList2[id]==coleccionable_activo){
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
;src/niveles/niveles.c:159: coleccionable[contadorColeccionables].num=id;
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
;src/niveles/niveles.c:160: coleccionable[contadorColeccionables].posx=posx;
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
;src/niveles/niveles.c:161: coleccionable[contadorColeccionables].posy=posy;
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
;src/niveles/niveles.c:162: coleccionable[contadorColeccionables].sprite=sprite_amstradTape;
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
	ld	(hl), #0x2f
00103$:
	pop	ix
	ret
;src/niveles/niveles.c:168: void crearNivel1(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNivel1
; ---------------------------------
_crearNivel1::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:170: createPlayer(player,3,4,posicion);
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
;src/niveles/niveles.c:171: createMarco(si);
	xor	a, a
	push	af
	inc	sp
	call	_createMarco
	inc	sp
;src/niveles/niveles.c:172: createPortal(portales,rocas,rocasEspejo,si);
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
;src/niveles/niveles.c:173: createPuerta(puertas,3,7,sprite_Puerta_G,nivel_07);
	ld	hl, #0x0a1e
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
;src/niveles/niveles.c:174: createPuerta(puertas,13,7,sprite_Puerta_B,nivel_01_01);
	ld	hl, #0x021f
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
;src/niveles/niveles.c:177: createRoca(rocas,2,4,mover_1,sprite_Rock_G,2);
	ld	hl, #0x0202
	push	hl
	ld	hl, #0x0104
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:178: createRocaEspejo(rocasEspejo,14,4,sin_Movimiento,sprite_Rock_nomove_B,2);
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
;src/niveles/niveles.c:181: createColeccionabeLuz(col,15,4,0);
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
;src/niveles/niveles.c:184: createRoca(rocas,1,2,sin_Movimiento,sprite_RockInmovil3_G,1);
	inc	sp
	ld	hl,#0x010b
	ex	(sp),hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:185: createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil4_G,1);
	ld	hl, #0x010d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:186: createRoca(rocas,1,3,sin_Movimiento,sprite_RockInmovil1_G,1);
	ld	hl, #0x0107
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:187: createRoca(rocas,6,3,sin_Movimiento,sprite_RockInmovil1_G,1);
	ld	hl, #0x0107
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:188: createRoca(rocas,1,5,sin_Movimiento,sprite_RockInmovil1_G,1);
	ld	hl, #0x0107
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:189: createRoca(rocas,6,5,sin_Movimiento,sprite_RockInmovil1_G,1);
	ld	hl, #0x0107
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:190: createRoca(rocas,7,1,sin_Movimiento,sprite_RockInmovil2_G,1);
	ld	hl, #0x0109
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:191: createRoca(rocas,7,7,sin_Movimiento,sprite_RockInmovil2_G,1);
	ld	hl, #0x0109
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:192: createRoca(rocas,1,4,sin_Movimiento,sprite_amstrad,1);
	ld	hl, #0x012e
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:193: createRoca(rocas,1,1,sin_Movimiento,sprite_PrinceofPersia2_G,1);
	ld	hl, #0x0132
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:194: createRoca(rocas,2,1,sin_Movimiento,sprite_PrinceofPersia1_G,1);
	ld	hl, #0x0130
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:198: createRocaEspejo(rocasEspejo,14,2,sin_Movimiento,sprite_RockInmovil3_B,1);
	ld	hl, #0x010c
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
;src/niveles/niveles.c:199: createRocaEspejo(rocasEspejo,15,2,sin_Movimiento,sprite_RockInmovil4_B,1);
	ld	hl, #0x010e
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
;src/niveles/niveles.c:200: createRocaEspejo(rocasEspejo,15,3,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
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
;src/niveles/niveles.c:201: createRocaEspejo(rocasEspejo,10,3,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
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
;src/niveles/niveles.c:202: createRocaEspejo(rocasEspejo,15,5,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
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
;src/niveles/niveles.c:203: createRocaEspejo(rocasEspejo,10,5,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
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
;src/niveles/niveles.c:204: createRocaEspejo(rocasEspejo,9,1,sin_Movimiento,sprite_RockInmovil2_B,1);
	ld	hl, #0x010a
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
;src/niveles/niveles.c:205: createRocaEspejo(rocasEspejo,9,7,sin_Movimiento,sprite_RockInmovil2_B,1);
	ld	hl, #0x010a
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
;src/niveles/niveles.c:206: createRocaEspejo(rocasEspejo,14,1,sin_Movimiento,sprite_PrinceofPersia1_B,1);
	ld	hl, #0x0131
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
;src/niveles/niveles.c:207: createRocaEspejo(rocasEspejo,15,1,sin_Movimiento,sprite_PrinceofPersia2_B,1);
	ld	hl, #0x0133
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
;src/niveles/niveles.c:209: void crearNivel01_01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNivel01_01
; ---------------------------------
_crearNivel01_01::
;src/niveles/niveles.c:214: }
	ret
;src/niveles/niveles.c:215: void crearNivel2(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNivel2
; ---------------------------------
_crearNivel2::
;src/niveles/niveles.c:220: }
	ret
;src/niveles/niveles.c:222: void crearNivelTRAP01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNivelTRAP01
; ---------------------------------
_crearNivelTRAP01::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:224: createPlayer(player,4,4,posicion);
	ld	l,16 (ix)
	ld	h,17 (ix)
	push	hl
	ld	hl, #0x0404
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_createPlayer
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:225: createMarco(no);
	ld	a, #0x01
	push	af
	inc	sp
	call	_createMarco
	inc	sp
;src/niveles/niveles.c:226: createPortal(portales,rocas,rocasEspejo,no);
	ld	a, #0x01
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
;src/niveles/niveles.c:227: createPuerta(puertas,4,2,sprite_Puerta_B,nivel_02);
	ld	hl, #0x041f
	push	hl
	ld	hl, #0x0204
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:228: createPuerta(puertas,4,6,sprite_Puerta_B,nivel_02);
	ld	hl, #0x041f
	push	hl
	ld	hl, #0x0604
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:234: createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:235: createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:236: createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:237: createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:238: createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:239: createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:240: createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:241: createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:242: createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:243: createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:244: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:245: createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:246: createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:247: createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:248: createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:249: createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:250: createRoca(rocas,1,4,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:251: createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:252: createRoca(rocas,1,6,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:253: createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:254: createRoca(rocas,7,3,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:255: createRoca(rocas,7,4,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:256: createRoca(rocas,7,5,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:257: createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:258: createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:259: createRoca(rocas,3,3,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:260: createRoca(rocas,3,5,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:261: createRoca(rocas,5,3,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:262: createRoca(rocas,5,5,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
;src/niveles/niveles.c:267: void crearNievel3(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNievel3
; ---------------------------------
_crearNievel3::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:269: createPlayer(player,3,3,posicion);
	ld	l,16 (ix)
	ld	h,17 (ix)
	push	hl
	ld	hl, #0x0303
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_createPlayer
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:270: createMarco(si);
	xor	a, a
	push	af
	inc	sp
	call	_createMarco
	inc	sp
;src/niveles/niveles.c:271: createPortal(portales,rocas,rocasEspejo,si);
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
;src/niveles/niveles.c:272: createPuerta(puertas,3,1,sprite_Puerta_G,nivel_02);
	ld	hl, #0x041e
	push	hl
	ld	hl, #0x0103
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:273: createPuerta(puertas,13,1,sprite_Puerta_B,nivel_01_01);
	ld	hl, #0x021f
	push	hl
	ld	hl, #0x010d
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:276: createPuerta(puertas,11,7,sprite_StairDown1_B,nivel_TRAP_01);
	ld	hl, #0x0323
	push	hl
	ld	hl, #0x070b
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:277: createPuerta(puertas,9,7,sprite_StairUp1_B,nivel_TRAP_01);
	ld	hl, #0x0321
	push	hl
	ld	hl, #0x0709
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:281: createRoca(rocas,5,4,mover_1,sprite_Rock_G,2);
	ld	hl, #0x0202
	push	hl
	ld	hl, #0x0104
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:282: createRoca(rocas,1,6,mover_1,sprite_Rock_G,3);
	ld	hl, #0x0302
	push	hl
	ld	hl, #0x0106
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:283: createRocaEspejo(rocasEspejo,11,4,mover_Linea,sprite_RockLineal1_G,2);
	ld	hl, #0x0205
	push	hl
	ld	l, #0x04
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:287: createColeccionabeFamilia(col,15,5,sprite_familia1,5);
	ld	hl, #0x0526
	push	hl
	ld	l, #0x0f
	push	hl
	ld	l,14 (ix)
	ld	h,15 (ix)
	push	hl
	call	_createColeccionabeFamilia
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:290: createRoca(rocas,4,2,sin_Movimiento,sprite_RockInmovil1_G,1);
	ld	hl, #0x0107
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:291: createRoca(rocas,4,6,sin_Movimiento,sprite_RockInmovil1_G,1);
	ld	hl, #0x0107
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:292: createRoca(rocas,6,2,sin_Movimiento,sprite_RockInmovil2_G,1);
	ld	hl, #0x0109
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:293: createRoca(rocas,6,6,sin_Movimiento,sprite_RockInmovil2_G,1);
	ld	hl, #0x0109
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:294: createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil6_G,1);
	ld	hl, #0x0111
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:295: createRoca(rocas,2,4,sin_Movimiento,sprite_RockInmovil7_G,1);
	ld	hl, #0x0113
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:296: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:297: createRoca(rocas,5,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:298: createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:302: createRocaEspejo(rocasEspejo,12,2,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:303: createRocaEspejo(rocasEspejo,12,6,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:304: createRocaEspejo(rocasEspejo,10,2,sin_Movimiento,sprite_RockInmovil2_B,1);
	ld	hl, #0x010a
	push	hl
	ld	hl, #0x0002
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
;src/niveles/niveles.c:305: createRocaEspejo(rocasEspejo,10,6,sin_Movimiento,sprite_RockInmovil2_B,1);
	ld	hl, #0x010a
	push	hl
	ld	hl, #0x0006
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
;src/niveles/niveles.c:306: createRocaEspejo(rocasEspejo,14,5,sin_Movimiento,sprite_RockInmovil6_B,1);
	ld	hl, #0x0112
	push	hl
	ld	hl, #0x0005
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
;src/niveles/niveles.c:307: createRocaEspejo(rocasEspejo,14,4,sin_Movimiento,sprite_RockInmovil7_B,1);
	ld	hl, #0x0114
	push	hl
	ld	hl, #0x0004
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
;src/niveles/niveles.c:308: createRocaEspejo(rocasEspejo,12,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:309: createRocaEspejo(rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
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
;src/niveles/niveles.c:310: createRocaEspejo(rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:311: createHoleDerecha(rocasEspejo,15,3,sprite_hole,1);
	ld	hl, #0x0124
	push	hl
	ld	hl, #0x030f
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createHoleDerecha
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:312: createHoleDerecha(rocasEspejo,15,6,sprite_hole,1);
	ld	hl, #0x0124
	push	hl
	ld	hl, #0x060f
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createHoleDerecha
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
;src/niveles/niveles.c:319: void crearNievel4(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNievel4
; ---------------------------------
_crearNievel4::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:321: createPlayer(player,14,4,posicion);
	ld	l,16 (ix)
	ld	h,17 (ix)
	push	hl
	ld	hl, #0x040e
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_createPlayer
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:322: createMarco(si);
	xor	a, a
	push	af
	inc	sp
	call	_createMarco
	inc	sp
;src/niveles/niveles.c:323: createPortal(portales,rocas,rocasEspejo,si);
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
;src/niveles/niveles.c:324: createPuerta(puertas,15,4,sprite_Puerta_G,nivel_02);
	ld	hl, #0x041e
	push	hl
	ld	l, #0x0f
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:325: createPuerta(puertas,3,1,sprite_Puerta_G,nivel_05);
	ld	hl, #0x081e
	push	hl
	ld	hl, #0x0103
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:326: createPuerta(puertas,1,4,sprite_Puerta_G,nivel_04_01);
	ld	hl, #0x071e
	push	hl
	ld	hl, #0x0401
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:332: createRoca(rocas,3,4,mover_1,sprite_Rock_G,2);
	ld	hl, #0x0202
	push	hl
	ld	hl, #0x0104
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:333: createRocaEspejo(rocasEspejo,13,4,mover_1,sprite_Rock_G,2);
	ld	hl, #0x0202
	push	hl
	ld	hl, #0x0104
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:334: createRoca(rocas,3,3,mover_1,sprite_Rock_G,3);
	ld	hl, #0x0302
	push	hl
	ld	hl, #0x0103
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:335: createRocaEspejo(rocasEspejo,13,3,sin_Movimiento,sprite_Rock_nomove_B,3);
	ld	hl, #0x0304
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:336: createRoca(rocas,3,5,mover_1,sprite_Rock_G,4);
	ld	hl, #0x0402
	push	hl
	ld	hl, #0x0105
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:337: createRocaEspejo(rocasEspejo,13,5,mover_Linea,sprite_RockLineal1_G,4);
	ld	hl, #0x0405
	push	hl
	ld	h, #0x02
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:342: createRoca(rocas,1,2,sin_Movimiento,sprite_RockInmovil8_G,1);
	ld	hl, #0x0115
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:343: createRoca(rocas,1,3,sin_Movimiento,sprite_RockInmovil9_G,1);
	ld	hl, #0x0117
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:344: createRoca(rocas,6,2,sin_Movimiento,sprite_RockInmovil8_G,1);
	ld	hl, #0x0115
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:345: createRoca(rocas,6,3,sin_Movimiento,sprite_RockInmovil9_G,1);
	ld	hl, #0x0117
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:346: createRoca(rocas,1,5,sin_Movimiento,sprite_RockInmovil8_G,1);
	ld	hl, #0x0115
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:347: createRoca(rocas,1,6,sin_Movimiento,sprite_RockInmovil9_G,1);
	ld	hl, #0x0117
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:348: createRoca(rocas,6,5,sin_Movimiento,sprite_RockInmovil8_G,1);
	ld	hl, #0x0115
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:349: createRoca(rocas,6,6,sin_Movimiento,sprite_RockInmovil9_G,1);
	ld	hl, #0x0117
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:350: createRoca(rocas,4,2,sin_Movimiento,sprite_RockInmovil1_G,1);
	ld	hl, #0x0107
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:351: createRoca(rocas,4,6,sin_Movimiento,sprite_RockInmovil1_G,1);
	ld	hl, #0x0107
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:352: createRoca(rocas,2,3,sin_Movimiento,sprite_RockInmovil2_G,1);
	ld	hl, #0x0109
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:353: createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil2_G,1);
	ld	hl, #0x0109
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:354: createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil5_G,1);
	ld	hl, #0x010f
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:355: createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil5_G,1);
	ld	hl, #0x010f
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:356: createHoleIzquierda(rocas,4,1,sprite_hole,4);
	ld	hl, #0x0424
	push	hl
	ld	hl, #0x0104
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createHoleIzquierda
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:357: createHoleIzquierda(rocas,4,7,sprite_hole,4);
	ld	hl, #0x0424
	push	hl
	ld	hl, #0x0704
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createHoleIzquierda
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:363: createRocaEspejo(rocasEspejo,12,4,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:364: createHoleDerecha(rocasEspejo,10,3,sprite_hole,4);
	ld	hl, #0x0424
	push	hl
	ld	hl, #0x030a
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createHoleDerecha
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:365: createHoleDerecha(rocasEspejo,10,5,sprite_hole,4);
	ld	hl, #0x0424
	push	hl
	ld	hl, #0x050a
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createHoleDerecha
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:366: createHoleDerecha(rocasEspejo,11,2,sprite_hole,4);
	ld	hl, #0x0424
	push	hl
	ld	hl, #0x020b
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createHoleDerecha
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:367: createHoleDerecha(rocasEspejo,11,4,sprite_hole,4);
	ld	hl, #0x0424
	push	hl
	ld	l, #0x0b
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createHoleDerecha
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:368: createHoleDerecha(rocasEspejo,11,6,sprite_hole,4);
	ld	hl, #0x0424
	push	hl
	ld	hl, #0x060b
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createHoleDerecha
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
;src/niveles/niveles.c:371: void crearNievel4_01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNievel4_01
; ---------------------------------
_crearNievel4_01::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:373: createPlayer(player,6,4,posicion);
	ld	l,16 (ix)
	ld	h,17 (ix)
	push	hl
	ld	hl, #0x0406
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_createPlayer
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:374: createMarco(no);
	ld	a, #0x01
	push	af
	inc	sp
	call	_createMarco
	inc	sp
;src/niveles/niveles.c:375: createPortal(portales,rocas,rocasEspejo,no);
	ld	a, #0x01
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
;src/niveles/niveles.c:376: createPuerta(puertas,7,4,sprite_Puerta_B,nivel_04);
	ld	hl, #0x061f
	push	hl
	ld	hl, #0x0407
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:377: createPuerta(puertas,1,4,sprite_Puerta_B,nivel_TRAP_01);
	ld	hl, #0x031f
	push	hl
	ld	hl, #0x0401
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:380: createRoca(rocas,5,4,mover_1,sprite_Rock_B,1);
	ld	hl, #0x0103
	push	hl
	ld	l, #0x04
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:384: createColeccionabeAmstr(col,3,4,4);
	ld	hl, #0x0404
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,14 (ix)
	ld	h,15 (ix)
	push	hl
	call	_createColeccionabeAmstr
	pop	af
;src/niveles/niveles.c:388: createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	inc	sp
	ld	hl,#0x011c
	ex	(sp),hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:389: createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:390: createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:391: createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:392: createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:393: createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:394: createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:395: createRoca(rocas,8,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:396: createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:397: createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:398: createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:399: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:400: createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:401: createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:402: createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:403: createRoca(rocas,8,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:404: createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:405: createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:406: createRoca(rocas,1,4,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:407: createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:408: createRoca(rocas,1,6,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:409: createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:410: createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:411: createRoca(rocas,8,4,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:412: createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:413: createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:414: createRoca(rocas,2,3,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:415: createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:416: createRoca(rocas,7,3,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:417: createRoca(rocas,7,5,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:418: createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil2_B,1);
	ld	hl, #0x010a
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:419: createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil2_B,1);
	ld	hl, #0x010a
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:420: createHoleIzquierda(rocas,2,4,sprite_hole,4);
	ld	hl, #0x0424
	push	hl
	ld	l, #0x02
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createHoleIzquierda
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
;src/niveles/niveles.c:423: void crearNievel5(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNievel5
; ---------------------------------
_crearNievel5::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:425: createPlayer(player,3,5,posicion);
	ld	l,16 (ix)
	ld	h,17 (ix)
	push	hl
	ld	hl, #0x0503
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_createPlayer
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:426: createMarco(no);
	ld	a, #0x01
	push	af
	inc	sp
	call	_createMarco
	inc	sp
;src/niveles/niveles.c:427: createPortal(portales,rocas,rocasEspejo,si);
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
;src/niveles/niveles.c:428: createPuerta(puertas,3,6,sprite_Puerta_G,nivel_04);
	ld	hl, #0x061e
	push	hl
	ld	l, #0x03
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:432: createRoca(rocas,5,5,mover_1,sprite_Rock_G,2);
	ld	hl, #0x0202
	push	hl
	ld	hl, #0x0105
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:433: createRocaEspejo(rocasEspejo,11,5,mover_1, sprite_Rock_B,2);
	ld	hl, #0x0203
	push	hl
	ld	hl, #0x0105
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:434: createRoca(rocas,4,3,mover_Linea,sprite_RockLineal1_G,3);
	ld	hl, #0x0305
	push	hl
	ld	hl, #0x0203
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:435: createRocaEspejo(rocasEspejo,12,3,mover_1, sprite_Rock_B,3);
	ld	hl, #0x0303
	push	hl
	ld	h, #0x01
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:439: createColeccionabeLuz(col,12,2,2);
	ld	hl, #0x0202
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l,14 (ix)
	ld	h,15 (ix)
	push	hl
	call	_createColeccionabeLuz
	pop	af
;src/niveles/niveles.c:442: createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Solid1,1);
	inc	sp
	ld	hl,#0x011d
	ex	(sp),hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:443: createRoca(rocas,2,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:444: createRoca(rocas,2,3,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:445: createRoca(rocas,2,4,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:446: createRoca(rocas,2,5,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:447: createRoca(rocas,2,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:448: createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:449: createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:450: createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:451: createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:452: createRoca(rocas,5,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:453: createRoca(rocas,6,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:454: createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:455: createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:456: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:457: createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:458: createRoca(rocas,5,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:459: createRoca(rocas,6,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:460: createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:461: createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:462: createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:463: createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:464: createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:465: createRoca(rocas,7,3,sin_Movimiento,sprite_RockInmovil1_G,1);
	ld	hl, #0x0107
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:466: createRoca(rocas,7,5,sin_Movimiento,sprite_RockInmovil1_G,1);
	ld	hl, #0x0107
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:470: createRocaEspejo(rocasEspejo,14,1,sin_Movimiento, sprite_Muro_Solid1,1);
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
;src/niveles/niveles.c:471: createRocaEspejo(rocasEspejo,14,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
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
;src/niveles/niveles.c:472: createRocaEspejo(rocasEspejo,14,3,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0003
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
;src/niveles/niveles.c:473: createRocaEspejo(rocasEspejo,14,4,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0004
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
;src/niveles/niveles.c:474: createRocaEspejo(rocasEspejo,14,5,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0005
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
;src/niveles/niveles.c:475: createRocaEspejo(rocasEspejo,14,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
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
;src/niveles/niveles.c:476: createRocaEspejo(rocasEspejo,14,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
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
;src/niveles/niveles.c:477: createRocaEspejo(rocasEspejo,11,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:478: createRocaEspejo(rocasEspejo,12,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:479: createRocaEspejo(rocasEspejo,13,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:480: createRocaEspejo(rocasEspejo,11,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:481: createRocaEspejo(rocasEspejo,10,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
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
;src/niveles/niveles.c:482: createRocaEspejo(rocasEspejo,9,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
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
;src/niveles/niveles.c:483: createRocaEspejo(rocasEspejo,11,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:484: createRocaEspejo(rocasEspejo,12,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:485: createRocaEspejo(rocasEspejo,13,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:486: createRocaEspejo(rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:487: createRocaEspejo(rocasEspejo,10,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
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
;src/niveles/niveles.c:488: createRocaEspejo(rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
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
;src/niveles/niveles.c:489: createHoleDerecha(rocasEspejo,10,4,sprite_hole,1);
	ld	hl, #0x0124
	push	hl
	ld	hl, #0x040a
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createHoleDerecha
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:490: createRocaEspejo(rocasEspejo,9,3,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0003
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
;src/niveles/niveles.c:491: createRocaEspejo(rocasEspejo,9,5,sin_Movimiento,sprite_RockInmovil1_B,1);
	ld	hl, #0x0108
	push	hl
	ld	hl, #0x0005
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
	pop	ix
	ret
;src/niveles/niveles.c:495: void crearNievel6(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNievel6
; ---------------------------------
_crearNievel6::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:497: createPlayer(player,4,2,posicion);
	ld	l,16 (ix)
	ld	h,17 (ix)
	push	hl
	ld	hl, #0x0204
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_createPlayer
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:498: createMarco(no);
	ld	a, #0x01
	push	af
	inc	sp
	call	_createMarco
	inc	sp
;src/niveles/niveles.c:499: createPortal(portales,rocas,rocasEspejo,si);
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
;src/niveles/niveles.c:500: createPuerta(puertas,3,2,sprite_Puerta_G,nivel_04);
	ld	hl, #0x061e
	push	hl
	ld	hl, #0x0203
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:504: createRoca(rocas,5,4,mover_Linea,sprite_RockLineal1_G,2);
	ld	hl, #0x0205
	push	hl
	ld	l, #0x04
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:505: createRoca(rocas,6,4,mover_Linea,sprite_RockLineal1_G,3);
	ld	hl, #0x0305
	push	hl
	ld	hl, #0x0204
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:506: createRocaEspejo(rocasEspejo,10,4,sin_Movimiento,sprite_Rock_nomove_B,3);
	ld	hl, #0x0304
	push	hl
	ld	h, #0x00
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
;src/niveles/niveles.c:507: createRocaEspejo(rocasEspejo,11,4,sin_Movimiento,sprite_Rock_nomove_B,2);
	ld	hl, #0x0204
	push	hl
	ld	h, #0x00
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:513: createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:514: createRoca(rocas,2,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:515: createRoca(rocas,2,3,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:516: createRoca(rocas,2,4,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:517: createRoca(rocas,2,5,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:518: createRoca(rocas,2,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:519: createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:520: createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:521: createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:522: createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:523: createRoca(rocas,5,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:524: createRoca(rocas,6,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:525: createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:526: createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:527: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:528: createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:529: createRoca(rocas,5,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:530: createRoca(rocas,6,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:531: createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:532: createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:533: createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:534: createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:535: createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:536: createRoca(rocas,3,3,sin_Movimiento,sprite_RockInmovil5_G,1);
	ld	hl, #0x010f
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:541: createRocaEspejo(rocasEspejo,14,1,sin_Movimiento, sprite_Muro_Solid1,1);
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
;src/niveles/niveles.c:542: createRocaEspejo(rocasEspejo,14,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
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
;src/niveles/niveles.c:543: createRocaEspejo(rocasEspejo,14,3,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0003
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
;src/niveles/niveles.c:544: createRocaEspejo(rocasEspejo,14,4,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0004
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
;src/niveles/niveles.c:545: createRocaEspejo(rocasEspejo,14,5,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0005
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
;src/niveles/niveles.c:546: createRocaEspejo(rocasEspejo,14,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
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
;src/niveles/niveles.c:547: createRocaEspejo(rocasEspejo,14,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
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
;src/niveles/niveles.c:548: createRocaEspejo(rocasEspejo,11,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:549: createRocaEspejo(rocasEspejo,12,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:550: createRocaEspejo(rocasEspejo,13,1,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:551: createRocaEspejo(rocasEspejo,11,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:552: createRocaEspejo(rocasEspejo,10,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
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
;src/niveles/niveles.c:553: createRocaEspejo(rocasEspejo,9,2,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0002
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
;src/niveles/niveles.c:554: createRocaEspejo(rocasEspejo,11,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:555: createRocaEspejo(rocasEspejo,12,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:556: createRocaEspejo(rocasEspejo,13,7,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x0d
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:557: createRocaEspejo(rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createRocaEspejo
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:558: createRocaEspejo(rocasEspejo,10,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
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
;src/niveles/niveles.c:559: createRocaEspejo(rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Solid1,1);
	ld	hl, #0x011d
	push	hl
	ld	hl, #0x0006
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
;src/niveles/niveles.c:560: createHoleDerecha(rocasEspejo,11,3,sprite_hole,1);
	ld	hl, #0x0124
	push	hl
	ld	hl, #0x030b
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createHoleDerecha
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:561: createHoleDerecha(rocasEspejo,12,3,sprite_hole,1);
	ld	hl, #0x0124
	push	hl
	ld	hl, #0x030c
	push	hl
	ld	l,8 (ix)
	ld	h,9 (ix)
	push	hl
	call	_createHoleDerecha
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:562: createRocaEspejo(rocasEspejo,13,3,sin_Movimiento,sprite_RockInmovil5_B,1);
	ld	hl, #0x0110
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x0d
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
;src/niveles/niveles.c:565: void crearNievel7(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
;	---------------------------------
; Function crearNievel7
; ---------------------------------
_crearNievel7::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/niveles/niveles.c:567: createPlayer(player,7,4,posicion);
	ld	l,16 (ix)
	ld	h,17 (ix)
	push	hl
	ld	hl, #0x0407
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_createPlayer
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:568: createMarco(no);
	ld	a, #0x01
	push	af
	inc	sp
	call	_createMarco
	inc	sp
;src/niveles/niveles.c:569: createPortal(portales,rocas,rocasEspejo,no);
	ld	a, #0x01
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
;src/niveles/niveles.c:570: createPuerta(puertas,8,2,sprite_Puerta_B,nivel_05);
	ld	hl, #0x081f
	push	hl
	ld	hl, #0x0208
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:571: createPuerta(puertas,8,6,sprite_Puerta_B,nivel_06);
	ld	hl, #0x091f
	push	hl
	ld	hl, #0x0608
	push	hl
	ld	l,10 (ix)
	ld	h,11 (ix)
	push	hl
	call	_createPuerta
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:574: createRoca(rocas,6,4,mover_1,sprite_Rock_B,1);
	ld	hl, #0x0103
	push	hl
	ld	l, #0x04
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:575: createRoca(rocas,6,2,mover_Linea,sprite_RockLineal1_B,1);
	ld	hl, #0x0106
	push	hl
	ld	hl, #0x0202
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:576: createRoca(rocas,6,6,mover_Linea,sprite_RockLineal1_B,1);
	ld	hl, #0x0106
	push	hl
	ld	h, #0x02
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:577: createRoca(rocas,5,4,mover_Linea,sprite_RockLineal1_B,1);
	ld	hl, #0x0106
	push	hl
	ld	hl, #0x0204
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:578: createRoca(rocas,4,4,mover_Linea,sprite_RockLineal1_B,1);
	ld	hl, #0x0106
	push	hl
	ld	hl, #0x0204
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:579: createRoca(rocas,4,3,mover_Linea,sprite_RockLineal1_B,1);
	ld	hl, #0x0106
	push	hl
	ld	hl, #0x0203
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:580: createRoca(rocas,4,5,mover_Linea,sprite_RockLineal1_B,1);
	ld	hl, #0x0106
	push	hl
	ld	hl, #0x0205
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:584: createColeccionabeLuz(col,2,4,6);
	ld	hl, #0x0604
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,14 (ix)
	ld	h,15 (ix)
	push	hl
	call	_createColeccionabeLuz
	pop	af
;src/niveles/niveles.c:588: createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	inc	sp
	ld	hl,#0x011c
	ex	(sp),hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:589: createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:590: createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:591: createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:592: createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:593: createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:594: createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:595: createRoca(rocas,8,1,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0001
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:596: createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:597: createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:598: createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x03
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:599: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:600: createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x05
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:601: createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:602: createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:603: createRoca(rocas,8,8,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0008
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:604: createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:605: createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:606: createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:607: createRoca(rocas,1,6,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:608: createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:609: createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0003
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:610: createRoca(rocas,8,4,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:611: createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:612: createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Polvo1,1);
	ld	hl, #0x011c
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x08
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:613: createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil2_B,1);
	ld	hl, #0x010a
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/niveles/niveles.c:614: createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil2_B,1);
	ld	hl, #0x010a
	push	hl
	ld	hl, #0x0006
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_createRoca
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
