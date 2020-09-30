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
	.globl _cpct_drawSprite
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
;src/juego/juego.c:15: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/juego/juego.c:18: cpct_drawSprite(playerSprite, Punto_Inicial_De_Pantalla, 4, 16); 
	ld	hl, #0x1004
	push	hl
	ld	hl, #0xe805
	push	hl
	ld	hl, #_playerSprite
	push	hl
	call	_cpct_drawSprite
;src/juego/juego.c:20: while(1){            
00102$:
	jr	00102$
;src/juego/juego.c:24: void initGame(){
;	---------------------------------
; Function initGame
; ---------------------------------
_initGame::
;src/juego/juego.c:25: crearNivel();
	call	_crearNivel
;src/juego/juego.c:26: createPlayer();
	jp  _createPlayer
;src/juego/juego.c:28: void createPlayer(){
;	---------------------------------
; Function createPlayer
; ---------------------------------
_createPlayer::
;src/juego/juego.c:29: player.posx=1;
	ld	hl, #_player
	ld	(hl), #0x01
;src/juego/juego.c:30: player.posy=1;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x01
;src/juego/juego.c:31: player.tipo=tipo_RocaNormal;
	ld	hl, #(_player + 0x0002)
	ld	(hl), #0x01
;src/juego/juego.c:32: player.sprite=sprite_Player;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x00
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
