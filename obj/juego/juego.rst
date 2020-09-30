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
                             12 	.globl _cpct_drawSprite
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
   50B4                      25 _player::
   50B4                      26 	.ds 4
   50B8                      27 _rocas::
   50B8                      28 	.ds 20
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
                             53 ;src/juego/juego.c:15: void game(){
                             54 ;	---------------------------------
                             55 ; Function game
                             56 ; ---------------------------------
   4DED                      57 _game::
                             58 ;src/juego/juego.c:18: cpct_drawSprite(playerSprite, Punto_Inicial_De_Pantalla, 4, 16); 
   4DED 21 04 10      [10]   59 	ld	hl, #0x1004
   4DF0 E5            [11]   60 	push	hl
   4DF1 21 05 E8      [10]   61 	ld	hl, #0xe805
   4DF4 E5            [11]   62 	push	hl
   4DF5 21 5C 4D      [10]   63 	ld	hl, #_playerSprite
   4DF8 E5            [11]   64 	push	hl
   4DF9 CD 11 4F      [17]   65 	call	_cpct_drawSprite
                             66 ;src/juego/juego.c:20: while(1){            
   4DFC                      67 00102$:
   4DFC 18 FE         [12]   68 	jr	00102$
                             69 ;src/juego/juego.c:24: void initGame(){
                             70 ;	---------------------------------
                             71 ; Function initGame
                             72 ; ---------------------------------
   4DFE                      73 _initGame::
                             74 ;src/juego/juego.c:25: crearNivel();
   4DFE CD 19 4E      [17]   75 	call	_crearNivel
                             76 ;src/juego/juego.c:26: createPlayer();
   4E01 C3 04 4E      [10]   77 	jp  _createPlayer
                             78 ;src/juego/juego.c:28: void createPlayer(){
                             79 ;	---------------------------------
                             80 ; Function createPlayer
                             81 ; ---------------------------------
   4E04                      82 _createPlayer::
                             83 ;src/juego/juego.c:29: player.posx=1;
   4E04 21 B4 50      [10]   84 	ld	hl, #_player
   4E07 36 01         [10]   85 	ld	(hl), #0x01
                             86 ;src/juego/juego.c:30: player.posy=1;
   4E09 21 B5 50      [10]   87 	ld	hl, #(_player + 0x0001)
   4E0C 36 01         [10]   88 	ld	(hl), #0x01
                             89 ;src/juego/juego.c:31: player.tipo=tipo_RocaNormal;
   4E0E 21 B6 50      [10]   90 	ld	hl, #(_player + 0x0002)
   4E11 36 01         [10]   91 	ld	(hl), #0x01
                             92 ;src/juego/juego.c:32: player.sprite=sprite_Player;
   4E13 21 B7 50      [10]   93 	ld	hl, #(_player + 0x0003)
   4E16 36 00         [10]   94 	ld	(hl), #0x00
   4E18 C9            [10]   95 	ret
                             96 	.area _CODE
                             97 	.area _INITIALIZER
                             98 	.area _CABS (ABS)
