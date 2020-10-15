;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module juego
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _managerDialogo
	.globl _initDialogos
	.globl _actualizarHud
	.globl _initHud
	.globl _crearNivel
	.globl _initNiveles
	.globl _movimientoPlayer
	.globl _keyR
	.globl _scanKey
	.globl _moverGameObject
	.globl _dibujarGameObjectCol
	.globl _dibujarGameObject
	.globl _initGameobjest
	.globl _pasos
	.globl _nivelActual
	.globl _coleccionablesAms
	.globl _coleccionablesFam
	.globl _coleccionablesLuz
	.globl _posicion
	.globl _colList
	.globl _coleccionables
	.globl _puertas
	.globl _portal
	.globl _rocasEspejo
	.globl _rocas
	.globl _player
	.globl _game
	.globl _initGame
	.globl _moverPlayer
	.globl _dibujarGameObjects
	.globl _comprobarMovimiento
	.globl _comprobarPasos
	.globl _resetGameobjects
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
_movimientoGuardado:
	.ds 1
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
_dialogos:
	.ds 100
_player::
	.ds 7
_rocas::
	.ds 280
_rocasEspejo::
	.ds 280
_portal::
	.ds 14
_puertas::
	.ds 70
_coleccionables::
	.ds 12
_colList::
	.ds 50
_posicion::
	.ds 1
_coleccionablesLuz::
	.ds 1
_coleccionablesFam::
	.ds 1
_coleccionablesAms::
	.ds 1
_nivelActual::
	.ds 1
_pasos::
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
;src/juego/juego.c:33: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/juego/juego.c:34: initGame();       
	call	_initGame
