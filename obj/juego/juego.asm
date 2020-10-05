;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module juego
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _crearNivel
	.globl _movimientoPlayer
	.globl _scanKey
	.globl _moverGameObject
	.globl _dibujarGameObject
	.globl _posicion
	.globl _rocasEspejo
	.globl _rocas
	.globl _player
	.globl _game
	.globl _initGame
	.globl _createPlayer
	.globl _createRocas
	.globl _createRocasEspejo
	.globl _dibujarGameObjects
	.globl _comprobarMovimiento
	.globl _resetGameobjects
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_movimientoGuardado:
	.ds 1
_player::
	.ds 5
_rocas::
	.ds 25
_rocasEspejo::
	.ds 25
_posicion::
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
;src/juego/juego.c:24: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/juego/juego.c:25: initGame();       
	call	_initGame
;src/juego/juego.c:26: while(1){ 
00102$:
;src/juego/juego.c:27: scanKey();
	call	_scanKey
;src/juego/juego.c:28: comprobarMovimiento();      
	call	_comprobarMovimiento
;src/juego/juego.c:29: moverGameObject(&player,movimientoGuardado,rocas,rocasEspejo,posicion);              
	ld	a, (_posicion)
	push	af
	inc	sp
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
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	jr	00102$
;src/juego/juego.c:32: void initGame(){
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;src/juego/juego.c:33: posicion=posicion_Izquieda;
	ld	hl,#_posicion + 0
	ld	(hl), #0x00
;src/juego/juego.c:34: crearNivel();
	call	_crearNivel
;src/juego/juego.c:35: createPlayer();
	call	_createPlayer
;src/juego/juego.c:36: createRocas();
	call	_createRocas
;src/juego/juego.c:37: createRocasEspejo();
	call	_createRocasEspejo
;src/juego/juego.c:38: dibujarGameObjects();    
	jp  _dibujarGameObjects
;src/juego/juego.c:40: void createPlayer(){
;	---------------------------------
; Function createPlayer
; ---------------------------------
_createPlayer::
;src/juego/juego.c:41: player.num=-1;
	ld	hl, #_player
	ld	(hl), #0xff
;src/juego/juego.c:42: player.posx=1;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x01
;src/juego/juego.c:43: player.posy=1;   
	ld	hl, #(_player + 0x0002)
	ld	(hl), #0x01
;src/juego/juego.c:44: player.sprite=sprite_Player;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x01
	ret
;src/juego/juego.c:46: void createRocas(){
;	---------------------------------
; Function createRocas
; ---------------------------------
_createRocas::
;src/juego/juego.c:47: rocas[0].num=0;
	ld	hl, #_rocas
	ld	(hl), #0x00
;src/juego/juego.c:48: rocas[0].posx=5;
	ld	hl, #(_rocas + 0x0001)
	ld	(hl), #0x05
;src/juego/juego.c:49: rocas[0].posy=5;
	ld	hl, #(_rocas + 0x0002)
	ld	(hl), #0x05
;src/juego/juego.c:50: rocas[0].sprite=sprite_Rock;
	ld	hl, #(_rocas + 0x0003)
	ld	(hl), #0x02
;src/juego/juego.c:52: rocas[1].num=1;
	ld	hl, #(_rocas + 0x0005)
	ld	(hl), #0x01
;src/juego/juego.c:53: rocas[1].posx=6;
	ld	hl, #(_rocas + 0x0006)
	ld	(hl), #0x06
;src/juego/juego.c:54: rocas[1].posy=6;
	ld	hl, #(_rocas + 0x0007)
	ld	(hl), #0x06
;src/juego/juego.c:55: rocas[1].sprite=sprite_Rock;
	ld	hl, #(_rocas + 0x0008)
	ld	(hl), #0x02
;src/juego/juego.c:57: rocas[2].num=2;
	ld	hl, #(_rocas + 0x000a)
	ld	(hl), #0x02
;src/juego/juego.c:58: rocas[2].posx=7;
	ld	hl, #(_rocas + 0x000b)
	ld	(hl), #0x07
;src/juego/juego.c:59: rocas[2].posy=7;
	ld	hl, #(_rocas + 0x000c)
	ld	(hl), #0x07
;src/juego/juego.c:60: rocas[2].sprite=sprite_Rock;
	ld	hl, #(_rocas + 0x000d)
	ld	(hl), #0x02
	ret
;src/juego/juego.c:65: void createRocasEspejo(){
;	---------------------------------
; Function createRocasEspejo
; ---------------------------------
_createRocasEspejo::
;src/juego/juego.c:66: rocasEspejo[0].num=0;
	ld	hl, #_rocasEspejo
	ld	(hl), #0x00
;src/juego/juego.c:67: rocasEspejo[0].posx=12;
	ld	hl, #(_rocasEspejo + 0x0001)
	ld	(hl), #0x0c
;src/juego/juego.c:68: rocasEspejo[0].posy=5;
	ld	hl, #(_rocasEspejo + 0x0002)
	ld	(hl), #0x05
;src/juego/juego.c:69: rocasEspejo[0].sprite=sprite_Rock;
	ld	hl, #(_rocasEspejo + 0x0003)
	ld	(hl), #0x02
;src/juego/juego.c:71: rocasEspejo[1].num=1;
	ld	hl, #(_rocasEspejo + 0x0005)
	ld	(hl), #0x01
;src/juego/juego.c:72: rocasEspejo[1].posx=11;
	ld	hl, #(_rocasEspejo + 0x0006)
	ld	(hl), #0x0b
;src/juego/juego.c:73: rocasEspejo[1].posy=6;
	ld	hl, #(_rocasEspejo + 0x0007)
	ld	(hl), #0x06
;src/juego/juego.c:74: rocasEspejo[1].sprite=sprite_Rock;
	ld	hl, #(_rocasEspejo + 0x0008)
	ld	(hl), #0x02
;src/juego/juego.c:76: rocasEspejo[2].num=2;
	ld	hl, #(_rocasEspejo + 0x000a)
	ld	(hl), #0x02
;src/juego/juego.c:77: rocasEspejo[2].posx=10;
	ld	hl, #(_rocasEspejo + 0x000b)
	ld	(hl), #0x0a
;src/juego/juego.c:78: rocasEspejo[2].posy=7;
	ld	hl, #(_rocasEspejo + 0x000c)
	ld	(hl), #0x07
;src/juego/juego.c:79: rocasEspejo[2].sprite=sprite_RockInmovil;
	ld	hl, #(_rocasEspejo + 0x000d)
	ld	(hl), #0x03
;src/juego/juego.c:81: rocasEspejo[3].num=3;
	ld	hl, #(_rocasEspejo + 0x000f)
	ld	(hl), #0x03
;src/juego/juego.c:82: rocasEspejo[3].posx=14;
	ld	hl, #(_rocasEspejo + 0x0010)
	ld	(hl), #0x0e
;src/juego/juego.c:83: rocasEspejo[3].posy=5;
	ld	hl, #(_rocasEspejo + 0x0011)
	ld	(hl), #0x05
;src/juego/juego.c:84: rocasEspejo[3].sprite=sprite_RockInmovil;
	ld	hl, #(_rocasEspejo + 0x0012)
	ld	(hl), #0x03
	ret
;src/juego/juego.c:86: void dibujarGameObjects(){
;	---------------------------------
; Function dibujarGameObjects
; ---------------------------------
_dibujarGameObjects::
;src/juego/juego.c:87: dibujarGameObject(&player);
	ld	hl, #_player
	push	hl
	call	_dibujarGameObject
	pop	af
;src/juego/juego.c:88: for (u8 i =0; i<RocasMaximas;i++){        
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x05
	jr	NC,00101$
;src/juego/juego.c:89: dibujarGameObject(&rocas[i]);
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_rocas
	add	hl, de
	push	bc
	push	hl
	call	_dibujarGameObject
	pop	af
	pop	bc
;src/juego/juego.c:88: for (u8 i =0; i<RocasMaximas;i++){        
	inc	c
	jr	00104$
00101$:
;src/juego/juego.c:92: for (u8 i =0; i<RocasMaximas;i++){        
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x05
	ret	NC
;src/juego/juego.c:93: dibujarGameObject(&rocasEspejo[i]);
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_rocasEspejo
	add	hl, de
	push	bc
	push	hl
	call	_dibujarGameObject
	pop	af
	pop	bc
;src/juego/juego.c:92: for (u8 i =0; i<RocasMaximas;i++){        
	inc	c
	jr	00107$
;src/juego/juego.c:98: void comprobarMovimiento(){
;	---------------------------------
; Function comprobarMovimiento
; ---------------------------------
_comprobarMovimiento::
;src/juego/juego.c:99: if(player.cronoMovimiento==0){
	ld	a, (#(_player + 0x0004) + 0)
	or	a, a
	jr	NZ,00102$
;src/juego/juego.c:100: movimientoGuardado=mover_SinMovimiento;
	ld	hl,#_movimientoGuardado + 0
	ld	(hl), #0x00
00102$:
;src/juego/juego.c:102: if(movimientoPlayer()!=mover_SinMovimiento){
	call	_movimientoPlayer
	ld	a, l
	or	a, a
	ret	Z
;src/juego/juego.c:103: movimientoGuardado=movimientoPlayer();
	call	_movimientoPlayer
	ld	iy, #_movimientoGuardado
	ld	0 (iy), l
	ret
;src/juego/juego.c:107: void resetGameobjects(){
;	---------------------------------
; Function resetGameobjects
; ---------------------------------
_resetGameobjects::
;src/juego/juego.c:108: player.posx=0;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x00
;src/juego/juego.c:109: player.posy=0;   
	ld	hl, #(_player + 0x0002)
	ld	(hl), #0x00
;src/juego/juego.c:110: player.sprite=sprite_Player;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x01
;src/juego/juego.c:112: for (u8 i=0;i<RocasMaximas;i++){
	ld	c, #0x00
00103$:
	ld	a, c
	sub	a, #0x05
	ret	NC
;src/juego/juego.c:113: rocas[i].posx=0;
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_rocas
	add	hl, de
	ld	e,l
	ld	d,h
	inc	hl
	ld	(hl), #0x00
;src/juego/juego.c:114: rocas[i].posy=0;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl), #0x00
;src/juego/juego.c:115: rocas[i].sprite=sprite_SinDefinir;
	inc	de
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
;src/juego/juego.c:112: for (u8 i=0;i<RocasMaximas;i++){
	inc	c
	jr	00103$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
