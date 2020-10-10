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
                             16 	.globl _initGameobjest
                             17 	.globl _posicion
                             18 	.globl _puertas
                             19 	.globl _portal
                             20 	.globl _rocasEspejo
                             21 	.globl _rocas
                             22 	.globl _player
                             23 	.globl _game
                             24 	.globl _initGame
                             25 	.globl _moverPlayer
                             26 	.globl _createPlayer
                             27 	.globl _createRocas
                             28 	.globl _createRocasEspejo
                             29 	.globl _createPortal
                             30 	.globl _createPuerta
                             31 	.globl _createHole
                             32 	.globl _dibujarGameObjects
                             33 	.globl _comprobarMovimiento
                             34 	.globl _resetGameobjects
                             35 ;--------------------------------------------------------
                             36 ; special function registers
                             37 ;--------------------------------------------------------
                             38 ;--------------------------------------------------------
                             39 ; ram data
                             40 ;--------------------------------------------------------
                             41 	.area _DATA
   61AE                      42 _P_portal:
   61AE                      43 	.ds 2
   61B0                      44 _P_puertas:
   61B0                      45 	.ds 2
   61B2                      46 _movimientoGuardado:
   61B2                      47 	.ds 1
   61B3                      48 _player::
   61B3                      49 	.ds 6
   61B9                      50 _rocas::
   61B9                      51 	.ds 240
   62A9                      52 _rocasEspejo::
   62A9                      53 	.ds 240
   6399                      54 _portal::
   6399                      55 	.ds 12
   63A5                      56 _puertas::
   63A5                      57 	.ds 60
   63E1                      58 _posicion::
   63E1                      59 	.ds 1
                             60 ;--------------------------------------------------------
                             61 ; ram data
                             62 ;--------------------------------------------------------
                             63 	.area _INITIALIZED
                             64 ;--------------------------------------------------------
                             65 ; absolute external ram data
                             66 ;--------------------------------------------------------
                             67 	.area _DABS (ABS)
                             68 ;--------------------------------------------------------
                             69 ; global & static initialisations
                             70 ;--------------------------------------------------------
                             71 	.area _HOME
                             72 	.area _GSINIT
                             73 	.area _GSFINAL
                             74 	.area _GSINIT
                             75 ;--------------------------------------------------------
                             76 ; Home
                             77 ;--------------------------------------------------------
                             78 	.area _HOME
                             79 	.area _HOME
                             80 ;--------------------------------------------------------
                             81 ; code
                             82 ;--------------------------------------------------------
                             83 	.area _CODE
                             84 ;src/juego/juego.c:31: void game(){
                             85 ;	---------------------------------
                             86 ; Function game
                             87 ; ---------------------------------
   5B3A                      88 _game::
                             89 ;src/juego/juego.c:32: initGame();       
   5B3A CD 48 5B      [17]   90 	call	_initGame
                             91 ;src/juego/juego.c:33: while(1){ 
   5B3D                      92 00102$:
                             93 ;src/juego/juego.c:34: scanKey();
   5B3D CD 53 5D      [17]   94 	call	_scanKey
                             95 ;src/juego/juego.c:35: comprobarMovimiento();      
   5B40 CD 05 5D      [17]   96 	call	_comprobarMovimiento
                             97 ;src/juego/juego.c:36: moverPlayer();       
   5B43 CD 72 5B      [17]   98 	call	_moverPlayer
   5B46 18 F5         [12]   99 	jr	00102$
                            100 ;src/juego/juego.c:39: void initGame(){
                            101 ;	---------------------------------
                            102 ; Function initGame
                            103 ; ---------------------------------
   5B48                     104 _initGame::
                            105 ;src/juego/juego.c:40: posicion=posicion_Izquieda;
   5B48 21 E1 63      [10]  106 	ld	hl,#_posicion + 0
   5B4B 36 00         [10]  107 	ld	(hl), #0x00
                            108 ;src/juego/juego.c:41: crearNivel();
   5B4D CD 4B 5D      [17]  109 	call	_crearNivel
                            110 ;src/juego/juego.c:42: createPlayer();
   5B50 CD C0 5B      [17]  111 	call	_createPlayer
                            112 ;src/juego/juego.c:43: createRocas();
   5B53 CD DA 5B      [17]  113 	call	_createRocas
                            114 ;src/juego/juego.c:44: createRocasEspejo();
   5B56 CD 0D 5C      [17]  115 	call	_createRocasEspejo
                            116 ;src/juego/juego.c:45: createPortal();
   5B59 CD 40 5C      [17]  117 	call	_createPortal
                            118 ;src/juego/juego.c:46: createPuerta();
   5B5C CD 5F 5C      [17]  119 	call	_createPuerta
                            120 ;src/juego/juego.c:47: createHole();
   5B5F CD 74 5C      [17]  121 	call	_createHole
                            122 ;src/juego/juego.c:48: initGameobjest(portal,puertas);
   5B62 21 A5 63      [10]  123 	ld	hl, #_puertas
   5B65 E5            [11]  124 	push	hl
   5B66 21 99 63      [10]  125 	ld	hl, #_portal
   5B69 E5            [11]  126 	push	hl
   5B6A CD BF 4F      [17]  127 	call	_initGameobjest
   5B6D F1            [10]  128 	pop	af
   5B6E F1            [10]  129 	pop	af
                            130 ;src/juego/juego.c:49: dibujarGameObjects();    
   5B6F C3 8E 5C      [10]  131 	jp  _dibujarGameObjects
                            132 ;src/juego/juego.c:51: void moverPlayer(){
                            133 ;	---------------------------------
                            134 ; Function moverPlayer
                            135 ; ---------------------------------
   5B72                     136 _moverPlayer::
                            137 ;src/juego/juego.c:53: if(posicion==posicion_Izquieda){
   5B72 3A E1 63      [13]  138 	ld	a,(#_posicion + 0)
   5B75 B7            [ 4]  139 	or	a, a
   5B76 20 22         [12]  140 	jr	NZ,00102$
                            141 ;src/juego/juego.c:54: nivel=moverGameObject(&player,movimientoGuardado,rocas,rocasEspejo,&posicion);
   5B78 21 E1 63      [10]  142 	ld	hl, #_posicion
   5B7B E5            [11]  143 	push	hl
   5B7C 21 A9 62      [10]  144 	ld	hl, #_rocasEspejo
   5B7F E5            [11]  145 	push	hl
   5B80 21 B9 61      [10]  146 	ld	hl, #_rocas
   5B83 E5            [11]  147 	push	hl
   5B84 3A B2 61      [13]  148 	ld	a, (_movimientoGuardado)
   5B87 F5            [11]  149 	push	af
   5B88 33            [ 6]  150 	inc	sp
   5B89 21 B3 61      [10]  151 	ld	hl, #_player
   5B8C E5            [11]  152 	push	hl
   5B8D CD DC 50      [17]  153 	call	_moverGameObject
   5B90 FD 21 09 00   [14]  154 	ld	iy, #9
   5B94 FD 39         [15]  155 	add	iy, sp
   5B96 FD F9         [10]  156 	ld	sp, iy
   5B98 18 20         [12]  157 	jr	00103$
   5B9A                     158 00102$:
                            159 ;src/juego/juego.c:56: nivel=moverGameObject(&player,movimientoGuardado,rocasEspejo,rocas,&posicion);
   5B9A 21 E1 63      [10]  160 	ld	hl, #_posicion
   5B9D E5            [11]  161 	push	hl
   5B9E 21 B9 61      [10]  162 	ld	hl, #_rocas
   5BA1 E5            [11]  163 	push	hl
   5BA2 21 A9 62      [10]  164 	ld	hl, #_rocasEspejo
   5BA5 E5            [11]  165 	push	hl
   5BA6 3A B2 61      [13]  166 	ld	a, (_movimientoGuardado)
   5BA9 F5            [11]  167 	push	af
   5BAA 33            [ 6]  168 	inc	sp
   5BAB 21 B3 61      [10]  169 	ld	hl, #_player
   5BAE E5            [11]  170 	push	hl
   5BAF CD DC 50      [17]  171 	call	_moverGameObject
   5BB2 FD 21 09 00   [14]  172 	ld	iy, #9
   5BB6 FD 39         [15]  173 	add	iy, sp
   5BB8 FD F9         [10]  174 	ld	sp, iy
   5BBA                     175 00103$:
                            176 ;src/juego/juego.c:59: if(nivel!=seguir_En_Nivel){
   5BBA 7D            [ 4]  177 	ld	a, l
   5BBB B7            [ 4]  178 	or	a, a
   5BBC C8            [11]  179 	ret	Z
                            180 ;src/juego/juego.c:60: resetGameobjects();
   5BBD C3 21 5D      [10]  181 	jp  _resetGameobjects
                            182 ;src/juego/juego.c:63: void createPlayer(){
                            183 ;	---------------------------------
                            184 ; Function createPlayer
                            185 ; ---------------------------------
   5BC0                     186 _createPlayer::
                            187 ;src/juego/juego.c:64: player.num=-1;
   5BC0 21 B3 61      [10]  188 	ld	hl, #_player
   5BC3 36 FF         [10]  189 	ld	(hl), #0xff
                            190 ;src/juego/juego.c:65: player.posx=1;
   5BC5 21 B4 61      [10]  191 	ld	hl, #(_player + 0x0001)
   5BC8 36 01         [10]  192 	ld	(hl), #0x01
                            193 ;src/juego/juego.c:66: player.posy=1;   
   5BCA 21 B5 61      [10]  194 	ld	hl, #(_player + 0x0002)
   5BCD 36 01         [10]  195 	ld	(hl), #0x01
                            196 ;src/juego/juego.c:67: player.sprite=sprite_Player;
   5BCF 21 B6 61      [10]  197 	ld	hl, #(_player + 0x0003)
   5BD2 36 01         [10]  198 	ld	(hl), #0x01
                            199 ;src/juego/juego.c:68: player.movimiento=mover_1;
   5BD4 21 B7 61      [10]  200 	ld	hl, #(_player + 0x0004)
   5BD7 36 01         [10]  201 	ld	(hl), #0x01
   5BD9 C9            [10]  202 	ret
                            203 ;src/juego/juego.c:70: void createRocas(){
                            204 ;	---------------------------------
                            205 ; Function createRocas
                            206 ; ---------------------------------
   5BDA                     207 _createRocas::
                            208 ;src/juego/juego.c:71: rocas[0].num=1;
   5BDA 21 B9 61      [10]  209 	ld	hl, #_rocas
   5BDD 36 01         [10]  210 	ld	(hl), #0x01
                            211 ;src/juego/juego.c:72: rocas[0].posx=3;
   5BDF 21 BA 61      [10]  212 	ld	hl, #(_rocas + 0x0001)
   5BE2 36 03         [10]  213 	ld	(hl), #0x03
                            214 ;src/juego/juego.c:73: rocas[0].posy=3;
   5BE4 21 BB 61      [10]  215 	ld	hl, #(_rocas + 0x0002)
   5BE7 36 03         [10]  216 	ld	(hl), #0x03
                            217 ;src/juego/juego.c:74: rocas[0].sprite=sprite_RockLineal;
   5BE9 21 BC 61      [10]  218 	ld	hl, #(_rocas + 0x0003)
   5BEC 36 04         [10]  219 	ld	(hl), #0x04
                            220 ;src/juego/juego.c:75: rocas[0].movimiento=mover_Linea;
   5BEE 21 BD 61      [10]  221 	ld	hl, #(_rocas + 0x0004)
   5BF1 36 02         [10]  222 	ld	(hl), #0x02
                            223 ;src/juego/juego.c:78: rocas[1].num=2;
   5BF3 21 BF 61      [10]  224 	ld	hl, #(_rocas + 0x0006)
   5BF6 36 02         [10]  225 	ld	(hl), #0x02
                            226 ;src/juego/juego.c:79: rocas[1].posx=4;
   5BF8 21 C0 61      [10]  227 	ld	hl, #(_rocas + 0x0007)
   5BFB 36 04         [10]  228 	ld	(hl), #0x04
                            229 ;src/juego/juego.c:80: rocas[1].posy=3;
   5BFD 21 C1 61      [10]  230 	ld	hl, #(_rocas + 0x0008)
   5C00 36 03         [10]  231 	ld	(hl), #0x03
                            232 ;src/juego/juego.c:81: rocas[1].sprite=sprite_Rock;
   5C02 21 C2 61      [10]  233 	ld	hl, #(_rocas + 0x0009)
   5C05 36 02         [10]  234 	ld	(hl), #0x02
                            235 ;src/juego/juego.c:82: rocas[1].movimiento=mover_1;
   5C07 21 C3 61      [10]  236 	ld	hl, #(_rocas + 0x000a)
   5C0A 36 01         [10]  237 	ld	(hl), #0x01
   5C0C C9            [10]  238 	ret
                            239 ;src/juego/juego.c:95: void createRocasEspejo(){
                            240 ;	---------------------------------
                            241 ; Function createRocasEspejo
                            242 ; ---------------------------------
   5C0D                     243 _createRocasEspejo::
                            244 ;src/juego/juego.c:96: rocasEspejo[0].num=1;
   5C0D 21 A9 62      [10]  245 	ld	hl, #_rocasEspejo
   5C10 36 01         [10]  246 	ld	(hl), #0x01
                            247 ;src/juego/juego.c:97: rocasEspejo[0].posx=14;
   5C12 21 AA 62      [10]  248 	ld	hl, #(_rocasEspejo + 0x0001)
   5C15 36 0E         [10]  249 	ld	(hl), #0x0e
                            250 ;src/juego/juego.c:98: rocasEspejo[0].posy=5;
   5C17 21 AB 62      [10]  251 	ld	hl, #(_rocasEspejo + 0x0002)
   5C1A 36 05         [10]  252 	ld	(hl), #0x05
                            253 ;src/juego/juego.c:99: rocasEspejo[0].sprite=sprite_RockLineal;
   5C1C 21 AC 62      [10]  254 	ld	hl, #(_rocasEspejo + 0x0003)
   5C1F 36 04         [10]  255 	ld	(hl), #0x04
                            256 ;src/juego/juego.c:100: rocasEspejo[0].movimiento=mover_Linea;
   5C21 21 AD 62      [10]  257 	ld	hl, #(_rocasEspejo + 0x0004)
   5C24 36 02         [10]  258 	ld	(hl), #0x02
                            259 ;src/juego/juego.c:103: rocasEspejo[1].num=2;
   5C26 21 AF 62      [10]  260 	ld	hl, #(_rocasEspejo + 0x0006)
   5C29 36 02         [10]  261 	ld	(hl), #0x02
                            262 ;src/juego/juego.c:104: rocasEspejo[1].posx=14;
   5C2B 21 B0 62      [10]  263 	ld	hl, #(_rocasEspejo + 0x0007)
   5C2E 36 0E         [10]  264 	ld	(hl), #0x0e
                            265 ;src/juego/juego.c:105: rocasEspejo[1].posy=6;
   5C30 21 B1 62      [10]  266 	ld	hl, #(_rocasEspejo + 0x0008)
   5C33 36 06         [10]  267 	ld	(hl), #0x06
                            268 ;src/juego/juego.c:106: rocasEspejo[1].sprite=sprite_Rock;
   5C35 21 B2 62      [10]  269 	ld	hl, #(_rocasEspejo + 0x0009)
   5C38 36 02         [10]  270 	ld	(hl), #0x02
                            271 ;src/juego/juego.c:107: rocasEspejo[1].movimiento=mover_1;
   5C3A 21 B3 62      [10]  272 	ld	hl, #(_rocasEspejo + 0x000a)
   5C3D 36 01         [10]  273 	ld	(hl), #0x01
   5C3F C9            [10]  274 	ret
                            275 ;src/juego/juego.c:124: void createPortal(){
                            276 ;	---------------------------------
                            277 ; Function createPortal
                            278 ; ---------------------------------
   5C40                     279 _createPortal::
                            280 ;src/juego/juego.c:125: portal[0].posx=7;
   5C40 21 9A 63      [10]  281 	ld	hl, #(_portal + 0x0001)
   5C43 36 07         [10]  282 	ld	(hl), #0x07
                            283 ;src/juego/juego.c:126: portal[0].posy=4;
   5C45 21 9B 63      [10]  284 	ld	hl, #(_portal + 0x0002)
   5C48 36 04         [10]  285 	ld	(hl), #0x04
                            286 ;src/juego/juego.c:127: portal[0].sprite=sprite_Portal;
   5C4A 21 9C 63      [10]  287 	ld	hl, #(_portal + 0x0003)
   5C4D 36 05         [10]  288 	ld	(hl), #0x05
                            289 ;src/juego/juego.c:129: portal[1].posx=9;
   5C4F 21 A0 63      [10]  290 	ld	hl, #(_portal + 0x0007)
   5C52 36 09         [10]  291 	ld	(hl), #0x09
                            292 ;src/juego/juego.c:130: portal[1].posy=4;
   5C54 21 A1 63      [10]  293 	ld	hl, #(_portal + 0x0008)
   5C57 36 04         [10]  294 	ld	(hl), #0x04
                            295 ;src/juego/juego.c:131: portal[1].sprite=sprite_Portal;
   5C59 21 A2 63      [10]  296 	ld	hl, #(_portal + 0x0009)
   5C5C 36 05         [10]  297 	ld	(hl), #0x05
   5C5E C9            [10]  298 	ret
                            299 ;src/juego/juego.c:133: void createPuerta(){
                            300 ;	---------------------------------
                            301 ; Function createPuerta
                            302 ; ---------------------------------
   5C5F                     303 _createPuerta::
                            304 ;src/juego/juego.c:134: puertas[0].num=nivel_2;
   5C5F 21 A5 63      [10]  305 	ld	hl, #_puertas
   5C62 36 02         [10]  306 	ld	(hl), #0x02
                            307 ;src/juego/juego.c:135: puertas[0].posx=1;
   5C64 21 A6 63      [10]  308 	ld	hl, #(_puertas + 0x0001)
   5C67 36 01         [10]  309 	ld	(hl), #0x01
                            310 ;src/juego/juego.c:136: puertas[0].posy=7;
   5C69 21 A7 63      [10]  311 	ld	hl, #(_puertas + 0x0002)
   5C6C 36 07         [10]  312 	ld	(hl), #0x07
                            313 ;src/juego/juego.c:137: puertas[0].sprite=sprite_Puerta;
   5C6E 21 A8 63      [10]  314 	ld	hl, #(_puertas + 0x0003)
   5C71 36 06         [10]  315 	ld	(hl), #0x06
   5C73 C9            [10]  316 	ret
                            317 ;src/juego/juego.c:139: void createHole(){
                            318 ;	---------------------------------
                            319 ; Function createHole
                            320 ; ---------------------------------
   5C74                     321 _createHole::
                            322 ;src/juego/juego.c:140: rocas[3].num=0;
   5C74 21 CB 61      [10]  323 	ld	hl, #(_rocas + 0x0012)
   5C77 36 00         [10]  324 	ld	(hl), #0x00
                            325 ;src/juego/juego.c:141: rocas[3].posx=6;
   5C79 21 CC 61      [10]  326 	ld	hl, #(_rocas + 0x0013)
   5C7C 36 06         [10]  327 	ld	(hl), #0x06
                            328 ;src/juego/juego.c:142: rocas[3].posy=3;
   5C7E 21 CD 61      [10]  329 	ld	hl, #(_rocas + 0x0014)
   5C81 36 03         [10]  330 	ld	(hl), #0x03
                            331 ;src/juego/juego.c:143: rocas[3].sprite=sprite_hole;
   5C83 21 CE 61      [10]  332 	ld	hl, #(_rocas + 0x0015)
   5C86 36 07         [10]  333 	ld	(hl), #0x07
                            334 ;src/juego/juego.c:144: rocas[3].movimiento=sin_Movimiento;
   5C88 21 CF 61      [10]  335 	ld	hl, #(_rocas + 0x0016)
   5C8B 36 00         [10]  336 	ld	(hl), #0x00
   5C8D C9            [10]  337 	ret
                            338 ;src/juego/juego.c:148: void dibujarGameObjects(){
                            339 ;	---------------------------------
                            340 ; Function dibujarGameObjects
                            341 ; ---------------------------------
   5C8E                     342 _dibujarGameObjects::
                            343 ;src/juego/juego.c:149: dibujarGameObject(&player);
   5C8E 21 B3 61      [10]  344 	ld	hl, #_player
   5C91 E5            [11]  345 	push	hl
   5C92 CD E0 4F      [17]  346 	call	_dibujarGameObject
   5C95 F1            [10]  347 	pop	af
                            348 ;src/juego/juego.c:150: for (u8 i =0; i<RocasMaximas;i++){        
   5C96 0E 00         [ 7]  349 	ld	c, #0x00
   5C98                     350 00106$:
   5C98 79            [ 4]  351 	ld	a, c
   5C99 D6 28         [ 7]  352 	sub	a, #0x28
   5C9B 30 15         [12]  353 	jr	NC,00101$
                            354 ;src/juego/juego.c:151: dibujarGameObject(&rocas[i]);
   5C9D 06 00         [ 7]  355 	ld	b,#0x00
   5C9F 69            [ 4]  356 	ld	l, c
   5CA0 60            [ 4]  357 	ld	h, b
   5CA1 29            [11]  358 	add	hl, hl
   5CA2 09            [11]  359 	add	hl, bc
   5CA3 29            [11]  360 	add	hl, hl
   5CA4 11 B9 61      [10]  361 	ld	de, #_rocas
   5CA7 19            [11]  362 	add	hl, de
   5CA8 C5            [11]  363 	push	bc
   5CA9 E5            [11]  364 	push	hl
   5CAA CD E0 4F      [17]  365 	call	_dibujarGameObject
   5CAD F1            [10]  366 	pop	af
   5CAE C1            [10]  367 	pop	bc
                            368 ;src/juego/juego.c:150: for (u8 i =0; i<RocasMaximas;i++){        
   5CAF 0C            [ 4]  369 	inc	c
   5CB0 18 E6         [12]  370 	jr	00106$
   5CB2                     371 00101$:
                            372 ;src/juego/juego.c:154: for (u8 i =0; i<RocasMaximas;i++){        
   5CB2 0E 00         [ 7]  373 	ld	c, #0x00
   5CB4                     374 00109$:
   5CB4 79            [ 4]  375 	ld	a, c
   5CB5 D6 28         [ 7]  376 	sub	a, #0x28
   5CB7 30 15         [12]  377 	jr	NC,00102$
                            378 ;src/juego/juego.c:155: dibujarGameObject(&rocasEspejo[i]);
   5CB9 06 00         [ 7]  379 	ld	b,#0x00
   5CBB 69            [ 4]  380 	ld	l, c
   5CBC 60            [ 4]  381 	ld	h, b
   5CBD 29            [11]  382 	add	hl, hl
   5CBE 09            [11]  383 	add	hl, bc
   5CBF 29            [11]  384 	add	hl, hl
   5CC0 11 A9 62      [10]  385 	ld	de, #_rocasEspejo
   5CC3 19            [11]  386 	add	hl, de
   5CC4 C5            [11]  387 	push	bc
   5CC5 E5            [11]  388 	push	hl
   5CC6 CD E0 4F      [17]  389 	call	_dibujarGameObject
   5CC9 F1            [10]  390 	pop	af
   5CCA C1            [10]  391 	pop	bc
                            392 ;src/juego/juego.c:154: for (u8 i =0; i<RocasMaximas;i++){        
   5CCB 0C            [ 4]  393 	inc	c
   5CCC 18 E6         [12]  394 	jr	00109$
   5CCE                     395 00102$:
                            396 ;src/juego/juego.c:158: for(u8 i=0;i<2;i++){
   5CCE 0E 00         [ 7]  397 	ld	c, #0x00
   5CD0                     398 00112$:
   5CD0 79            [ 4]  399 	ld	a, c
   5CD1 D6 02         [ 7]  400 	sub	a, #0x02
   5CD3 30 15         [12]  401 	jr	NC,00103$
                            402 ;src/juego/juego.c:159: dibujarGameObject(&portal[i]);
   5CD5 06 00         [ 7]  403 	ld	b,#0x00
   5CD7 69            [ 4]  404 	ld	l, c
   5CD8 60            [ 4]  405 	ld	h, b
   5CD9 29            [11]  406 	add	hl, hl
   5CDA 09            [11]  407 	add	hl, bc
   5CDB 29            [11]  408 	add	hl, hl
   5CDC 11 99 63      [10]  409 	ld	de, #_portal
   5CDF 19            [11]  410 	add	hl, de
   5CE0 C5            [11]  411 	push	bc
   5CE1 E5            [11]  412 	push	hl
   5CE2 CD E0 4F      [17]  413 	call	_dibujarGameObject
   5CE5 F1            [10]  414 	pop	af
   5CE6 C1            [10]  415 	pop	bc
                            416 ;src/juego/juego.c:158: for(u8 i=0;i<2;i++){
   5CE7 0C            [ 4]  417 	inc	c
   5CE8 18 E6         [12]  418 	jr	00112$
   5CEA                     419 00103$:
                            420 ;src/juego/juego.c:161: for(u8 i=0;i<2;i++){
   5CEA 0E 00         [ 7]  421 	ld	c, #0x00
   5CEC                     422 00115$:
   5CEC 79            [ 4]  423 	ld	a, c
   5CED D6 02         [ 7]  424 	sub	a, #0x02
   5CEF D0            [11]  425 	ret	NC
                            426 ;src/juego/juego.c:162: dibujarGameObject(&puertas[i]);
   5CF0 06 00         [ 7]  427 	ld	b,#0x00
   5CF2 69            [ 4]  428 	ld	l, c
   5CF3 60            [ 4]  429 	ld	h, b
   5CF4 29            [11]  430 	add	hl, hl
   5CF5 09            [11]  431 	add	hl, bc
   5CF6 29            [11]  432 	add	hl, hl
   5CF7 11 A5 63      [10]  433 	ld	de, #_puertas
   5CFA 19            [11]  434 	add	hl, de
   5CFB C5            [11]  435 	push	bc
   5CFC E5            [11]  436 	push	hl
   5CFD CD E0 4F      [17]  437 	call	_dibujarGameObject
   5D00 F1            [10]  438 	pop	af
   5D01 C1            [10]  439 	pop	bc
                            440 ;src/juego/juego.c:161: for(u8 i=0;i<2;i++){
   5D02 0C            [ 4]  441 	inc	c
   5D03 18 E7         [12]  442 	jr	00115$
                            443 ;src/juego/juego.c:166: void comprobarMovimiento(){
                            444 ;	---------------------------------
                            445 ; Function comprobarMovimiento
                            446 ; ---------------------------------
   5D05                     447 _comprobarMovimiento::
                            448 ;src/juego/juego.c:167: if(player.cronoMovimiento==0){
   5D05 3A B8 61      [13]  449 	ld	a, (#(_player + 0x0005) + 0)
   5D08 B7            [ 4]  450 	or	a, a
   5D09 20 05         [12]  451 	jr	NZ,00102$
                            452 ;src/juego/juego.c:168: movimientoGuardado=mover_SinMovimiento;
   5D0B 21 B2 61      [10]  453 	ld	hl,#_movimientoGuardado + 0
   5D0E 36 00         [10]  454 	ld	(hl), #0x00
   5D10                     455 00102$:
                            456 ;src/juego/juego.c:170: if(movimientoPlayer()!=mover_SinMovimiento){
   5D10 CD 76 5D      [17]  457 	call	_movimientoPlayer
   5D13 7D            [ 4]  458 	ld	a, l
   5D14 B7            [ 4]  459 	or	a, a
   5D15 C8            [11]  460 	ret	Z
                            461 ;src/juego/juego.c:171: movimientoGuardado=movimientoPlayer();
   5D16 CD 76 5D      [17]  462 	call	_movimientoPlayer
   5D19 FD 21 B2 61   [14]  463 	ld	iy, #_movimientoGuardado
   5D1D FD 75 00      [19]  464 	ld	0 (iy), l
   5D20 C9            [10]  465 	ret
                            466 ;src/juego/juego.c:175: void resetGameobjects(){
                            467 ;	---------------------------------
                            468 ; Function resetGameobjects
                            469 ; ---------------------------------
   5D21                     470 _resetGameobjects::
                            471 ;src/juego/juego.c:176: posicion=posicion_Izquieda;
   5D21 21 E1 63      [10]  472 	ld	hl,#_posicion + 0
   5D24 36 00         [10]  473 	ld	(hl), #0x00
                            474 ;src/juego/juego.c:177: crearNivel();
   5D26 CD 4B 5D      [17]  475 	call	_crearNivel
                            476 ;src/juego/juego.c:178: createPlayer();
   5D29 CD C0 5B      [17]  477 	call	_createPlayer
                            478 ;src/juego/juego.c:179: createRocas();
   5D2C CD DA 5B      [17]  479 	call	_createRocas
                            480 ;src/juego/juego.c:180: createRocasEspejo();
   5D2F CD 0D 5C      [17]  481 	call	_createRocasEspejo
                            482 ;src/juego/juego.c:181: createPortal();
   5D32 CD 40 5C      [17]  483 	call	_createPortal
                            484 ;src/juego/juego.c:182: createPuerta();
   5D35 CD 5F 5C      [17]  485 	call	_createPuerta
                            486 ;src/juego/juego.c:183: createHole();
   5D38 CD 74 5C      [17]  487 	call	_createHole
                            488 ;src/juego/juego.c:184: initGameobjest(portal,puertas);
   5D3B 21 A5 63      [10]  489 	ld	hl, #_puertas
   5D3E E5            [11]  490 	push	hl
   5D3F 21 99 63      [10]  491 	ld	hl, #_portal
   5D42 E5            [11]  492 	push	hl
   5D43 CD BF 4F      [17]  493 	call	_initGameobjest
   5D46 F1            [10]  494 	pop	af
   5D47 F1            [10]  495 	pop	af
                            496 ;src/juego/juego.c:185: dibujarGameObjects();  
   5D48 C3 8E 5C      [10]  497 	jp  _dibujarGameObjects
                            498 	.area _CODE
                            499 	.area _INITIALIZER
                            500 	.area _CABS (ABS)