;src/juego/juego.c:35: while(1){          
00106$:
;src/juego/juego.c:36: scanKey();
	call	_scanKey
;src/juego/juego.c:37: if(keyR()==si){
	call	_keyR
	ld	a, l
	or	a, a
	jr	NZ,00102$
;src/juego/juego.c:38: resetGameobjects(nivelActual);
	ld	a, (_nivelActual)
	push	af
	inc	sp
	call	_resetGameobjects
	inc	sp
00102$:
;src/juego/juego.c:40: comprobarMovimiento();      
	call	_comprobarMovimiento
;src/juego/juego.c:41: moverPlayer();
	call	_moverPlayer
;src/juego/juego.c:42: actualizarHud(coleccionablesLuz,coleccionablesFam,coleccionablesAms,pasos);
	ld	a, (_pasos)
	push	af
	inc	sp
	ld	a, (_coleccionablesAms)
	push	af
	inc	sp
	ld	a, (_coleccionablesFam)
	push	af
	inc	sp
	ld	a, (_coleccionablesLuz)
	push	af
	inc	sp
	call	_actualizarHud
	pop	af
	pop	af
;src/juego/juego.c:43: if(comprobarPasos()==si){
	call	_comprobarPasos
	ld	a, l
	or	a, a
	jr	NZ,00106$
;src/juego/juego.c:44: managerDialogo(nivelActual,pasos);
	ld	a, (_pasos)
	push	af
	inc	sp
	ld	a, (_nivelActual)
	push	af
	inc	sp
	call	_managerDialogo
	pop	af
	jr	00106$
;src/juego/juego.c:49: void initGame(){
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;src/juego/juego.c:50: for(u8 i =0;i<ColeccionablesMaximosTotales;i++){
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x32
	jr	NC,00101$
;src/juego/juego.c:51: colList[i]=coleccionable_activo;
	ld	hl, #_colList
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;src/juego/juego.c:50: for(u8 i =0;i<ColeccionablesMaximosTotales;i++){
	inc	c
	jr	00103$
00101$:
;src/juego/juego.c:53: posicion=posicion_Izquieda;
	ld	hl,#_posicion + 0
	ld	(hl), #0x00
;src/juego/juego.c:54: coleccionablesLuz=0;
	ld	hl,#_coleccionablesLuz + 0
	ld	(hl), #0x00
;src/juego/juego.c:55: coleccionablesFam=0;
	ld	hl,#_coleccionablesFam + 0
	ld	(hl), #0x00
;src/juego/juego.c:56: coleccionablesAms=0;
	ld	hl,#_coleccionablesAms + 0
	ld	(hl), #0x00
;src/juego/juego.c:57: nivelActual=nivel_0;
	ld	hl,#_nivelActual + 0
	ld	(hl), #0x01
;src/juego/juego.c:58: pasos=0;
	ld	hl,#_pasos + 0
	ld	(hl), #0x00
;src/juego/juego.c:59: initNiveles(colList);
	ld	hl, #_colList
	push	hl
	call	_initNiveles
;src/juego/juego.c:60: crearNivel(&player,rocas,rocasEspejo,puertas,portal,coleccionables,&posicion,nivel_0);    
	ld	h,#0x01
	ex	(sp),hl
	inc	sp
	ld	hl, #_posicion
	push	hl
	ld	hl, #_coleccionables
	push	hl
	ld	hl, #_portal
	push	hl
	ld	hl, #_puertas
	push	hl
	ld	hl, #_rocasEspejo
	push	hl
	ld	hl, #_rocas
	push	hl
	ld	hl, #_player
	push	hl
	call	_crearNivel
	ld	hl, #15
	add	hl, sp
	ld	sp, hl
;src/juego/juego.c:61: initGameobjest(portal,puertas,coleccionables,&coleccionablesLuz,&coleccionablesFam,&coleccionablesAms,colList);
	ld	hl, #_colList
	push	hl
	ld	hl, #_coleccionablesAms
	push	hl
	ld	hl, #_coleccionablesFam
	push	hl
	ld	hl, #_coleccionablesLuz
	push	hl
	ld	hl, #_coleccionables
	push	hl
	ld	hl, #_puertas
	push	hl
	ld	hl, #_portal
	push	hl
	call	_initGameobjest
	ld	hl, #14
	add	hl, sp
	ld	sp, hl
;src/juego/juego.c:62: dibujarGameObjects();
	call	_dibujarGameObjects
;src/juego/juego.c:63: initHud();
	call	_initHud
;src/juego/juego.c:64: initDialogos();        
	jp  _initDialogos
;src/juego/juego.c:66: void moverPlayer(){
;	---------------------------------
; Function moverPlayer
; ---------------------------------
_moverPlayer::
;src/juego/juego.c:68: if(posicion==posicion_Izquieda){
	ld	a,(#_posicion + 0)
	or	a, a
	jr	NZ,00102$
;src/juego/juego.c:69: nivel=moverGameObject(&player,movimientoGuardado,rocas,rocasEspejo,&posicion);
	ld	hl, #_posicion
	push	hl
	ld	hl, #_rocasEspejo
	push	hl
	ld	hl, #_rocas
	push	hl
	ld	a, (_movimientoGuardado)
	push	af
	inc	sp
	ld	hl, #_player
	push	hl
	call	_moverGameObject
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	ld	b, l
	jr	00103$
00102$:
;src/juego/juego.c:71: nivel=moverGameObject(&player,movimientoGuardado,rocasEspejo,rocas,&posicion);
	ld	hl, #_posicion
	push	hl
	ld	hl, #_rocas
	push	hl
	ld	hl, #_rocasEspejo
	push	hl
	ld	a, (_movimientoGuardado)
	push	af
	inc	sp
	ld	hl, #_player
	push	hl
	call	_moverGameObject
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	ld	b, l
00103$:
;src/juego/juego.c:74: if(nivel!=seguir_En_Nivel){ 
	ld	a, b
	or	a, a
	ret	Z
;src/juego/juego.c:75: nivelActual=nivel;      
	ld	hl,#_nivelActual + 0
	ld	(hl), b
;src/juego/juego.c:76: resetGameobjects(nivel);
	push	bc
	inc	sp
	call	_resetGameobjects
	inc	sp
	ret
;src/juego/juego.c:82: void dibujarGameObjects(){
;	---------------------------------
; Function dibujarGameObjects
; ---------------------------------
_dibujarGameObjects::
;src/juego/juego.c:83: dibujarGameObject(&player);
	ld	hl, #_player
	push	hl
	call	_dibujarGameObject
	pop	af
;src/juego/juego.c:84: for (u8 i =0; i<RocasMaximas;i++){        
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x28
	jr	NC,00101$
;src/juego/juego.c:85: dibujarGameObject(&rocas[i]);        
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de, #_rocas
	add	hl, de
	push	bc
	push	hl
	call	_dibujarGameObject
	pop	af
	pop	bc
;src/juego/juego.c:84: for (u8 i =0; i<RocasMaximas;i++){        
	inc	c
	jr	00107$
00101$:
;src/juego/juego.c:87: for (u8 i =0; i<RocasMaximas;i++){        
	ld	c, #0x00
00110$:
	ld	a, c
	sub	a, #0x28
	jr	NC,00102$
;src/juego/juego.c:88: dibujarGameObject(&rocasEspejo[i]);
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de, #_rocasEspejo
	add	hl, de
	push	bc
	push	hl
	call	_dibujarGameObject
	pop	af
	pop	bc
;src/juego/juego.c:87: for (u8 i =0; i<RocasMaximas;i++){        
	inc	c
	jr	00110$
00102$:
;src/juego/juego.c:91: for(u8 i=0;i<2;i++){
	ld	c, #0x00
00113$:
	ld	a, c
	sub	a, #0x02
	jr	NC,00103$
;src/juego/juego.c:92: dibujarGameObject(&portal[i]);
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de, #_portal
	add	hl, de
	push	bc
	push	hl
	call	_dibujarGameObject
	pop	af
	pop	bc
;src/juego/juego.c:91: for(u8 i=0;i<2;i++){
	inc	c
	jr	00113$
00103$:
;src/juego/juego.c:94: for(u8 i=0;i<PuertasMaximas;i++){
	ld	c, #0x00
00116$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00104$
;src/juego/juego.c:95: dibujarGameObject(&puertas[i]);
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de, #_puertas
	add	hl, de
	push	bc
	push	hl
	call	_dibujarGameObject
	pop	af
	pop	bc
;src/juego/juego.c:94: for(u8 i=0;i<PuertasMaximas;i++){
	inc	c
	jr	00116$
00104$:
;src/juego/juego.c:97: for(u8 i=0;i<ColeccionablesMaximos;i++){
	ld	c, #0x00
00119$:
	ld	a, c
	sub	a, #0x03
	ret	NC
;src/juego/juego.c:98: dibujarGameObjectCol(&coleccionables[i]);
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_coleccionables
	add	hl, de
	push	bc
	push	hl
	call	_dibujarGameObjectCol
	pop	af
	pop	bc
;src/juego/juego.c:97: for(u8 i=0;i<ColeccionablesMaximos;i++){
	inc	c
	jr	00119$
;src/juego/juego.c:102: void comprobarMovimiento(){
;	---------------------------------
; Function comprobarMovimiento
; ---------------------------------
_comprobarMovimiento::
;src/juego/juego.c:103: if(player.cronoMovimiento==0){
	ld	a, (#(_player + 0x0005) + 0)
	or	a, a
	jr	NZ,00102$
;src/juego/juego.c:104: movimientoGuardado=mover_SinMovimiento;
	ld	hl,#_movimientoGuardado + 0
	ld	(hl), #0x00
00102$:
;src/juego/juego.c:106: if(movimientoPlayer()!=mover_SinMovimiento){
	call	_movimientoPlayer
	ld	a, l
	or	a, a
	ret	Z
;src/juego/juego.c:107: movimientoGuardado=movimientoPlayer();
	call	_movimientoPlayer
	ld	iy, #_movimientoGuardado
	ld	0 (iy), l
	ret
;src/juego/juego.c:110: u8 comprobarPasos(){
;	---------------------------------
; Function comprobarPasos
; ---------------------------------
_comprobarPasos::
;src/juego/juego.c:111: if(player.pasos!=pasos){
	ld	hl, #(_player + 0x0006) + 0
	ld	c, (hl)
	ld	iy, #_pasos
	ld	a, 0 (iy)
	sub	a, c
	jr	Z,00102$
;src/juego/juego.c:112: pasos=player.pasos;
	ld	0 (iy), c
;src/juego/juego.c:113: return si;
	ld	l, #0x00
	ret
00102$:
;src/juego/juego.c:115: return no;
	ld	l, #0x01
	ret
;src/juego/juego.c:118: void resetGameobjects(u8 nivel){
;	---------------------------------
; Function resetGameobjects
; ---------------------------------
_resetGameobjects::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/juego/juego.c:119: posicion=posicion_Izquieda;
	ld	hl,#_posicion + 0
	ld	(hl), #0x00
;src/juego/juego.c:120: player.pasos=0;
	ld	hl, #(_player + 0x0006)
	ld	(hl), #0x00
;src/juego/juego.c:121: pasos=0;    
	ld	hl,#_pasos + 0
	ld	(hl), #0x00
;src/juego/juego.c:122: crearNivel(&player,rocas,rocasEspejo,puertas,portal,coleccionables,&posicion,nivel);        
	ld	a, 4 (ix)
	push	af
	inc	sp
	ld	hl, #_posicion
	push	hl
	ld	hl, #_coleccionables
	push	hl
	ld	hl, #_portal
	push	hl
	ld	hl, #_puertas
	push	hl
	ld	hl, #_rocasEspejo
	push	hl
	ld	hl, #_rocas
	push	hl
	ld	hl, #_player
	push	hl
	call	_crearNivel
	ld	hl, #15
	add	hl, sp
	ld	sp, hl
;src/juego/juego.c:123: dibujarGameObjects();     
	pop	ix
	jp	_dibujarGameObjects
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
