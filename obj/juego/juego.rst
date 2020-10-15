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
                             11 	.globl _managerDialogo
                             12 	.globl _initDialogos
                             13 	.globl _actualizarHud
                             14 	.globl _initHud
                             15 	.globl _crearNivel
                             16 	.globl _initNiveles
                             17 	.globl _movimientoPlayer
                             18 	.globl _keyR
                             19 	.globl _scanKey
                             20 	.globl _moverGameObject
                             21 	.globl _dibujarGameObjectCol
                             22 	.globl _dibujarGameObject
                             23 	.globl _initGameobjest
                             24 	.globl _pasos
                             25 	.globl _nivelActual
                             26 	.globl _coleccionablesAms
                             27 	.globl _coleccionablesFam
                             28 	.globl _coleccionablesLuz
                             29 	.globl _posicion
                             30 	.globl _colList
                             31 	.globl _coleccionables
                             32 	.globl _puertas
                             33 	.globl _portal
                             34 	.globl _rocasEspejo
                             35 	.globl _rocas
                             36 	.globl _player
                             37 	.globl _game
                             38 	.globl _initGame
                             39 	.globl _moverPlayer
                             40 	.globl _dibujarGameObjects
                             41 	.globl _comprobarMovimiento
                             42 	.globl _comprobarPasos
                             43 	.globl _resetGameobjects
                             44 ;--------------------------------------------------------
                             45 ; special function registers
                             46 ;--------------------------------------------------------
                             47 ;--------------------------------------------------------
                             48 ; ram data
                             49 ;--------------------------------------------------------
                             50 	.area _DATA
   7709                      51 _P_portal:
   7709                      52 	.ds 2
   770B                      53 _P_puertas:
   770B                      54 	.ds 2
   770D                      55 _P_col:
   770D                      56 	.ds 2
   770F                      57 _P_luz:
   770F                      58 	.ds 2
   7711                      59 _P_fam:
   7711                      60 	.ds 2
   7713                      61 _P_ams:
   7713                      62 	.ds 2
   7715                      63 _P_colList:
   7715                      64 	.ds 2
   7717                      65 _movimientoGuardado:
   7717                      66 	.ds 1
   7718                      67 _niveles:
   7718                      68 	.ds 100
   777C                      69 _contadorRocas:
   777C                      70 	.ds 1
   777D                      71 _contadorRocasEspejo:
   777D                      72 	.ds 1
   777E                      73 _contadorPuertas:
   777E                      74 	.ds 1
   777F                      75 _contadorColeccionables:
   777F                      76 	.ds 1
   7780                      77 _P_colList2:
   7780                      78 	.ds 2
   7782                      79 _dialogos:
   7782                      80 	.ds 100
   77E6                      81 _player::
   77E6                      82 	.ds 7
   77ED                      83 _rocas::
   77ED                      84 	.ds 280
   7905                      85 _rocasEspejo::
   7905                      86 	.ds 280
   7A1D                      87 _portal::
   7A1D                      88 	.ds 14
   7A2B                      89 _puertas::
   7A2B                      90 	.ds 70
   7A71                      91 _coleccionables::
   7A71                      92 	.ds 12
   7A7D                      93 _colList::
   7A7D                      94 	.ds 50
   7AAF                      95 _posicion::
   7AAF                      96 	.ds 1
   7AB0                      97 _coleccionablesLuz::
   7AB0                      98 	.ds 1
   7AB1                      99 _coleccionablesFam::
   7AB1                     100 	.ds 1
   7AB2                     101 _coleccionablesAms::
   7AB2                     102 	.ds 1
   7AB3                     103 _nivelActual::
   7AB3                     104 	.ds 1
   7AB4                     105 _pasos::
   7AB4                     106 	.ds 1
                            107 ;--------------------------------------------------------
                            108 ; ram data
                            109 ;--------------------------------------------------------
                            110 	.area _INITIALIZED
                            111 ;--------------------------------------------------------
                            112 ; absolute external ram data
                            113 ;--------------------------------------------------------
                            114 	.area _DABS (ABS)
                            115 ;--------------------------------------------------------
                            116 ; global & static initialisations
                            117 ;--------------------------------------------------------
                            118 	.area _HOME
                            119 	.area _GSINIT
                            120 	.area _GSFINAL
                            121 	.area _GSINIT
                            122 ;--------------------------------------------------------
                            123 ; Home
                            124 ;--------------------------------------------------------
                            125 	.area _HOME
                            126 	.area _HOME
                            127 ;--------------------------------------------------------
                            128 ; code
                            129 ;--------------------------------------------------------
                            130 	.area _CODE
                            131 ;src/juego/juego.c:33: void game(){
                            132 ;	---------------------------------
                            133 ; Function game
                            134 ; ---------------------------------
   6273                     135 _game::
                            136 ;src/juego/juego.c:34: initGame();       
   6273 CD BF 62      [17]  137 	call	_initGame
                            138 ;src/juego/juego.c:35: while(1){          
   6276                     139 00106$:
                            140 ;src/juego/juego.c:36: scanKey();
   6276 CD CB 6E      [17]  141 	call	_scanKey
                            142 ;src/juego/juego.c:37: if(keyR()==si){
   6279 CD EE 6E      [17]  143 	call	_keyR
   627C 7D            [ 4]  144 	ld	a, l
   627D B7            [ 4]  145 	or	a, a
   627E 20 09         [12]  146 	jr	NZ,00102$
                            147 ;src/juego/juego.c:38: resetGameobjects(nivelActual);
   6280 3A B3 7A      [13]  148 	ld	a, (_nivelActual)
   6283 F5            [11]  149 	push	af
   6284 33            [ 6]  150 	inc	sp
   6285 CD 6B 64      [17]  151 	call	_resetGameobjects
   6288 33            [ 6]  152 	inc	sp
   6289                     153 00102$:
                            154 ;src/juego/juego.c:40: comprobarMovimiento();      
   6289 CD 38 64      [17]  155 	call	_comprobarMovimiento
                            156 ;src/juego/juego.c:41: moverPlayer();
   628C CD 4B 63      [17]  157 	call	_moverPlayer
                            158 ;src/juego/juego.c:42: actualizarHud(coleccionablesLuz,coleccionablesFam,coleccionablesAms,pasos);
   628F 3A B4 7A      [13]  159 	ld	a, (_pasos)
   6292 F5            [11]  160 	push	af
   6293 33            [ 6]  161 	inc	sp
   6294 3A B2 7A      [13]  162 	ld	a, (_coleccionablesAms)
   6297 F5            [11]  163 	push	af
   6298 33            [ 6]  164 	inc	sp
   6299 3A B1 7A      [13]  165 	ld	a, (_coleccionablesFam)
   629C F5            [11]  166 	push	af
   629D 33            [ 6]  167 	inc	sp
   629E 3A B0 7A      [13]  168 	ld	a, (_coleccionablesLuz)
   62A1 F5            [11]  169 	push	af
   62A2 33            [ 6]  170 	inc	sp
   62A3 CD BF 70      [17]  171 	call	_actualizarHud
   62A6 F1            [10]  172 	pop	af
   62A7 F1            [10]  173 	pop	af
                            174 ;src/juego/juego.c:43: if(comprobarPasos()==si){
   62A8 CD 54 64      [17]  175 	call	_comprobarPasos
   62AB 7D            [ 4]  176 	ld	a, l
   62AC B7            [ 4]  177 	or	a, a
   62AD 20 C7         [12]  178 	jr	NZ,00106$
                            179 ;src/juego/juego.c:44: managerDialogo(nivelActual,pasos);
   62AF 3A B4 7A      [13]  180 	ld	a, (_pasos)
   62B2 F5            [11]  181 	push	af
   62B3 33            [ 6]  182 	inc	sp
   62B4 3A B3 7A      [13]  183 	ld	a, (_nivelActual)
   62B7 F5            [11]  184 	push	af
   62B8 33            [ 6]  185 	inc	sp
   62B9 CD 62 6F      [17]  186 	call	_managerDialogo
   62BC F1            [10]  187 	pop	af
   62BD 18 B7         [12]  188 	jr	00106$
                            189 ;src/juego/juego.c:49: void initGame(){
                            190 ;	---------------------------------
                            191 ; Function initGame
                            192 ; ---------------------------------
   62BF                     193 _initGame::
                            194 ;src/juego/juego.c:50: for(u8 i =0;i<ColeccionablesMaximosTotales;i++){
   62BF 0E 00         [ 7]  195 	ld	c, #0x00
   62C1                     196 00103$:
   62C1 79            [ 4]  197 	ld	a, c
   62C2 D6 32         [ 7]  198 	sub	a, #0x32
   62C4 30 0B         [12]  199 	jr	NC,00101$
                            200 ;src/juego/juego.c:51: colList[i]=coleccionable_activo;
   62C6 21 7D 7A      [10]  201 	ld	hl, #_colList
   62C9 06 00         [ 7]  202 	ld	b, #0x00
   62CB 09            [11]  203 	add	hl, bc
   62CC 36 00         [10]  204 	ld	(hl), #0x00
                            205 ;src/juego/juego.c:50: for(u8 i =0;i<ColeccionablesMaximosTotales;i++){
   62CE 0C            [ 4]  206 	inc	c
   62CF 18 F0         [12]  207 	jr	00103$
   62D1                     208 00101$:
                            209 ;src/juego/juego.c:53: posicion=posicion_Izquieda;
   62D1 21 AF 7A      [10]  210 	ld	hl,#_posicion + 0
   62D4 36 00         [10]  211 	ld	(hl), #0x00
                            212 ;src/juego/juego.c:54: coleccionablesLuz=0;
   62D6 21 B0 7A      [10]  213 	ld	hl,#_coleccionablesLuz + 0
   62D9 36 00         [10]  214 	ld	(hl), #0x00
                            215 ;src/juego/juego.c:55: coleccionablesFam=0;
   62DB 21 B1 7A      [10]  216 	ld	hl,#_coleccionablesFam + 0
   62DE 36 00         [10]  217 	ld	(hl), #0x00
                            218 ;src/juego/juego.c:56: coleccionablesAms=0;
   62E0 21 B2 7A      [10]  219 	ld	hl,#_coleccionablesAms + 0
   62E3 36 00         [10]  220 	ld	(hl), #0x00
                            221 ;src/juego/juego.c:57: nivelActual=nivel_0;
   62E5 21 B3 7A      [10]  222 	ld	hl,#_nivelActual + 0
   62E8 36 01         [10]  223 	ld	(hl), #0x01
                            224 ;src/juego/juego.c:58: pasos=0;
   62EA 21 B4 7A      [10]  225 	ld	hl,#_pasos + 0
   62ED 36 00         [10]  226 	ld	(hl), #0x00
                            227 ;src/juego/juego.c:59: initNiveles(colList);
   62EF 21 7D 7A      [10]  228 	ld	hl, #_colList
   62F2 E5            [11]  229 	push	hl
   62F3 CD B0 64      [17]  230 	call	_initNiveles
                            231 ;src/juego/juego.c:60: crearNivel(&player,rocas,rocasEspejo,puertas,portal,coleccionables,&posicion,nivel_0);    
   62F6 26 01         [ 7]  232 	ld	h,#0x01
   62F8 E3            [19]  233 	ex	(sp),hl
   62F9 33            [ 6]  234 	inc	sp
   62FA 21 AF 7A      [10]  235 	ld	hl, #_posicion
   62FD E5            [11]  236 	push	hl
   62FE 21 71 7A      [10]  237 	ld	hl, #_coleccionables
   6301 E5            [11]  238 	push	hl
   6302 21 1D 7A      [10]  239 	ld	hl, #_portal
   6305 E5            [11]  240 	push	hl
   6306 21 2B 7A      [10]  241 	ld	hl, #_puertas
   6309 E5            [11]  242 	push	hl
   630A 21 05 79      [10]  243 	ld	hl, #_rocasEspejo
   630D E5            [11]  244 	push	hl
   630E 21 ED 77      [10]  245 	ld	hl, #_rocas
   6311 E5            [11]  246 	push	hl
   6312 21 E6 77      [10]  247 	ld	hl, #_player
   6315 E5            [11]  248 	push	hl
   6316 CD E7 64      [17]  249 	call	_crearNivel
   6319 21 0F 00      [10]  250 	ld	hl, #15
   631C 39            [11]  251 	add	hl, sp
   631D F9            [ 6]  252 	ld	sp, hl
                            253 ;src/juego/juego.c:61: initGameobjest(portal,puertas,coleccionables,&coleccionablesLuz,&coleccionablesFam,&coleccionablesAms,colList);
   631E 21 7D 7A      [10]  254 	ld	hl, #_colList
   6321 E5            [11]  255 	push	hl
   6322 21 B2 7A      [10]  256 	ld	hl, #_coleccionablesAms
   6325 E5            [11]  257 	push	hl
   6326 21 B1 7A      [10]  258 	ld	hl, #_coleccionablesFam
   6329 E5            [11]  259 	push	hl
   632A 21 B0 7A      [10]  260 	ld	hl, #_coleccionablesLuz
   632D E5            [11]  261 	push	hl
   632E 21 71 7A      [10]  262 	ld	hl, #_coleccionables
   6331 E5            [11]  263 	push	hl
   6332 21 2B 7A      [10]  264 	ld	hl, #_puertas
   6335 E5            [11]  265 	push	hl
   6336 21 1D 7A      [10]  266 	ld	hl, #_portal
   6339 E5            [11]  267 	push	hl
   633A CD A2 52      [17]  268 	call	_initGameobjest
   633D 21 0E 00      [10]  269 	ld	hl, #14
   6340 39            [11]  270 	add	hl, sp
   6341 F9            [ 6]  271 	ld	sp, hl
                            272 ;src/juego/juego.c:62: dibujarGameObjects();
   6342 CD A3 63      [17]  273 	call	_dibujarGameObjects
                            274 ;src/juego/juego.c:63: initHud();
   6345 CD 42 70      [17]  275 	call	_initHud
                            276 ;src/juego/juego.c:64: initDialogos();        
   6348 C3 4E 6F      [10]  277 	jp  _initDialogos
                            278 ;src/juego/juego.c:66: void moverPlayer(){
                            279 ;	---------------------------------
                            280 ; Function moverPlayer
                            281 ; ---------------------------------
   634B                     282 _moverPlayer::
                            283 ;src/juego/juego.c:68: if(posicion==posicion_Izquieda){
   634B 3A AF 7A      [13]  284 	ld	a,(#_posicion + 0)
   634E B7            [ 4]  285 	or	a, a
   634F 20 23         [12]  286 	jr	NZ,00102$
                            287 ;src/juego/juego.c:69: nivel=moverGameObject(&player,movimientoGuardado,rocas,rocasEspejo,&posicion);
   6351 21 AF 7A      [10]  288 	ld	hl, #_posicion
   6354 E5            [11]  289 	push	hl
   6355 21 05 79      [10]  290 	ld	hl, #_rocasEspejo
   6358 E5            [11]  291 	push	hl
   6359 21 ED 77      [10]  292 	ld	hl, #_rocas
   635C E5            [11]  293 	push	hl
   635D 3A 17 77      [13]  294 	ld	a, (_movimientoGuardado)
   6360 F5            [11]  295 	push	af
   6361 33            [ 6]  296 	inc	sp
   6362 21 E6 77      [10]  297 	ld	hl, #_player
   6365 E5            [11]  298 	push	hl
   6366 CD 7A 57      [17]  299 	call	_moverGameObject
   6369 FD 21 09 00   [14]  300 	ld	iy, #9
   636D FD 39         [15]  301 	add	iy, sp
   636F FD F9         [10]  302 	ld	sp, iy
   6371 45            [ 4]  303 	ld	b, l
   6372 18 21         [12]  304 	jr	00103$
   6374                     305 00102$:
                            306 ;src/juego/juego.c:71: nivel=moverGameObject(&player,movimientoGuardado,rocasEspejo,rocas,&posicion);
   6374 21 AF 7A      [10]  307 	ld	hl, #_posicion
   6377 E5            [11]  308 	push	hl
   6378 21 ED 77      [10]  309 	ld	hl, #_rocas
   637B E5            [11]  310 	push	hl
   637C 21 05 79      [10]  311 	ld	hl, #_rocasEspejo
   637F E5            [11]  312 	push	hl
   6380 3A 17 77      [13]  313 	ld	a, (_movimientoGuardado)
   6383 F5            [11]  314 	push	af
   6384 33            [ 6]  315 	inc	sp
   6385 21 E6 77      [10]  316 	ld	hl, #_player
   6388 E5            [11]  317 	push	hl
   6389 CD 7A 57      [17]  318 	call	_moverGameObject
   638C FD 21 09 00   [14]  319 	ld	iy, #9
   6390 FD 39         [15]  320 	add	iy, sp
   6392 FD F9         [10]  321 	ld	sp, iy
   6394 45            [ 4]  322 	ld	b, l
   6395                     323 00103$:
                            324 ;src/juego/juego.c:74: if(nivel!=seguir_En_Nivel){ 
   6395 78            [ 4]  325 	ld	a, b
   6396 B7            [ 4]  326 	or	a, a
   6397 C8            [11]  327 	ret	Z
                            328 ;src/juego/juego.c:75: nivelActual=nivel;      
   6398 21 B3 7A      [10]  329 	ld	hl,#_nivelActual + 0
   639B 70            [ 7]  330 	ld	(hl), b
                            331 ;src/juego/juego.c:76: resetGameobjects(nivel);
   639C C5            [11]  332 	push	bc
   639D 33            [ 6]  333 	inc	sp
   639E CD 6B 64      [17]  334 	call	_resetGameobjects
   63A1 33            [ 6]  335 	inc	sp
   63A2 C9            [10]  336 	ret
                            337 ;src/juego/juego.c:82: void dibujarGameObjects(){
                            338 ;	---------------------------------
                            339 ; Function dibujarGameObjects
                            340 ; ---------------------------------
   63A3                     341 _dibujarGameObjects::
                            342 ;src/juego/juego.c:83: dibujarGameObject(&player);
   63A3 21 E6 77      [10]  343 	ld	hl, #_player
   63A6 E5            [11]  344 	push	hl
   63A7 CD EC 52      [17]  345 	call	_dibujarGameObject
   63AA F1            [10]  346 	pop	af
                            347 ;src/juego/juego.c:84: for (u8 i =0; i<RocasMaximas;i++){        
   63AB 0E 00         [ 7]  348 	ld	c, #0x00
   63AD                     349 00107$:
   63AD 79            [ 4]  350 	ld	a, c
   63AE D6 28         [ 7]  351 	sub	a, #0x28
   63B0 30 16         [12]  352 	jr	NC,00101$
                            353 ;src/juego/juego.c:85: dibujarGameObject(&rocas[i]);        
   63B2 06 00         [ 7]  354 	ld	b,#0x00
   63B4 69            [ 4]  355 	ld	l, c
   63B5 60            [ 4]  356 	ld	h, b
   63B6 29            [11]  357 	add	hl, hl
   63B7 09            [11]  358 	add	hl, bc
   63B8 29            [11]  359 	add	hl, hl
   63B9 09            [11]  360 	add	hl, bc
   63BA 11 ED 77      [10]  361 	ld	de, #_rocas
   63BD 19            [11]  362 	add	hl, de
   63BE C5            [11]  363 	push	bc
   63BF E5            [11]  364 	push	hl
   63C0 CD EC 52      [17]  365 	call	_dibujarGameObject
   63C3 F1            [10]  366 	pop	af
   63C4 C1            [10]  367 	pop	bc
                            368 ;src/juego/juego.c:84: for (u8 i =0; i<RocasMaximas;i++){        
   63C5 0C            [ 4]  369 	inc	c
   63C6 18 E5         [12]  370 	jr	00107$
   63C8                     371 00101$:
                            372 ;src/juego/juego.c:87: for (u8 i =0; i<RocasMaximas;i++){        
   63C8 0E 00         [ 7]  373 	ld	c, #0x00
   63CA                     374 00110$:
   63CA 79            [ 4]  375 	ld	a, c
   63CB D6 28         [ 7]  376 	sub	a, #0x28
   63CD 30 16         [12]  377 	jr	NC,00102$
                            378 ;src/juego/juego.c:88: dibujarGameObject(&rocasEspejo[i]);
   63CF 06 00         [ 7]  379 	ld	b,#0x00
   63D1 69            [ 4]  380 	ld	l, c
   63D2 60            [ 4]  381 	ld	h, b
   63D3 29            [11]  382 	add	hl, hl
   63D4 09            [11]  383 	add	hl, bc
   63D5 29            [11]  384 	add	hl, hl
   63D6 09            [11]  385 	add	hl, bc
   63D7 11 05 79      [10]  386 	ld	de, #_rocasEspejo
   63DA 19            [11]  387 	add	hl, de
   63DB C5            [11]  388 	push	bc
   63DC E5            [11]  389 	push	hl
   63DD CD EC 52      [17]  390 	call	_dibujarGameObject
   63E0 F1            [10]  391 	pop	af
   63E1 C1            [10]  392 	pop	bc
                            393 ;src/juego/juego.c:87: for (u8 i =0; i<RocasMaximas;i++){        
   63E2 0C            [ 4]  394 	inc	c
   63E3 18 E5         [12]  395 	jr	00110$
   63E5                     396 00102$:
                            397 ;src/juego/juego.c:91: for(u8 i=0;i<2;i++){
   63E5 0E 00         [ 7]  398 	ld	c, #0x00
   63E7                     399 00113$:
   63E7 79            [ 4]  400 	ld	a, c
   63E8 D6 02         [ 7]  401 	sub	a, #0x02
   63EA 30 16         [12]  402 	jr	NC,00103$
                            403 ;src/juego/juego.c:92: dibujarGameObject(&portal[i]);
   63EC 06 00         [ 7]  404 	ld	b,#0x00
   63EE 69            [ 4]  405 	ld	l, c
   63EF 60            [ 4]  406 	ld	h, b
   63F0 29            [11]  407 	add	hl, hl
   63F1 09            [11]  408 	add	hl, bc
   63F2 29            [11]  409 	add	hl, hl
   63F3 09            [11]  410 	add	hl, bc
   63F4 11 1D 7A      [10]  411 	ld	de, #_portal
   63F7 19            [11]  412 	add	hl, de
   63F8 C5            [11]  413 	push	bc
   63F9 E5            [11]  414 	push	hl
   63FA CD EC 52      [17]  415 	call	_dibujarGameObject
   63FD F1            [10]  416 	pop	af
   63FE C1            [10]  417 	pop	bc
                            418 ;src/juego/juego.c:91: for(u8 i=0;i<2;i++){
   63FF 0C            [ 4]  419 	inc	c
   6400 18 E5         [12]  420 	jr	00113$
   6402                     421 00103$:
                            422 ;src/juego/juego.c:94: for(u8 i=0;i<PuertasMaximas;i++){
   6402 0E 00         [ 7]  423 	ld	c, #0x00
   6404                     424 00116$:
   6404 79            [ 4]  425 	ld	a, c
   6405 D6 03         [ 7]  426 	sub	a, #0x03
   6407 30 16         [12]  427 	jr	NC,00104$
                            428 ;src/juego/juego.c:95: dibujarGameObject(&puertas[i]);
   6409 06 00         [ 7]  429 	ld	b,#0x00
   640B 69            [ 4]  430 	ld	l, c
   640C 60            [ 4]  431 	ld	h, b
   640D 29            [11]  432 	add	hl, hl
   640E 09            [11]  433 	add	hl, bc
   640F 29            [11]  434 	add	hl, hl
   6410 09            [11]  435 	add	hl, bc
   6411 11 2B 7A      [10]  436 	ld	de, #_puertas
   6414 19            [11]  437 	add	hl, de
   6415 C5            [11]  438 	push	bc
   6416 E5            [11]  439 	push	hl
   6417 CD EC 52      [17]  440 	call	_dibujarGameObject
   641A F1            [10]  441 	pop	af
   641B C1            [10]  442 	pop	bc
                            443 ;src/juego/juego.c:94: for(u8 i=0;i<PuertasMaximas;i++){
   641C 0C            [ 4]  444 	inc	c
   641D 18 E5         [12]  445 	jr	00116$
   641F                     446 00104$:
                            447 ;src/juego/juego.c:97: for(u8 i=0;i<ColeccionablesMaximos;i++){
   641F 0E 00         [ 7]  448 	ld	c, #0x00
   6421                     449 00119$:
   6421 79            [ 4]  450 	ld	a, c
   6422 D6 03         [ 7]  451 	sub	a, #0x03
   6424 D0            [11]  452 	ret	NC
                            453 ;src/juego/juego.c:98: dibujarGameObjectCol(&coleccionables[i]);
   6425 69            [ 4]  454 	ld	l, c
   6426 26 00         [ 7]  455 	ld	h, #0x00
   6428 29            [11]  456 	add	hl, hl
   6429 29            [11]  457 	add	hl, hl
   642A 11 71 7A      [10]  458 	ld	de, #_coleccionables
   642D 19            [11]  459 	add	hl, de
   642E C5            [11]  460 	push	bc
   642F E5            [11]  461 	push	hl
   6430 CD CA 55      [17]  462 	call	_dibujarGameObjectCol
   6433 F1            [10]  463 	pop	af
   6434 C1            [10]  464 	pop	bc
                            465 ;src/juego/juego.c:97: for(u8 i=0;i<ColeccionablesMaximos;i++){
   6435 0C            [ 4]  466 	inc	c
   6436 18 E9         [12]  467 	jr	00119$
                            468 ;src/juego/juego.c:102: void comprobarMovimiento(){
                            469 ;	---------------------------------
                            470 ; Function comprobarMovimiento
                            471 ; ---------------------------------
   6438                     472 _comprobarMovimiento::
                            473 ;src/juego/juego.c:103: if(player.cronoMovimiento==0){
   6438 3A EB 77      [13]  474 	ld	a, (#(_player + 0x0005) + 0)
   643B B7            [ 4]  475 	or	a, a
   643C 20 05         [12]  476 	jr	NZ,00102$
                            477 ;src/juego/juego.c:104: movimientoGuardado=mover_SinMovimiento;
   643E 21 17 77      [10]  478 	ld	hl,#_movimientoGuardado + 0
   6441 36 00         [10]  479 	ld	(hl), #0x00
   6443                     480 00102$:
                            481 ;src/juego/juego.c:106: if(movimientoPlayer()!=mover_SinMovimiento){
   6443 CD FE 6E      [17]  482 	call	_movimientoPlayer
   6446 7D            [ 4]  483 	ld	a, l
   6447 B7            [ 4]  484 	or	a, a
   6448 C8            [11]  485 	ret	Z
                            486 ;src/juego/juego.c:107: movimientoGuardado=movimientoPlayer();
   6449 CD FE 6E      [17]  487 	call	_movimientoPlayer
   644C FD 21 17 77   [14]  488 	ld	iy, #_movimientoGuardado
   6450 FD 75 00      [19]  489 	ld	0 (iy), l
   6453 C9            [10]  490 	ret
                            491 ;src/juego/juego.c:110: u8 comprobarPasos(){
                            492 ;	---------------------------------
                            493 ; Function comprobarPasos
                            494 ; ---------------------------------
   6454                     495 _comprobarPasos::
                            496 ;src/juego/juego.c:111: if(player.pasos!=pasos){
   6454 21 EC 77      [10]  497 	ld	hl, #(_player + 0x0006) + 0
   6457 4E            [ 7]  498 	ld	c, (hl)
   6458 FD 21 B4 7A   [14]  499 	ld	iy, #_pasos
   645C FD 7E 00      [19]  500 	ld	a, 0 (iy)
   645F 91            [ 4]  501 	sub	a, c
   6460 28 06         [12]  502 	jr	Z,00102$
                            503 ;src/juego/juego.c:112: pasos=player.pasos;
   6462 FD 71 00      [19]  504 	ld	0 (iy), c
                            505 ;src/juego/juego.c:113: return si;
   6465 2E 00         [ 7]  506 	ld	l, #0x00
   6467 C9            [10]  507 	ret
   6468                     508 00102$:
                            509 ;src/juego/juego.c:115: return no;
   6468 2E 01         [ 7]  510 	ld	l, #0x01
   646A C9            [10]  511 	ret
                            512 ;src/juego/juego.c:118: void resetGameobjects(u8 nivel){
                            513 ;	---------------------------------
                            514 ; Function resetGameobjects
                            515 ; ---------------------------------
   646B                     516 _resetGameobjects::
   646B DD E5         [15]  517 	push	ix
   646D DD 21 00 00   [14]  518 	ld	ix,#0
   6471 DD 39         [15]  519 	add	ix,sp
                            520 ;src/juego/juego.c:119: posicion=posicion_Izquieda;
   6473 21 AF 7A      [10]  521 	ld	hl,#_posicion + 0
   6476 36 00         [10]  522 	ld	(hl), #0x00
                            523 ;src/juego/juego.c:120: player.pasos=0;
   6478 21 EC 77      [10]  524 	ld	hl, #(_player + 0x0006)
   647B 36 00         [10]  525 	ld	(hl), #0x00
                            526 ;src/juego/juego.c:121: pasos=0;    
   647D 21 B4 7A      [10]  527 	ld	hl,#_pasos + 0
   6480 36 00         [10]  528 	ld	(hl), #0x00
                            529 ;src/juego/juego.c:122: crearNivel(&player,rocas,rocasEspejo,puertas,portal,coleccionables,&posicion,nivel);        
   6482 DD 7E 04      [19]  530 	ld	a, 4 (ix)
   6485 F5            [11]  531 	push	af
   6486 33            [ 6]  532 	inc	sp
   6487 21 AF 7A      [10]  533 	ld	hl, #_posicion
   648A E5            [11]  534 	push	hl
   648B 21 71 7A      [10]  535 	ld	hl, #_coleccionables
   648E E5            [11]  536 	push	hl
   648F 21 1D 7A      [10]  537 	ld	hl, #_portal
   6492 E5            [11]  538 	push	hl
   6493 21 2B 7A      [10]  539 	ld	hl, #_puertas
   6496 E5            [11]  540 	push	hl
   6497 21 05 79      [10]  541 	ld	hl, #_rocasEspejo
   649A E5            [11]  542 	push	hl
   649B 21 ED 77      [10]  543 	ld	hl, #_rocas
   649E E5            [11]  544 	push	hl
   649F 21 E6 77      [10]  545 	ld	hl, #_player
   64A2 E5            [11]  546 	push	hl
   64A3 CD E7 64      [17]  547 	call	_crearNivel
   64A6 21 0F 00      [10]  548 	ld	hl, #15
   64A9 39            [11]  549 	add	hl, sp
   64AA F9            [ 6]  550 	ld	sp, hl
                            551 ;src/juego/juego.c:123: dibujarGameObjects();     
   64AB DD E1         [14]  552 	pop	ix
   64AD C3 A3 63      [10]  553 	jp	_dibujarGameObjects
                            554 	.area _CODE
                            555 	.area _INITIALIZER
                            556 	.area _CABS (ABS)
