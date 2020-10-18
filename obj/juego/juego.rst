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
                             11 	.globl _crearEnemigos
                             12 	.globl _initEnemigos
                             13 	.globl _initDialogos
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
                             24 	.globl _cpct_akp_SFXInit
                             25 	.globl _cpct_akp_stop
                             26 	.globl _cpct_akp_musicPlay
                             27 	.globl _cpct_akp_musicInit
                             28 	.globl _cpct_waitVSYNC
                             29 	.globl _frecuenciaIA
                             30 	.globl _pasos
                             31 	.globl _nivelActual
                             32 	.globl _coleccionablesAms
                             33 	.globl _coleccionablesFam
                             34 	.globl _coleccionablesLuz
                             35 	.globl _posicion
                             36 	.globl _colList
                             37 	.globl _coleccionables
                             38 	.globl _puertas
                             39 	.globl _portal
                             40 	.globl _rocasEspejo
                             41 	.globl _rocas
                             42 	.globl _player
                             43 	.globl _game
                             44 	.globl _initGame
                             45 	.globl _moverPlayer
                             46 	.globl _dibujarGameObjects
                             47 	.globl _comprobarMovimiento
                             48 	.globl _comprobarPasos
                             49 	.globl _resetGameobjects
                             50 ;--------------------------------------------------------
                             51 ; special function registers
                             52 ;--------------------------------------------------------
                             53 ;--------------------------------------------------------
                             54 ; ram data
                             55 ;--------------------------------------------------------
                             56 	.area _DATA
   AC41                      57 _P_portal:
   AC41                      58 	.ds 2
   AC43                      59 _P_puertas:
   AC43                      60 	.ds 2
   AC45                      61 _P_col:
   AC45                      62 	.ds 2
   AC47                      63 _P_luz:
   AC47                      64 	.ds 2
   AC49                      65 _P_fam:
   AC49                      66 	.ds 2
   AC4B                      67 _P_ams:
   AC4B                      68 	.ds 2
   AC4D                      69 _P_colList:
   AC4D                      70 	.ds 2
   AC4F                      71 _movimientoGuardado:
   AC4F                      72 	.ds 1
   AC50                      73 _niveles:
   AC50                      74 	.ds 100
   ACB4                      75 _contadorRocas:
   ACB4                      76 	.ds 1
   ACB5                      77 _contadorRocasEspejo:
   ACB5                      78 	.ds 1
   ACB6                      79 _contadorPuertas:
   ACB6                      80 	.ds 1
   ACB7                      81 _contadorColeccionables:
   ACB7                      82 	.ds 1
   ACB8                      83 _P_colList2:
   ACB8                      84 	.ds 2
   ACBA                      85 _dialogos:
   ACBA                      86 	.ds 100
   AD1E                      87 _creadorDeEnemigos:
   AD1E                      88 	.ds 100
   AD82                      89 _player::
   AD82                      90 	.ds 7
   AD89                      91 _rocas::
   AD89                      92 	.ds 280
   AEA1                      93 _rocasEspejo::
   AEA1                      94 	.ds 280
   AFB9                      95 _portal::
   AFB9                      96 	.ds 14
   AFC7                      97 _puertas::
   AFC7                      98 	.ds 70
   B00D                      99 _coleccionables::
   B00D                     100 	.ds 12
   B019                     101 _colList::
   B019                     102 	.ds 50
   B04B                     103 _posicion::
   B04B                     104 	.ds 1
   B04C                     105 _coleccionablesLuz::
   B04C                     106 	.ds 1
   B04D                     107 _coleccionablesFam::
   B04D                     108 	.ds 1
   B04E                     109 _coleccionablesAms::
   B04E                     110 	.ds 1
   B04F                     111 _nivelActual::
   B04F                     112 	.ds 1
   B050                     113 _pasos::
   B050                     114 	.ds 1
   B051                     115 _frecuenciaIA::
   B051                     116 	.ds 1
                            117 ;--------------------------------------------------------
                            118 ; ram data
                            119 ;--------------------------------------------------------
                            120 	.area _INITIALIZED
                            121 ;--------------------------------------------------------
                            122 ; absolute external ram data
                            123 ;--------------------------------------------------------
                            124 	.area _DABS (ABS)
                            125 ;--------------------------------------------------------
                            126 ; global & static initialisations
                            127 ;--------------------------------------------------------
                            128 	.area _HOME
                            129 	.area _GSINIT
                            130 	.area _GSFINAL
                            131 	.area _GSINIT
                            132 ;--------------------------------------------------------
                            133 ; Home
                            134 ;--------------------------------------------------------
                            135 	.area _HOME
                            136 	.area _HOME
                            137 ;--------------------------------------------------------
                            138 ; code
                            139 ;--------------------------------------------------------
                            140 	.area _CODE
                            141 ;src/juego/juego.c:38: void game(){
                            142 ;	---------------------------------
                            143 ; Function game
                            144 ; ---------------------------------
   7117                     145 _game::
                            146 ;src/juego/juego.c:39: initGame();
   7117 CD 5F 71      [17]  147 	call	_initGame
                            148 ;src/juego/juego.c:40: cpct_akp_musicInit(molusk);    // Initialize the music
   711A 21 4D 1D      [10]  149 	ld	hl, #_molusk
   711D E5            [11]  150 	push	hl
   711E CD 55 A6      [17]  151 	call	_cpct_akp_musicInit
                            152 ;src/juego/juego.c:41: cpct_akp_SFXInit(molusk);      // Initialize instruments to be used for SFX (Same as music song)
   7121 21 4D 1D      [10]  153 	ld	hl, #_molusk
   7124 E3            [19]  154 	ex	(sp),hl
   7125 CD E1 A6      [17]  155 	call	_cpct_akp_SFXInit
   7128 F1            [10]  156 	pop	af
                            157 ;src/juego/juego.c:43: while(1){
   7129                     158 00108$:
                            159 ;src/juego/juego.c:44: cpct_waitVSYNC();        
   7129 CD D0 A9      [17]  160 	call	_cpct_waitVSYNC
                            161 ;src/juego/juego.c:45: cpct_akp_musicPlay();
   712C CD 52 9F      [17]  162 	call	_cpct_akp_musicPlay
                            163 ;src/juego/juego.c:46: frecuenciaIA--;
   712F 21 51 B0      [10]  164 	ld	hl, #_frecuenciaIA+0
   7132 35            [11]  165 	dec	(hl)
                            166 ;src/juego/juego.c:49: scanKey();
   7133 CD B0 9A      [17]  167 	call	_scanKey
                            168 ;src/juego/juego.c:50: if(keyR()==si){            
   7136 CD D3 9A      [17]  169 	call	_keyR
   7139 7D            [ 4]  170 	ld	a, l
   713A B7            [ 4]  171 	or	a, a
   713B 20 09         [12]  172 	jr	NZ,00102$
                            173 ;src/juego/juego.c:51: resetGameobjects(nivelActual);
   713D 3A 4F B0      [13]  174 	ld	a, (_nivelActual)
   7140 F5            [11]  175 	push	af
   7141 33            [ 6]  176 	inc	sp
   7142 CD 19 73      [17]  177 	call	_resetGameobjects
   7145 33            [ 6]  178 	inc	sp
   7146                     179 00102$:
                            180 ;src/juego/juego.c:53: comprobarMovimiento();      
   7146 CD E6 72      [17]  181 	call	_comprobarMovimiento
                            182 ;src/juego/juego.c:54: moverPlayer();
   7149 CD F9 71      [17]  183 	call	_moverPlayer
                            184 ;src/juego/juego.c:56: if(comprobarPasos()==si){
   714C CD 02 73      [17]  185 	call	_comprobarPasos
                            186 ;src/juego/juego.c:62: if(frecuenciaIA==0){
   714F FD 21 51 B0   [14]  187 	ld	iy, #_frecuenciaIA
   7153 FD 7E 00      [19]  188 	ld	a, 0 (iy)
   7156 B7            [ 4]  189 	or	a, a
   7157 20 D0         [12]  190 	jr	NZ,00108$
                            191 ;src/juego/juego.c:63: frecuenciaIA=frecuenciaMaxIA;
   7159 FD 36 00 14   [19]  192 	ld	0 (iy), #0x14
   715D 18 CA         [12]  193 	jr	00108$
                            194 ;src/juego/juego.c:68: void initGame(){
                            195 ;	---------------------------------
                            196 ; Function initGame
                            197 ; ---------------------------------
   715F                     198 _initGame::
                            199 ;src/juego/juego.c:69: for(u8 i =0;i<ColeccionablesMaximosTotales;i++){
   715F 01 19 B0      [10]  200 	ld	bc, #_colList+0
   7162 1E 00         [ 7]  201 	ld	e, #0x00
   7164                     202 00103$:
   7164 7B            [ 4]  203 	ld	a, e
   7165 D6 32         [ 7]  204 	sub	a, #0x32
   7167 30 09         [12]  205 	jr	NC,00101$
                            206 ;src/juego/juego.c:70: colList[i]=coleccionable_activo;
   7169 6B            [ 4]  207 	ld	l,e
   716A 26 00         [ 7]  208 	ld	h,#0x00
   716C 09            [11]  209 	add	hl, bc
   716D 36 00         [10]  210 	ld	(hl), #0x00
                            211 ;src/juego/juego.c:69: for(u8 i =0;i<ColeccionablesMaximosTotales;i++){
   716F 1C            [ 4]  212 	inc	e
   7170 18 F2         [12]  213 	jr	00103$
   7172                     214 00101$:
                            215 ;src/juego/juego.c:72: posicion=posicion_Izquieda;
   7172 21 4B B0      [10]  216 	ld	hl,#_posicion + 0
   7175 36 00         [10]  217 	ld	(hl), #0x00
                            218 ;src/juego/juego.c:73: coleccionablesLuz=0;
   7177 21 4C B0      [10]  219 	ld	hl,#_coleccionablesLuz + 0
   717A 36 00         [10]  220 	ld	(hl), #0x00
                            221 ;src/juego/juego.c:74: coleccionablesFam=0;
   717C 21 4D B0      [10]  222 	ld	hl,#_coleccionablesFam + 0
   717F 36 00         [10]  223 	ld	(hl), #0x00
                            224 ;src/juego/juego.c:75: coleccionablesAms=0;
   7181 21 4E B0      [10]  225 	ld	hl,#_coleccionablesAms + 0
   7184 36 00         [10]  226 	ld	(hl), #0x00
                            227 ;src/juego/juego.c:76: nivelActual=nivel_01;
   7186 21 4F B0      [10]  228 	ld	hl,#_nivelActual + 0
   7189 36 01         [10]  229 	ld	(hl), #0x01
                            230 ;src/juego/juego.c:77: pasos=0;
   718B 21 50 B0      [10]  231 	ld	hl,#_pasos + 0
   718E 36 00         [10]  232 	ld	(hl), #0x00
                            233 ;src/juego/juego.c:78: frecuenciaIA=frecuenciaMaxIA;
   7190 21 51 B0      [10]  234 	ld	hl,#_frecuenciaIA + 0
   7193 36 14         [10]  235 	ld	(hl), #0x14
                            236 ;src/juego/juego.c:79: initNiveles(colList);
   7195 59            [ 4]  237 	ld	e, c
   7196 50            [ 4]  238 	ld	d, b
   7197 C5            [11]  239 	push	bc
   7198 D5            [11]  240 	push	de
   7199 CD 6A 73      [17]  241 	call	_initNiveles
   719C 21 4E B0      [10]  242 	ld	hl, #_coleccionablesAms
   719F E3            [19]  243 	ex	(sp),hl
   71A0 21 4D B0      [10]  244 	ld	hl, #_coleccionablesFam
   71A3 E5            [11]  245 	push	hl
   71A4 21 4C B0      [10]  246 	ld	hl, #_coleccionablesLuz
   71A7 E5            [11]  247 	push	hl
   71A8 21 0D B0      [10]  248 	ld	hl, #_coleccionables
   71AB E5            [11]  249 	push	hl
   71AC 21 C7 AF      [10]  250 	ld	hl, #_puertas
   71AF E5            [11]  251 	push	hl
   71B0 21 B9 AF      [10]  252 	ld	hl, #_portal
   71B3 E5            [11]  253 	push	hl
   71B4 CD 0D 59      [17]  254 	call	_initGameobjest
   71B7 21 0E 00      [10]  255 	ld	hl, #14
   71BA 39            [11]  256 	add	hl, sp
   71BB F9            [ 6]  257 	ld	sp, hl
                            258 ;src/juego/juego.c:81: initHud();
   71BC CD 27 9C      [17]  259 	call	_initHud
                            260 ;src/juego/juego.c:82: initDialogos();
   71BF CD 33 9B      [17]  261 	call	_initDialogos
                            262 ;src/juego/juego.c:83: initEnemigos();
   71C2 CD E3 6B      [17]  263 	call	_initEnemigos
                            264 ;src/juego/juego.c:84: crearNivel(&player,rocas,rocasEspejo,puertas,portal,coleccionables,&posicion,nivel_01);
   71C5 3E 01         [ 7]  265 	ld	a, #0x01
   71C7 F5            [11]  266 	push	af
   71C8 33            [ 6]  267 	inc	sp
   71C9 21 4B B0      [10]  268 	ld	hl, #_posicion
   71CC E5            [11]  269 	push	hl
   71CD 21 0D B0      [10]  270 	ld	hl, #_coleccionables
   71D0 E5            [11]  271 	push	hl
   71D1 21 B9 AF      [10]  272 	ld	hl, #_portal
   71D4 E5            [11]  273 	push	hl
   71D5 21 C7 AF      [10]  274 	ld	hl, #_puertas
   71D8 E5            [11]  275 	push	hl
   71D9 21 A1 AE      [10]  276 	ld	hl, #_rocasEspejo
   71DC E5            [11]  277 	push	hl
   71DD 21 89 AD      [10]  278 	ld	hl, #_rocas
   71E0 E5            [11]  279 	push	hl
   71E1 21 82 AD      [10]  280 	ld	hl, #_player
   71E4 E5            [11]  281 	push	hl
   71E5 CD CB 73      [17]  282 	call	_crearNivel
   71E8 21 0F 00      [10]  283 	ld	hl, #15
   71EB 39            [11]  284 	add	hl, sp
   71EC F9            [ 6]  285 	ld	sp, hl
                            286 ;src/juego/juego.c:85: crearEnemigos(nivelActual);    
   71ED 3A 4F B0      [13]  287 	ld	a, (_nivelActual)
   71F0 F5            [11]  288 	push	af
   71F1 33            [ 6]  289 	inc	sp
   71F2 CD 18 6C      [17]  290 	call	_crearEnemigos
   71F5 33            [ 6]  291 	inc	sp
                            292 ;src/juego/juego.c:86: dibujarGameObjects();
   71F6 C3 51 72      [10]  293 	jp  _dibujarGameObjects
                            294 ;src/juego/juego.c:89: void moverPlayer(){
                            295 ;	---------------------------------
                            296 ; Function moverPlayer
                            297 ; ---------------------------------
   71F9                     298 _moverPlayer::
                            299 ;src/juego/juego.c:91: if(posicion==posicion_Izquieda){
   71F9 3A 4B B0      [13]  300 	ld	a,(#_posicion + 0)
   71FC B7            [ 4]  301 	or	a, a
   71FD 20 23         [12]  302 	jr	NZ,00102$
                            303 ;src/juego/juego.c:92: nivel=moverGameObject(&player,movimientoGuardado,rocas,rocasEspejo,&posicion);
   71FF 21 4B B0      [10]  304 	ld	hl, #_posicion
   7202 E5            [11]  305 	push	hl
   7203 21 A1 AE      [10]  306 	ld	hl, #_rocasEspejo
   7206 E5            [11]  307 	push	hl
   7207 21 89 AD      [10]  308 	ld	hl, #_rocas
   720A E5            [11]  309 	push	hl
   720B 3A 4F AC      [13]  310 	ld	a, (_movimientoGuardado)
   720E F5            [11]  311 	push	af
   720F 33            [ 6]  312 	inc	sp
   7210 21 82 AD      [10]  313 	ld	hl, #_player
   7213 E5            [11]  314 	push	hl
   7214 CD E6 5F      [17]  315 	call	_moverGameObject
   7217 FD 21 09 00   [14]  316 	ld	iy, #9
   721B FD 39         [15]  317 	add	iy, sp
   721D FD F9         [10]  318 	ld	sp, iy
   721F 45            [ 4]  319 	ld	b, l
   7220 18 21         [12]  320 	jr	00103$
   7222                     321 00102$:
                            322 ;src/juego/juego.c:94: nivel=moverGameObject(&player,movimientoGuardado,rocasEspejo,rocas,&posicion);
   7222 21 4B B0      [10]  323 	ld	hl, #_posicion
   7225 E5            [11]  324 	push	hl
   7226 21 89 AD      [10]  325 	ld	hl, #_rocas
   7229 E5            [11]  326 	push	hl
   722A 21 A1 AE      [10]  327 	ld	hl, #_rocasEspejo
   722D E5            [11]  328 	push	hl
   722E 3A 4F AC      [13]  329 	ld	a, (_movimientoGuardado)
   7231 F5            [11]  330 	push	af
   7232 33            [ 6]  331 	inc	sp
   7233 21 82 AD      [10]  332 	ld	hl, #_player
   7236 E5            [11]  333 	push	hl
   7237 CD E6 5F      [17]  334 	call	_moverGameObject
   723A FD 21 09 00   [14]  335 	ld	iy, #9
   723E FD 39         [15]  336 	add	iy, sp
   7240 FD F9         [10]  337 	ld	sp, iy
   7242 45            [ 4]  338 	ld	b, l
   7243                     339 00103$:
                            340 ;src/juego/juego.c:97: if(nivel!=seguir_En_Nivel){ 
   7243 78            [ 4]  341 	ld	a, b
   7244 B7            [ 4]  342 	or	a, a
   7245 C8            [11]  343 	ret	Z
                            344 ;src/juego/juego.c:98: nivelActual=nivel;      
   7246 21 4F B0      [10]  345 	ld	hl,#_nivelActual + 0
   7249 70            [ 7]  346 	ld	(hl), b
                            347 ;src/juego/juego.c:99: resetGameobjects(nivel);
   724A C5            [11]  348 	push	bc
   724B 33            [ 6]  349 	inc	sp
   724C CD 19 73      [17]  350 	call	_resetGameobjects
   724F 33            [ 6]  351 	inc	sp
   7250 C9            [10]  352 	ret
                            353 ;src/juego/juego.c:105: void dibujarGameObjects(){
                            354 ;	---------------------------------
                            355 ; Function dibujarGameObjects
                            356 ; ---------------------------------
   7251                     357 _dibujarGameObjects::
                            358 ;src/juego/juego.c:106: dibujarGameObject(&player);
   7251 21 82 AD      [10]  359 	ld	hl, #_player
   7254 E5            [11]  360 	push	hl
   7255 CD 57 59      [17]  361 	call	_dibujarGameObject
   7258 F1            [10]  362 	pop	af
                            363 ;src/juego/juego.c:107: for (u8 i =0; i<RocasMaximas;i++){        
   7259 0E 00         [ 7]  364 	ld	c, #0x00
   725B                     365 00107$:
   725B 79            [ 4]  366 	ld	a, c
   725C D6 28         [ 7]  367 	sub	a, #0x28
   725E 30 16         [12]  368 	jr	NC,00101$
                            369 ;src/juego/juego.c:108: dibujarGameObject(&rocas[i]);        
   7260 06 00         [ 7]  370 	ld	b,#0x00
   7262 69            [ 4]  371 	ld	l, c
   7263 60            [ 4]  372 	ld	h, b
   7264 29            [11]  373 	add	hl, hl
   7265 09            [11]  374 	add	hl, bc
   7266 29            [11]  375 	add	hl, hl
   7267 09            [11]  376 	add	hl, bc
   7268 11 89 AD      [10]  377 	ld	de, #_rocas
   726B 19            [11]  378 	add	hl, de
   726C C5            [11]  379 	push	bc
   726D E5            [11]  380 	push	hl
   726E CD 57 59      [17]  381 	call	_dibujarGameObject
   7271 F1            [10]  382 	pop	af
   7272 C1            [10]  383 	pop	bc
                            384 ;src/juego/juego.c:107: for (u8 i =0; i<RocasMaximas;i++){        
   7273 0C            [ 4]  385 	inc	c
   7274 18 E5         [12]  386 	jr	00107$
   7276                     387 00101$:
                            388 ;src/juego/juego.c:110: for (u8 i =0; i<RocasMaximas;i++){        
   7276 0E 00         [ 7]  389 	ld	c, #0x00
   7278                     390 00110$:
   7278 79            [ 4]  391 	ld	a, c
   7279 D6 28         [ 7]  392 	sub	a, #0x28
   727B 30 16         [12]  393 	jr	NC,00102$
                            394 ;src/juego/juego.c:111: dibujarGameObject(&rocasEspejo[i]);
   727D 06 00         [ 7]  395 	ld	b,#0x00
   727F 69            [ 4]  396 	ld	l, c
   7280 60            [ 4]  397 	ld	h, b
   7281 29            [11]  398 	add	hl, hl
   7282 09            [11]  399 	add	hl, bc
   7283 29            [11]  400 	add	hl, hl
   7284 09            [11]  401 	add	hl, bc
   7285 11 A1 AE      [10]  402 	ld	de, #_rocasEspejo
   7288 19            [11]  403 	add	hl, de
   7289 C5            [11]  404 	push	bc
   728A E5            [11]  405 	push	hl
   728B CD 57 59      [17]  406 	call	_dibujarGameObject
   728E F1            [10]  407 	pop	af
   728F C1            [10]  408 	pop	bc
                            409 ;src/juego/juego.c:110: for (u8 i =0; i<RocasMaximas;i++){        
   7290 0C            [ 4]  410 	inc	c
   7291 18 E5         [12]  411 	jr	00110$
   7293                     412 00102$:
                            413 ;src/juego/juego.c:114: for(u8 i=0;i<2;i++){
   7293 0E 00         [ 7]  414 	ld	c, #0x00
   7295                     415 00113$:
   7295 79            [ 4]  416 	ld	a, c
   7296 D6 02         [ 7]  417 	sub	a, #0x02
   7298 30 16         [12]  418 	jr	NC,00103$
                            419 ;src/juego/juego.c:115: dibujarGameObject(&portal[i]);
   729A 06 00         [ 7]  420 	ld	b,#0x00
   729C 69            [ 4]  421 	ld	l, c
   729D 60            [ 4]  422 	ld	h, b
   729E 29            [11]  423 	add	hl, hl
   729F 09            [11]  424 	add	hl, bc
   72A0 29            [11]  425 	add	hl, hl
   72A1 09            [11]  426 	add	hl, bc
   72A2 11 B9 AF      [10]  427 	ld	de, #_portal
   72A5 19            [11]  428 	add	hl, de
   72A6 C5            [11]  429 	push	bc
   72A7 E5            [11]  430 	push	hl
   72A8 CD 57 59      [17]  431 	call	_dibujarGameObject
   72AB F1            [10]  432 	pop	af
   72AC C1            [10]  433 	pop	bc
                            434 ;src/juego/juego.c:114: for(u8 i=0;i<2;i++){
   72AD 0C            [ 4]  435 	inc	c
   72AE 18 E5         [12]  436 	jr	00113$
   72B0                     437 00103$:
                            438 ;src/juego/juego.c:117: for(u8 i=0;i<PuertasMaximas;i++){
   72B0 0E 00         [ 7]  439 	ld	c, #0x00
   72B2                     440 00116$:
   72B2 79            [ 4]  441 	ld	a, c
   72B3 D6 06         [ 7]  442 	sub	a, #0x06
   72B5 30 16         [12]  443 	jr	NC,00104$
                            444 ;src/juego/juego.c:118: dibujarGameObject(&puertas[i]);
   72B7 06 00         [ 7]  445 	ld	b,#0x00
   72B9 69            [ 4]  446 	ld	l, c
   72BA 60            [ 4]  447 	ld	h, b
   72BB 29            [11]  448 	add	hl, hl
   72BC 09            [11]  449 	add	hl, bc
   72BD 29            [11]  450 	add	hl, hl
   72BE 09            [11]  451 	add	hl, bc
   72BF 11 C7 AF      [10]  452 	ld	de, #_puertas
   72C2 19            [11]  453 	add	hl, de
   72C3 C5            [11]  454 	push	bc
   72C4 E5            [11]  455 	push	hl
   72C5 CD 57 59      [17]  456 	call	_dibujarGameObject
   72C8 F1            [10]  457 	pop	af
   72C9 C1            [10]  458 	pop	bc
                            459 ;src/juego/juego.c:117: for(u8 i=0;i<PuertasMaximas;i++){
   72CA 0C            [ 4]  460 	inc	c
   72CB 18 E5         [12]  461 	jr	00116$
   72CD                     462 00104$:
                            463 ;src/juego/juego.c:120: for(u8 i=0;i<ColeccionablesMaximos;i++){
   72CD 0E 00         [ 7]  464 	ld	c, #0x00
   72CF                     465 00119$:
   72CF 79            [ 4]  466 	ld	a, c
   72D0 D6 03         [ 7]  467 	sub	a, #0x03
   72D2 D0            [11]  468 	ret	NC
                            469 ;src/juego/juego.c:121: dibujarGameObjectCol(&coleccionables[i]);
   72D3 69            [ 4]  470 	ld	l, c
   72D4 26 00         [ 7]  471 	ld	h, #0x00
   72D6 29            [11]  472 	add	hl, hl
   72D7 29            [11]  473 	add	hl, hl
   72D8 11 0D B0      [10]  474 	ld	de, #_coleccionables
   72DB 19            [11]  475 	add	hl, de
   72DC C5            [11]  476 	push	bc
   72DD E5            [11]  477 	push	hl
   72DE CD 36 5E      [17]  478 	call	_dibujarGameObjectCol
   72E1 F1            [10]  479 	pop	af
   72E2 C1            [10]  480 	pop	bc
                            481 ;src/juego/juego.c:120: for(u8 i=0;i<ColeccionablesMaximos;i++){
   72E3 0C            [ 4]  482 	inc	c
   72E4 18 E9         [12]  483 	jr	00119$
                            484 ;src/juego/juego.c:125: void comprobarMovimiento(){
                            485 ;	---------------------------------
                            486 ; Function comprobarMovimiento
                            487 ; ---------------------------------
   72E6                     488 _comprobarMovimiento::
                            489 ;src/juego/juego.c:126: if(player.cronoMovimiento==0){
   72E6 3A 87 AD      [13]  490 	ld	a, (#(_player + 0x0005) + 0)
   72E9 B7            [ 4]  491 	or	a, a
   72EA 20 05         [12]  492 	jr	NZ,00102$
                            493 ;src/juego/juego.c:127: movimientoGuardado=mover_SinMovimiento;
   72EC 21 4F AC      [10]  494 	ld	hl,#_movimientoGuardado + 0
   72EF 36 00         [10]  495 	ld	(hl), #0x00
   72F1                     496 00102$:
                            497 ;src/juego/juego.c:129: if(movimientoPlayer()!=mover_SinMovimiento){
   72F1 CD E3 9A      [17]  498 	call	_movimientoPlayer
   72F4 7D            [ 4]  499 	ld	a, l
   72F5 B7            [ 4]  500 	or	a, a
   72F6 C8            [11]  501 	ret	Z
                            502 ;src/juego/juego.c:130: movimientoGuardado=movimientoPlayer();
   72F7 CD E3 9A      [17]  503 	call	_movimientoPlayer
   72FA FD 21 4F AC   [14]  504 	ld	iy, #_movimientoGuardado
   72FE FD 75 00      [19]  505 	ld	0 (iy), l
   7301 C9            [10]  506 	ret
                            507 ;src/juego/juego.c:133: u8 comprobarPasos(){
                            508 ;	---------------------------------
                            509 ; Function comprobarPasos
                            510 ; ---------------------------------
   7302                     511 _comprobarPasos::
                            512 ;src/juego/juego.c:134: if(player.pasos!=pasos){
   7302 21 88 AD      [10]  513 	ld	hl, #(_player + 0x0006) + 0
   7305 4E            [ 7]  514 	ld	c, (hl)
   7306 FD 21 50 B0   [14]  515 	ld	iy, #_pasos
   730A FD 7E 00      [19]  516 	ld	a, 0 (iy)
   730D 91            [ 4]  517 	sub	a, c
   730E 28 06         [12]  518 	jr	Z,00102$
                            519 ;src/juego/juego.c:135: pasos=player.pasos;
   7310 FD 71 00      [19]  520 	ld	0 (iy), c
                            521 ;src/juego/juego.c:136: return si;
   7313 2E 00         [ 7]  522 	ld	l, #0x00
   7315 C9            [10]  523 	ret
   7316                     524 00102$:
                            525 ;src/juego/juego.c:138: return no;
   7316 2E 01         [ 7]  526 	ld	l, #0x01
   7318 C9            [10]  527 	ret
                            528 ;src/juego/juego.c:141: void resetGameobjects(u8 nivel){
                            529 ;	---------------------------------
                            530 ; Function resetGameobjects
                            531 ; ---------------------------------
   7319                     532 _resetGameobjects::
   7319 DD E5         [15]  533 	push	ix
   731B DD 21 00 00   [14]  534 	ld	ix,#0
   731F DD 39         [15]  535 	add	ix,sp
                            536 ;src/juego/juego.c:142: cpct_akp_stop();
   7321 CD B5 A6      [17]  537 	call	_cpct_akp_stop
                            538 ;src/juego/juego.c:143: posicion=posicion_Izquieda;
   7324 21 4B B0      [10]  539 	ld	hl,#_posicion + 0
   7327 36 00         [10]  540 	ld	(hl), #0x00
                            541 ;src/juego/juego.c:144: player.pasos=0;
   7329 21 88 AD      [10]  542 	ld	hl, #(_player + 0x0006)
   732C 36 00         [10]  543 	ld	(hl), #0x00
                            544 ;src/juego/juego.c:145: pasos=0;    
   732E 21 50 B0      [10]  545 	ld	hl,#_pasos + 0
   7331 36 00         [10]  546 	ld	(hl), #0x00
                            547 ;src/juego/juego.c:146: crearNivel(&player,rocas,rocasEspejo,puertas,portal,coleccionables,&posicion,nivel);
   7333 DD 7E 04      [19]  548 	ld	a, 4 (ix)
   7336 F5            [11]  549 	push	af
   7337 33            [ 6]  550 	inc	sp
   7338 21 4B B0      [10]  551 	ld	hl, #_posicion
   733B E5            [11]  552 	push	hl
   733C 21 0D B0      [10]  553 	ld	hl, #_coleccionables
   733F E5            [11]  554 	push	hl
   7340 21 B9 AF      [10]  555 	ld	hl, #_portal
   7343 E5            [11]  556 	push	hl
   7344 21 C7 AF      [10]  557 	ld	hl, #_puertas
   7347 E5            [11]  558 	push	hl
   7348 21 A1 AE      [10]  559 	ld	hl, #_rocasEspejo
   734B E5            [11]  560 	push	hl
   734C 21 89 AD      [10]  561 	ld	hl, #_rocas
   734F E5            [11]  562 	push	hl
   7350 21 82 AD      [10]  563 	ld	hl, #_player
   7353 E5            [11]  564 	push	hl
   7354 CD CB 73      [17]  565 	call	_crearNivel
   7357 21 0F 00      [10]  566 	ld	hl, #15
   735A 39            [11]  567 	add	hl, sp
   735B F9            [ 6]  568 	ld	sp, hl
                            569 ;src/juego/juego.c:147: crearEnemigos(nivelActual);        
   735C 3A 4F B0      [13]  570 	ld	a, (_nivelActual)
   735F F5            [11]  571 	push	af
   7360 33            [ 6]  572 	inc	sp
   7361 CD 18 6C      [17]  573 	call	_crearEnemigos
   7364 33            [ 6]  574 	inc	sp
                            575 ;src/juego/juego.c:148: dibujarGameObjects();     
   7365 DD E1         [14]  576 	pop	ix
   7367 C3 51 72      [10]  577 	jp	_dibujarGameObjects
                            578 	.area _CODE
                            579 	.area _INITIALIZER
                            580 	.area _CABS (ABS)
