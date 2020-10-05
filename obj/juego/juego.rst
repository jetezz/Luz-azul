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
                             12 	.globl _movimientoPlayer
                             13 	.globl _scanKey
                             14 	.globl _moverGameObject
                             15 	.globl _dibujarGameObject
                             16 	.globl _posicion
                             17 	.globl _rocasEspejo
                             18 	.globl _rocas
                             19 	.globl _player
                             20 	.globl _game
                             21 	.globl _initGame
                             22 	.globl _createPlayer
                             23 	.globl _createRocas
                             24 	.globl _createRocasEspejo
                             25 	.globl _dibujarGameObjects
                             26 	.globl _comprobarMovimiento
                             27 	.globl _resetGameobjects
                             28 ;--------------------------------------------------------
                             29 ; special function registers
                             30 ;--------------------------------------------------------
                             31 ;--------------------------------------------------------
                             32 ; ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DATA
   57E8                      35 _movimientoGuardado:
   57E8                      36 	.ds 1
   57E9                      37 _player::
   57E9                      38 	.ds 5
   57EE                      39 _rocas::
   57EE                      40 	.ds 25
   5807                      41 _rocasEspejo::
   5807                      42 	.ds 25
   5820                      43 _posicion::
   5820                      44 	.ds 1
                             45 ;--------------------------------------------------------
                             46 ; ram data
                             47 ;--------------------------------------------------------
                             48 	.area _INITIALIZED
                             49 ;--------------------------------------------------------
                             50 ; absolute external ram data
                             51 ;--------------------------------------------------------
                             52 	.area _DABS (ABS)
                             53 ;--------------------------------------------------------
                             54 ; global & static initialisations
                             55 ;--------------------------------------------------------
                             56 	.area _HOME
                             57 	.area _GSINIT
                             58 	.area _GSFINAL
                             59 	.area _GSINIT
                             60 ;--------------------------------------------------------
                             61 ; Home
                             62 ;--------------------------------------------------------
                             63 	.area _HOME
                             64 	.area _HOME
                             65 ;--------------------------------------------------------
                             66 ; code
                             67 ;--------------------------------------------------------
                             68 	.area _CODE
                             69 ;src/juego/juego.c:24: void game(){
                             70 ;	---------------------------------
                             71 ; Function game
                             72 ; ---------------------------------
   5232                      73 _game::
                             74 ;src/juego/juego.c:25: initGame();       
   5232 CD 5B 52      [17]   75 	call	_initGame
                             76 ;src/juego/juego.c:26: while(1){ 
   5235                      77 00102$:
                             78 ;src/juego/juego.c:27: scanKey();
   5235 CD A8 53      [17]   79 	call	_scanKey
                             80 ;src/juego/juego.c:28: comprobarMovimiento();      
   5238 CD 51 53      [17]   81 	call	_comprobarMovimiento
                             82 ;src/juego/juego.c:29: moverGameObject(&player,movimientoGuardado,rocas,rocasEspejo,posicion);              
   523B 3A 20 58      [13]   83 	ld	a, (_posicion)
   523E F5            [11]   84 	push	af
   523F 33            [ 6]   85 	inc	sp
   5240 21 07 58      [10]   86 	ld	hl, #_rocasEspejo
   5243 E5            [11]   87 	push	hl
   5244 21 EE 57      [10]   88 	ld	hl, #_rocas
   5247 E5            [11]   89 	push	hl
   5248 3A E8 57      [13]   90 	ld	a, (_movimientoGuardado)
   524B F5            [11]   91 	push	af
   524C 33            [ 6]   92 	inc	sp
   524D 21 E9 57      [10]   93 	ld	hl, #_player
   5250 E5            [11]   94 	push	hl
   5251 CD 00 4F      [17]   95 	call	_moverGameObject
   5254 21 08 00      [10]   96 	ld	hl, #8
   5257 39            [11]   97 	add	hl, sp
   5258 F9            [ 6]   98 	ld	sp, hl
   5259 18 DA         [12]   99 	jr	00102$
                            100 ;src/juego/juego.c:32: void initGame(){
                            101 ;	---------------------------------
                            102 ; Function initGame
                            103 ; ---------------------------------
   525B                     104 _initGame::
                            105 ;src/juego/juego.c:33: posicion=posicion_Izquieda;
   525B 21 20 58      [10]  106 	ld	hl,#_posicion + 0
   525E 36 00         [10]  107 	ld	(hl), #0x00
                            108 ;src/juego/juego.c:34: crearNivel();
   5260 CD A0 53      [17]  109 	call	_crearNivel
                            110 ;src/juego/juego.c:35: createPlayer();
   5263 CD 6F 52      [17]  111 	call	_createPlayer
                            112 ;src/juego/juego.c:36: createRocas();
   5266 CD 84 52      [17]  113 	call	_createRocas
                            114 ;src/juego/juego.c:37: createRocasEspejo();
   5269 CD C1 52      [17]  115 	call	_createRocasEspejo
                            116 ;src/juego/juego.c:38: dibujarGameObjects();    
   526C C3 12 53      [10]  117 	jp  _dibujarGameObjects
                            118 ;src/juego/juego.c:40: void createPlayer(){
                            119 ;	---------------------------------
                            120 ; Function createPlayer
                            121 ; ---------------------------------
   526F                     122 _createPlayer::
                            123 ;src/juego/juego.c:41: player.num=-1;
   526F 21 E9 57      [10]  124 	ld	hl, #_player
   5272 36 FF         [10]  125 	ld	(hl), #0xff
                            126 ;src/juego/juego.c:42: player.posx=1;
   5274 21 EA 57      [10]  127 	ld	hl, #(_player + 0x0001)
   5277 36 01         [10]  128 	ld	(hl), #0x01
                            129 ;src/juego/juego.c:43: player.posy=1;   
   5279 21 EB 57      [10]  130 	ld	hl, #(_player + 0x0002)
   527C 36 01         [10]  131 	ld	(hl), #0x01
                            132 ;src/juego/juego.c:44: player.sprite=sprite_Player;
   527E 21 EC 57      [10]  133 	ld	hl, #(_player + 0x0003)
   5281 36 01         [10]  134 	ld	(hl), #0x01
   5283 C9            [10]  135 	ret
                            136 ;src/juego/juego.c:46: void createRocas(){
                            137 ;	---------------------------------
                            138 ; Function createRocas
                            139 ; ---------------------------------
   5284                     140 _createRocas::
                            141 ;src/juego/juego.c:47: rocas[0].num=0;
   5284 21 EE 57      [10]  142 	ld	hl, #_rocas
   5287 36 00         [10]  143 	ld	(hl), #0x00
                            144 ;src/juego/juego.c:48: rocas[0].posx=5;
   5289 21 EF 57      [10]  145 	ld	hl, #(_rocas + 0x0001)
   528C 36 05         [10]  146 	ld	(hl), #0x05
                            147 ;src/juego/juego.c:49: rocas[0].posy=5;
   528E 21 F0 57      [10]  148 	ld	hl, #(_rocas + 0x0002)
   5291 36 05         [10]  149 	ld	(hl), #0x05
                            150 ;src/juego/juego.c:50: rocas[0].sprite=sprite_Rock;
   5293 21 F1 57      [10]  151 	ld	hl, #(_rocas + 0x0003)
   5296 36 02         [10]  152 	ld	(hl), #0x02
                            153 ;src/juego/juego.c:52: rocas[1].num=1;
   5298 21 F3 57      [10]  154 	ld	hl, #(_rocas + 0x0005)
   529B 36 01         [10]  155 	ld	(hl), #0x01
                            156 ;src/juego/juego.c:53: rocas[1].posx=6;
   529D 21 F4 57      [10]  157 	ld	hl, #(_rocas + 0x0006)
   52A0 36 06         [10]  158 	ld	(hl), #0x06
                            159 ;src/juego/juego.c:54: rocas[1].posy=6;
   52A2 21 F5 57      [10]  160 	ld	hl, #(_rocas + 0x0007)
   52A5 36 06         [10]  161 	ld	(hl), #0x06
                            162 ;src/juego/juego.c:55: rocas[1].sprite=sprite_Rock;
   52A7 21 F6 57      [10]  163 	ld	hl, #(_rocas + 0x0008)
   52AA 36 02         [10]  164 	ld	(hl), #0x02
                            165 ;src/juego/juego.c:57: rocas[2].num=2;
   52AC 21 F8 57      [10]  166 	ld	hl, #(_rocas + 0x000a)
   52AF 36 02         [10]  167 	ld	(hl), #0x02
                            168 ;src/juego/juego.c:58: rocas[2].posx=7;
   52B1 21 F9 57      [10]  169 	ld	hl, #(_rocas + 0x000b)
   52B4 36 07         [10]  170 	ld	(hl), #0x07
                            171 ;src/juego/juego.c:59: rocas[2].posy=7;
   52B6 21 FA 57      [10]  172 	ld	hl, #(_rocas + 0x000c)
   52B9 36 07         [10]  173 	ld	(hl), #0x07
                            174 ;src/juego/juego.c:60: rocas[2].sprite=sprite_Rock;
   52BB 21 FB 57      [10]  175 	ld	hl, #(_rocas + 0x000d)
   52BE 36 02         [10]  176 	ld	(hl), #0x02
   52C0 C9            [10]  177 	ret
                            178 ;src/juego/juego.c:65: void createRocasEspejo(){
                            179 ;	---------------------------------
                            180 ; Function createRocasEspejo
                            181 ; ---------------------------------
   52C1                     182 _createRocasEspejo::
                            183 ;src/juego/juego.c:66: rocasEspejo[0].num=0;
   52C1 21 07 58      [10]  184 	ld	hl, #_rocasEspejo
   52C4 36 00         [10]  185 	ld	(hl), #0x00
                            186 ;src/juego/juego.c:67: rocasEspejo[0].posx=12;
   52C6 21 08 58      [10]  187 	ld	hl, #(_rocasEspejo + 0x0001)
   52C9 36 0C         [10]  188 	ld	(hl), #0x0c
                            189 ;src/juego/juego.c:68: rocasEspejo[0].posy=5;
   52CB 21 09 58      [10]  190 	ld	hl, #(_rocasEspejo + 0x0002)
   52CE 36 05         [10]  191 	ld	(hl), #0x05
                            192 ;src/juego/juego.c:69: rocasEspejo[0].sprite=sprite_Rock;
   52D0 21 0A 58      [10]  193 	ld	hl, #(_rocasEspejo + 0x0003)
   52D3 36 02         [10]  194 	ld	(hl), #0x02
                            195 ;src/juego/juego.c:71: rocasEspejo[1].num=1;
   52D5 21 0C 58      [10]  196 	ld	hl, #(_rocasEspejo + 0x0005)
   52D8 36 01         [10]  197 	ld	(hl), #0x01
                            198 ;src/juego/juego.c:72: rocasEspejo[1].posx=11;
   52DA 21 0D 58      [10]  199 	ld	hl, #(_rocasEspejo + 0x0006)
   52DD 36 0B         [10]  200 	ld	(hl), #0x0b
                            201 ;src/juego/juego.c:73: rocasEspejo[1].posy=6;
   52DF 21 0E 58      [10]  202 	ld	hl, #(_rocasEspejo + 0x0007)
   52E2 36 06         [10]  203 	ld	(hl), #0x06
                            204 ;src/juego/juego.c:74: rocasEspejo[1].sprite=sprite_Rock;
   52E4 21 0F 58      [10]  205 	ld	hl, #(_rocasEspejo + 0x0008)
   52E7 36 02         [10]  206 	ld	(hl), #0x02
                            207 ;src/juego/juego.c:76: rocasEspejo[2].num=2;
   52E9 21 11 58      [10]  208 	ld	hl, #(_rocasEspejo + 0x000a)
   52EC 36 02         [10]  209 	ld	(hl), #0x02
                            210 ;src/juego/juego.c:77: rocasEspejo[2].posx=10;
   52EE 21 12 58      [10]  211 	ld	hl, #(_rocasEspejo + 0x000b)
   52F1 36 0A         [10]  212 	ld	(hl), #0x0a
                            213 ;src/juego/juego.c:78: rocasEspejo[2].posy=7;
   52F3 21 13 58      [10]  214 	ld	hl, #(_rocasEspejo + 0x000c)
   52F6 36 07         [10]  215 	ld	(hl), #0x07
                            216 ;src/juego/juego.c:79: rocasEspejo[2].sprite=sprite_RockInmovil;
   52F8 21 14 58      [10]  217 	ld	hl, #(_rocasEspejo + 0x000d)
   52FB 36 03         [10]  218 	ld	(hl), #0x03
                            219 ;src/juego/juego.c:81: rocasEspejo[3].num=3;
   52FD 21 16 58      [10]  220 	ld	hl, #(_rocasEspejo + 0x000f)
   5300 36 03         [10]  221 	ld	(hl), #0x03
                            222 ;src/juego/juego.c:82: rocasEspejo[3].posx=14;
   5302 21 17 58      [10]  223 	ld	hl, #(_rocasEspejo + 0x0010)
   5305 36 0E         [10]  224 	ld	(hl), #0x0e
                            225 ;src/juego/juego.c:83: rocasEspejo[3].posy=5;
   5307 21 18 58      [10]  226 	ld	hl, #(_rocasEspejo + 0x0011)
   530A 36 05         [10]  227 	ld	(hl), #0x05
                            228 ;src/juego/juego.c:84: rocasEspejo[3].sprite=sprite_RockInmovil;
   530C 21 19 58      [10]  229 	ld	hl, #(_rocasEspejo + 0x0012)
   530F 36 03         [10]  230 	ld	(hl), #0x03
   5311 C9            [10]  231 	ret
                            232 ;src/juego/juego.c:86: void dibujarGameObjects(){
                            233 ;	---------------------------------
                            234 ; Function dibujarGameObjects
                            235 ; ---------------------------------
   5312                     236 _dibujarGameObjects::
                            237 ;src/juego/juego.c:87: dibujarGameObject(&player);
   5312 21 E9 57      [10]  238 	ld	hl, #_player
   5315 E5            [11]  239 	push	hl
   5316 CD 6F 4E      [17]  240 	call	_dibujarGameObject
   5319 F1            [10]  241 	pop	af
                            242 ;src/juego/juego.c:88: for (u8 i =0; i<RocasMaximas;i++){        
   531A 0E 00         [ 7]  243 	ld	c, #0x00
   531C                     244 00104$:
   531C 79            [ 4]  245 	ld	a, c
   531D D6 05         [ 7]  246 	sub	a, #0x05
   531F 30 15         [12]  247 	jr	NC,00101$
                            248 ;src/juego/juego.c:89: dibujarGameObject(&rocas[i]);
   5321 06 00         [ 7]  249 	ld	b,#0x00
   5323 69            [ 4]  250 	ld	l, c
   5324 60            [ 4]  251 	ld	h, b
   5325 29            [11]  252 	add	hl, hl
   5326 29            [11]  253 	add	hl, hl
   5327 09            [11]  254 	add	hl, bc
   5328 11 EE 57      [10]  255 	ld	de, #_rocas
   532B 19            [11]  256 	add	hl, de
   532C C5            [11]  257 	push	bc
   532D E5            [11]  258 	push	hl
   532E CD 6F 4E      [17]  259 	call	_dibujarGameObject
   5331 F1            [10]  260 	pop	af
   5332 C1            [10]  261 	pop	bc
                            262 ;src/juego/juego.c:88: for (u8 i =0; i<RocasMaximas;i++){        
   5333 0C            [ 4]  263 	inc	c
   5334 18 E6         [12]  264 	jr	00104$
   5336                     265 00101$:
                            266 ;src/juego/juego.c:92: for (u8 i =0; i<RocasMaximas;i++){        
   5336 0E 00         [ 7]  267 	ld	c, #0x00
   5338                     268 00107$:
   5338 79            [ 4]  269 	ld	a, c
   5339 D6 05         [ 7]  270 	sub	a, #0x05
   533B D0            [11]  271 	ret	NC
                            272 ;src/juego/juego.c:93: dibujarGameObject(&rocasEspejo[i]);
   533C 06 00         [ 7]  273 	ld	b,#0x00
   533E 69            [ 4]  274 	ld	l, c
   533F 60            [ 4]  275 	ld	h, b
   5340 29            [11]  276 	add	hl, hl
   5341 29            [11]  277 	add	hl, hl
   5342 09            [11]  278 	add	hl, bc
   5343 11 07 58      [10]  279 	ld	de, #_rocasEspejo
   5346 19            [11]  280 	add	hl, de
   5347 C5            [11]  281 	push	bc
   5348 E5            [11]  282 	push	hl
   5349 CD 6F 4E      [17]  283 	call	_dibujarGameObject
   534C F1            [10]  284 	pop	af
   534D C1            [10]  285 	pop	bc
                            286 ;src/juego/juego.c:92: for (u8 i =0; i<RocasMaximas;i++){        
   534E 0C            [ 4]  287 	inc	c
   534F 18 E7         [12]  288 	jr	00107$
                            289 ;src/juego/juego.c:98: void comprobarMovimiento(){
                            290 ;	---------------------------------
                            291 ; Function comprobarMovimiento
                            292 ; ---------------------------------
   5351                     293 _comprobarMovimiento::
                            294 ;src/juego/juego.c:99: if(player.cronoMovimiento==0){
   5351 3A ED 57      [13]  295 	ld	a, (#(_player + 0x0004) + 0)
   5354 B7            [ 4]  296 	or	a, a
   5355 20 05         [12]  297 	jr	NZ,00102$
                            298 ;src/juego/juego.c:100: movimientoGuardado=mover_SinMovimiento;
   5357 21 E8 57      [10]  299 	ld	hl,#_movimientoGuardado + 0
   535A 36 00         [10]  300 	ld	(hl), #0x00
   535C                     301 00102$:
                            302 ;src/juego/juego.c:102: if(movimientoPlayer()!=mover_SinMovimiento){
   535C CD CB 53      [17]  303 	call	_movimientoPlayer
   535F 7D            [ 4]  304 	ld	a, l
   5360 B7            [ 4]  305 	or	a, a
   5361 C8            [11]  306 	ret	Z
                            307 ;src/juego/juego.c:103: movimientoGuardado=movimientoPlayer();
   5362 CD CB 53      [17]  308 	call	_movimientoPlayer
   5365 FD 21 E8 57   [14]  309 	ld	iy, #_movimientoGuardado
   5369 FD 75 00      [19]  310 	ld	0 (iy), l
   536C C9            [10]  311 	ret
                            312 ;src/juego/juego.c:107: void resetGameobjects(){
                            313 ;	---------------------------------
                            314 ; Function resetGameobjects
                            315 ; ---------------------------------
   536D                     316 _resetGameobjects::
                            317 ;src/juego/juego.c:108: player.posx=0;
   536D 21 EA 57      [10]  318 	ld	hl, #(_player + 0x0001)
   5370 36 00         [10]  319 	ld	(hl), #0x00
                            320 ;src/juego/juego.c:109: player.posy=0;   
   5372 21 EB 57      [10]  321 	ld	hl, #(_player + 0x0002)
   5375 36 00         [10]  322 	ld	(hl), #0x00
                            323 ;src/juego/juego.c:110: player.sprite=sprite_Player;
   5377 21 EC 57      [10]  324 	ld	hl, #(_player + 0x0003)
   537A 36 01         [10]  325 	ld	(hl), #0x01
                            326 ;src/juego/juego.c:112: for (u8 i=0;i<RocasMaximas;i++){
   537C 0E 00         [ 7]  327 	ld	c, #0x00
   537E                     328 00103$:
   537E 79            [ 4]  329 	ld	a, c
   537F D6 05         [ 7]  330 	sub	a, #0x05
   5381 D0            [11]  331 	ret	NC
                            332 ;src/juego/juego.c:113: rocas[i].posx=0;
   5382 06 00         [ 7]  333 	ld	b,#0x00
   5384 69            [ 4]  334 	ld	l, c
   5385 60            [ 4]  335 	ld	h, b
   5386 29            [11]  336 	add	hl, hl
   5387 29            [11]  337 	add	hl, hl
   5388 09            [11]  338 	add	hl, bc
   5389 11 EE 57      [10]  339 	ld	de, #_rocas
   538C 19            [11]  340 	add	hl, de
   538D 5D            [ 4]  341 	ld	e,l
   538E 54            [ 4]  342 	ld	d,h
   538F 23            [ 6]  343 	inc	hl
   5390 36 00         [10]  344 	ld	(hl), #0x00
                            345 ;src/juego/juego.c:114: rocas[i].posy=0;
   5392 6B            [ 4]  346 	ld	l, e
   5393 62            [ 4]  347 	ld	h, d
   5394 23            [ 6]  348 	inc	hl
   5395 23            [ 6]  349 	inc	hl
   5396 36 00         [10]  350 	ld	(hl), #0x00
                            351 ;src/juego/juego.c:115: rocas[i].sprite=sprite_SinDefinir;
   5398 13            [ 6]  352 	inc	de
   5399 13            [ 6]  353 	inc	de
   539A 13            [ 6]  354 	inc	de
   539B AF            [ 4]  355 	xor	a, a
   539C 12            [ 7]  356 	ld	(de), a
                            357 ;src/juego/juego.c:112: for (u8 i=0;i<RocasMaximas;i++){
   539D 0C            [ 4]  358 	inc	c
   539E 18 DE         [12]  359 	jr	00103$
                            360 	.area _CODE
                            361 	.area _INITIALIZER
                            362 	.area _CABS (ABS)
