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
	.globl _initGameobjest
	.globl _posicion
	.globl _puertas
	.globl _portal
	.globl _rocasEspejo
	.globl _rocas
	.globl _player
	.globl _game
	.globl _initGame
	.globl _moverPlayer
	.globl _createPlayer
	.globl _createRocas
	.globl _createRocasEspejo
	.globl _createPortal
	.globl _createPuerta
	.globl _createHole
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
_P_portal:
	.ds 2
_P_puertas:
	.ds 2
_movimientoGuardado:
	.ds 1
_player::
	.ds 6
_rocas::
	.ds 240
_rocasEspejo::
	.ds 240
_portal::
	.ds 12
_puertas::
	.ds 60
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
;src/juego/juego.c:31: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/juego/juego.c:32: initGame();       
	call	_initGame
;src/juego/juego.c:33: while(1){ 
00102$:
;src/juego/juego.c:34: scanKey();
	call	_scanKey
;src/juego/juego.c:35: comprobarMovimiento();      
	call	_comprobarMovimiento
;src/juego/juego.c:36: moverPlayer();       
	call	_moverPlayer
	jr	00102$
;src/juego/juego.c:39: void initGame(){
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;src/juego/juego.c:40: posicion=posicion_Izquieda;
	ld	hl,#_posicion + 0
	ld	(hl), #0x00
;src/juego/juego.c:41: crearNivel();
	call	_crearNivel
;src/juego/juego.c:42: createPlayer();
	call	_createPlayer
;src/juego/juego.c:43: createRocas();
	call	_createRocas
;src/juego/juego.c:44: createRocasEspejo();
	call	_createRocasEspejo
;src/juego/juego.c:45: createPortal();
	call	_createPortal
;src/juego/juego.c:46: createPuerta();
	call	_createPuerta
;src/juego/juego.c:47: createHole();
	call	_createHole
;src/juego/juego.c:48: initGameobjest(portal,puertas);
	ld	hl, #_puertas
	push	hl
	ld	hl, #_portal
	push	hl
	call	_initGameobjest
	pop	af
	pop	af
;src/juego/juego.c:49: dibujarGameObjects();    
	jp  _dibujarGameObjects
;src/juego/juego.c:51: void moverPlayer(){
;	---------------------------------
; Function moverPlayer
; ---------------------------------
_moverPlayer::
;src/juego/juego.c:53: if(posicion==posicion_Izquieda){
	ld	a,(#_posicion + 0)
	or	a, a
	jr	NZ,00102$
;src/juego/juego.c:54: nivel=moverGameObject(&player,movimientoGuardado,rocas,rocasEspejo,&posicion);
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
	jr	00103$
00102$:
;src/juego/juego.c:56: nivel=moverGameObject(&player,movimientoGuardado,rocasEspejo,rocas,&posicion);
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
00103$:
;src/juego/juego.c:59: if(nivel!=seguir_En_Nivel){
	ld	a, l
	or	a, a
	ret	Z
;src/juego/juego.c:60: resetGameobjects();
	jp  _resetGameobjects
;src/juego/juego.c:63: void createPlayer(){
;	---------------------------------
; Function createPlayer
; ---------------------------------
_createPlayer::
;src/juego/juego.c:64: player.num=-1;
	ld	hl, #_player
	ld	(hl), #0xff
;src/juego/juego.c:65: player.posx=1;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x01
;src/juego/juego.c:66: player.posy=1;   
	ld	hl, #(_player + 0x0002)
	ld	(hl), #0x01
;src/juego/juego.c:67: player.sprite=sprite_Player;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x01
;src/juego/juego.c:68: player.movimiento=mover_1;
	ld	hl, #(_player + 0x0004)
	ld	(hl), #0x01
	ret
;src/juego/juego.c:70: void createRocas(){
;	---------------------------------
; Function createRocas
; ---------------------------------
_createRocas::
;src/juego/juego.c:71: rocas[0].num=1;
	ld	hl, #_rocas
	ld	(hl), #0x01
;src/juego/juego.c:72: rocas[0].posx=3;
	ld	hl, #(_rocas + 0x0001)
	ld	(hl), #0x03
;src/juego/juego.c:73: rocas[0].posy=3;
	ld	hl, #(_rocas + 0x0002)
	ld	(hl), #0x03
;src/juego/juego.c:74: rocas[0].sprite=sprite_RockLineal;
	ld	hl, #(_rocas + 0x0003)
	ld	(hl), #0x04
;src/juego/juego.c:75: rocas[0].movimiento=mover_Linea;
	ld	hl, #(_rocas + 0x0004)
	ld	(hl), #0x02
;src/juego/juego.c:78: rocas[1].num=2;
	ld	hl, #(_rocas + 0x0006)
	ld	(hl), #0x02
;src/juego/juego.c:79: rocas[1].posx=4;
	ld	hl, #(_rocas + 0x0007)
	ld	(hl), #0x04
;src/juego/juego.c:80: rocas[1].posy=3;
	ld	hl, #(_rocas + 0x0008)
	ld	(hl), #0x03
;src/juego/juego.c:81: rocas[1].sprite=sprite_Rock;
	ld	hl, #(_rocas + 0x0009)
	ld	(hl), #0x02
;src/juego/juego.c:82: rocas[1].movimiento=mover_1;
	ld	hl, #(_rocas + 0x000a)
	ld	(hl), #0x01
	ret
;src/juego/juego.c:95: void createRocasEspejo(){
;	---------------------------------
; Function createRocasEspejo
; ---------------------------------
_createRocasEspejo::
;src/juego/juego.c:96: rocasEspejo[0].num=1;
	ld	hl, #_rocasEspejo
	ld	(hl), #0x01
;src/juego/juego.c:97: rocasEspejo[0].posx=14;
	ld	hl, #(_rocasEspejo + 0x0001)
	ld	(hl), #0x0e
;src/juego/juego.c:98: rocasEspejo[0].posy=5;
	ld	hl, #(_rocasEspejo + 0x0002)
	ld	(hl), #0x05
;src/juego/juego.c:99: rocasEspejo[0].sprite=sprite_RockLineal;
	ld	hl, #(_rocasEspejo + 0x0003)
	ld	(hl), #0x04
;src/juego/juego.c:100: rocasEspejo[0].movimiento=mover_Linea;
	ld	hl, #(_rocasEspejo + 0x0004)
	ld	(hl), #0x02
;src/juego/juego.c:103: rocasEspejo[1].num=2;
	ld	hl, #(_rocasEspejo + 0x0006)
	ld	(hl), #0x02
;src/juego/juego.c:104: rocasEspejo[1].posx=14;
	ld	hl, #(_rocasEspejo + 0x0007)
	ld	(hl), #0x0e
;src/juego/juego.c:105: rocasEspejo[1].posy=6;
	ld	hl, #(_rocasEspejo + 0x0008)
	ld	(hl), #0x06
;src/juego/juego.c:106: rocasEspejo[1].sprite=sprite_Rock;
	ld	hl, #(_rocasEspejo + 0x0009)
	ld	(hl), #0x02
;src/juego/juego.c:107: rocasEspejo[1].movimiento=mover_1;
	ld	hl, #(_rocasEspejo + 0x000a)
	ld	(hl), #0x01
	ret
;src/juego/juego.c:124: void createPortal(){
;	---------------------------------
; Function createPortal
; ---------------------------------
_createPortal::
;src/juego/juego.c:125: portal[0].posx=7;
	ld	hl, #(_portal + 0x0001)
	ld	(hl), #0x07
;src/juego/juego.c:126: portal[0].posy=4;
	ld	hl, #(_portal + 0x0002)
	ld	(hl), #0x04
;src/juego/juego.c:127: portal[0].sprite=sprite_Portal;
	ld	hl, #(_portal + 0x0003)
	ld	(hl), #0x05
;src/juego/juego.c:129: portal[1].posx=9;
	ld	hl, #(_portal + 0x0007)
	ld	(hl), #0x09
;src/juego/juego.c:130: portal[1].posy=4;
	ld	hl, #(_portal + 0x0008)
	ld	(hl), #0x04
;src/juego/juego.c:131: portal[1].sprite=sprite_Portal;
	ld	hl, #(_portal + 0x0009)
	ld	(hl), #0x05
	ret
;src/juego/juego.c:133: void createPuerta(){
;	---------------------------------
; Function createPuerta
; ---------------------------------
_createPuerta::
;src/juego/juego.c:134: puertas[0].num=nivel_2;
	ld	hl, #_puertas
	ld	(hl), #0x02
;src/juego/juego.c:135: puertas[0].posx=1;
	ld	hl, #(_puertas + 0x0001)
	ld	(hl), #0x01
;src/juego/juego.c:136: puertas[0].posy=7;
	ld	hl, #(_puertas + 0x0002)
	ld	(hl), #0x07
;src/juego/juego.c:137: puertas[0].sprite=sprite_Puerta;
	ld	hl, #(_puertas + 0x0003)
	ld	(hl), #0x06
	ret
;src/juego/juego.c:139: void createHole(){
;	---------------------------------
; Function createHole
; ---------------------------------
_createHole::
;src/juego/juego.c:140: rocas[3].num=0;
	ld	hl, #(_rocas + 0x0012)
	ld	(hl), #0x00
;src/juego/juego.c:141: rocas[3].posx=6;
	ld	hl, #(_rocas + 0x0013)
	ld	(hl), #0x06
;src/juego/juego.c:142: rocas[3].posy=3;
	ld	hl, #(_rocas + 0x0014)
	ld	(hl), #0x03
;src/juego/juego.c:143: rocas[3].sprite=sprite_hole;
	ld	hl, #(_rocas + 0x0015)
	ld	(hl), #0x07
;src/juego/juego.c:144: rocas[3].movimiento=sin_Movimiento;
	ld	hl, #(_rocas + 0x0016)
	ld	(hl), #0x00
	ret
;src/juego/juego.c:148: void dibujarGameObjects(){
;	---------------------------------
; Function dibujarGameObjects
; ---------------------------------
_dibujarGameObjects::
;src/juego/juego.c:149: dibujarGameObject(&player);
	ld	hl, #_player
	push	hl
	call	_dibujarGameObject
	pop	af
;src/juego/juego.c:150: for (u8 i =0; i<RocasMaximas;i++){        
	ld	c, #0x00
00106$:
	ld	a, c
	sub	a, #0x28
	jr	NC,00101$
;src/juego/juego.c:151: dibujarGameObject(&rocas[i]);
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_rocas
	add	hl, de
	push	bc
	push	hl
	call	_dibujarGameObject
	pop	af
	pop	bc
;src/juego/juego.c:150: for (u8 i =0; i<RocasMaximas;i++){        
	inc	c
	jr	00106$
00101$:
;src/juego/juego.c:154: for (u8 i =0; i<RocasMaximas;i++){        
	ld	c, #0x00
00109$:
	ld	a, c
	sub	a, #0x28
	jr	NC,00102$
;src/juego/juego.c:155: dibujarGameObject(&rocasEspejo[i]);
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_rocasEspejo
	add	hl, de
	push	bc
	push	hl
	call	_dibujarGameObject
	pop	af
	pop	bc
;src/juego/juego.c:154: for (u8 i =0; i<RocasMaximas;i++){        
	inc	c
	jr	00109$
00102$:
;src/juego/juego.c:158: for(u8 i=0;i<2;i++){
	ld	c, #0x00
00112$:
	ld	a, c
	sub	a, #0x02
	jr	NC,00103$
;src/juego/juego.c:159: dibujarGameObject(&portal[i]);
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_portal
	add	hl, de
	push	bc
	push	hl
	call	_dibujarGameObject
	pop	af
	pop	bc
;src/juego/juego.c:158: for(u8 i=0;i<2;i++){
	inc	c
	jr	00112$
00103$:
;src/juego/juego.c:161: for(u8 i=0;i<2;i++){
	ld	c, #0x00
00115$:
	ld	a, c
	sub	a, #0x02
	ret	NC
;src/juego/juego.c:162: dibujarGameObject(&puertas[i]);
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	de, #_puertas
	add	hl, de
	push	bc
	push	hl
	call	_dibujarGameObject
	pop	af
	pop	bc
;src/juego/juego.c:161: for(u8 i=0;i<2;i++){
	inc	c
	jr	00115$
;src/juego/juego.c:166: void comprobarMovimiento(){
;	---------------------------------
; Function comprobarMovimiento
; ---------------------------------
_comprobarMovimiento::
;src/juego/juego.c:167: if(player.cronoMovimiento==0){
	ld	a, (#(_player + 0x0005) + 0)
	or	a, a
	jr	NZ,00102$
;src/juego/juego.c:168: movimientoGuardado=mover_SinMovimiento;
	ld	hl,#_movimientoGuardado + 0
	ld	(hl), #0x00
00102$:
;src/juego/juego.c:170: if(movimientoPlayer()!=mover_SinMovimiento){
	call	_movimientoPlayer
	ld	a, l
	or	a, a
	ret	Z
;src/juego/juego.c:171: movimientoGuardado=movimientoPlayer();
	call	_movimientoPlayer
	ld	iy, #_movimientoGuardado
	ld	0 (iy), l
	ret
;src/juego/juego.c:175: void resetGameobjects(){
;	---------------------------------
; Function resetGameobjects
; ---------------------------------
_resetGameobjects::
;src/juego/juego.c:176: posicion=posicion_Izquieda;
	ld	hl,#_posicion + 0
	ld	(hl), #0x00
;src/juego/juego.c:177: crearNivel();
	call	_crearNivel
;src/juego/juego.c:178: createPlayer();
	call	_createPlayer
;src/juego/juego.c:179: createRocas();
	call	_createRocas
;src/juego/juego.c:180: createRocasEspejo();
	call	_createRocasEspejo
;src/juego/juego.c:181: createPortal();
	call	_createPortal
;src/juego/juego.c:182: createPuerta();
	call	_createPuerta
;src/juego/juego.c:183: createHole();
	call	_createHole
;src/juego/juego.c:184: initGameobjest(portal,puertas);
	ld	hl, #_puertas
	push	hl
	ld	hl, #_portal
	push	hl
	call	_initGameobjest
	pop	af
	pop	af
;src/juego/juego.c:185: dibujarGameObjects();  
	jp  _dibujarGameObjects
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
