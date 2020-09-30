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
	.globl _dibujarGameObject
	.globl _rocas
	.globl _player
	.globl _game
	.globl _initGame
	.globl _createPlayer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_player::
	.ds 4
_rocas::
	.ds 20
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
;src/juego/juego.c:19: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/juego/juego.c:20: initGame();
	call	_initGame
;src/juego/juego.c:21: dibujarGameObject(&player);
	ld	hl, #_player
	push	hl
	call	_dibujarGameObject
	pop	af
;src/juego/juego.c:29: while(1){            
00102$:
	jr	00102$
;src/juego/juego.c:33: void initGame(){
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;src/juego/juego.c:34: crearNivel();
	call	_crearNivel
;src/juego/juego.c:35: createPlayer();
	jp  _createPlayer
;src/juego/juego.c:37: void createPlayer(){
;	---------------------------------
; Function createPlayer
; ---------------------------------
_createPlayer::
;src/juego/juego.c:38: player.posx=1;
	ld	hl, #_player
	ld	(hl), #0x01
;src/juego/juego.c:39: player.posy=1;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x01
;src/juego/juego.c:40: player.tipo=tipo_RocaNormal;
	ld	hl, #(_player + 0x0002)
	ld	(hl), #0x01
;src/juego/juego.c:41: player.sprite=sprite_Player;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x00
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
