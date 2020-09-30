                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module juego
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _crearNivel
                             12 	.globl _dibujarGameObject
                             13 	.globl _rocas
                             14 	.globl _player
                             15 	.globl _game
                             16 	.globl _initGame
                             17 	.globl _createPlayer
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
   50BE                      25 _player::
   50BE                      26 	.ds 4
   50C2                      27 _rocas::
   50C2                      28 	.ds 20
                             29 ;--------------------------------------------------------
                             30 ; ram data
                             31 ;--------------------------------------------------------
                             32 	.area _INITIALIZED
                             33 ;--------------------------------------------------------
                             34 ; absolute external ram data
                             35 ;--------------------------------------------------------
                             36 	.area _DABS (ABS)
                             37 ;--------------------------------------------------------
                             38 ; global & static initialisations
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _GSINIT
                             42 	.area _GSFINAL
                             43 	.area _GSINIT
                             44 ;--------------------------------------------------------
                             45 ; Home
                             46 ;--------------------------------------------------------
                             47 	.area _HOME
                             48 	.area _HOME
                             49 ;--------------------------------------------------------
                             50 ; code
                             51 ;--------------------------------------------------------
                             52 	.area _CODE
                             53 ;src/juego/juego.c:19: void game(){
                             54 ;	---------------------------------
                             55 ; Function game
                             56 ; ---------------------------------
   4DFB                      57 _game::
                             58 ;src/juego/juego.c:20: initGame();
   4DFB CD 08 4E      [17]   59 	call	_initGame
                             60 ;src/juego/juego.c:21: dibujarGameObject(&player);
   4DFE 21 BE 50      [10]   61 	ld	hl, #_player
   4E01 E5            [11]   62 	push	hl
   4E02 CD C7 4D      [17]   63 	call	_dibujarGameObject
   4E05 F1            [10]   64 	pop	af
                             65 ;src/juego/juego.c:29: while(1){            
   4E06                      66 00102$:
   4E06 18 FE         [12]   67 	jr	00102$
                             68 ;src/juego/juego.c:33: void initGame(){
                             69 ;	---------------------------------
                             70 ; Function initGame
                             71 ; ---------------------------------
   4E08                      72 _initGame::
                             73 ;src/juego/juego.c:34: crearNivel();
   4E08 CD 23 4E      [17]   74 	call	_crearNivel
                             75 ;src/juego/juego.c:35: createPlayer();
   4E0B C3 0E 4E      [10]   76 	jp  _createPlayer
                             77 ;src/juego/juego.c:37: void createPlayer(){
                             78 ;	---------------------------------
                             79 ; Function createPlayer
                             80 ; ---------------------------------
   4E0E                      81 _createPlayer::
                             82 ;src/juego/juego.c:38: player.posx=1;
   4E0E 21 BE 50      [10]   83 	ld	hl, #_player
   4E11 36 01         [10]   84 	ld	(hl), #0x01
                             85 ;src/juego/juego.c:39: player.posy=1;
   4E13 21 BF 50      [10]   86 	ld	hl, #(_player + 0x0001)
   4E16 36 01         [10]   87 	ld	(hl), #0x01
                             88 ;src/juego/juego.c:40: player.tipo=tipo_RocaNormal;
   4E18 21 C0 50      [10]   89 	ld	hl, #(_player + 0x0002)
   4E1B 36 01         [10]   90 	ld	(hl), #0x01
                             91 ;src/juego/juego.c:41: player.sprite=sprite_Player;
   4E1D 21 C1 50      [10]   92 	ld	hl, #(_player + 0x0003)
   4E20 36 00         [10]   93 	ld	(hl), #0x00
   4E22 C9            [10]   94 	ret
                             95 	.area _CODE
                             96 	.area _INITIALIZER
                             97 	.area _CABS (ABS)
