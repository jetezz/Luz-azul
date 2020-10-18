                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module niveles
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _crearMapa
                             12 	.globl _cpct_drawSolidBox
                             13 	.globl _initNiveles
                             14 	.globl _crearNivel
                             15 	.globl _resetLevel
                             16 	.globl _limpiarPantalla
                             17 	.globl _createMarco
                             18 	.globl _createPlayer
                             19 	.globl _createRoca
                             20 	.globl _createRocaEspejo
                             21 	.globl _createPuerta
                             22 	.globl _createPortal
                             23 	.globl _createHoleIzquierda
                             24 	.globl _createHoleDerecha
                             25 	.globl _createColeccionabeLuz
                             26 	.globl _createColeccionabeFamilia
                             27 	.globl _createColeccionabeAmstr
                             28 	.globl _crearNivel1
                             29 	.globl _crearNivel01_01
                             30 	.globl _crearNivel2
                             31 	.globl _crearNivelTRAP01
                             32 	.globl _crearNievel3
                             33 	.globl _crearNievel4
                             34 	.globl _crearNievel4_01
                             35 	.globl _crearNievel5
                             36 	.globl _crearNievel6
                             37 	.globl _crearNievel7
                             38 ;--------------------------------------------------------
                             39 ; special function registers
                             40 ;--------------------------------------------------------
                             41 ;--------------------------------------------------------
                             42 ; ram data
                             43 ;--------------------------------------------------------
                             44 	.area _DATA
   B052                      45 _niveles:
   B052                      46 	.ds 100
   B0B6                      47 _contadorRocas:
   B0B6                      48 	.ds 1
   B0B7                      49 _contadorRocasEspejo:
   B0B7                      50 	.ds 1
   B0B8                      51 _contadorPuertas:
   B0B8                      52 	.ds 1
   B0B9                      53 _contadorColeccionables:
   B0B9                      54 	.ds 1
   B0BA                      55 _P_colList2:
   B0BA                      56 	.ds 2
                             57 ;--------------------------------------------------------
                             58 ; ram data
                             59 ;--------------------------------------------------------
                             60 	.area _INITIALIZED
                             61 ;--------------------------------------------------------
                             62 ; absolute external ram data
                             63 ;--------------------------------------------------------
                             64 	.area _DABS (ABS)
                             65 ;--------------------------------------------------------
                             66 ; global & static initialisations
                             67 ;--------------------------------------------------------
                             68 	.area _HOME
                             69 	.area _GSINIT
                             70 	.area _GSFINAL
                             71 	.area _GSINIT
                             72 ;--------------------------------------------------------
                             73 ; Home
                             74 ;--------------------------------------------------------
                             75 	.area _HOME
                             76 	.area _HOME
                             77 ;--------------------------------------------------------
                             78 ; code
                             79 ;--------------------------------------------------------
                             80 	.area _CODE
                             81 ;src/niveles/niveles.c:9: void initNiveles(u8* collist){
                             82 ;	---------------------------------
                             83 ; Function initNiveles
                             84 ; ---------------------------------
   736A                      85 _initNiveles::
                             86 ;src/niveles/niveles.c:11: niveles[nivel_01]=crearNivel1;
   736A 21 EB 79      [10]   87 	ld	hl, #_crearNivel1
   736D 22 54 B0      [16]   88 	ld	((_niveles + 0x0002)), hl
                             89 ;src/niveles/niveles.c:12: niveles[nivel_01_01]=crearNivel01_01;    
   7370 21 E5 7C      [10]   90 	ld	hl, #_crearNivel01_01
   7373 22 56 B0      [16]   91 	ld	((_niveles + 0x0004)), hl
                             92 ;src/niveles/niveles.c:13: niveles[nivel_02]=crearNivel2;
   7376 21 E6 7C      [10]   93 	ld	hl, #_crearNivel2
   7379 22 5A B0      [16]   94 	ld	((_niveles + 0x0008)), hl
                             95 ;src/niveles/niveles.c:14: niveles[nivel_TRAP_01]=crearNivelTRAP01;  
   737C 21 E7 7C      [10]   96 	ld	hl, #_crearNivelTRAP01
   737F 22 58 B0      [16]   97 	ld	((_niveles + 0x0006)), hl
                             98 ;src/niveles/niveles.c:15: niveles[nivel_03]=crearNievel3;
   7382 21 72 80      [10]   99 	ld	hl, #_crearNievel3
   7385 22 5C B0      [16]  100 	ld	((_niveles + 0x000a)), hl
                            101 ;src/niveles/niveles.c:16: niveles[nivel_04]=crearNievel4;
   7388 21 94 83      [10]  102 	ld	hl, #_crearNievel4
   738B 22 5E B0      [16]  103 	ld	((_niveles + 0x000c)), hl
                            104 ;src/niveles/niveles.c:17: niveles[nivel_04_01]=crearNievel4_01;
   738E 21 FA 86      [10]  105 	ld	hl, #_crearNievel4_01
   7391 22 60 B0      [16]  106 	ld	((_niveles + 0x000e)), hl
                            107 ;src/niveles/niveles.c:18: niveles[nivel_05]=crearNievel5;
   7394 21 1A 8B      [10]  108 	ld	hl, #_crearNievel5
   7397 22 62 B0      [16]  109 	ld	((_niveles + 0x0010)), hl
                            110 ;src/niveles/niveles.c:19: niveles[nivel_06]=crearNievel6;
   739A 21 ED 90      [10]  111 	ld	hl, #_crearNievel6
   739D 22 64 B0      [16]  112 	ld	((_niveles + 0x0012)), hl
                            113 ;src/niveles/niveles.c:20: niveles[nivel_07]=crearNievel7;
   73A0 21 8C 96      [10]  114 	ld	hl, #_crearNievel7
   73A3 22 66 B0      [16]  115 	ld	((_niveles + 0x0014)), hl
                            116 ;src/niveles/niveles.c:25: P_colList2=collist;
   73A6 21 02 00      [10]  117 	ld	hl, #2+0
   73A9 39            [11]  118 	add	hl, sp
   73AA 7E            [ 7]  119 	ld	a, (hl)
   73AB 32 BA B0      [13]  120 	ld	(#_P_colList2 + 0),a
   73AE 21 03 00      [10]  121 	ld	hl, #2+1
   73B1 39            [11]  122 	add	hl, sp
   73B2 7E            [ 7]  123 	ld	a, (hl)
   73B3 32 BB B0      [13]  124 	ld	(#_P_colList2 + 1),a
                            125 ;src/niveles/niveles.c:26: contadorRocas=0;
   73B6 21 B6 B0      [10]  126 	ld	hl,#_contadorRocas + 0
   73B9 36 00         [10]  127 	ld	(hl), #0x00
                            128 ;src/niveles/niveles.c:27: contadorRocasEspejo=0;
   73BB 21 B7 B0      [10]  129 	ld	hl,#_contadorRocasEspejo + 0
   73BE 36 00         [10]  130 	ld	(hl), #0x00
                            131 ;src/niveles/niveles.c:28: contadorPuertas=0;
   73C0 21 B8 B0      [10]  132 	ld	hl,#_contadorPuertas + 0
   73C3 36 00         [10]  133 	ld	(hl), #0x00
                            134 ;src/niveles/niveles.c:29: contadorColeccionables=0;
   73C5 21 B9 B0      [10]  135 	ld	hl,#_contadorColeccionables + 0
   73C8 36 00         [10]  136 	ld	(hl), #0x00
   73CA C9            [10]  137 	ret
                            138 ;src/niveles/niveles.c:33: void crearNivel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables,u8* posicion,u8 nivel){
                            139 ;	---------------------------------
                            140 ; Function crearNivel
                            141 ; ---------------------------------
   73CB                     142 _crearNivel::
   73CB DD E5         [15]  143 	push	ix
   73CD DD 21 00 00   [14]  144 	ld	ix,#0
   73D1 DD 39         [15]  145 	add	ix,sp
                            146 ;src/niveles/niveles.c:34: limpiarPantalla();
   73D3 CD FC 74      [17]  147 	call	_limpiarPantalla
                            148 ;src/niveles/niveles.c:35: resetLevel(player,rocas,rocasEspejo,puertas,portales,coleccionables);    
   73D6 DD 6E 0E      [19]  149 	ld	l,14 (ix)
   73D9 DD 66 0F      [19]  150 	ld	h,15 (ix)
   73DC E5            [11]  151 	push	hl
   73DD DD 6E 0C      [19]  152 	ld	l,12 (ix)
   73E0 DD 66 0D      [19]  153 	ld	h,13 (ix)
   73E3 E5            [11]  154 	push	hl
   73E4 DD 6E 0A      [19]  155 	ld	l,10 (ix)
   73E7 DD 66 0B      [19]  156 	ld	h,11 (ix)
   73EA E5            [11]  157 	push	hl
   73EB DD 6E 08      [19]  158 	ld	l,8 (ix)
   73EE DD 66 09      [19]  159 	ld	h,9 (ix)
   73F1 E5            [11]  160 	push	hl
   73F2 DD 6E 06      [19]  161 	ld	l,6 (ix)
   73F5 DD 66 07      [19]  162 	ld	h,7 (ix)
   73F8 E5            [11]  163 	push	hl
   73F9 DD 6E 04      [19]  164 	ld	l,4 (ix)
   73FC DD 66 05      [19]  165 	ld	h,5 (ix)
   73FF E5            [11]  166 	push	hl
   7400 CD 52 74      [17]  167 	call	_resetLevel
   7403 21 0C 00      [10]  168 	ld	hl, #12
   7406 39            [11]  169 	add	hl, sp
   7407 F9            [ 6]  170 	ld	sp, hl
                            171 ;src/niveles/niveles.c:36: niveles[nivel](player,rocas,rocasEspejo,puertas,portales,coleccionables,posicion);
   7408 01 52 B0      [10]  172 	ld	bc, #_niveles+0
   740B DD 6E 12      [19]  173 	ld	l, 18 (ix)
   740E 26 00         [ 7]  174 	ld	h, #0x00
   7410 29            [11]  175 	add	hl, hl
   7411 09            [11]  176 	add	hl, bc
   7412 4E            [ 7]  177 	ld	c, (hl)
   7413 23            [ 6]  178 	inc	hl
   7414 66            [ 7]  179 	ld	h, (hl)
   7415 DD 5E 10      [19]  180 	ld	e,16 (ix)
   7418 DD 56 11      [19]  181 	ld	d,17 (ix)
   741B D5            [11]  182 	push	de
   741C DD 5E 0E      [19]  183 	ld	e,14 (ix)
   741F DD 56 0F      [19]  184 	ld	d,15 (ix)
   7422 D5            [11]  185 	push	de
   7423 DD 5E 0C      [19]  186 	ld	e,12 (ix)
   7426 DD 56 0D      [19]  187 	ld	d,13 (ix)
   7429 D5            [11]  188 	push	de
   742A DD 5E 0A      [19]  189 	ld	e,10 (ix)
   742D DD 56 0B      [19]  190 	ld	d,11 (ix)
   7430 D5            [11]  191 	push	de
   7431 DD 5E 08      [19]  192 	ld	e,8 (ix)
   7434 DD 56 09      [19]  193 	ld	d,9 (ix)
   7437 D5            [11]  194 	push	de
   7438 DD 5E 06      [19]  195 	ld	e,6 (ix)
   743B DD 56 07      [19]  196 	ld	d,7 (ix)
   743E D5            [11]  197 	push	de
   743F DD 5E 04      [19]  198 	ld	e,4 (ix)
   7442 DD 56 05      [19]  199 	ld	d,5 (ix)
   7445 D5            [11]  200 	push	de
   7446 69            [ 4]  201 	ld	l, c
   7447 CD CF A9      [17]  202 	call	___sdcc_call_hl
   744A 21 0E 00      [10]  203 	ld	hl, #14
   744D 39            [11]  204 	add	hl, sp
   744E F9            [ 6]  205 	ld	sp, hl
   744F DD E1         [14]  206 	pop	ix
   7451 C9            [10]  207 	ret
                            208 ;src/niveles/niveles.c:40: void resetLevel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables){
                            209 ;	---------------------------------
                            210 ; Function resetLevel
                            211 ; ---------------------------------
   7452                     212 _resetLevel::
   7452 DD E5         [15]  213 	push	ix
   7454 DD 21 00 00   [14]  214 	ld	ix,#0
   7458 DD 39         [15]  215 	add	ix,sp
                            216 ;src/niveles/niveles.c:41: player->posx=0;
   745A DD 4E 04      [19]  217 	ld	c,4 (ix)
   745D DD 46 05      [19]  218 	ld	b,5 (ix)
   7460 03            [ 6]  219 	inc	bc
   7461 AF            [ 4]  220 	xor	a, a
   7462 02            [ 7]  221 	ld	(bc), a
                            222 ;src/niveles/niveles.c:42: for(u8 i =0;i<RocasMaximas;i++){
   7463 0E 00         [ 7]  223 	ld	c, #0x00
   7465                     224 00106$:
   7465 79            [ 4]  225 	ld	a, c
   7466 D6 28         [ 7]  226 	sub	a, #0x28
   7468 30 16         [12]  227 	jr	NC,00101$
                            228 ;src/niveles/niveles.c:43: rocas[i].posx=0; 
   746A 06 00         [ 7]  229 	ld	b,#0x00
   746C 69            [ 4]  230 	ld	l, c
   746D 60            [ 4]  231 	ld	h, b
   746E 29            [11]  232 	add	hl, hl
   746F 09            [11]  233 	add	hl, bc
   7470 29            [11]  234 	add	hl, hl
   7471 09            [11]  235 	add	hl, bc
   7472 EB            [ 4]  236 	ex	de,hl
   7473 DD 6E 06      [19]  237 	ld	l,6 (ix)
   7476 DD 66 07      [19]  238 	ld	h,7 (ix)
   7479 19            [11]  239 	add	hl, de
   747A 23            [ 6]  240 	inc	hl
   747B 36 00         [10]  241 	ld	(hl), #0x00
                            242 ;src/niveles/niveles.c:42: for(u8 i =0;i<RocasMaximas;i++){
   747D 0C            [ 4]  243 	inc	c
   747E 18 E5         [12]  244 	jr	00106$
   7480                     245 00101$:
                            246 ;src/niveles/niveles.c:45: for(u8 i =0;i<RocasMaximas;i++){
   7480 0E 00         [ 7]  247 	ld	c, #0x00
   7482                     248 00109$:
   7482 79            [ 4]  249 	ld	a, c
   7483 D6 28         [ 7]  250 	sub	a, #0x28
   7485 30 16         [12]  251 	jr	NC,00102$
                            252 ;src/niveles/niveles.c:46: rocasEspejo[i].posx=0; 
   7487 06 00         [ 7]  253 	ld	b,#0x00
   7489 69            [ 4]  254 	ld	l, c
   748A 60            [ 4]  255 	ld	h, b
   748B 29            [11]  256 	add	hl, hl
   748C 09            [11]  257 	add	hl, bc
   748D 29            [11]  258 	add	hl, hl
   748E 09            [11]  259 	add	hl, bc
   748F EB            [ 4]  260 	ex	de,hl
   7490 DD 6E 08      [19]  261 	ld	l,8 (ix)
   7493 DD 66 09      [19]  262 	ld	h,9 (ix)
   7496 19            [11]  263 	add	hl, de
   7497 23            [ 6]  264 	inc	hl
   7498 36 00         [10]  265 	ld	(hl), #0x00
                            266 ;src/niveles/niveles.c:45: for(u8 i =0;i<RocasMaximas;i++){
   749A 0C            [ 4]  267 	inc	c
   749B 18 E5         [12]  268 	jr	00109$
   749D                     269 00102$:
                            270 ;src/niveles/niveles.c:48: for(u8 i =0;i<PuertasMaximas;i++){
   749D 0E 00         [ 7]  271 	ld	c, #0x00
   749F                     272 00112$:
   749F 79            [ 4]  273 	ld	a, c
   74A0 D6 06         [ 7]  274 	sub	a, #0x06
   74A2 30 16         [12]  275 	jr	NC,00103$
                            276 ;src/niveles/niveles.c:49: puertas[i].posx=0; 
   74A4 06 00         [ 7]  277 	ld	b,#0x00
   74A6 69            [ 4]  278 	ld	l, c
   74A7 60            [ 4]  279 	ld	h, b
   74A8 29            [11]  280 	add	hl, hl
   74A9 09            [11]  281 	add	hl, bc
   74AA 29            [11]  282 	add	hl, hl
   74AB 09            [11]  283 	add	hl, bc
   74AC EB            [ 4]  284 	ex	de,hl
   74AD DD 6E 0A      [19]  285 	ld	l,10 (ix)
   74B0 DD 66 0B      [19]  286 	ld	h,11 (ix)
   74B3 19            [11]  287 	add	hl, de
   74B4 23            [ 6]  288 	inc	hl
   74B5 36 00         [10]  289 	ld	(hl), #0x00
                            290 ;src/niveles/niveles.c:48: for(u8 i =0;i<PuertasMaximas;i++){
   74B7 0C            [ 4]  291 	inc	c
   74B8 18 E5         [12]  292 	jr	00112$
   74BA                     293 00103$:
                            294 ;src/niveles/niveles.c:51: portales[0].posx=0;
   74BA DD 4E 0C      [19]  295 	ld	c,12 (ix)
   74BD DD 46 0D      [19]  296 	ld	b,13 (ix)
   74C0 59            [ 4]  297 	ld	e, c
   74C1 50            [ 4]  298 	ld	d, b
   74C2 13            [ 6]  299 	inc	de
   74C3 AF            [ 4]  300 	xor	a, a
   74C4 12            [ 7]  301 	ld	(de), a
                            302 ;src/niveles/niveles.c:52: portales[1].posx=0;
   74C5 21 08 00      [10]  303 	ld	hl, #0x0008
   74C8 09            [11]  304 	add	hl, bc
   74C9 36 00         [10]  305 	ld	(hl), #0x00
                            306 ;src/niveles/niveles.c:54: for(u8 i =0;i<ColeccionablesMaximos;i++){
   74CB 0E 00         [ 7]  307 	ld	c, #0x00
   74CD                     308 00115$:
   74CD 79            [ 4]  309 	ld	a, c
   74CE D6 03         [ 7]  310 	sub	a, #0x03
   74D0 30 13         [12]  311 	jr	NC,00104$
                            312 ;src/niveles/niveles.c:55: coleccionables[i].posx=0; 
   74D2 69            [ 4]  313 	ld	l, c
   74D3 26 00         [ 7]  314 	ld	h, #0x00
   74D5 29            [11]  315 	add	hl, hl
   74D6 29            [11]  316 	add	hl, hl
   74D7 EB            [ 4]  317 	ex	de,hl
   74D8 DD 6E 0E      [19]  318 	ld	l,14 (ix)
   74DB DD 66 0F      [19]  319 	ld	h,15 (ix)
   74DE 19            [11]  320 	add	hl, de
   74DF 23            [ 6]  321 	inc	hl
   74E0 36 00         [10]  322 	ld	(hl), #0x00
                            323 ;src/niveles/niveles.c:54: for(u8 i =0;i<ColeccionablesMaximos;i++){
   74E2 0C            [ 4]  324 	inc	c
   74E3 18 E8         [12]  325 	jr	00115$
   74E5                     326 00104$:
                            327 ;src/niveles/niveles.c:58: contadorRocas=0;
   74E5 21 B6 B0      [10]  328 	ld	hl,#_contadorRocas + 0
   74E8 36 00         [10]  329 	ld	(hl), #0x00
                            330 ;src/niveles/niveles.c:59: contadorRocasEspejo=0;
   74EA 21 B7 B0      [10]  331 	ld	hl,#_contadorRocasEspejo + 0
   74ED 36 00         [10]  332 	ld	(hl), #0x00
                            333 ;src/niveles/niveles.c:60: contadorPuertas=0;
   74EF 21 B8 B0      [10]  334 	ld	hl,#_contadorPuertas + 0
   74F2 36 00         [10]  335 	ld	(hl), #0x00
                            336 ;src/niveles/niveles.c:61: contadorColeccionables=0;
   74F4 21 B9 B0      [10]  337 	ld	hl,#_contadorColeccionables + 0
   74F7 36 00         [10]  338 	ld	(hl), #0x00
   74F9 DD E1         [14]  339 	pop	ix
   74FB C9            [10]  340 	ret
                            341 ;src/niveles/niveles.c:63: void limpiarPantalla(){
                            342 ;	---------------------------------
                            343 ; Function limpiarPantalla
                            344 ; ---------------------------------
   74FC                     345 _limpiarPantalla::
                            346 ;src/niveles/niveles.c:64: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 0, 0),0x00,36,144);
   74FC 21 24 90      [10]  347 	ld	hl, #0x9024
   74FF E5            [11]  348 	push	hl
   7500 21 00 00      [10]  349 	ld	hl, #0x0000
   7503 E5            [11]  350 	push	hl
   7504 26 C0         [ 7]  351 	ld	h, #0xc0
   7506 E5            [11]  352 	push	hl
   7507 CD F6 A9      [17]  353 	call	_cpct_drawSolidBox
                            354 ;src/niveles/niveles.c:65: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 36, 0),0x00,33,144);
   750A 21 21 90      [10]  355 	ld	hl, #0x9021
   750D E5            [11]  356 	push	hl
   750E 21 00 00      [10]  357 	ld	hl, #0x0000
   7511 E5            [11]  358 	push	hl
   7512 21 24 C0      [10]  359 	ld	hl, #0xc024
   7515 E5            [11]  360 	push	hl
   7516 CD F6 A9      [17]  361 	call	_cpct_drawSolidBox
   7519 C9            [10]  362 	ret
                            363 ;src/niveles/niveles.c:69: void createMarco(u8 hay){
                            364 ;	---------------------------------
                            365 ; Function createMarco
                            366 ; ---------------------------------
   751A                     367 _createMarco::
                            368 ;src/niveles/niveles.c:70: if (hay==si){
   751A 21 02 00      [10]  369 	ld	hl, #2+0
   751D 39            [11]  370 	add	hl, sp
   751E 7E            [ 7]  371 	ld	a, (hl)
   751F B7            [ 4]  372 	or	a, a
   7520 C0            [11]  373 	ret	NZ
                            374 ;src/niveles/niveles.c:71: crearMapa(0);  
   7521 AF            [ 4]  375 	xor	a, a
   7522 F5            [11]  376 	push	af
   7523 33            [ 6]  377 	inc	sp
   7524 CD C9 6B      [17]  378 	call	_crearMapa
   7527 33            [ 6]  379 	inc	sp
   7528 C9            [10]  380 	ret
                            381 ;src/niveles/niveles.c:76: void createPlayer(TGameObject* player,u8 posx, u8 posy,u8* posicion){
                            382 ;	---------------------------------
                            383 ; Function createPlayer
                            384 ; ---------------------------------
   7529                     385 _createPlayer::
                            386 ;src/niveles/niveles.c:78: *posicion=posicion_Izquieda;
   7529 21 06 00      [10]  387 	ld	hl, #6
   752C 39            [11]  388 	add	hl, sp
   752D 4E            [ 7]  389 	ld	c, (hl)
   752E 23            [ 6]  390 	inc	hl
   752F 46            [ 7]  391 	ld	b, (hl)
                            392 ;src/niveles/niveles.c:77: if(posx<9){
   7530 21 04 00      [10]  393 	ld	hl, #4+0
   7533 39            [11]  394 	add	hl, sp
   7534 7E            [ 7]  395 	ld	a, (hl)
   7535 D6 09         [ 7]  396 	sub	a, #0x09
   7537 30 04         [12]  397 	jr	NC,00102$
                            398 ;src/niveles/niveles.c:78: *posicion=posicion_Izquieda;
   7539 AF            [ 4]  399 	xor	a, a
   753A 02            [ 7]  400 	ld	(bc), a
   753B 18 03         [12]  401 	jr	00103$
   753D                     402 00102$:
                            403 ;src/niveles/niveles.c:80: *posicion=posicion_Derecha;        
   753D 3E 01         [ 7]  404 	ld	a, #0x01
   753F 02            [ 7]  405 	ld	(bc), a
   7540                     406 00103$:
                            407 ;src/niveles/niveles.c:82: player->num=-1;
   7540 D1            [10]  408 	pop	de
   7541 C1            [10]  409 	pop	bc
   7542 C5            [11]  410 	push	bc
   7543 D5            [11]  411 	push	de
   7544 3E FF         [ 7]  412 	ld	a, #0xff
   7546 02            [ 7]  413 	ld	(bc), a
                            414 ;src/niveles/niveles.c:83: player->posx=posx;
   7547 59            [ 4]  415 	ld	e, c
   7548 50            [ 4]  416 	ld	d, b
   7549 13            [ 6]  417 	inc	de
   754A 21 04 00      [10]  418 	ld	hl, #4+0
   754D 39            [11]  419 	add	hl, sp
   754E 7E            [ 7]  420 	ld	a, (hl)
   754F 12            [ 7]  421 	ld	(de), a
                            422 ;src/niveles/niveles.c:84: player->posy=posy;   
   7550 59            [ 4]  423 	ld	e, c
   7551 50            [ 4]  424 	ld	d, b
   7552 13            [ 6]  425 	inc	de
   7553 13            [ 6]  426 	inc	de
   7554 21 05 00      [10]  427 	ld	hl, #5+0
   7557 39            [11]  428 	add	hl, sp
   7558 7E            [ 7]  429 	ld	a, (hl)
   7559 12            [ 7]  430 	ld	(de), a
                            431 ;src/niveles/niveles.c:85: player->sprite=sprite_Player;
   755A 69            [ 4]  432 	ld	l, c
   755B 60            [ 4]  433 	ld	h, b
   755C 23            [ 6]  434 	inc	hl
   755D 23            [ 6]  435 	inc	hl
   755E 23            [ 6]  436 	inc	hl
   755F 36 01         [10]  437 	ld	(hl), #0x01
                            438 ;src/niveles/niveles.c:86: player->movimiento=mover_1;
   7561 21 04 00      [10]  439 	ld	hl, #0x0004
   7564 09            [11]  440 	add	hl, bc
   7565 36 01         [10]  441 	ld	(hl), #0x01
   7567 C9            [10]  442 	ret
                            443 ;src/niveles/niveles.c:88: void createRoca(TGameObject* rocas,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria){
                            444 ;	---------------------------------
                            445 ; Function createRoca
                            446 ; ---------------------------------
   7568                     447 _createRoca::
   7568 DD E5         [15]  448 	push	ix
   756A DD 21 00 00   [14]  449 	ld	ix,#0
   756E DD 39         [15]  450 	add	ix,sp
                            451 ;src/niveles/niveles.c:89: rocas[contadorRocas].num=simetria;
   7570 ED 4B B6 B0   [20]  452 	ld	bc, (_contadorRocas)
   7574 06 00         [ 7]  453 	ld	b, #0x00
   7576 69            [ 4]  454 	ld	l, c
   7577 60            [ 4]  455 	ld	h, b
   7578 29            [11]  456 	add	hl, hl
   7579 09            [11]  457 	add	hl, bc
   757A 29            [11]  458 	add	hl, hl
   757B 09            [11]  459 	add	hl, bc
   757C 4D            [ 4]  460 	ld	c, l
   757D 44            [ 4]  461 	ld	b, h
   757E DD 6E 04      [19]  462 	ld	l,4 (ix)
   7581 DD 66 05      [19]  463 	ld	h,5 (ix)
   7584 09            [11]  464 	add	hl, bc
   7585 DD 7E 0A      [19]  465 	ld	a, 10 (ix)
   7588 77            [ 7]  466 	ld	(hl), a
                            467 ;src/niveles/niveles.c:90: rocas[contadorRocas].posx=posx;
   7589 ED 4B B6 B0   [20]  468 	ld	bc, (_contadorRocas)
   758D 06 00         [ 7]  469 	ld	b, #0x00
   758F 69            [ 4]  470 	ld	l, c
   7590 60            [ 4]  471 	ld	h, b
   7591 29            [11]  472 	add	hl, hl
   7592 09            [11]  473 	add	hl, bc
   7593 29            [11]  474 	add	hl, hl
   7594 09            [11]  475 	add	hl, bc
   7595 4D            [ 4]  476 	ld	c, l
   7596 44            [ 4]  477 	ld	b, h
   7597 DD 6E 04      [19]  478 	ld	l,4 (ix)
   759A DD 66 05      [19]  479 	ld	h,5 (ix)
   759D 09            [11]  480 	add	hl, bc
   759E 23            [ 6]  481 	inc	hl
   759F DD 7E 06      [19]  482 	ld	a, 6 (ix)
   75A2 77            [ 7]  483 	ld	(hl), a
                            484 ;src/niveles/niveles.c:91: rocas[contadorRocas].posy=posy;
   75A3 ED 4B B6 B0   [20]  485 	ld	bc, (_contadorRocas)
   75A7 06 00         [ 7]  486 	ld	b, #0x00
   75A9 69            [ 4]  487 	ld	l, c
   75AA 60            [ 4]  488 	ld	h, b
   75AB 29            [11]  489 	add	hl, hl
   75AC 09            [11]  490 	add	hl, bc
   75AD 29            [11]  491 	add	hl, hl
   75AE 09            [11]  492 	add	hl, bc
   75AF 4D            [ 4]  493 	ld	c, l
   75B0 44            [ 4]  494 	ld	b, h
   75B1 DD 6E 04      [19]  495 	ld	l,4 (ix)
   75B4 DD 66 05      [19]  496 	ld	h,5 (ix)
   75B7 09            [11]  497 	add	hl, bc
   75B8 23            [ 6]  498 	inc	hl
   75B9 23            [ 6]  499 	inc	hl
   75BA DD 7E 07      [19]  500 	ld	a, 7 (ix)
   75BD 77            [ 7]  501 	ld	(hl), a
                            502 ;src/niveles/niveles.c:92: rocas[contadorRocas].sprite=sprite;
   75BE ED 4B B6 B0   [20]  503 	ld	bc, (_contadorRocas)
   75C2 06 00         [ 7]  504 	ld	b, #0x00
   75C4 69            [ 4]  505 	ld	l, c
   75C5 60            [ 4]  506 	ld	h, b
   75C6 29            [11]  507 	add	hl, hl
   75C7 09            [11]  508 	add	hl, bc
   75C8 29            [11]  509 	add	hl, hl
   75C9 09            [11]  510 	add	hl, bc
   75CA 4D            [ 4]  511 	ld	c, l
   75CB 44            [ 4]  512 	ld	b, h
   75CC DD 6E 04      [19]  513 	ld	l,4 (ix)
   75CF DD 66 05      [19]  514 	ld	h,5 (ix)
   75D2 09            [11]  515 	add	hl, bc
   75D3 23            [ 6]  516 	inc	hl
   75D4 23            [ 6]  517 	inc	hl
   75D5 23            [ 6]  518 	inc	hl
   75D6 DD 7E 09      [19]  519 	ld	a, 9 (ix)
   75D9 77            [ 7]  520 	ld	(hl), a
                            521 ;src/niveles/niveles.c:93: rocas[contadorRocas].movimiento=mivimiento;
   75DA ED 4B B6 B0   [20]  522 	ld	bc, (_contadorRocas)
   75DE 06 00         [ 7]  523 	ld	b, #0x00
   75E0 69            [ 4]  524 	ld	l, c
   75E1 60            [ 4]  525 	ld	h, b
   75E2 29            [11]  526 	add	hl, hl
   75E3 09            [11]  527 	add	hl, bc
   75E4 29            [11]  528 	add	hl, hl
   75E5 09            [11]  529 	add	hl, bc
   75E6 4D            [ 4]  530 	ld	c, l
   75E7 44            [ 4]  531 	ld	b, h
   75E8 DD 6E 04      [19]  532 	ld	l,4 (ix)
   75EB DD 66 05      [19]  533 	ld	h,5 (ix)
   75EE 09            [11]  534 	add	hl, bc
   75EF 01 04 00      [10]  535 	ld	bc, #0x0004
   75F2 09            [11]  536 	add	hl, bc
   75F3 DD 7E 08      [19]  537 	ld	a, 8 (ix)
   75F6 77            [ 7]  538 	ld	(hl), a
                            539 ;src/niveles/niveles.c:94: contadorRocas++;    
   75F7 21 B6 B0      [10]  540 	ld	hl, #_contadorRocas+0
   75FA 34            [11]  541 	inc	(hl)
   75FB DD E1         [14]  542 	pop	ix
   75FD C9            [10]  543 	ret
                            544 ;src/niveles/niveles.c:96: void createRocaEspejo(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria){
                            545 ;	---------------------------------
                            546 ; Function createRocaEspejo
                            547 ; ---------------------------------
   75FE                     548 _createRocaEspejo::
   75FE DD E5         [15]  549 	push	ix
   7600 DD 21 00 00   [14]  550 	ld	ix,#0
   7604 DD 39         [15]  551 	add	ix,sp
                            552 ;src/niveles/niveles.c:97: rocasEspejo[contadorRocasEspejo].num=simetria;
   7606 ED 4B B7 B0   [20]  553 	ld	bc, (_contadorRocasEspejo)
   760A 06 00         [ 7]  554 	ld	b, #0x00
   760C 69            [ 4]  555 	ld	l, c
   760D 60            [ 4]  556 	ld	h, b
   760E 29            [11]  557 	add	hl, hl
   760F 09            [11]  558 	add	hl, bc
   7610 29            [11]  559 	add	hl, hl
   7611 09            [11]  560 	add	hl, bc
   7612 4D            [ 4]  561 	ld	c, l
   7613 44            [ 4]  562 	ld	b, h
   7614 DD 6E 04      [19]  563 	ld	l,4 (ix)
   7617 DD 66 05      [19]  564 	ld	h,5 (ix)
   761A 09            [11]  565 	add	hl, bc
   761B DD 7E 0A      [19]  566 	ld	a, 10 (ix)
   761E 77            [ 7]  567 	ld	(hl), a
                            568 ;src/niveles/niveles.c:98: rocasEspejo[contadorRocasEspejo].posx=posx;
   761F ED 4B B7 B0   [20]  569 	ld	bc, (_contadorRocasEspejo)
   7623 06 00         [ 7]  570 	ld	b, #0x00
   7625 69            [ 4]  571 	ld	l, c
   7626 60            [ 4]  572 	ld	h, b
   7627 29            [11]  573 	add	hl, hl
   7628 09            [11]  574 	add	hl, bc
   7629 29            [11]  575 	add	hl, hl
   762A 09            [11]  576 	add	hl, bc
   762B 4D            [ 4]  577 	ld	c, l
   762C 44            [ 4]  578 	ld	b, h
   762D DD 6E 04      [19]  579 	ld	l,4 (ix)
   7630 DD 66 05      [19]  580 	ld	h,5 (ix)
   7633 09            [11]  581 	add	hl, bc
   7634 23            [ 6]  582 	inc	hl
   7635 DD 7E 06      [19]  583 	ld	a, 6 (ix)
   7638 77            [ 7]  584 	ld	(hl), a
                            585 ;src/niveles/niveles.c:99: rocasEspejo[contadorRocasEspejo].posy=posy;
   7639 ED 4B B7 B0   [20]  586 	ld	bc, (_contadorRocasEspejo)
   763D 06 00         [ 7]  587 	ld	b, #0x00
   763F 69            [ 4]  588 	ld	l, c
   7640 60            [ 4]  589 	ld	h, b
   7641 29            [11]  590 	add	hl, hl
   7642 09            [11]  591 	add	hl, bc
   7643 29            [11]  592 	add	hl, hl
   7644 09            [11]  593 	add	hl, bc
   7645 4D            [ 4]  594 	ld	c, l
   7646 44            [ 4]  595 	ld	b, h
   7647 DD 6E 04      [19]  596 	ld	l,4 (ix)
   764A DD 66 05      [19]  597 	ld	h,5 (ix)
   764D 09            [11]  598 	add	hl, bc
   764E 23            [ 6]  599 	inc	hl
   764F 23            [ 6]  600 	inc	hl
   7650 DD 7E 07      [19]  601 	ld	a, 7 (ix)
   7653 77            [ 7]  602 	ld	(hl), a
                            603 ;src/niveles/niveles.c:100: rocasEspejo[contadorRocasEspejo].sprite=sprite;
   7654 ED 4B B7 B0   [20]  604 	ld	bc, (_contadorRocasEspejo)
   7658 06 00         [ 7]  605 	ld	b, #0x00
   765A 69            [ 4]  606 	ld	l, c
   765B 60            [ 4]  607 	ld	h, b
   765C 29            [11]  608 	add	hl, hl
   765D 09            [11]  609 	add	hl, bc
   765E 29            [11]  610 	add	hl, hl
   765F 09            [11]  611 	add	hl, bc
   7660 4D            [ 4]  612 	ld	c, l
   7661 44            [ 4]  613 	ld	b, h
   7662 DD 6E 04      [19]  614 	ld	l,4 (ix)
   7665 DD 66 05      [19]  615 	ld	h,5 (ix)
   7668 09            [11]  616 	add	hl, bc
   7669 23            [ 6]  617 	inc	hl
   766A 23            [ 6]  618 	inc	hl
   766B 23            [ 6]  619 	inc	hl
   766C DD 7E 09      [19]  620 	ld	a, 9 (ix)
   766F 77            [ 7]  621 	ld	(hl), a
                            622 ;src/niveles/niveles.c:101: rocasEspejo[contadorRocasEspejo].movimiento=mivimiento;
   7670 ED 4B B7 B0   [20]  623 	ld	bc, (_contadorRocasEspejo)
   7674 06 00         [ 7]  624 	ld	b, #0x00
   7676 69            [ 4]  625 	ld	l, c
   7677 60            [ 4]  626 	ld	h, b
   7678 29            [11]  627 	add	hl, hl
   7679 09            [11]  628 	add	hl, bc
   767A 29            [11]  629 	add	hl, hl
   767B 09            [11]  630 	add	hl, bc
   767C 4D            [ 4]  631 	ld	c, l
   767D 44            [ 4]  632 	ld	b, h
   767E DD 6E 04      [19]  633 	ld	l,4 (ix)
   7681 DD 66 05      [19]  634 	ld	h,5 (ix)
   7684 09            [11]  635 	add	hl, bc
   7685 01 04 00      [10]  636 	ld	bc, #0x0004
   7688 09            [11]  637 	add	hl, bc
   7689 DD 7E 08      [19]  638 	ld	a, 8 (ix)
   768C 77            [ 7]  639 	ld	(hl), a
                            640 ;src/niveles/niveles.c:102: contadorRocasEspejo++;
   768D 21 B7 B0      [10]  641 	ld	hl, #_contadorRocasEspejo+0
   7690 34            [11]  642 	inc	(hl)
   7691 DD E1         [14]  643 	pop	ix
   7693 C9            [10]  644 	ret
                            645 ;src/niveles/niveles.c:104: void createPuerta(TGameObject* puertas,u8 posx,u8 posy,u8 sprite,u8 nivel){
                            646 ;	---------------------------------
                            647 ; Function createPuerta
                            648 ; ---------------------------------
   7694                     649 _createPuerta::
   7694 DD E5         [15]  650 	push	ix
   7696 DD 21 00 00   [14]  651 	ld	ix,#0
   769A DD 39         [15]  652 	add	ix,sp
                            653 ;src/niveles/niveles.c:105: puertas[contadorPuertas].num=nivel;
   769C ED 4B B8 B0   [20]  654 	ld	bc, (_contadorPuertas)
   76A0 06 00         [ 7]  655 	ld	b, #0x00
   76A2 69            [ 4]  656 	ld	l, c
   76A3 60            [ 4]  657 	ld	h, b
   76A4 29            [11]  658 	add	hl, hl
   76A5 09            [11]  659 	add	hl, bc
   76A6 29            [11]  660 	add	hl, hl
   76A7 09            [11]  661 	add	hl, bc
   76A8 4D            [ 4]  662 	ld	c, l
   76A9 44            [ 4]  663 	ld	b, h
   76AA DD 6E 04      [19]  664 	ld	l,4 (ix)
   76AD DD 66 05      [19]  665 	ld	h,5 (ix)
   76B0 09            [11]  666 	add	hl, bc
   76B1 DD 7E 09      [19]  667 	ld	a, 9 (ix)
   76B4 77            [ 7]  668 	ld	(hl), a
                            669 ;src/niveles/niveles.c:106: puertas[contadorPuertas].posx=posx;
   76B5 ED 4B B8 B0   [20]  670 	ld	bc, (_contadorPuertas)
   76B9 06 00         [ 7]  671 	ld	b, #0x00
   76BB 69            [ 4]  672 	ld	l, c
   76BC 60            [ 4]  673 	ld	h, b
   76BD 29            [11]  674 	add	hl, hl
   76BE 09            [11]  675 	add	hl, bc
   76BF 29            [11]  676 	add	hl, hl
   76C0 09            [11]  677 	add	hl, bc
   76C1 4D            [ 4]  678 	ld	c, l
   76C2 44            [ 4]  679 	ld	b, h
   76C3 DD 6E 04      [19]  680 	ld	l,4 (ix)
   76C6 DD 66 05      [19]  681 	ld	h,5 (ix)
   76C9 09            [11]  682 	add	hl, bc
   76CA 23            [ 6]  683 	inc	hl
   76CB DD 7E 06      [19]  684 	ld	a, 6 (ix)
   76CE 77            [ 7]  685 	ld	(hl), a
                            686 ;src/niveles/niveles.c:107: puertas[contadorPuertas].posy=posy;
   76CF ED 4B B8 B0   [20]  687 	ld	bc, (_contadorPuertas)
   76D3 06 00         [ 7]  688 	ld	b, #0x00
   76D5 69            [ 4]  689 	ld	l, c
   76D6 60            [ 4]  690 	ld	h, b
   76D7 29            [11]  691 	add	hl, hl
   76D8 09            [11]  692 	add	hl, bc
   76D9 29            [11]  693 	add	hl, hl
   76DA 09            [11]  694 	add	hl, bc
   76DB 4D            [ 4]  695 	ld	c, l
   76DC 44            [ 4]  696 	ld	b, h
   76DD DD 6E 04      [19]  697 	ld	l,4 (ix)
   76E0 DD 66 05      [19]  698 	ld	h,5 (ix)
   76E3 09            [11]  699 	add	hl, bc
   76E4 23            [ 6]  700 	inc	hl
   76E5 23            [ 6]  701 	inc	hl
   76E6 DD 7E 07      [19]  702 	ld	a, 7 (ix)
   76E9 77            [ 7]  703 	ld	(hl), a
                            704 ;src/niveles/niveles.c:108: puertas[contadorPuertas].sprite=sprite;
   76EA ED 4B B8 B0   [20]  705 	ld	bc, (_contadorPuertas)
   76EE 06 00         [ 7]  706 	ld	b, #0x00
   76F0 69            [ 4]  707 	ld	l, c
   76F1 60            [ 4]  708 	ld	h, b
   76F2 29            [11]  709 	add	hl, hl
   76F3 09            [11]  710 	add	hl, bc
   76F4 29            [11]  711 	add	hl, hl
   76F5 09            [11]  712 	add	hl, bc
   76F6 4D            [ 4]  713 	ld	c, l
   76F7 44            [ 4]  714 	ld	b, h
   76F8 DD 6E 04      [19]  715 	ld	l,4 (ix)
   76FB DD 66 05      [19]  716 	ld	h,5 (ix)
   76FE 09            [11]  717 	add	hl, bc
   76FF 23            [ 6]  718 	inc	hl
   7700 23            [ 6]  719 	inc	hl
   7701 23            [ 6]  720 	inc	hl
   7702 DD 7E 08      [19]  721 	ld	a, 8 (ix)
   7705 77            [ 7]  722 	ld	(hl), a
                            723 ;src/niveles/niveles.c:109: contadorPuertas++;
   7706 21 B8 B0      [10]  724 	ld	hl, #_contadorPuertas+0
   7709 34            [11]  725 	inc	(hl)
   770A DD E1         [14]  726 	pop	ix
   770C C9            [10]  727 	ret
                            728 ;src/niveles/niveles.c:111: void createPortal(TGameObject* portal,TGameObject* roca,TGameObject* rocasEspejo,u8 hay){
                            729 ;	---------------------------------
                            730 ; Function createPortal
                            731 ; ---------------------------------
   770D                     732 _createPortal::
                            733 ;src/niveles/niveles.c:112: if(hay==si){
   770D 21 08 00      [10]  734 	ld	hl, #8+0
   7710 39            [11]  735 	add	hl, sp
   7711 7E            [ 7]  736 	ld	a, (hl)
   7712 B7            [ 4]  737 	or	a, a
   7713 C0            [11]  738 	ret	NZ
                            739 ;src/niveles/niveles.c:113: portal[0].posx=7;
   7714 D1            [10]  740 	pop	de
   7715 C1            [10]  741 	pop	bc
   7716 C5            [11]  742 	push	bc
   7717 D5            [11]  743 	push	de
   7718 69            [ 4]  744 	ld	l, c
   7719 60            [ 4]  745 	ld	h, b
   771A 23            [ 6]  746 	inc	hl
   771B 36 07         [10]  747 	ld	(hl), #0x07
                            748 ;src/niveles/niveles.c:114: portal[0].posy=4;
   771D 69            [ 4]  749 	ld	l, c
   771E 60            [ 4]  750 	ld	h, b
   771F 23            [ 6]  751 	inc	hl
   7720 23            [ 6]  752 	inc	hl
   7721 36 04         [10]  753 	ld	(hl), #0x04
                            754 ;src/niveles/niveles.c:115: portal[0].sprite=sprite_PuertaPortal_G;
   7723 69            [ 4]  755 	ld	l, c
   7724 60            [ 4]  756 	ld	h, b
   7725 23            [ 6]  757 	inc	hl
   7726 23            [ 6]  758 	inc	hl
   7727 23            [ 6]  759 	inc	hl
   7728 36 1A         [10]  760 	ld	(hl), #0x1a
                            761 ;src/niveles/niveles.c:117: portal[1].posx=9;
   772A 21 08 00      [10]  762 	ld	hl, #0x0008
   772D 09            [11]  763 	add	hl, bc
   772E 36 09         [10]  764 	ld	(hl), #0x09
                            765 ;src/niveles/niveles.c:118: portal[1].posy=4;
   7730 21 09 00      [10]  766 	ld	hl, #0x0009
   7733 09            [11]  767 	add	hl, bc
   7734 36 04         [10]  768 	ld	(hl), #0x04
                            769 ;src/niveles/niveles.c:119: portal[1].sprite=sprite_PuertaPortal_B;
   7736 21 0A 00      [10]  770 	ld	hl, #0x000a
   7739 09            [11]  771 	add	hl, bc
   773A 36 1B         [10]  772 	ld	(hl), #0x1b
                            773 ;src/niveles/niveles.c:120: createRoca(roca,8,4,sin_Movimiento,sprite_PortalMuro,1);
   773C 21 19 01      [10]  774 	ld	hl, #0x0119
   773F E5            [11]  775 	push	hl
   7740 21 04 00      [10]  776 	ld	hl, #0x0004
   7743 E5            [11]  777 	push	hl
   7744 3E 08         [ 7]  778 	ld	a, #0x08
   7746 F5            [11]  779 	push	af
   7747 33            [ 6]  780 	inc	sp
   7748 21 09 00      [10]  781 	ld	hl, #9
   774B 39            [11]  782 	add	hl, sp
   774C 4E            [ 7]  783 	ld	c, (hl)
   774D 23            [ 6]  784 	inc	hl
   774E 46            [ 7]  785 	ld	b, (hl)
   774F C5            [11]  786 	push	bc
   7750 CD 68 75      [17]  787 	call	_createRoca
   7753 21 07 00      [10]  788 	ld	hl, #7
   7756 39            [11]  789 	add	hl, sp
   7757 F9            [ 6]  790 	ld	sp, hl
   7758 C9            [10]  791 	ret
                            792 ;src/niveles/niveles.c:125: void createHoleIzquierda(TGameObject* rocas,u8 posx, u8 posy,u8 sprite, u8 simetria){
                            793 ;	---------------------------------
                            794 ; Function createHoleIzquierda
                            795 ; ---------------------------------
   7759                     796 _createHoleIzquierda::
   7759 DD E5         [15]  797 	push	ix
   775B DD 21 00 00   [14]  798 	ld	ix,#0
   775F DD 39         [15]  799 	add	ix,sp
                            800 ;src/niveles/niveles.c:126: rocas[contadorRocas].num=simetria;
   7761 ED 4B B6 B0   [20]  801 	ld	bc, (_contadorRocas)
   7765 06 00         [ 7]  802 	ld	b, #0x00
   7767 69            [ 4]  803 	ld	l, c
   7768 60            [ 4]  804 	ld	h, b
   7769 29            [11]  805 	add	hl, hl
   776A 09            [11]  806 	add	hl, bc
   776B 29            [11]  807 	add	hl, hl
   776C 09            [11]  808 	add	hl, bc
   776D 4D            [ 4]  809 	ld	c, l
   776E 44            [ 4]  810 	ld	b, h
   776F DD 6E 04      [19]  811 	ld	l,4 (ix)
   7772 DD 66 05      [19]  812 	ld	h,5 (ix)
   7775 09            [11]  813 	add	hl, bc
   7776 DD 7E 09      [19]  814 	ld	a, 9 (ix)
   7779 77            [ 7]  815 	ld	(hl), a
                            816 ;src/niveles/niveles.c:127: rocas[contadorRocas].posx=posx;
   777A ED 4B B6 B0   [20]  817 	ld	bc, (_contadorRocas)
   777E 06 00         [ 7]  818 	ld	b, #0x00
   7780 69            [ 4]  819 	ld	l, c
   7781 60            [ 4]  820 	ld	h, b
   7782 29            [11]  821 	add	hl, hl
   7783 09            [11]  822 	add	hl, bc
   7784 29            [11]  823 	add	hl, hl
   7785 09            [11]  824 	add	hl, bc
   7786 4D            [ 4]  825 	ld	c, l
   7787 44            [ 4]  826 	ld	b, h
   7788 DD 6E 04      [19]  827 	ld	l,4 (ix)
   778B DD 66 05      [19]  828 	ld	h,5 (ix)
   778E 09            [11]  829 	add	hl, bc
   778F 23            [ 6]  830 	inc	hl
   7790 DD 7E 06      [19]  831 	ld	a, 6 (ix)
   7793 77            [ 7]  832 	ld	(hl), a
                            833 ;src/niveles/niveles.c:128: rocas[contadorRocas].posy=posy;
   7794 ED 4B B6 B0   [20]  834 	ld	bc, (_contadorRocas)
   7798 06 00         [ 7]  835 	ld	b, #0x00
   779A 69            [ 4]  836 	ld	l, c
   779B 60            [ 4]  837 	ld	h, b
   779C 29            [11]  838 	add	hl, hl
   779D 09            [11]  839 	add	hl, bc
   779E 29            [11]  840 	add	hl, hl
   779F 09            [11]  841 	add	hl, bc
   77A0 4D            [ 4]  842 	ld	c, l
   77A1 44            [ 4]  843 	ld	b, h
   77A2 DD 6E 04      [19]  844 	ld	l,4 (ix)
   77A5 DD 66 05      [19]  845 	ld	h,5 (ix)
   77A8 09            [11]  846 	add	hl, bc
   77A9 23            [ 6]  847 	inc	hl
   77AA 23            [ 6]  848 	inc	hl
   77AB DD 7E 07      [19]  849 	ld	a, 7 (ix)
   77AE 77            [ 7]  850 	ld	(hl), a
                            851 ;src/niveles/niveles.c:129: rocas[contadorRocas].sprite=sprite;
   77AF ED 4B B6 B0   [20]  852 	ld	bc, (_contadorRocas)
   77B3 06 00         [ 7]  853 	ld	b, #0x00
   77B5 69            [ 4]  854 	ld	l, c
   77B6 60            [ 4]  855 	ld	h, b
   77B7 29            [11]  856 	add	hl, hl
   77B8 09            [11]  857 	add	hl, bc
   77B9 29            [11]  858 	add	hl, hl
   77BA 09            [11]  859 	add	hl, bc
   77BB 4D            [ 4]  860 	ld	c, l
   77BC 44            [ 4]  861 	ld	b, h
   77BD DD 6E 04      [19]  862 	ld	l,4 (ix)
   77C0 DD 66 05      [19]  863 	ld	h,5 (ix)
   77C3 09            [11]  864 	add	hl, bc
   77C4 23            [ 6]  865 	inc	hl
   77C5 23            [ 6]  866 	inc	hl
   77C6 23            [ 6]  867 	inc	hl
   77C7 DD 7E 08      [19]  868 	ld	a, 8 (ix)
   77CA 77            [ 7]  869 	ld	(hl), a
                            870 ;src/niveles/niveles.c:130: rocas[contadorRocas].movimiento=sin_Movimiento;
   77CB ED 4B B6 B0   [20]  871 	ld	bc, (_contadorRocas)
   77CF 06 00         [ 7]  872 	ld	b, #0x00
   77D1 69            [ 4]  873 	ld	l, c
   77D2 60            [ 4]  874 	ld	h, b
   77D3 29            [11]  875 	add	hl, hl
   77D4 09            [11]  876 	add	hl, bc
   77D5 29            [11]  877 	add	hl, hl
   77D6 09            [11]  878 	add	hl, bc
   77D7 4D            [ 4]  879 	ld	c, l
   77D8 44            [ 4]  880 	ld	b, h
   77D9 DD 6E 04      [19]  881 	ld	l,4 (ix)
   77DC DD 66 05      [19]  882 	ld	h,5 (ix)
   77DF 09            [11]  883 	add	hl, bc
   77E0 01 04 00      [10]  884 	ld	bc, #0x0004
   77E3 09            [11]  885 	add	hl, bc
   77E4 36 00         [10]  886 	ld	(hl), #0x00
                            887 ;src/niveles/niveles.c:131: contadorRocas++;
   77E6 21 B6 B0      [10]  888 	ld	hl, #_contadorRocas+0
   77E9 34            [11]  889 	inc	(hl)
   77EA DD E1         [14]  890 	pop	ix
   77EC C9            [10]  891 	ret
                            892 ;src/niveles/niveles.c:133: void createHoleDerecha(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 sprite, u8 simetria){
                            893 ;	---------------------------------
                            894 ; Function createHoleDerecha
                            895 ; ---------------------------------
   77ED                     896 _createHoleDerecha::
   77ED DD E5         [15]  897 	push	ix
   77EF DD 21 00 00   [14]  898 	ld	ix,#0
   77F3 DD 39         [15]  899 	add	ix,sp
                            900 ;src/niveles/niveles.c:134: rocasEspejo[contadorRocasEspejo].num=simetria;
   77F5 ED 4B B7 B0   [20]  901 	ld	bc, (_contadorRocasEspejo)
   77F9 06 00         [ 7]  902 	ld	b, #0x00
   77FB 69            [ 4]  903 	ld	l, c
   77FC 60            [ 4]  904 	ld	h, b
   77FD 29            [11]  905 	add	hl, hl
   77FE 09            [11]  906 	add	hl, bc
   77FF 29            [11]  907 	add	hl, hl
   7800 09            [11]  908 	add	hl, bc
   7801 4D            [ 4]  909 	ld	c, l
   7802 44            [ 4]  910 	ld	b, h
   7803 DD 6E 04      [19]  911 	ld	l,4 (ix)
   7806 DD 66 05      [19]  912 	ld	h,5 (ix)
   7809 09            [11]  913 	add	hl, bc
   780A DD 7E 09      [19]  914 	ld	a, 9 (ix)
   780D 77            [ 7]  915 	ld	(hl), a
                            916 ;src/niveles/niveles.c:135: rocasEspejo[contadorRocasEspejo].posx=posx;
   780E ED 4B B7 B0   [20]  917 	ld	bc, (_contadorRocasEspejo)
   7812 06 00         [ 7]  918 	ld	b, #0x00
   7814 69            [ 4]  919 	ld	l, c
   7815 60            [ 4]  920 	ld	h, b
   7816 29            [11]  921 	add	hl, hl
   7817 09            [11]  922 	add	hl, bc
   7818 29            [11]  923 	add	hl, hl
   7819 09            [11]  924 	add	hl, bc
   781A 4D            [ 4]  925 	ld	c, l
   781B 44            [ 4]  926 	ld	b, h
   781C DD 6E 04      [19]  927 	ld	l,4 (ix)
   781F DD 66 05      [19]  928 	ld	h,5 (ix)
   7822 09            [11]  929 	add	hl, bc
   7823 23            [ 6]  930 	inc	hl
   7824 DD 7E 06      [19]  931 	ld	a, 6 (ix)
   7827 77            [ 7]  932 	ld	(hl), a
                            933 ;src/niveles/niveles.c:136: rocasEspejo[contadorRocasEspejo].posy=posy;
   7828 ED 4B B7 B0   [20]  934 	ld	bc, (_contadorRocasEspejo)
   782C 06 00         [ 7]  935 	ld	b, #0x00
   782E 69            [ 4]  936 	ld	l, c
   782F 60            [ 4]  937 	ld	h, b
   7830 29            [11]  938 	add	hl, hl
   7831 09            [11]  939 	add	hl, bc
   7832 29            [11]  940 	add	hl, hl
   7833 09            [11]  941 	add	hl, bc
   7834 4D            [ 4]  942 	ld	c, l
   7835 44            [ 4]  943 	ld	b, h
   7836 DD 6E 04      [19]  944 	ld	l,4 (ix)
   7839 DD 66 05      [19]  945 	ld	h,5 (ix)
   783C 09            [11]  946 	add	hl, bc
   783D 23            [ 6]  947 	inc	hl
   783E 23            [ 6]  948 	inc	hl
   783F DD 7E 07      [19]  949 	ld	a, 7 (ix)
   7842 77            [ 7]  950 	ld	(hl), a
                            951 ;src/niveles/niveles.c:137: rocasEspejo[contadorRocasEspejo].sprite=sprite;
   7843 ED 4B B7 B0   [20]  952 	ld	bc, (_contadorRocasEspejo)
   7847 06 00         [ 7]  953 	ld	b, #0x00
   7849 69            [ 4]  954 	ld	l, c
   784A 60            [ 4]  955 	ld	h, b
   784B 29            [11]  956 	add	hl, hl
   784C 09            [11]  957 	add	hl, bc
   784D 29            [11]  958 	add	hl, hl
   784E 09            [11]  959 	add	hl, bc
   784F 4D            [ 4]  960 	ld	c, l
   7850 44            [ 4]  961 	ld	b, h
   7851 DD 6E 04      [19]  962 	ld	l,4 (ix)
   7854 DD 66 05      [19]  963 	ld	h,5 (ix)
   7857 09            [11]  964 	add	hl, bc
   7858 23            [ 6]  965 	inc	hl
   7859 23            [ 6]  966 	inc	hl
   785A 23            [ 6]  967 	inc	hl
   785B DD 7E 08      [19]  968 	ld	a, 8 (ix)
   785E 77            [ 7]  969 	ld	(hl), a
                            970 ;src/niveles/niveles.c:138: rocasEspejo[contadorRocasEspejo].movimiento=sin_Movimiento;
   785F ED 4B B7 B0   [20]  971 	ld	bc, (_contadorRocasEspejo)
   7863 06 00         [ 7]  972 	ld	b, #0x00
   7865 69            [ 4]  973 	ld	l, c
   7866 60            [ 4]  974 	ld	h, b
   7867 29            [11]  975 	add	hl, hl
   7868 09            [11]  976 	add	hl, bc
   7869 29            [11]  977 	add	hl, hl
   786A 09            [11]  978 	add	hl, bc
   786B 4D            [ 4]  979 	ld	c, l
   786C 44            [ 4]  980 	ld	b, h
   786D DD 6E 04      [19]  981 	ld	l,4 (ix)
   7870 DD 66 05      [19]  982 	ld	h,5 (ix)
   7873 09            [11]  983 	add	hl, bc
   7874 01 04 00      [10]  984 	ld	bc, #0x0004
   7877 09            [11]  985 	add	hl, bc
   7878 36 00         [10]  986 	ld	(hl), #0x00
                            987 ;src/niveles/niveles.c:139: contadorRocasEspejo++;
   787A 21 B7 B0      [10]  988 	ld	hl, #_contadorRocasEspejo+0
   787D 34            [11]  989 	inc	(hl)
   787E DD E1         [14]  990 	pop	ix
   7880 C9            [10]  991 	ret
                            992 ;src/niveles/niveles.c:141: void createColeccionabeLuz(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
                            993 ;	---------------------------------
                            994 ; Function createColeccionabeLuz
                            995 ; ---------------------------------
   7881                     996 _createColeccionabeLuz::
   7881 DD E5         [15]  997 	push	ix
   7883 DD 21 00 00   [14]  998 	ld	ix,#0
   7887 DD 39         [15]  999 	add	ix,sp
                           1000 ;src/niveles/niveles.c:142: if(P_colList2[id]==coleccionable_activo){
   7889 FD 21 BA B0   [14] 1001 	ld	iy, #_P_colList2
   788D FD 7E 00      [19] 1002 	ld	a, 0 (iy)
   7890 DD 86 08      [19] 1003 	add	a, 8 (ix)
   7893 4F            [ 4] 1004 	ld	c, a
   7894 FD 7E 01      [19] 1005 	ld	a, 1 (iy)
   7897 CE 00         [ 7] 1006 	adc	a, #0x00
   7899 47            [ 4] 1007 	ld	b, a
   789A 0A            [ 7] 1008 	ld	a, (bc)
   789B B7            [ 4] 1009 	or	a, a
   789C 20 58         [12] 1010 	jr	NZ,00103$
                           1011 ;src/niveles/niveles.c:143: coleccionable[contadorColeccionables].num=id;
   789E FD 21 B9 B0   [14] 1012 	ld	iy, #_contadorColeccionables
   78A2 FD 6E 00      [19] 1013 	ld	l, 0 (iy)
   78A5 26 00         [ 7] 1014 	ld	h, #0x00
   78A7 29            [11] 1015 	add	hl, hl
   78A8 29            [11] 1016 	add	hl, hl
   78A9 4D            [ 4] 1017 	ld	c, l
   78AA 44            [ 4] 1018 	ld	b, h
   78AB DD 6E 04      [19] 1019 	ld	l,4 (ix)
   78AE DD 66 05      [19] 1020 	ld	h,5 (ix)
   78B1 09            [11] 1021 	add	hl, bc
   78B2 DD 7E 08      [19] 1022 	ld	a, 8 (ix)
   78B5 77            [ 7] 1023 	ld	(hl), a
                           1024 ;src/niveles/niveles.c:144: coleccionable[contadorColeccionables].posx=posx;
   78B6 FD 6E 00      [19] 1025 	ld	l, 0 (iy)
   78B9 26 00         [ 7] 1026 	ld	h, #0x00
   78BB 29            [11] 1027 	add	hl, hl
   78BC 29            [11] 1028 	add	hl, hl
   78BD 4D            [ 4] 1029 	ld	c, l
   78BE 44            [ 4] 1030 	ld	b, h
   78BF DD 6E 04      [19] 1031 	ld	l,4 (ix)
   78C2 DD 66 05      [19] 1032 	ld	h,5 (ix)
   78C5 09            [11] 1033 	add	hl, bc
   78C6 23            [ 6] 1034 	inc	hl
   78C7 DD 7E 06      [19] 1035 	ld	a, 6 (ix)
   78CA 77            [ 7] 1036 	ld	(hl), a
                           1037 ;src/niveles/niveles.c:145: coleccionable[contadorColeccionables].posy=posy;
   78CB FD 6E 00      [19] 1038 	ld	l, 0 (iy)
   78CE 26 00         [ 7] 1039 	ld	h, #0x00
   78D0 29            [11] 1040 	add	hl, hl
   78D1 29            [11] 1041 	add	hl, hl
   78D2 4D            [ 4] 1042 	ld	c, l
   78D3 44            [ 4] 1043 	ld	b, h
   78D4 DD 6E 04      [19] 1044 	ld	l,4 (ix)
   78D7 DD 66 05      [19] 1045 	ld	h,5 (ix)
   78DA 09            [11] 1046 	add	hl, bc
   78DB 23            [ 6] 1047 	inc	hl
   78DC 23            [ 6] 1048 	inc	hl
   78DD DD 7E 07      [19] 1049 	ld	a, 7 (ix)
   78E0 77            [ 7] 1050 	ld	(hl), a
                           1051 ;src/niveles/niveles.c:146: coleccionable[contadorColeccionables].sprite=sprite_luz;
   78E1 FD 6E 00      [19] 1052 	ld	l, 0 (iy)
   78E4 26 00         [ 7] 1053 	ld	h, #0x00
   78E6 29            [11] 1054 	add	hl, hl
   78E7 29            [11] 1055 	add	hl, hl
   78E8 4D            [ 4] 1056 	ld	c, l
   78E9 44            [ 4] 1057 	ld	b, h
   78EA DD 6E 04      [19] 1058 	ld	l,4 (ix)
   78ED DD 66 05      [19] 1059 	ld	h,5 (ix)
   78F0 09            [11] 1060 	add	hl, bc
   78F1 23            [ 6] 1061 	inc	hl
   78F2 23            [ 6] 1062 	inc	hl
   78F3 23            [ 6] 1063 	inc	hl
   78F4 36 25         [10] 1064 	ld	(hl), #0x25
   78F6                    1065 00103$:
   78F6 DD E1         [14] 1066 	pop	ix
   78F8 C9            [10] 1067 	ret
                           1068 ;src/niveles/niveles.c:149: void createColeccionabeFamilia(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 sprite,u8 id){
                           1069 ;	---------------------------------
                           1070 ; Function createColeccionabeFamilia
                           1071 ; ---------------------------------
   78F9                    1072 _createColeccionabeFamilia::
   78F9 DD E5         [15] 1073 	push	ix
   78FB DD 21 00 00   [14] 1074 	ld	ix,#0
   78FF DD 39         [15] 1075 	add	ix,sp
                           1076 ;src/niveles/niveles.c:150: if(P_colList2[id]==coleccionable_activo){
   7901 FD 21 BA B0   [14] 1077 	ld	iy, #_P_colList2
   7905 FD 7E 00      [19] 1078 	ld	a, 0 (iy)
   7908 DD 86 09      [19] 1079 	add	a, 9 (ix)
   790B 4F            [ 4] 1080 	ld	c, a
   790C FD 7E 01      [19] 1081 	ld	a, 1 (iy)
   790F CE 00         [ 7] 1082 	adc	a, #0x00
   7911 47            [ 4] 1083 	ld	b, a
   7912 0A            [ 7] 1084 	ld	a, (bc)
   7913 B7            [ 4] 1085 	or	a, a
   7914 20 5A         [12] 1086 	jr	NZ,00103$
                           1087 ;src/niveles/niveles.c:151: coleccionable[contadorColeccionables].num=id;
   7916 FD 21 B9 B0   [14] 1088 	ld	iy, #_contadorColeccionables
   791A FD 6E 00      [19] 1089 	ld	l, 0 (iy)
   791D 26 00         [ 7] 1090 	ld	h, #0x00
   791F 29            [11] 1091 	add	hl, hl
   7920 29            [11] 1092 	add	hl, hl
   7921 4D            [ 4] 1093 	ld	c, l
   7922 44            [ 4] 1094 	ld	b, h
   7923 DD 6E 04      [19] 1095 	ld	l,4 (ix)
   7926 DD 66 05      [19] 1096 	ld	h,5 (ix)
   7929 09            [11] 1097 	add	hl, bc
   792A DD 7E 09      [19] 1098 	ld	a, 9 (ix)
   792D 77            [ 7] 1099 	ld	(hl), a
                           1100 ;src/niveles/niveles.c:152: coleccionable[contadorColeccionables].posx=posx;
   792E FD 6E 00      [19] 1101 	ld	l, 0 (iy)
   7931 26 00         [ 7] 1102 	ld	h, #0x00
   7933 29            [11] 1103 	add	hl, hl
   7934 29            [11] 1104 	add	hl, hl
   7935 4D            [ 4] 1105 	ld	c, l
   7936 44            [ 4] 1106 	ld	b, h
   7937 DD 6E 04      [19] 1107 	ld	l,4 (ix)
   793A DD 66 05      [19] 1108 	ld	h,5 (ix)
   793D 09            [11] 1109 	add	hl, bc
   793E 23            [ 6] 1110 	inc	hl
   793F DD 7E 06      [19] 1111 	ld	a, 6 (ix)
   7942 77            [ 7] 1112 	ld	(hl), a
                           1113 ;src/niveles/niveles.c:153: coleccionable[contadorColeccionables].posy=posy;
   7943 FD 6E 00      [19] 1114 	ld	l, 0 (iy)
   7946 26 00         [ 7] 1115 	ld	h, #0x00
   7948 29            [11] 1116 	add	hl, hl
   7949 29            [11] 1117 	add	hl, hl
   794A 4D            [ 4] 1118 	ld	c, l
   794B 44            [ 4] 1119 	ld	b, h
   794C DD 6E 04      [19] 1120 	ld	l,4 (ix)
   794F DD 66 05      [19] 1121 	ld	h,5 (ix)
   7952 09            [11] 1122 	add	hl, bc
   7953 23            [ 6] 1123 	inc	hl
   7954 23            [ 6] 1124 	inc	hl
   7955 DD 7E 07      [19] 1125 	ld	a, 7 (ix)
   7958 77            [ 7] 1126 	ld	(hl), a
                           1127 ;src/niveles/niveles.c:154: coleccionable[contadorColeccionables].sprite=sprite;
   7959 FD 6E 00      [19] 1128 	ld	l, 0 (iy)
   795C 26 00         [ 7] 1129 	ld	h, #0x00
   795E 29            [11] 1130 	add	hl, hl
   795F 29            [11] 1131 	add	hl, hl
   7960 4D            [ 4] 1132 	ld	c, l
   7961 44            [ 4] 1133 	ld	b, h
   7962 DD 6E 04      [19] 1134 	ld	l,4 (ix)
   7965 DD 66 05      [19] 1135 	ld	h,5 (ix)
   7968 09            [11] 1136 	add	hl, bc
   7969 23            [ 6] 1137 	inc	hl
   796A 23            [ 6] 1138 	inc	hl
   796B 23            [ 6] 1139 	inc	hl
   796C DD 7E 08      [19] 1140 	ld	a, 8 (ix)
   796F 77            [ 7] 1141 	ld	(hl), a
   7970                    1142 00103$:
   7970 DD E1         [14] 1143 	pop	ix
   7972 C9            [10] 1144 	ret
                           1145 ;src/niveles/niveles.c:157: void createColeccionabeAmstr(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
                           1146 ;	---------------------------------
                           1147 ; Function createColeccionabeAmstr
                           1148 ; ---------------------------------
   7973                    1149 _createColeccionabeAmstr::
   7973 DD E5         [15] 1150 	push	ix
   7975 DD 21 00 00   [14] 1151 	ld	ix,#0
   7979 DD 39         [15] 1152 	add	ix,sp
                           1153 ;src/niveles/niveles.c:158: if(P_colList2[id]==coleccionable_activo){
   797B FD 21 BA B0   [14] 1154 	ld	iy, #_P_colList2
   797F FD 7E 00      [19] 1155 	ld	a, 0 (iy)
   7982 DD 86 08      [19] 1156 	add	a, 8 (ix)
   7985 4F            [ 4] 1157 	ld	c, a
   7986 FD 7E 01      [19] 1158 	ld	a, 1 (iy)
   7989 CE 00         [ 7] 1159 	adc	a, #0x00
   798B 47            [ 4] 1160 	ld	b, a
   798C 0A            [ 7] 1161 	ld	a, (bc)
   798D B7            [ 4] 1162 	or	a, a
   798E 20 58         [12] 1163 	jr	NZ,00103$
                           1164 ;src/niveles/niveles.c:159: coleccionable[contadorColeccionables].num=id;
   7990 FD 21 B9 B0   [14] 1165 	ld	iy, #_contadorColeccionables
   7994 FD 6E 00      [19] 1166 	ld	l, 0 (iy)
   7997 26 00         [ 7] 1167 	ld	h, #0x00
   7999 29            [11] 1168 	add	hl, hl
   799A 29            [11] 1169 	add	hl, hl
   799B 4D            [ 4] 1170 	ld	c, l
   799C 44            [ 4] 1171 	ld	b, h
   799D DD 6E 04      [19] 1172 	ld	l,4 (ix)
   79A0 DD 66 05      [19] 1173 	ld	h,5 (ix)
   79A3 09            [11] 1174 	add	hl, bc
   79A4 DD 7E 08      [19] 1175 	ld	a, 8 (ix)
   79A7 77            [ 7] 1176 	ld	(hl), a
                           1177 ;src/niveles/niveles.c:160: coleccionable[contadorColeccionables].posx=posx;
   79A8 FD 6E 00      [19] 1178 	ld	l, 0 (iy)
   79AB 26 00         [ 7] 1179 	ld	h, #0x00
   79AD 29            [11] 1180 	add	hl, hl
   79AE 29            [11] 1181 	add	hl, hl
   79AF 4D            [ 4] 1182 	ld	c, l
   79B0 44            [ 4] 1183 	ld	b, h
   79B1 DD 6E 04      [19] 1184 	ld	l,4 (ix)
   79B4 DD 66 05      [19] 1185 	ld	h,5 (ix)
   79B7 09            [11] 1186 	add	hl, bc
   79B8 23            [ 6] 1187 	inc	hl
   79B9 DD 7E 06      [19] 1188 	ld	a, 6 (ix)
   79BC 77            [ 7] 1189 	ld	(hl), a
                           1190 ;src/niveles/niveles.c:161: coleccionable[contadorColeccionables].posy=posy;
   79BD FD 6E 00      [19] 1191 	ld	l, 0 (iy)
   79C0 26 00         [ 7] 1192 	ld	h, #0x00
   79C2 29            [11] 1193 	add	hl, hl
   79C3 29            [11] 1194 	add	hl, hl
   79C4 4D            [ 4] 1195 	ld	c, l
   79C5 44            [ 4] 1196 	ld	b, h
   79C6 DD 6E 04      [19] 1197 	ld	l,4 (ix)
   79C9 DD 66 05      [19] 1198 	ld	h,5 (ix)
   79CC 09            [11] 1199 	add	hl, bc
   79CD 23            [ 6] 1200 	inc	hl
   79CE 23            [ 6] 1201 	inc	hl
   79CF DD 7E 07      [19] 1202 	ld	a, 7 (ix)
   79D2 77            [ 7] 1203 	ld	(hl), a
                           1204 ;src/niveles/niveles.c:162: coleccionable[contadorColeccionables].sprite=sprite_amstradTape;
   79D3 FD 6E 00      [19] 1205 	ld	l, 0 (iy)
   79D6 26 00         [ 7] 1206 	ld	h, #0x00
   79D8 29            [11] 1207 	add	hl, hl
   79D9 29            [11] 1208 	add	hl, hl
   79DA 4D            [ 4] 1209 	ld	c, l
   79DB 44            [ 4] 1210 	ld	b, h
   79DC DD 6E 04      [19] 1211 	ld	l,4 (ix)
   79DF DD 66 05      [19] 1212 	ld	h,5 (ix)
   79E2 09            [11] 1213 	add	hl, bc
   79E3 23            [ 6] 1214 	inc	hl
   79E4 23            [ 6] 1215 	inc	hl
   79E5 23            [ 6] 1216 	inc	hl
   79E6 36 2F         [10] 1217 	ld	(hl), #0x2f
   79E8                    1218 00103$:
   79E8 DD E1         [14] 1219 	pop	ix
   79EA C9            [10] 1220 	ret
                           1221 ;src/niveles/niveles.c:168: void crearNivel1(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           1222 ;	---------------------------------
                           1223 ; Function crearNivel1
                           1224 ; ---------------------------------
   79EB                    1225 _crearNivel1::
   79EB DD E5         [15] 1226 	push	ix
   79ED DD 21 00 00   [14] 1227 	ld	ix,#0
   79F1 DD 39         [15] 1228 	add	ix,sp
                           1229 ;src/niveles/niveles.c:170: createPlayer(player,3,4,posicion);
   79F3 DD 6E 10      [19] 1230 	ld	l,16 (ix)
   79F6 DD 66 11      [19] 1231 	ld	h,17 (ix)
   79F9 E5            [11] 1232 	push	hl
   79FA 21 03 04      [10] 1233 	ld	hl, #0x0403
   79FD E5            [11] 1234 	push	hl
   79FE DD 6E 04      [19] 1235 	ld	l,4 (ix)
   7A01 DD 66 05      [19] 1236 	ld	h,5 (ix)
   7A04 E5            [11] 1237 	push	hl
   7A05 CD 29 75      [17] 1238 	call	_createPlayer
   7A08 21 06 00      [10] 1239 	ld	hl, #6
   7A0B 39            [11] 1240 	add	hl, sp
   7A0C F9            [ 6] 1241 	ld	sp, hl
                           1242 ;src/niveles/niveles.c:171: createMarco(si);
   7A0D AF            [ 4] 1243 	xor	a, a
   7A0E F5            [11] 1244 	push	af
   7A0F 33            [ 6] 1245 	inc	sp
   7A10 CD 1A 75      [17] 1246 	call	_createMarco
   7A13 33            [ 6] 1247 	inc	sp
                           1248 ;src/niveles/niveles.c:172: createPortal(portales,rocas,rocasEspejo,si);
   7A14 AF            [ 4] 1249 	xor	a, a
   7A15 F5            [11] 1250 	push	af
   7A16 33            [ 6] 1251 	inc	sp
   7A17 DD 6E 08      [19] 1252 	ld	l,8 (ix)
   7A1A DD 66 09      [19] 1253 	ld	h,9 (ix)
   7A1D E5            [11] 1254 	push	hl
   7A1E DD 6E 06      [19] 1255 	ld	l,6 (ix)
   7A21 DD 66 07      [19] 1256 	ld	h,7 (ix)
   7A24 E5            [11] 1257 	push	hl
   7A25 DD 6E 0C      [19] 1258 	ld	l,12 (ix)
   7A28 DD 66 0D      [19] 1259 	ld	h,13 (ix)
   7A2B E5            [11] 1260 	push	hl
   7A2C CD 0D 77      [17] 1261 	call	_createPortal
   7A2F 21 07 00      [10] 1262 	ld	hl, #7
   7A32 39            [11] 1263 	add	hl, sp
   7A33 F9            [ 6] 1264 	ld	sp, hl
                           1265 ;src/niveles/niveles.c:173: createPuerta(puertas,3,7,sprite_Puerta_G,nivel_07);
   7A34 21 1E 0A      [10] 1266 	ld	hl, #0x0a1e
   7A37 E5            [11] 1267 	push	hl
   7A38 21 03 07      [10] 1268 	ld	hl, #0x0703
   7A3B E5            [11] 1269 	push	hl
   7A3C DD 6E 0A      [19] 1270 	ld	l,10 (ix)
   7A3F DD 66 0B      [19] 1271 	ld	h,11 (ix)
   7A42 E5            [11] 1272 	push	hl
   7A43 CD 94 76      [17] 1273 	call	_createPuerta
   7A46 21 06 00      [10] 1274 	ld	hl, #6
   7A49 39            [11] 1275 	add	hl, sp
   7A4A F9            [ 6] 1276 	ld	sp, hl
                           1277 ;src/niveles/niveles.c:174: createPuerta(puertas,13,7,sprite_Puerta_B,nivel_01_01);
   7A4B 21 1F 02      [10] 1278 	ld	hl, #0x021f
   7A4E E5            [11] 1279 	push	hl
   7A4F 21 0D 07      [10] 1280 	ld	hl, #0x070d
   7A52 E5            [11] 1281 	push	hl
   7A53 DD 6E 0A      [19] 1282 	ld	l,10 (ix)
   7A56 DD 66 0B      [19] 1283 	ld	h,11 (ix)
   7A59 E5            [11] 1284 	push	hl
   7A5A CD 94 76      [17] 1285 	call	_createPuerta
   7A5D 21 06 00      [10] 1286 	ld	hl, #6
   7A60 39            [11] 1287 	add	hl, sp
   7A61 F9            [ 6] 1288 	ld	sp, hl
                           1289 ;src/niveles/niveles.c:177: createRoca(rocas,2,4,mover_1,sprite_Rock_G,2);
   7A62 21 02 02      [10] 1290 	ld	hl, #0x0202
   7A65 E5            [11] 1291 	push	hl
   7A66 21 04 01      [10] 1292 	ld	hl, #0x0104
   7A69 E5            [11] 1293 	push	hl
   7A6A 3E 02         [ 7] 1294 	ld	a, #0x02
   7A6C F5            [11] 1295 	push	af
   7A6D 33            [ 6] 1296 	inc	sp
   7A6E DD 6E 06      [19] 1297 	ld	l,6 (ix)
   7A71 DD 66 07      [19] 1298 	ld	h,7 (ix)
   7A74 E5            [11] 1299 	push	hl
   7A75 CD 68 75      [17] 1300 	call	_createRoca
   7A78 21 07 00      [10] 1301 	ld	hl, #7
   7A7B 39            [11] 1302 	add	hl, sp
   7A7C F9            [ 6] 1303 	ld	sp, hl
                           1304 ;src/niveles/niveles.c:178: createRocaEspejo(rocasEspejo,14,4,sin_Movimiento,sprite_Rock_nomove_B,2);
   7A7D 21 04 02      [10] 1305 	ld	hl, #0x0204
   7A80 E5            [11] 1306 	push	hl
   7A81 26 00         [ 7] 1307 	ld	h, #0x00
   7A83 E5            [11] 1308 	push	hl
   7A84 3E 0E         [ 7] 1309 	ld	a, #0x0e
   7A86 F5            [11] 1310 	push	af
   7A87 33            [ 6] 1311 	inc	sp
   7A88 DD 6E 08      [19] 1312 	ld	l,8 (ix)
   7A8B DD 66 09      [19] 1313 	ld	h,9 (ix)
   7A8E E5            [11] 1314 	push	hl
   7A8F CD FE 75      [17] 1315 	call	_createRocaEspejo
   7A92 21 07 00      [10] 1316 	ld	hl, #7
   7A95 39            [11] 1317 	add	hl, sp
   7A96 F9            [ 6] 1318 	ld	sp, hl
                           1319 ;src/niveles/niveles.c:181: createColeccionabeLuz(col,15,4,0);
   7A97 21 04 00      [10] 1320 	ld	hl, #0x0004
   7A9A E5            [11] 1321 	push	hl
   7A9B 3E 0F         [ 7] 1322 	ld	a, #0x0f
   7A9D F5            [11] 1323 	push	af
   7A9E 33            [ 6] 1324 	inc	sp
   7A9F DD 6E 0E      [19] 1325 	ld	l,14 (ix)
   7AA2 DD 66 0F      [19] 1326 	ld	h,15 (ix)
   7AA5 E5            [11] 1327 	push	hl
   7AA6 CD 81 78      [17] 1328 	call	_createColeccionabeLuz
   7AA9 F1            [10] 1329 	pop	af
                           1330 ;src/niveles/niveles.c:184: createRoca(rocas,1,2,sin_Movimiento,sprite_RockInmovil3_G,1);
   7AAA 33            [ 6] 1331 	inc	sp
   7AAB 21 0B 01      [10] 1332 	ld	hl,#0x010b
   7AAE E3            [19] 1333 	ex	(sp),hl
   7AAF 21 02 00      [10] 1334 	ld	hl, #0x0002
   7AB2 E5            [11] 1335 	push	hl
   7AB3 3E 01         [ 7] 1336 	ld	a, #0x01
   7AB5 F5            [11] 1337 	push	af
   7AB6 33            [ 6] 1338 	inc	sp
   7AB7 DD 6E 06      [19] 1339 	ld	l,6 (ix)
   7ABA DD 66 07      [19] 1340 	ld	h,7 (ix)
   7ABD E5            [11] 1341 	push	hl
   7ABE CD 68 75      [17] 1342 	call	_createRoca
   7AC1 21 07 00      [10] 1343 	ld	hl, #7
   7AC4 39            [11] 1344 	add	hl, sp
   7AC5 F9            [ 6] 1345 	ld	sp, hl
                           1346 ;src/niveles/niveles.c:185: createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil4_G,1);
   7AC6 21 0D 01      [10] 1347 	ld	hl, #0x010d
   7AC9 E5            [11] 1348 	push	hl
   7ACA 21 02 00      [10] 1349 	ld	hl, #0x0002
   7ACD E5            [11] 1350 	push	hl
   7ACE 3E 02         [ 7] 1351 	ld	a, #0x02
   7AD0 F5            [11] 1352 	push	af
   7AD1 33            [ 6] 1353 	inc	sp
   7AD2 DD 6E 06      [19] 1354 	ld	l,6 (ix)
   7AD5 DD 66 07      [19] 1355 	ld	h,7 (ix)
   7AD8 E5            [11] 1356 	push	hl
   7AD9 CD 68 75      [17] 1357 	call	_createRoca
   7ADC 21 07 00      [10] 1358 	ld	hl, #7
   7ADF 39            [11] 1359 	add	hl, sp
   7AE0 F9            [ 6] 1360 	ld	sp, hl
                           1361 ;src/niveles/niveles.c:186: createRoca(rocas,1,3,sin_Movimiento,sprite_RockInmovil1_G,1);
   7AE1 21 07 01      [10] 1362 	ld	hl, #0x0107
   7AE4 E5            [11] 1363 	push	hl
   7AE5 21 03 00      [10] 1364 	ld	hl, #0x0003
   7AE8 E5            [11] 1365 	push	hl
   7AE9 3E 01         [ 7] 1366 	ld	a, #0x01
   7AEB F5            [11] 1367 	push	af
   7AEC 33            [ 6] 1368 	inc	sp
   7AED DD 6E 06      [19] 1369 	ld	l,6 (ix)
   7AF0 DD 66 07      [19] 1370 	ld	h,7 (ix)
   7AF3 E5            [11] 1371 	push	hl
   7AF4 CD 68 75      [17] 1372 	call	_createRoca
   7AF7 21 07 00      [10] 1373 	ld	hl, #7
   7AFA 39            [11] 1374 	add	hl, sp
   7AFB F9            [ 6] 1375 	ld	sp, hl
                           1376 ;src/niveles/niveles.c:187: createRoca(rocas,6,3,sin_Movimiento,sprite_RockInmovil1_G,1);
   7AFC 21 07 01      [10] 1377 	ld	hl, #0x0107
   7AFF E5            [11] 1378 	push	hl
   7B00 21 03 00      [10] 1379 	ld	hl, #0x0003
   7B03 E5            [11] 1380 	push	hl
   7B04 3E 06         [ 7] 1381 	ld	a, #0x06
   7B06 F5            [11] 1382 	push	af
   7B07 33            [ 6] 1383 	inc	sp
   7B08 DD 6E 06      [19] 1384 	ld	l,6 (ix)
   7B0B DD 66 07      [19] 1385 	ld	h,7 (ix)
   7B0E E5            [11] 1386 	push	hl
   7B0F CD 68 75      [17] 1387 	call	_createRoca
   7B12 21 07 00      [10] 1388 	ld	hl, #7
   7B15 39            [11] 1389 	add	hl, sp
   7B16 F9            [ 6] 1390 	ld	sp, hl
                           1391 ;src/niveles/niveles.c:188: createRoca(rocas,1,5,sin_Movimiento,sprite_RockInmovil1_G,1);
   7B17 21 07 01      [10] 1392 	ld	hl, #0x0107
   7B1A E5            [11] 1393 	push	hl
   7B1B 21 05 00      [10] 1394 	ld	hl, #0x0005
   7B1E E5            [11] 1395 	push	hl
   7B1F 3E 01         [ 7] 1396 	ld	a, #0x01
   7B21 F5            [11] 1397 	push	af
   7B22 33            [ 6] 1398 	inc	sp
   7B23 DD 6E 06      [19] 1399 	ld	l,6 (ix)
   7B26 DD 66 07      [19] 1400 	ld	h,7 (ix)
   7B29 E5            [11] 1401 	push	hl
   7B2A CD 68 75      [17] 1402 	call	_createRoca
   7B2D 21 07 00      [10] 1403 	ld	hl, #7
   7B30 39            [11] 1404 	add	hl, sp
   7B31 F9            [ 6] 1405 	ld	sp, hl
                           1406 ;src/niveles/niveles.c:189: createRoca(rocas,6,5,sin_Movimiento,sprite_RockInmovil1_G,1);
   7B32 21 07 01      [10] 1407 	ld	hl, #0x0107
   7B35 E5            [11] 1408 	push	hl
   7B36 21 05 00      [10] 1409 	ld	hl, #0x0005
   7B39 E5            [11] 1410 	push	hl
   7B3A 3E 06         [ 7] 1411 	ld	a, #0x06
   7B3C F5            [11] 1412 	push	af
   7B3D 33            [ 6] 1413 	inc	sp
   7B3E DD 6E 06      [19] 1414 	ld	l,6 (ix)
   7B41 DD 66 07      [19] 1415 	ld	h,7 (ix)
   7B44 E5            [11] 1416 	push	hl
   7B45 CD 68 75      [17] 1417 	call	_createRoca
   7B48 21 07 00      [10] 1418 	ld	hl, #7
   7B4B 39            [11] 1419 	add	hl, sp
   7B4C F9            [ 6] 1420 	ld	sp, hl
                           1421 ;src/niveles/niveles.c:190: createRoca(rocas,7,1,sin_Movimiento,sprite_RockInmovil2_G,1);
   7B4D 21 09 01      [10] 1422 	ld	hl, #0x0109
   7B50 E5            [11] 1423 	push	hl
   7B51 21 01 00      [10] 1424 	ld	hl, #0x0001
   7B54 E5            [11] 1425 	push	hl
   7B55 3E 07         [ 7] 1426 	ld	a, #0x07
   7B57 F5            [11] 1427 	push	af
   7B58 33            [ 6] 1428 	inc	sp
   7B59 DD 6E 06      [19] 1429 	ld	l,6 (ix)
   7B5C DD 66 07      [19] 1430 	ld	h,7 (ix)
   7B5F E5            [11] 1431 	push	hl
   7B60 CD 68 75      [17] 1432 	call	_createRoca
   7B63 21 07 00      [10] 1433 	ld	hl, #7
   7B66 39            [11] 1434 	add	hl, sp
   7B67 F9            [ 6] 1435 	ld	sp, hl
                           1436 ;src/niveles/niveles.c:191: createRoca(rocas,7,7,sin_Movimiento,sprite_RockInmovil2_G,1);
   7B68 21 09 01      [10] 1437 	ld	hl, #0x0109
   7B6B E5            [11] 1438 	push	hl
   7B6C 21 07 00      [10] 1439 	ld	hl, #0x0007
   7B6F E5            [11] 1440 	push	hl
   7B70 3E 07         [ 7] 1441 	ld	a, #0x07
   7B72 F5            [11] 1442 	push	af
   7B73 33            [ 6] 1443 	inc	sp
   7B74 DD 6E 06      [19] 1444 	ld	l,6 (ix)
   7B77 DD 66 07      [19] 1445 	ld	h,7 (ix)
   7B7A E5            [11] 1446 	push	hl
   7B7B CD 68 75      [17] 1447 	call	_createRoca
   7B7E 21 07 00      [10] 1448 	ld	hl, #7
   7B81 39            [11] 1449 	add	hl, sp
   7B82 F9            [ 6] 1450 	ld	sp, hl
                           1451 ;src/niveles/niveles.c:192: createRoca(rocas,1,4,sin_Movimiento,sprite_amstrad,1);
   7B83 21 2E 01      [10] 1452 	ld	hl, #0x012e
   7B86 E5            [11] 1453 	push	hl
   7B87 21 04 00      [10] 1454 	ld	hl, #0x0004
   7B8A E5            [11] 1455 	push	hl
   7B8B 3E 01         [ 7] 1456 	ld	a, #0x01
   7B8D F5            [11] 1457 	push	af
   7B8E 33            [ 6] 1458 	inc	sp
   7B8F DD 6E 06      [19] 1459 	ld	l,6 (ix)
   7B92 DD 66 07      [19] 1460 	ld	h,7 (ix)
   7B95 E5            [11] 1461 	push	hl
   7B96 CD 68 75      [17] 1462 	call	_createRoca
   7B99 21 07 00      [10] 1463 	ld	hl, #7
   7B9C 39            [11] 1464 	add	hl, sp
   7B9D F9            [ 6] 1465 	ld	sp, hl
                           1466 ;src/niveles/niveles.c:193: createRoca(rocas,1,1,sin_Movimiento,sprite_PrinceofPersia2_G,1);
   7B9E 21 32 01      [10] 1467 	ld	hl, #0x0132
   7BA1 E5            [11] 1468 	push	hl
   7BA2 21 01 00      [10] 1469 	ld	hl, #0x0001
   7BA5 E5            [11] 1470 	push	hl
   7BA6 3E 01         [ 7] 1471 	ld	a, #0x01
   7BA8 F5            [11] 1472 	push	af
   7BA9 33            [ 6] 1473 	inc	sp
   7BAA DD 6E 06      [19] 1474 	ld	l,6 (ix)
   7BAD DD 66 07      [19] 1475 	ld	h,7 (ix)
   7BB0 E5            [11] 1476 	push	hl
   7BB1 CD 68 75      [17] 1477 	call	_createRoca
   7BB4 21 07 00      [10] 1478 	ld	hl, #7
   7BB7 39            [11] 1479 	add	hl, sp
   7BB8 F9            [ 6] 1480 	ld	sp, hl
                           1481 ;src/niveles/niveles.c:194: createRoca(rocas,2,1,sin_Movimiento,sprite_PrinceofPersia1_G,1);
   7BB9 21 30 01      [10] 1482 	ld	hl, #0x0130
   7BBC E5            [11] 1483 	push	hl
   7BBD 21 01 00      [10] 1484 	ld	hl, #0x0001
   7BC0 E5            [11] 1485 	push	hl
   7BC1 3E 02         [ 7] 1486 	ld	a, #0x02
   7BC3 F5            [11] 1487 	push	af
   7BC4 33            [ 6] 1488 	inc	sp
   7BC5 DD 6E 06      [19] 1489 	ld	l,6 (ix)
   7BC8 DD 66 07      [19] 1490 	ld	h,7 (ix)
   7BCB E5            [11] 1491 	push	hl
   7BCC CD 68 75      [17] 1492 	call	_createRoca
   7BCF 21 07 00      [10] 1493 	ld	hl, #7
   7BD2 39            [11] 1494 	add	hl, sp
   7BD3 F9            [ 6] 1495 	ld	sp, hl
                           1496 ;src/niveles/niveles.c:198: createRocaEspejo(rocasEspejo,14,2,sin_Movimiento,sprite_RockInmovil3_B,1);
   7BD4 21 0C 01      [10] 1497 	ld	hl, #0x010c
   7BD7 E5            [11] 1498 	push	hl
   7BD8 21 02 00      [10] 1499 	ld	hl, #0x0002
   7BDB E5            [11] 1500 	push	hl
   7BDC 3E 0E         [ 7] 1501 	ld	a, #0x0e
   7BDE F5            [11] 1502 	push	af
   7BDF 33            [ 6] 1503 	inc	sp
   7BE0 DD 6E 08      [19] 1504 	ld	l,8 (ix)
   7BE3 DD 66 09      [19] 1505 	ld	h,9 (ix)
   7BE6 E5            [11] 1506 	push	hl
   7BE7 CD FE 75      [17] 1507 	call	_createRocaEspejo
   7BEA 21 07 00      [10] 1508 	ld	hl, #7
   7BED 39            [11] 1509 	add	hl, sp
   7BEE F9            [ 6] 1510 	ld	sp, hl
                           1511 ;src/niveles/niveles.c:199: createRocaEspejo(rocasEspejo,15,2,sin_Movimiento,sprite_RockInmovil4_B,1);
   7BEF 21 0E 01      [10] 1512 	ld	hl, #0x010e
   7BF2 E5            [11] 1513 	push	hl
   7BF3 21 02 00      [10] 1514 	ld	hl, #0x0002
   7BF6 E5            [11] 1515 	push	hl
   7BF7 3E 0F         [ 7] 1516 	ld	a, #0x0f
   7BF9 F5            [11] 1517 	push	af
   7BFA 33            [ 6] 1518 	inc	sp
   7BFB DD 6E 08      [19] 1519 	ld	l,8 (ix)
   7BFE DD 66 09      [19] 1520 	ld	h,9 (ix)
   7C01 E5            [11] 1521 	push	hl
   7C02 CD FE 75      [17] 1522 	call	_createRocaEspejo
   7C05 21 07 00      [10] 1523 	ld	hl, #7
   7C08 39            [11] 1524 	add	hl, sp
   7C09 F9            [ 6] 1525 	ld	sp, hl
                           1526 ;src/niveles/niveles.c:200: createRocaEspejo(rocasEspejo,15,3,sin_Movimiento,sprite_RockInmovil1_B,1);
   7C0A 21 08 01      [10] 1527 	ld	hl, #0x0108
   7C0D E5            [11] 1528 	push	hl
   7C0E 21 03 00      [10] 1529 	ld	hl, #0x0003
   7C11 E5            [11] 1530 	push	hl
   7C12 3E 0F         [ 7] 1531 	ld	a, #0x0f
   7C14 F5            [11] 1532 	push	af
   7C15 33            [ 6] 1533 	inc	sp
   7C16 DD 6E 08      [19] 1534 	ld	l,8 (ix)
   7C19 DD 66 09      [19] 1535 	ld	h,9 (ix)
   7C1C E5            [11] 1536 	push	hl
   7C1D CD FE 75      [17] 1537 	call	_createRocaEspejo
   7C20 21 07 00      [10] 1538 	ld	hl, #7
   7C23 39            [11] 1539 	add	hl, sp
   7C24 F9            [ 6] 1540 	ld	sp, hl
                           1541 ;src/niveles/niveles.c:201: createRocaEspejo(rocasEspejo,10,3,sin_Movimiento,sprite_RockInmovil1_B,1);
   7C25 21 08 01      [10] 1542 	ld	hl, #0x0108
   7C28 E5            [11] 1543 	push	hl
   7C29 21 03 00      [10] 1544 	ld	hl, #0x0003
   7C2C E5            [11] 1545 	push	hl
   7C2D 3E 0A         [ 7] 1546 	ld	a, #0x0a
   7C2F F5            [11] 1547 	push	af
   7C30 33            [ 6] 1548 	inc	sp
   7C31 DD 6E 08      [19] 1549 	ld	l,8 (ix)
   7C34 DD 66 09      [19] 1550 	ld	h,9 (ix)
   7C37 E5            [11] 1551 	push	hl
   7C38 CD FE 75      [17] 1552 	call	_createRocaEspejo
   7C3B 21 07 00      [10] 1553 	ld	hl, #7
   7C3E 39            [11] 1554 	add	hl, sp
   7C3F F9            [ 6] 1555 	ld	sp, hl
                           1556 ;src/niveles/niveles.c:202: createRocaEspejo(rocasEspejo,15,5,sin_Movimiento,sprite_RockInmovil1_B,1);
   7C40 21 08 01      [10] 1557 	ld	hl, #0x0108
   7C43 E5            [11] 1558 	push	hl
   7C44 21 05 00      [10] 1559 	ld	hl, #0x0005
   7C47 E5            [11] 1560 	push	hl
   7C48 3E 0F         [ 7] 1561 	ld	a, #0x0f
   7C4A F5            [11] 1562 	push	af
   7C4B 33            [ 6] 1563 	inc	sp
   7C4C DD 6E 08      [19] 1564 	ld	l,8 (ix)
   7C4F DD 66 09      [19] 1565 	ld	h,9 (ix)
   7C52 E5            [11] 1566 	push	hl
   7C53 CD FE 75      [17] 1567 	call	_createRocaEspejo
   7C56 21 07 00      [10] 1568 	ld	hl, #7
   7C59 39            [11] 1569 	add	hl, sp
   7C5A F9            [ 6] 1570 	ld	sp, hl
                           1571 ;src/niveles/niveles.c:203: createRocaEspejo(rocasEspejo,10,5,sin_Movimiento,sprite_RockInmovil1_B,1);
   7C5B 21 08 01      [10] 1572 	ld	hl, #0x0108
   7C5E E5            [11] 1573 	push	hl
   7C5F 21 05 00      [10] 1574 	ld	hl, #0x0005
   7C62 E5            [11] 1575 	push	hl
   7C63 3E 0A         [ 7] 1576 	ld	a, #0x0a
   7C65 F5            [11] 1577 	push	af
   7C66 33            [ 6] 1578 	inc	sp
   7C67 DD 6E 08      [19] 1579 	ld	l,8 (ix)
   7C6A DD 66 09      [19] 1580 	ld	h,9 (ix)
   7C6D E5            [11] 1581 	push	hl
   7C6E CD FE 75      [17] 1582 	call	_createRocaEspejo
   7C71 21 07 00      [10] 1583 	ld	hl, #7
   7C74 39            [11] 1584 	add	hl, sp
   7C75 F9            [ 6] 1585 	ld	sp, hl
                           1586 ;src/niveles/niveles.c:204: createRocaEspejo(rocasEspejo,9,1,sin_Movimiento,sprite_RockInmovil2_B,1);
   7C76 21 0A 01      [10] 1587 	ld	hl, #0x010a
   7C79 E5            [11] 1588 	push	hl
   7C7A 21 01 00      [10] 1589 	ld	hl, #0x0001
   7C7D E5            [11] 1590 	push	hl
   7C7E 3E 09         [ 7] 1591 	ld	a, #0x09
   7C80 F5            [11] 1592 	push	af
   7C81 33            [ 6] 1593 	inc	sp
   7C82 DD 6E 08      [19] 1594 	ld	l,8 (ix)
   7C85 DD 66 09      [19] 1595 	ld	h,9 (ix)
   7C88 E5            [11] 1596 	push	hl
   7C89 CD FE 75      [17] 1597 	call	_createRocaEspejo
   7C8C 21 07 00      [10] 1598 	ld	hl, #7
   7C8F 39            [11] 1599 	add	hl, sp
   7C90 F9            [ 6] 1600 	ld	sp, hl
                           1601 ;src/niveles/niveles.c:205: createRocaEspejo(rocasEspejo,9,7,sin_Movimiento,sprite_RockInmovil2_B,1);
   7C91 21 0A 01      [10] 1602 	ld	hl, #0x010a
   7C94 E5            [11] 1603 	push	hl
   7C95 21 07 00      [10] 1604 	ld	hl, #0x0007
   7C98 E5            [11] 1605 	push	hl
   7C99 3E 09         [ 7] 1606 	ld	a, #0x09
   7C9B F5            [11] 1607 	push	af
   7C9C 33            [ 6] 1608 	inc	sp
   7C9D DD 6E 08      [19] 1609 	ld	l,8 (ix)
   7CA0 DD 66 09      [19] 1610 	ld	h,9 (ix)
   7CA3 E5            [11] 1611 	push	hl
   7CA4 CD FE 75      [17] 1612 	call	_createRocaEspejo
   7CA7 21 07 00      [10] 1613 	ld	hl, #7
   7CAA 39            [11] 1614 	add	hl, sp
   7CAB F9            [ 6] 1615 	ld	sp, hl
                           1616 ;src/niveles/niveles.c:206: createRocaEspejo(rocasEspejo,14,1,sin_Movimiento,sprite_PrinceofPersia1_B,1);
   7CAC 21 31 01      [10] 1617 	ld	hl, #0x0131
   7CAF E5            [11] 1618 	push	hl
   7CB0 21 01 00      [10] 1619 	ld	hl, #0x0001
   7CB3 E5            [11] 1620 	push	hl
   7CB4 3E 0E         [ 7] 1621 	ld	a, #0x0e
   7CB6 F5            [11] 1622 	push	af
   7CB7 33            [ 6] 1623 	inc	sp
   7CB8 DD 6E 08      [19] 1624 	ld	l,8 (ix)
   7CBB DD 66 09      [19] 1625 	ld	h,9 (ix)
   7CBE E5            [11] 1626 	push	hl
   7CBF CD FE 75      [17] 1627 	call	_createRocaEspejo
   7CC2 21 07 00      [10] 1628 	ld	hl, #7
   7CC5 39            [11] 1629 	add	hl, sp
   7CC6 F9            [ 6] 1630 	ld	sp, hl
                           1631 ;src/niveles/niveles.c:207: createRocaEspejo(rocasEspejo,15,1,sin_Movimiento,sprite_PrinceofPersia2_B,1);
   7CC7 21 33 01      [10] 1632 	ld	hl, #0x0133
   7CCA E5            [11] 1633 	push	hl
   7CCB 21 01 00      [10] 1634 	ld	hl, #0x0001
   7CCE E5            [11] 1635 	push	hl
   7CCF 3E 0F         [ 7] 1636 	ld	a, #0x0f
   7CD1 F5            [11] 1637 	push	af
   7CD2 33            [ 6] 1638 	inc	sp
   7CD3 DD 6E 08      [19] 1639 	ld	l,8 (ix)
   7CD6 DD 66 09      [19] 1640 	ld	h,9 (ix)
   7CD9 E5            [11] 1641 	push	hl
   7CDA CD FE 75      [17] 1642 	call	_createRocaEspejo
   7CDD 21 07 00      [10] 1643 	ld	hl, #7
   7CE0 39            [11] 1644 	add	hl, sp
   7CE1 F9            [ 6] 1645 	ld	sp, hl
   7CE2 DD E1         [14] 1646 	pop	ix
   7CE4 C9            [10] 1647 	ret
                           1648 ;src/niveles/niveles.c:209: void crearNivel01_01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           1649 ;	---------------------------------
                           1650 ; Function crearNivel01_01
                           1651 ; ---------------------------------
   7CE5                    1652 _crearNivel01_01::
                           1653 ;src/niveles/niveles.c:214: }
   7CE5 C9            [10] 1654 	ret
                           1655 ;src/niveles/niveles.c:215: void crearNivel2(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           1656 ;	---------------------------------
                           1657 ; Function crearNivel2
                           1658 ; ---------------------------------
   7CE6                    1659 _crearNivel2::
                           1660 ;src/niveles/niveles.c:220: }
   7CE6 C9            [10] 1661 	ret
                           1662 ;src/niveles/niveles.c:222: void crearNivelTRAP01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           1663 ;	---------------------------------
                           1664 ; Function crearNivelTRAP01
                           1665 ; ---------------------------------
   7CE7                    1666 _crearNivelTRAP01::
   7CE7 DD E5         [15] 1667 	push	ix
   7CE9 DD 21 00 00   [14] 1668 	ld	ix,#0
   7CED DD 39         [15] 1669 	add	ix,sp
                           1670 ;src/niveles/niveles.c:224: createPlayer(player,4,4,posicion);
   7CEF DD 6E 10      [19] 1671 	ld	l,16 (ix)
   7CF2 DD 66 11      [19] 1672 	ld	h,17 (ix)
   7CF5 E5            [11] 1673 	push	hl
   7CF6 21 04 04      [10] 1674 	ld	hl, #0x0404
   7CF9 E5            [11] 1675 	push	hl
   7CFA DD 6E 04      [19] 1676 	ld	l,4 (ix)
   7CFD DD 66 05      [19] 1677 	ld	h,5 (ix)
   7D00 E5            [11] 1678 	push	hl
   7D01 CD 29 75      [17] 1679 	call	_createPlayer
   7D04 21 06 00      [10] 1680 	ld	hl, #6
   7D07 39            [11] 1681 	add	hl, sp
   7D08 F9            [ 6] 1682 	ld	sp, hl
                           1683 ;src/niveles/niveles.c:225: createMarco(no);
   7D09 3E 01         [ 7] 1684 	ld	a, #0x01
   7D0B F5            [11] 1685 	push	af
   7D0C 33            [ 6] 1686 	inc	sp
   7D0D CD 1A 75      [17] 1687 	call	_createMarco
   7D10 33            [ 6] 1688 	inc	sp
                           1689 ;src/niveles/niveles.c:226: createPortal(portales,rocas,rocasEspejo,no);
   7D11 3E 01         [ 7] 1690 	ld	a, #0x01
   7D13 F5            [11] 1691 	push	af
   7D14 33            [ 6] 1692 	inc	sp
   7D15 DD 6E 08      [19] 1693 	ld	l,8 (ix)
   7D18 DD 66 09      [19] 1694 	ld	h,9 (ix)
   7D1B E5            [11] 1695 	push	hl
   7D1C DD 6E 06      [19] 1696 	ld	l,6 (ix)
   7D1F DD 66 07      [19] 1697 	ld	h,7 (ix)
   7D22 E5            [11] 1698 	push	hl
   7D23 DD 6E 0C      [19] 1699 	ld	l,12 (ix)
   7D26 DD 66 0D      [19] 1700 	ld	h,13 (ix)
   7D29 E5            [11] 1701 	push	hl
   7D2A CD 0D 77      [17] 1702 	call	_createPortal
   7D2D 21 07 00      [10] 1703 	ld	hl, #7
   7D30 39            [11] 1704 	add	hl, sp
   7D31 F9            [ 6] 1705 	ld	sp, hl
                           1706 ;src/niveles/niveles.c:227: createPuerta(puertas,4,2,sprite_Puerta_B,nivel_02);
   7D32 21 1F 04      [10] 1707 	ld	hl, #0x041f
   7D35 E5            [11] 1708 	push	hl
   7D36 21 04 02      [10] 1709 	ld	hl, #0x0204
   7D39 E5            [11] 1710 	push	hl
   7D3A DD 6E 0A      [19] 1711 	ld	l,10 (ix)
   7D3D DD 66 0B      [19] 1712 	ld	h,11 (ix)
   7D40 E5            [11] 1713 	push	hl
   7D41 CD 94 76      [17] 1714 	call	_createPuerta
   7D44 21 06 00      [10] 1715 	ld	hl, #6
   7D47 39            [11] 1716 	add	hl, sp
   7D48 F9            [ 6] 1717 	ld	sp, hl
                           1718 ;src/niveles/niveles.c:228: createPuerta(puertas,4,6,sprite_Puerta_B,nivel_02);
   7D49 21 1F 04      [10] 1719 	ld	hl, #0x041f
   7D4C E5            [11] 1720 	push	hl
   7D4D 21 04 06      [10] 1721 	ld	hl, #0x0604
   7D50 E5            [11] 1722 	push	hl
   7D51 DD 6E 0A      [19] 1723 	ld	l,10 (ix)
   7D54 DD 66 0B      [19] 1724 	ld	h,11 (ix)
   7D57 E5            [11] 1725 	push	hl
   7D58 CD 94 76      [17] 1726 	call	_createPuerta
   7D5B 21 06 00      [10] 1727 	ld	hl, #6
   7D5E 39            [11] 1728 	add	hl, sp
   7D5F F9            [ 6] 1729 	ld	sp, hl
                           1730 ;src/niveles/niveles.c:234: createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   7D60 21 1C 01      [10] 1731 	ld	hl, #0x011c
   7D63 E5            [11] 1732 	push	hl
   7D64 21 01 00      [10] 1733 	ld	hl, #0x0001
   7D67 E5            [11] 1734 	push	hl
   7D68 3E 01         [ 7] 1735 	ld	a, #0x01
   7D6A F5            [11] 1736 	push	af
   7D6B 33            [ 6] 1737 	inc	sp
   7D6C DD 6E 06      [19] 1738 	ld	l,6 (ix)
   7D6F DD 66 07      [19] 1739 	ld	h,7 (ix)
   7D72 E5            [11] 1740 	push	hl
   7D73 CD 68 75      [17] 1741 	call	_createRoca
   7D76 21 07 00      [10] 1742 	ld	hl, #7
   7D79 39            [11] 1743 	add	hl, sp
   7D7A F9            [ 6] 1744 	ld	sp, hl
                           1745 ;src/niveles/niveles.c:235: createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   7D7B 21 1C 01      [10] 1746 	ld	hl, #0x011c
   7D7E E5            [11] 1747 	push	hl
   7D7F 21 01 00      [10] 1748 	ld	hl, #0x0001
   7D82 E5            [11] 1749 	push	hl
   7D83 3E 02         [ 7] 1750 	ld	a, #0x02
   7D85 F5            [11] 1751 	push	af
   7D86 33            [ 6] 1752 	inc	sp
   7D87 DD 6E 06      [19] 1753 	ld	l,6 (ix)
   7D8A DD 66 07      [19] 1754 	ld	h,7 (ix)
   7D8D E5            [11] 1755 	push	hl
   7D8E CD 68 75      [17] 1756 	call	_createRoca
   7D91 21 07 00      [10] 1757 	ld	hl, #7
   7D94 39            [11] 1758 	add	hl, sp
   7D95 F9            [ 6] 1759 	ld	sp, hl
                           1760 ;src/niveles/niveles.c:236: createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   7D96 21 1C 01      [10] 1761 	ld	hl, #0x011c
   7D99 E5            [11] 1762 	push	hl
   7D9A 21 01 00      [10] 1763 	ld	hl, #0x0001
   7D9D E5            [11] 1764 	push	hl
   7D9E 3E 04         [ 7] 1765 	ld	a, #0x04
   7DA0 F5            [11] 1766 	push	af
   7DA1 33            [ 6] 1767 	inc	sp
   7DA2 DD 6E 06      [19] 1768 	ld	l,6 (ix)
   7DA5 DD 66 07      [19] 1769 	ld	h,7 (ix)
   7DA8 E5            [11] 1770 	push	hl
   7DA9 CD 68 75      [17] 1771 	call	_createRoca
   7DAC 21 07 00      [10] 1772 	ld	hl, #7
   7DAF 39            [11] 1773 	add	hl, sp
   7DB0 F9            [ 6] 1774 	ld	sp, hl
                           1775 ;src/niveles/niveles.c:237: createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   7DB1 21 1C 01      [10] 1776 	ld	hl, #0x011c
   7DB4 E5            [11] 1777 	push	hl
   7DB5 21 01 00      [10] 1778 	ld	hl, #0x0001
   7DB8 E5            [11] 1779 	push	hl
   7DB9 3E 03         [ 7] 1780 	ld	a, #0x03
   7DBB F5            [11] 1781 	push	af
   7DBC 33            [ 6] 1782 	inc	sp
   7DBD DD 6E 06      [19] 1783 	ld	l,6 (ix)
   7DC0 DD 66 07      [19] 1784 	ld	h,7 (ix)
   7DC3 E5            [11] 1785 	push	hl
   7DC4 CD 68 75      [17] 1786 	call	_createRoca
   7DC7 21 07 00      [10] 1787 	ld	hl, #7
   7DCA 39            [11] 1788 	add	hl, sp
   7DCB F9            [ 6] 1789 	ld	sp, hl
                           1790 ;src/niveles/niveles.c:238: createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   7DCC 21 1C 01      [10] 1791 	ld	hl, #0x011c
   7DCF E5            [11] 1792 	push	hl
   7DD0 21 01 00      [10] 1793 	ld	hl, #0x0001
   7DD3 E5            [11] 1794 	push	hl
   7DD4 3E 05         [ 7] 1795 	ld	a, #0x05
   7DD6 F5            [11] 1796 	push	af
   7DD7 33            [ 6] 1797 	inc	sp
   7DD8 DD 6E 06      [19] 1798 	ld	l,6 (ix)
   7DDB DD 66 07      [19] 1799 	ld	h,7 (ix)
   7DDE E5            [11] 1800 	push	hl
   7DDF CD 68 75      [17] 1801 	call	_createRoca
   7DE2 21 07 00      [10] 1802 	ld	hl, #7
   7DE5 39            [11] 1803 	add	hl, sp
   7DE6 F9            [ 6] 1804 	ld	sp, hl
                           1805 ;src/niveles/niveles.c:239: createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   7DE7 21 1C 01      [10] 1806 	ld	hl, #0x011c
   7DEA E5            [11] 1807 	push	hl
   7DEB 21 01 00      [10] 1808 	ld	hl, #0x0001
   7DEE E5            [11] 1809 	push	hl
   7DEF 3E 06         [ 7] 1810 	ld	a, #0x06
   7DF1 F5            [11] 1811 	push	af
   7DF2 33            [ 6] 1812 	inc	sp
   7DF3 DD 6E 06      [19] 1813 	ld	l,6 (ix)
   7DF6 DD 66 07      [19] 1814 	ld	h,7 (ix)
   7DF9 E5            [11] 1815 	push	hl
   7DFA CD 68 75      [17] 1816 	call	_createRoca
   7DFD 21 07 00      [10] 1817 	ld	hl, #7
   7E00 39            [11] 1818 	add	hl, sp
   7E01 F9            [ 6] 1819 	ld	sp, hl
                           1820 ;src/niveles/niveles.c:240: createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   7E02 21 1C 01      [10] 1821 	ld	hl, #0x011c
   7E05 E5            [11] 1822 	push	hl
   7E06 21 01 00      [10] 1823 	ld	hl, #0x0001
   7E09 E5            [11] 1824 	push	hl
   7E0A 3E 07         [ 7] 1825 	ld	a, #0x07
   7E0C F5            [11] 1826 	push	af
   7E0D 33            [ 6] 1827 	inc	sp
   7E0E DD 6E 06      [19] 1828 	ld	l,6 (ix)
   7E11 DD 66 07      [19] 1829 	ld	h,7 (ix)
   7E14 E5            [11] 1830 	push	hl
   7E15 CD 68 75      [17] 1831 	call	_createRoca
   7E18 21 07 00      [10] 1832 	ld	hl, #7
   7E1B 39            [11] 1833 	add	hl, sp
   7E1C F9            [ 6] 1834 	ld	sp, hl
                           1835 ;src/niveles/niveles.c:241: createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   7E1D 21 1C 01      [10] 1836 	ld	hl, #0x011c
   7E20 E5            [11] 1837 	push	hl
   7E21 21 07 00      [10] 1838 	ld	hl, #0x0007
   7E24 E5            [11] 1839 	push	hl
   7E25 3E 01         [ 7] 1840 	ld	a, #0x01
   7E27 F5            [11] 1841 	push	af
   7E28 33            [ 6] 1842 	inc	sp
   7E29 DD 6E 06      [19] 1843 	ld	l,6 (ix)
   7E2C DD 66 07      [19] 1844 	ld	h,7 (ix)
   7E2F E5            [11] 1845 	push	hl
   7E30 CD 68 75      [17] 1846 	call	_createRoca
   7E33 21 07 00      [10] 1847 	ld	hl, #7
   7E36 39            [11] 1848 	add	hl, sp
   7E37 F9            [ 6] 1849 	ld	sp, hl
                           1850 ;src/niveles/niveles.c:242: createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   7E38 21 1C 01      [10] 1851 	ld	hl, #0x011c
   7E3B E5            [11] 1852 	push	hl
   7E3C 21 07 00      [10] 1853 	ld	hl, #0x0007
   7E3F E5            [11] 1854 	push	hl
   7E40 3E 02         [ 7] 1855 	ld	a, #0x02
   7E42 F5            [11] 1856 	push	af
   7E43 33            [ 6] 1857 	inc	sp
   7E44 DD 6E 06      [19] 1858 	ld	l,6 (ix)
   7E47 DD 66 07      [19] 1859 	ld	h,7 (ix)
   7E4A E5            [11] 1860 	push	hl
   7E4B CD 68 75      [17] 1861 	call	_createRoca
   7E4E 21 07 00      [10] 1862 	ld	hl, #7
   7E51 39            [11] 1863 	add	hl, sp
   7E52 F9            [ 6] 1864 	ld	sp, hl
                           1865 ;src/niveles/niveles.c:243: createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   7E53 21 1C 01      [10] 1866 	ld	hl, #0x011c
   7E56 E5            [11] 1867 	push	hl
   7E57 21 07 00      [10] 1868 	ld	hl, #0x0007
   7E5A E5            [11] 1869 	push	hl
   7E5B 3E 03         [ 7] 1870 	ld	a, #0x03
   7E5D F5            [11] 1871 	push	af
   7E5E 33            [ 6] 1872 	inc	sp
   7E5F DD 6E 06      [19] 1873 	ld	l,6 (ix)
   7E62 DD 66 07      [19] 1874 	ld	h,7 (ix)
   7E65 E5            [11] 1875 	push	hl
   7E66 CD 68 75      [17] 1876 	call	_createRoca
   7E69 21 07 00      [10] 1877 	ld	hl, #7
   7E6C 39            [11] 1878 	add	hl, sp
   7E6D F9            [ 6] 1879 	ld	sp, hl
                           1880 ;src/niveles/niveles.c:244: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   7E6E 21 1C 01      [10] 1881 	ld	hl, #0x011c
   7E71 E5            [11] 1882 	push	hl
   7E72 21 07 00      [10] 1883 	ld	hl, #0x0007
   7E75 E5            [11] 1884 	push	hl
   7E76 3E 04         [ 7] 1885 	ld	a, #0x04
   7E78 F5            [11] 1886 	push	af
   7E79 33            [ 6] 1887 	inc	sp
   7E7A DD 6E 06      [19] 1888 	ld	l,6 (ix)
   7E7D DD 66 07      [19] 1889 	ld	h,7 (ix)
   7E80 E5            [11] 1890 	push	hl
   7E81 CD 68 75      [17] 1891 	call	_createRoca
   7E84 21 07 00      [10] 1892 	ld	hl, #7
   7E87 39            [11] 1893 	add	hl, sp
   7E88 F9            [ 6] 1894 	ld	sp, hl
                           1895 ;src/niveles/niveles.c:245: createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   7E89 21 1C 01      [10] 1896 	ld	hl, #0x011c
   7E8C E5            [11] 1897 	push	hl
   7E8D 21 07 00      [10] 1898 	ld	hl, #0x0007
   7E90 E5            [11] 1899 	push	hl
   7E91 3E 05         [ 7] 1900 	ld	a, #0x05
   7E93 F5            [11] 1901 	push	af
   7E94 33            [ 6] 1902 	inc	sp
   7E95 DD 6E 06      [19] 1903 	ld	l,6 (ix)
   7E98 DD 66 07      [19] 1904 	ld	h,7 (ix)
   7E9B E5            [11] 1905 	push	hl
   7E9C CD 68 75      [17] 1906 	call	_createRoca
   7E9F 21 07 00      [10] 1907 	ld	hl, #7
   7EA2 39            [11] 1908 	add	hl, sp
   7EA3 F9            [ 6] 1909 	ld	sp, hl
                           1910 ;src/niveles/niveles.c:246: createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   7EA4 21 1C 01      [10] 1911 	ld	hl, #0x011c
   7EA7 E5            [11] 1912 	push	hl
   7EA8 21 07 00      [10] 1913 	ld	hl, #0x0007
   7EAB E5            [11] 1914 	push	hl
   7EAC 3E 06         [ 7] 1915 	ld	a, #0x06
   7EAE F5            [11] 1916 	push	af
   7EAF 33            [ 6] 1917 	inc	sp
   7EB0 DD 6E 06      [19] 1918 	ld	l,6 (ix)
   7EB3 DD 66 07      [19] 1919 	ld	h,7 (ix)
   7EB6 E5            [11] 1920 	push	hl
   7EB7 CD 68 75      [17] 1921 	call	_createRoca
   7EBA 21 07 00      [10] 1922 	ld	hl, #7
   7EBD 39            [11] 1923 	add	hl, sp
   7EBE F9            [ 6] 1924 	ld	sp, hl
                           1925 ;src/niveles/niveles.c:247: createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   7EBF 21 1C 01      [10] 1926 	ld	hl, #0x011c
   7EC2 E5            [11] 1927 	push	hl
   7EC3 21 07 00      [10] 1928 	ld	hl, #0x0007
   7EC6 E5            [11] 1929 	push	hl
   7EC7 3E 07         [ 7] 1930 	ld	a, #0x07
   7EC9 F5            [11] 1931 	push	af
   7ECA 33            [ 6] 1932 	inc	sp
   7ECB DD 6E 06      [19] 1933 	ld	l,6 (ix)
   7ECE DD 66 07      [19] 1934 	ld	h,7 (ix)
   7ED1 E5            [11] 1935 	push	hl
   7ED2 CD 68 75      [17] 1936 	call	_createRoca
   7ED5 21 07 00      [10] 1937 	ld	hl, #7
   7ED8 39            [11] 1938 	add	hl, sp
   7ED9 F9            [ 6] 1939 	ld	sp, hl
                           1940 ;src/niveles/niveles.c:248: createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
   7EDA 21 1C 01      [10] 1941 	ld	hl, #0x011c
   7EDD E5            [11] 1942 	push	hl
   7EDE 21 02 00      [10] 1943 	ld	hl, #0x0002
   7EE1 E5            [11] 1944 	push	hl
   7EE2 3E 01         [ 7] 1945 	ld	a, #0x01
   7EE4 F5            [11] 1946 	push	af
   7EE5 33            [ 6] 1947 	inc	sp
   7EE6 DD 6E 06      [19] 1948 	ld	l,6 (ix)
   7EE9 DD 66 07      [19] 1949 	ld	h,7 (ix)
   7EEC E5            [11] 1950 	push	hl
   7EED CD 68 75      [17] 1951 	call	_createRoca
   7EF0 21 07 00      [10] 1952 	ld	hl, #7
   7EF3 39            [11] 1953 	add	hl, sp
   7EF4 F9            [ 6] 1954 	ld	sp, hl
                           1955 ;src/niveles/niveles.c:249: createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
   7EF5 21 1C 01      [10] 1956 	ld	hl, #0x011c
   7EF8 E5            [11] 1957 	push	hl
   7EF9 21 03 00      [10] 1958 	ld	hl, #0x0003
   7EFC E5            [11] 1959 	push	hl
   7EFD 3E 01         [ 7] 1960 	ld	a, #0x01
   7EFF F5            [11] 1961 	push	af
   7F00 33            [ 6] 1962 	inc	sp
   7F01 DD 6E 06      [19] 1963 	ld	l,6 (ix)
   7F04 DD 66 07      [19] 1964 	ld	h,7 (ix)
   7F07 E5            [11] 1965 	push	hl
   7F08 CD 68 75      [17] 1966 	call	_createRoca
   7F0B 21 07 00      [10] 1967 	ld	hl, #7
   7F0E 39            [11] 1968 	add	hl, sp
   7F0F F9            [ 6] 1969 	ld	sp, hl
                           1970 ;src/niveles/niveles.c:250: createRoca(rocas,1,4,sin_Movimiento, sprite_Muro_Polvo1,1);
   7F10 21 1C 01      [10] 1971 	ld	hl, #0x011c
   7F13 E5            [11] 1972 	push	hl
   7F14 21 04 00      [10] 1973 	ld	hl, #0x0004
   7F17 E5            [11] 1974 	push	hl
   7F18 3E 01         [ 7] 1975 	ld	a, #0x01
   7F1A F5            [11] 1976 	push	af
   7F1B 33            [ 6] 1977 	inc	sp
   7F1C DD 6E 06      [19] 1978 	ld	l,6 (ix)
   7F1F DD 66 07      [19] 1979 	ld	h,7 (ix)
   7F22 E5            [11] 1980 	push	hl
   7F23 CD 68 75      [17] 1981 	call	_createRoca
   7F26 21 07 00      [10] 1982 	ld	hl, #7
   7F29 39            [11] 1983 	add	hl, sp
   7F2A F9            [ 6] 1984 	ld	sp, hl
                           1985 ;src/niveles/niveles.c:251: createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
   7F2B 21 1C 01      [10] 1986 	ld	hl, #0x011c
   7F2E E5            [11] 1987 	push	hl
   7F2F 21 05 00      [10] 1988 	ld	hl, #0x0005
   7F32 E5            [11] 1989 	push	hl
   7F33 3E 01         [ 7] 1990 	ld	a, #0x01
   7F35 F5            [11] 1991 	push	af
   7F36 33            [ 6] 1992 	inc	sp
   7F37 DD 6E 06      [19] 1993 	ld	l,6 (ix)
   7F3A DD 66 07      [19] 1994 	ld	h,7 (ix)
   7F3D E5            [11] 1995 	push	hl
   7F3E CD 68 75      [17] 1996 	call	_createRoca
   7F41 21 07 00      [10] 1997 	ld	hl, #7
   7F44 39            [11] 1998 	add	hl, sp
   7F45 F9            [ 6] 1999 	ld	sp, hl
                           2000 ;src/niveles/niveles.c:252: createRoca(rocas,1,6,sin_Movimiento, sprite_Muro_Polvo1,1);
   7F46 21 1C 01      [10] 2001 	ld	hl, #0x011c
   7F49 E5            [11] 2002 	push	hl
   7F4A 21 06 00      [10] 2003 	ld	hl, #0x0006
   7F4D E5            [11] 2004 	push	hl
   7F4E 3E 01         [ 7] 2005 	ld	a, #0x01
   7F50 F5            [11] 2006 	push	af
   7F51 33            [ 6] 2007 	inc	sp
   7F52 DD 6E 06      [19] 2008 	ld	l,6 (ix)
   7F55 DD 66 07      [19] 2009 	ld	h,7 (ix)
   7F58 E5            [11] 2010 	push	hl
   7F59 CD 68 75      [17] 2011 	call	_createRoca
   7F5C 21 07 00      [10] 2012 	ld	hl, #7
   7F5F 39            [11] 2013 	add	hl, sp
   7F60 F9            [ 6] 2014 	ld	sp, hl
                           2015 ;src/niveles/niveles.c:253: createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Polvo1,1);
   7F61 21 1C 01      [10] 2016 	ld	hl, #0x011c
   7F64 E5            [11] 2017 	push	hl
   7F65 21 02 00      [10] 2018 	ld	hl, #0x0002
   7F68 E5            [11] 2019 	push	hl
   7F69 3E 07         [ 7] 2020 	ld	a, #0x07
   7F6B F5            [11] 2021 	push	af
   7F6C 33            [ 6] 2022 	inc	sp
   7F6D DD 6E 06      [19] 2023 	ld	l,6 (ix)
   7F70 DD 66 07      [19] 2024 	ld	h,7 (ix)
   7F73 E5            [11] 2025 	push	hl
   7F74 CD 68 75      [17] 2026 	call	_createRoca
   7F77 21 07 00      [10] 2027 	ld	hl, #7
   7F7A 39            [11] 2028 	add	hl, sp
   7F7B F9            [ 6] 2029 	ld	sp, hl
                           2030 ;src/niveles/niveles.c:254: createRoca(rocas,7,3,sin_Movimiento, sprite_Muro_Polvo1,1);
   7F7C 21 1C 01      [10] 2031 	ld	hl, #0x011c
   7F7F E5            [11] 2032 	push	hl
   7F80 21 03 00      [10] 2033 	ld	hl, #0x0003
   7F83 E5            [11] 2034 	push	hl
   7F84 3E 07         [ 7] 2035 	ld	a, #0x07
   7F86 F5            [11] 2036 	push	af
   7F87 33            [ 6] 2037 	inc	sp
   7F88 DD 6E 06      [19] 2038 	ld	l,6 (ix)
   7F8B DD 66 07      [19] 2039 	ld	h,7 (ix)
   7F8E E5            [11] 2040 	push	hl
   7F8F CD 68 75      [17] 2041 	call	_createRoca
   7F92 21 07 00      [10] 2042 	ld	hl, #7
   7F95 39            [11] 2043 	add	hl, sp
   7F96 F9            [ 6] 2044 	ld	sp, hl
                           2045 ;src/niveles/niveles.c:255: createRoca(rocas,7,4,sin_Movimiento, sprite_Muro_Polvo1,1);
   7F97 21 1C 01      [10] 2046 	ld	hl, #0x011c
   7F9A E5            [11] 2047 	push	hl
   7F9B 21 04 00      [10] 2048 	ld	hl, #0x0004
   7F9E E5            [11] 2049 	push	hl
   7F9F 3E 07         [ 7] 2050 	ld	a, #0x07
   7FA1 F5            [11] 2051 	push	af
   7FA2 33            [ 6] 2052 	inc	sp
   7FA3 DD 6E 06      [19] 2053 	ld	l,6 (ix)
   7FA6 DD 66 07      [19] 2054 	ld	h,7 (ix)
   7FA9 E5            [11] 2055 	push	hl
   7FAA CD 68 75      [17] 2056 	call	_createRoca
   7FAD 21 07 00      [10] 2057 	ld	hl, #7
   7FB0 39            [11] 2058 	add	hl, sp
   7FB1 F9            [ 6] 2059 	ld	sp, hl
                           2060 ;src/niveles/niveles.c:256: createRoca(rocas,7,5,sin_Movimiento, sprite_Muro_Polvo1,1);
   7FB2 21 1C 01      [10] 2061 	ld	hl, #0x011c
   7FB5 E5            [11] 2062 	push	hl
   7FB6 21 05 00      [10] 2063 	ld	hl, #0x0005
   7FB9 E5            [11] 2064 	push	hl
   7FBA 3E 07         [ 7] 2065 	ld	a, #0x07
   7FBC F5            [11] 2066 	push	af
   7FBD 33            [ 6] 2067 	inc	sp
   7FBE DD 6E 06      [19] 2068 	ld	l,6 (ix)
   7FC1 DD 66 07      [19] 2069 	ld	h,7 (ix)
   7FC4 E5            [11] 2070 	push	hl
   7FC5 CD 68 75      [17] 2071 	call	_createRoca
   7FC8 21 07 00      [10] 2072 	ld	hl, #7
   7FCB 39            [11] 2073 	add	hl, sp
   7FCC F9            [ 6] 2074 	ld	sp, hl
                           2075 ;src/niveles/niveles.c:257: createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Polvo1,1);
   7FCD 21 1C 01      [10] 2076 	ld	hl, #0x011c
   7FD0 E5            [11] 2077 	push	hl
   7FD1 21 06 00      [10] 2078 	ld	hl, #0x0006
   7FD4 E5            [11] 2079 	push	hl
   7FD5 3E 07         [ 7] 2080 	ld	a, #0x07
   7FD7 F5            [11] 2081 	push	af
   7FD8 33            [ 6] 2082 	inc	sp
   7FD9 DD 6E 06      [19] 2083 	ld	l,6 (ix)
   7FDC DD 66 07      [19] 2084 	ld	h,7 (ix)
   7FDF E5            [11] 2085 	push	hl
   7FE0 CD 68 75      [17] 2086 	call	_createRoca
   7FE3 21 07 00      [10] 2087 	ld	hl, #7
   7FE6 39            [11] 2088 	add	hl, sp
   7FE7 F9            [ 6] 2089 	ld	sp, hl
                           2090 ;src/niveles/niveles.c:258: createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   7FE8 21 1C 01      [10] 2091 	ld	hl, #0x011c
   7FEB E5            [11] 2092 	push	hl
   7FEC 21 07 00      [10] 2093 	ld	hl, #0x0007
   7FEF E5            [11] 2094 	push	hl
   7FF0 3E 07         [ 7] 2095 	ld	a, #0x07
   7FF2 F5            [11] 2096 	push	af
   7FF3 33            [ 6] 2097 	inc	sp
   7FF4 DD 6E 06      [19] 2098 	ld	l,6 (ix)
   7FF7 DD 66 07      [19] 2099 	ld	h,7 (ix)
   7FFA E5            [11] 2100 	push	hl
   7FFB CD 68 75      [17] 2101 	call	_createRoca
   7FFE 21 07 00      [10] 2102 	ld	hl, #7
   8001 39            [11] 2103 	add	hl, sp
   8002 F9            [ 6] 2104 	ld	sp, hl
                           2105 ;src/niveles/niveles.c:259: createRoca(rocas,3,3,sin_Movimiento,sprite_RockInmovil1_B,1);
   8003 21 08 01      [10] 2106 	ld	hl, #0x0108
   8006 E5            [11] 2107 	push	hl
   8007 21 03 00      [10] 2108 	ld	hl, #0x0003
   800A E5            [11] 2109 	push	hl
   800B 3E 03         [ 7] 2110 	ld	a, #0x03
   800D F5            [11] 2111 	push	af
   800E 33            [ 6] 2112 	inc	sp
   800F DD 6E 06      [19] 2113 	ld	l,6 (ix)
   8012 DD 66 07      [19] 2114 	ld	h,7 (ix)
   8015 E5            [11] 2115 	push	hl
   8016 CD 68 75      [17] 2116 	call	_createRoca
   8019 21 07 00      [10] 2117 	ld	hl, #7
   801C 39            [11] 2118 	add	hl, sp
   801D F9            [ 6] 2119 	ld	sp, hl
                           2120 ;src/niveles/niveles.c:260: createRoca(rocas,3,5,sin_Movimiento,sprite_RockInmovil1_B,1);
   801E 21 08 01      [10] 2121 	ld	hl, #0x0108
   8021 E5            [11] 2122 	push	hl
   8022 21 05 00      [10] 2123 	ld	hl, #0x0005
   8025 E5            [11] 2124 	push	hl
   8026 3E 03         [ 7] 2125 	ld	a, #0x03
   8028 F5            [11] 2126 	push	af
   8029 33            [ 6] 2127 	inc	sp
   802A DD 6E 06      [19] 2128 	ld	l,6 (ix)
   802D DD 66 07      [19] 2129 	ld	h,7 (ix)
   8030 E5            [11] 2130 	push	hl
   8031 CD 68 75      [17] 2131 	call	_createRoca
   8034 21 07 00      [10] 2132 	ld	hl, #7
   8037 39            [11] 2133 	add	hl, sp
   8038 F9            [ 6] 2134 	ld	sp, hl
                           2135 ;src/niveles/niveles.c:261: createRoca(rocas,5,3,sin_Movimiento,sprite_RockInmovil1_B,1);
   8039 21 08 01      [10] 2136 	ld	hl, #0x0108
   803C E5            [11] 2137 	push	hl
   803D 21 03 00      [10] 2138 	ld	hl, #0x0003
   8040 E5            [11] 2139 	push	hl
   8041 3E 05         [ 7] 2140 	ld	a, #0x05
   8043 F5            [11] 2141 	push	af
   8044 33            [ 6] 2142 	inc	sp
   8045 DD 6E 06      [19] 2143 	ld	l,6 (ix)
   8048 DD 66 07      [19] 2144 	ld	h,7 (ix)
   804B E5            [11] 2145 	push	hl
   804C CD 68 75      [17] 2146 	call	_createRoca
   804F 21 07 00      [10] 2147 	ld	hl, #7
   8052 39            [11] 2148 	add	hl, sp
   8053 F9            [ 6] 2149 	ld	sp, hl
                           2150 ;src/niveles/niveles.c:262: createRoca(rocas,5,5,sin_Movimiento,sprite_RockInmovil1_B,1);
   8054 21 08 01      [10] 2151 	ld	hl, #0x0108
   8057 E5            [11] 2152 	push	hl
   8058 21 05 00      [10] 2153 	ld	hl, #0x0005
   805B E5            [11] 2154 	push	hl
   805C 3E 05         [ 7] 2155 	ld	a, #0x05
   805E F5            [11] 2156 	push	af
   805F 33            [ 6] 2157 	inc	sp
   8060 DD 6E 06      [19] 2158 	ld	l,6 (ix)
   8063 DD 66 07      [19] 2159 	ld	h,7 (ix)
   8066 E5            [11] 2160 	push	hl
   8067 CD 68 75      [17] 2161 	call	_createRoca
   806A 21 07 00      [10] 2162 	ld	hl, #7
   806D 39            [11] 2163 	add	hl, sp
   806E F9            [ 6] 2164 	ld	sp, hl
   806F DD E1         [14] 2165 	pop	ix
   8071 C9            [10] 2166 	ret
                           2167 ;src/niveles/niveles.c:267: void crearNievel3(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           2168 ;	---------------------------------
                           2169 ; Function crearNievel3
                           2170 ; ---------------------------------
   8072                    2171 _crearNievel3::
   8072 DD E5         [15] 2172 	push	ix
   8074 DD 21 00 00   [14] 2173 	ld	ix,#0
   8078 DD 39         [15] 2174 	add	ix,sp
                           2175 ;src/niveles/niveles.c:269: createPlayer(player,3,3,posicion);
   807A DD 6E 10      [19] 2176 	ld	l,16 (ix)
   807D DD 66 11      [19] 2177 	ld	h,17 (ix)
   8080 E5            [11] 2178 	push	hl
   8081 21 03 03      [10] 2179 	ld	hl, #0x0303
   8084 E5            [11] 2180 	push	hl
   8085 DD 6E 04      [19] 2181 	ld	l,4 (ix)
   8088 DD 66 05      [19] 2182 	ld	h,5 (ix)
   808B E5            [11] 2183 	push	hl
   808C CD 29 75      [17] 2184 	call	_createPlayer
   808F 21 06 00      [10] 2185 	ld	hl, #6
   8092 39            [11] 2186 	add	hl, sp
   8093 F9            [ 6] 2187 	ld	sp, hl
                           2188 ;src/niveles/niveles.c:270: createMarco(si);
   8094 AF            [ 4] 2189 	xor	a, a
   8095 F5            [11] 2190 	push	af
   8096 33            [ 6] 2191 	inc	sp
   8097 CD 1A 75      [17] 2192 	call	_createMarco
   809A 33            [ 6] 2193 	inc	sp
                           2194 ;src/niveles/niveles.c:271: createPortal(portales,rocas,rocasEspejo,si);
   809B AF            [ 4] 2195 	xor	a, a
   809C F5            [11] 2196 	push	af
   809D 33            [ 6] 2197 	inc	sp
   809E DD 6E 08      [19] 2198 	ld	l,8 (ix)
   80A1 DD 66 09      [19] 2199 	ld	h,9 (ix)
   80A4 E5            [11] 2200 	push	hl
   80A5 DD 6E 06      [19] 2201 	ld	l,6 (ix)
   80A8 DD 66 07      [19] 2202 	ld	h,7 (ix)
   80AB E5            [11] 2203 	push	hl
   80AC DD 6E 0C      [19] 2204 	ld	l,12 (ix)
   80AF DD 66 0D      [19] 2205 	ld	h,13 (ix)
   80B2 E5            [11] 2206 	push	hl
   80B3 CD 0D 77      [17] 2207 	call	_createPortal
   80B6 21 07 00      [10] 2208 	ld	hl, #7
   80B9 39            [11] 2209 	add	hl, sp
   80BA F9            [ 6] 2210 	ld	sp, hl
                           2211 ;src/niveles/niveles.c:272: createPuerta(puertas,3,1,sprite_Puerta_G,nivel_02);
   80BB 21 1E 04      [10] 2212 	ld	hl, #0x041e
   80BE E5            [11] 2213 	push	hl
   80BF 21 03 01      [10] 2214 	ld	hl, #0x0103
   80C2 E5            [11] 2215 	push	hl
   80C3 DD 6E 0A      [19] 2216 	ld	l,10 (ix)
   80C6 DD 66 0B      [19] 2217 	ld	h,11 (ix)
   80C9 E5            [11] 2218 	push	hl
   80CA CD 94 76      [17] 2219 	call	_createPuerta
   80CD 21 06 00      [10] 2220 	ld	hl, #6
   80D0 39            [11] 2221 	add	hl, sp
   80D1 F9            [ 6] 2222 	ld	sp, hl
                           2223 ;src/niveles/niveles.c:273: createPuerta(puertas,13,1,sprite_Puerta_B,nivel_01_01);
   80D2 21 1F 02      [10] 2224 	ld	hl, #0x021f
   80D5 E5            [11] 2225 	push	hl
   80D6 21 0D 01      [10] 2226 	ld	hl, #0x010d
   80D9 E5            [11] 2227 	push	hl
   80DA DD 6E 0A      [19] 2228 	ld	l,10 (ix)
   80DD DD 66 0B      [19] 2229 	ld	h,11 (ix)
   80E0 E5            [11] 2230 	push	hl
   80E1 CD 94 76      [17] 2231 	call	_createPuerta
   80E4 21 06 00      [10] 2232 	ld	hl, #6
   80E7 39            [11] 2233 	add	hl, sp
   80E8 F9            [ 6] 2234 	ld	sp, hl
                           2235 ;src/niveles/niveles.c:276: createPuerta(puertas,11,7,sprite_StairDown1_B,nivel_TRAP_01);
   80E9 21 23 03      [10] 2236 	ld	hl, #0x0323
   80EC E5            [11] 2237 	push	hl
   80ED 21 0B 07      [10] 2238 	ld	hl, #0x070b
   80F0 E5            [11] 2239 	push	hl
   80F1 DD 6E 0A      [19] 2240 	ld	l,10 (ix)
   80F4 DD 66 0B      [19] 2241 	ld	h,11 (ix)
   80F7 E5            [11] 2242 	push	hl
   80F8 CD 94 76      [17] 2243 	call	_createPuerta
   80FB 21 06 00      [10] 2244 	ld	hl, #6
   80FE 39            [11] 2245 	add	hl, sp
   80FF F9            [ 6] 2246 	ld	sp, hl
                           2247 ;src/niveles/niveles.c:277: createPuerta(puertas,9,7,sprite_StairUp1_B,nivel_TRAP_01);
   8100 21 21 03      [10] 2248 	ld	hl, #0x0321
   8103 E5            [11] 2249 	push	hl
   8104 21 09 07      [10] 2250 	ld	hl, #0x0709
   8107 E5            [11] 2251 	push	hl
   8108 DD 6E 0A      [19] 2252 	ld	l,10 (ix)
   810B DD 66 0B      [19] 2253 	ld	h,11 (ix)
   810E E5            [11] 2254 	push	hl
   810F CD 94 76      [17] 2255 	call	_createPuerta
   8112 21 06 00      [10] 2256 	ld	hl, #6
   8115 39            [11] 2257 	add	hl, sp
   8116 F9            [ 6] 2258 	ld	sp, hl
                           2259 ;src/niveles/niveles.c:281: createRoca(rocas,5,4,mover_1,sprite_Rock_G,2);
   8117 21 02 02      [10] 2260 	ld	hl, #0x0202
   811A E5            [11] 2261 	push	hl
   811B 21 04 01      [10] 2262 	ld	hl, #0x0104
   811E E5            [11] 2263 	push	hl
   811F 3E 05         [ 7] 2264 	ld	a, #0x05
   8121 F5            [11] 2265 	push	af
   8122 33            [ 6] 2266 	inc	sp
   8123 DD 6E 06      [19] 2267 	ld	l,6 (ix)
   8126 DD 66 07      [19] 2268 	ld	h,7 (ix)
   8129 E5            [11] 2269 	push	hl
   812A CD 68 75      [17] 2270 	call	_createRoca
   812D 21 07 00      [10] 2271 	ld	hl, #7
   8130 39            [11] 2272 	add	hl, sp
   8131 F9            [ 6] 2273 	ld	sp, hl
                           2274 ;src/niveles/niveles.c:282: createRoca(rocas,1,6,mover_1,sprite_Rock_G,3);
   8132 21 02 03      [10] 2275 	ld	hl, #0x0302
   8135 E5            [11] 2276 	push	hl
   8136 21 06 01      [10] 2277 	ld	hl, #0x0106
   8139 E5            [11] 2278 	push	hl
   813A 3E 01         [ 7] 2279 	ld	a, #0x01
   813C F5            [11] 2280 	push	af
   813D 33            [ 6] 2281 	inc	sp
   813E DD 6E 06      [19] 2282 	ld	l,6 (ix)
   8141 DD 66 07      [19] 2283 	ld	h,7 (ix)
   8144 E5            [11] 2284 	push	hl
   8145 CD 68 75      [17] 2285 	call	_createRoca
   8148 21 07 00      [10] 2286 	ld	hl, #7
   814B 39            [11] 2287 	add	hl, sp
   814C F9            [ 6] 2288 	ld	sp, hl
                           2289 ;src/niveles/niveles.c:283: createRocaEspejo(rocasEspejo,11,4,mover_Linea,sprite_RockLineal1_G,2);
   814D 21 05 02      [10] 2290 	ld	hl, #0x0205
   8150 E5            [11] 2291 	push	hl
   8151 2E 04         [ 7] 2292 	ld	l, #0x04
   8153 E5            [11] 2293 	push	hl
   8154 3E 0B         [ 7] 2294 	ld	a, #0x0b
   8156 F5            [11] 2295 	push	af
   8157 33            [ 6] 2296 	inc	sp
   8158 DD 6E 08      [19] 2297 	ld	l,8 (ix)
   815B DD 66 09      [19] 2298 	ld	h,9 (ix)
   815E E5            [11] 2299 	push	hl
   815F CD FE 75      [17] 2300 	call	_createRocaEspejo
   8162 21 07 00      [10] 2301 	ld	hl, #7
   8165 39            [11] 2302 	add	hl, sp
   8166 F9            [ 6] 2303 	ld	sp, hl
                           2304 ;src/niveles/niveles.c:287: createColeccionabeFamilia(col,15,5,sprite_familia1,5);
   8167 21 26 05      [10] 2305 	ld	hl, #0x0526
   816A E5            [11] 2306 	push	hl
   816B 2E 0F         [ 7] 2307 	ld	l, #0x0f
   816D E5            [11] 2308 	push	hl
   816E DD 6E 0E      [19] 2309 	ld	l,14 (ix)
   8171 DD 66 0F      [19] 2310 	ld	h,15 (ix)
   8174 E5            [11] 2311 	push	hl
   8175 CD F9 78      [17] 2312 	call	_createColeccionabeFamilia
   8178 21 06 00      [10] 2313 	ld	hl, #6
   817B 39            [11] 2314 	add	hl, sp
   817C F9            [ 6] 2315 	ld	sp, hl
                           2316 ;src/niveles/niveles.c:290: createRoca(rocas,4,2,sin_Movimiento,sprite_RockInmovil1_G,1);
   817D 21 07 01      [10] 2317 	ld	hl, #0x0107
   8180 E5            [11] 2318 	push	hl
   8181 21 02 00      [10] 2319 	ld	hl, #0x0002
   8184 E5            [11] 2320 	push	hl
   8185 3E 04         [ 7] 2321 	ld	a, #0x04
   8187 F5            [11] 2322 	push	af
   8188 33            [ 6] 2323 	inc	sp
   8189 DD 6E 06      [19] 2324 	ld	l,6 (ix)
   818C DD 66 07      [19] 2325 	ld	h,7 (ix)
   818F E5            [11] 2326 	push	hl
   8190 CD 68 75      [17] 2327 	call	_createRoca
   8193 21 07 00      [10] 2328 	ld	hl, #7
   8196 39            [11] 2329 	add	hl, sp
   8197 F9            [ 6] 2330 	ld	sp, hl
                           2331 ;src/niveles/niveles.c:291: createRoca(rocas,4,6,sin_Movimiento,sprite_RockInmovil1_G,1);
   8198 21 07 01      [10] 2332 	ld	hl, #0x0107
   819B E5            [11] 2333 	push	hl
   819C 21 06 00      [10] 2334 	ld	hl, #0x0006
   819F E5            [11] 2335 	push	hl
   81A0 3E 04         [ 7] 2336 	ld	a, #0x04
   81A2 F5            [11] 2337 	push	af
   81A3 33            [ 6] 2338 	inc	sp
   81A4 DD 6E 06      [19] 2339 	ld	l,6 (ix)
   81A7 DD 66 07      [19] 2340 	ld	h,7 (ix)
   81AA E5            [11] 2341 	push	hl
   81AB CD 68 75      [17] 2342 	call	_createRoca
   81AE 21 07 00      [10] 2343 	ld	hl, #7
   81B1 39            [11] 2344 	add	hl, sp
   81B2 F9            [ 6] 2345 	ld	sp, hl
                           2346 ;src/niveles/niveles.c:292: createRoca(rocas,6,2,sin_Movimiento,sprite_RockInmovil2_G,1);
   81B3 21 09 01      [10] 2347 	ld	hl, #0x0109
   81B6 E5            [11] 2348 	push	hl
   81B7 21 02 00      [10] 2349 	ld	hl, #0x0002
   81BA E5            [11] 2350 	push	hl
   81BB 3E 06         [ 7] 2351 	ld	a, #0x06
   81BD F5            [11] 2352 	push	af
   81BE 33            [ 6] 2353 	inc	sp
   81BF DD 6E 06      [19] 2354 	ld	l,6 (ix)
   81C2 DD 66 07      [19] 2355 	ld	h,7 (ix)
   81C5 E5            [11] 2356 	push	hl
   81C6 CD 68 75      [17] 2357 	call	_createRoca
   81C9 21 07 00      [10] 2358 	ld	hl, #7
   81CC 39            [11] 2359 	add	hl, sp
   81CD F9            [ 6] 2360 	ld	sp, hl
                           2361 ;src/niveles/niveles.c:293: createRoca(rocas,6,6,sin_Movimiento,sprite_RockInmovil2_G,1);
   81CE 21 09 01      [10] 2362 	ld	hl, #0x0109
   81D1 E5            [11] 2363 	push	hl
   81D2 21 06 00      [10] 2364 	ld	hl, #0x0006
   81D5 E5            [11] 2365 	push	hl
   81D6 3E 06         [ 7] 2366 	ld	a, #0x06
   81D8 F5            [11] 2367 	push	af
   81D9 33            [ 6] 2368 	inc	sp
   81DA DD 6E 06      [19] 2369 	ld	l,6 (ix)
   81DD DD 66 07      [19] 2370 	ld	h,7 (ix)
   81E0 E5            [11] 2371 	push	hl
   81E1 CD 68 75      [17] 2372 	call	_createRoca
   81E4 21 07 00      [10] 2373 	ld	hl, #7
   81E7 39            [11] 2374 	add	hl, sp
   81E8 F9            [ 6] 2375 	ld	sp, hl
                           2376 ;src/niveles/niveles.c:294: createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil6_G,1);
   81E9 21 11 01      [10] 2377 	ld	hl, #0x0111
   81EC E5            [11] 2378 	push	hl
   81ED 21 05 00      [10] 2379 	ld	hl, #0x0005
   81F0 E5            [11] 2380 	push	hl
   81F1 3E 02         [ 7] 2381 	ld	a, #0x02
   81F3 F5            [11] 2382 	push	af
   81F4 33            [ 6] 2383 	inc	sp
   81F5 DD 6E 06      [19] 2384 	ld	l,6 (ix)
   81F8 DD 66 07      [19] 2385 	ld	h,7 (ix)
   81FB E5            [11] 2386 	push	hl
   81FC CD 68 75      [17] 2387 	call	_createRoca
   81FF 21 07 00      [10] 2388 	ld	hl, #7
   8202 39            [11] 2389 	add	hl, sp
   8203 F9            [ 6] 2390 	ld	sp, hl
                           2391 ;src/niveles/niveles.c:295: createRoca(rocas,2,4,sin_Movimiento,sprite_RockInmovil7_G,1);
   8204 21 13 01      [10] 2392 	ld	hl, #0x0113
   8207 E5            [11] 2393 	push	hl
   8208 21 04 00      [10] 2394 	ld	hl, #0x0004
   820B E5            [11] 2395 	push	hl
   820C 3E 02         [ 7] 2396 	ld	a, #0x02
   820E F5            [11] 2397 	push	af
   820F 33            [ 6] 2398 	inc	sp
   8210 DD 6E 06      [19] 2399 	ld	l,6 (ix)
   8213 DD 66 07      [19] 2400 	ld	h,7 (ix)
   8216 E5            [11] 2401 	push	hl
   8217 CD 68 75      [17] 2402 	call	_createRoca
   821A 21 07 00      [10] 2403 	ld	hl, #7
   821D 39            [11] 2404 	add	hl, sp
   821E F9            [ 6] 2405 	ld	sp, hl
                           2406 ;src/niveles/niveles.c:296: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
   821F 21 1D 01      [10] 2407 	ld	hl, #0x011d
   8222 E5            [11] 2408 	push	hl
   8223 21 07 00      [10] 2409 	ld	hl, #0x0007
   8226 E5            [11] 2410 	push	hl
   8227 3E 04         [ 7] 2411 	ld	a, #0x04
   8229 F5            [11] 2412 	push	af
   822A 33            [ 6] 2413 	inc	sp
   822B DD 6E 06      [19] 2414 	ld	l,6 (ix)
   822E DD 66 07      [19] 2415 	ld	h,7 (ix)
   8231 E5            [11] 2416 	push	hl
   8232 CD 68 75      [17] 2417 	call	_createRoca
   8235 21 07 00      [10] 2418 	ld	hl, #7
   8238 39            [11] 2419 	add	hl, sp
   8239 F9            [ 6] 2420 	ld	sp, hl
                           2421 ;src/niveles/niveles.c:297: createRoca(rocas,5,6,sin_Movimiento, sprite_Muro_Solid1,1);
   823A 21 1D 01      [10] 2422 	ld	hl, #0x011d
   823D E5            [11] 2423 	push	hl
   823E 21 06 00      [10] 2424 	ld	hl, #0x0006
   8241 E5            [11] 2425 	push	hl
   8242 3E 05         [ 7] 2426 	ld	a, #0x05
   8244 F5            [11] 2427 	push	af
   8245 33            [ 6] 2428 	inc	sp
   8246 DD 6E 06      [19] 2429 	ld	l,6 (ix)
   8249 DD 66 07      [19] 2430 	ld	h,7 (ix)
   824C E5            [11] 2431 	push	hl
   824D CD 68 75      [17] 2432 	call	_createRoca
   8250 21 07 00      [10] 2433 	ld	hl, #7
   8253 39            [11] 2434 	add	hl, sp
   8254 F9            [ 6] 2435 	ld	sp, hl
                           2436 ;src/niveles/niveles.c:298: createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Solid1,1);
   8255 21 1D 01      [10] 2437 	ld	hl, #0x011d
   8258 E5            [11] 2438 	push	hl
   8259 21 06 00      [10] 2439 	ld	hl, #0x0006
   825C E5            [11] 2440 	push	hl
   825D 3E 07         [ 7] 2441 	ld	a, #0x07
   825F F5            [11] 2442 	push	af
   8260 33            [ 6] 2443 	inc	sp
   8261 DD 6E 06      [19] 2444 	ld	l,6 (ix)
   8264 DD 66 07      [19] 2445 	ld	h,7 (ix)
   8267 E5            [11] 2446 	push	hl
   8268 CD 68 75      [17] 2447 	call	_createRoca
   826B 21 07 00      [10] 2448 	ld	hl, #7
   826E 39            [11] 2449 	add	hl, sp
   826F F9            [ 6] 2450 	ld	sp, hl
                           2451 ;src/niveles/niveles.c:302: createRocaEspejo(rocasEspejo,12,2,sin_Movimiento,sprite_RockInmovil1_B,1);
   8270 21 08 01      [10] 2452 	ld	hl, #0x0108
   8273 E5            [11] 2453 	push	hl
   8274 21 02 00      [10] 2454 	ld	hl, #0x0002
   8277 E5            [11] 2455 	push	hl
   8278 3E 0C         [ 7] 2456 	ld	a, #0x0c
   827A F5            [11] 2457 	push	af
   827B 33            [ 6] 2458 	inc	sp
   827C DD 6E 08      [19] 2459 	ld	l,8 (ix)
   827F DD 66 09      [19] 2460 	ld	h,9 (ix)
   8282 E5            [11] 2461 	push	hl
   8283 CD FE 75      [17] 2462 	call	_createRocaEspejo
   8286 21 07 00      [10] 2463 	ld	hl, #7
   8289 39            [11] 2464 	add	hl, sp
   828A F9            [ 6] 2465 	ld	sp, hl
                           2466 ;src/niveles/niveles.c:303: createRocaEspejo(rocasEspejo,12,6,sin_Movimiento,sprite_RockInmovil1_B,1);
   828B 21 08 01      [10] 2467 	ld	hl, #0x0108
   828E E5            [11] 2468 	push	hl
   828F 21 06 00      [10] 2469 	ld	hl, #0x0006
   8292 E5            [11] 2470 	push	hl
   8293 3E 0C         [ 7] 2471 	ld	a, #0x0c
   8295 F5            [11] 2472 	push	af
   8296 33            [ 6] 2473 	inc	sp
   8297 DD 6E 08      [19] 2474 	ld	l,8 (ix)
   829A DD 66 09      [19] 2475 	ld	h,9 (ix)
   829D E5            [11] 2476 	push	hl
   829E CD FE 75      [17] 2477 	call	_createRocaEspejo
   82A1 21 07 00      [10] 2478 	ld	hl, #7
   82A4 39            [11] 2479 	add	hl, sp
   82A5 F9            [ 6] 2480 	ld	sp, hl
                           2481 ;src/niveles/niveles.c:304: createRocaEspejo(rocasEspejo,10,2,sin_Movimiento,sprite_RockInmovil2_B,1);
   82A6 21 0A 01      [10] 2482 	ld	hl, #0x010a
   82A9 E5            [11] 2483 	push	hl
   82AA 21 02 00      [10] 2484 	ld	hl, #0x0002
   82AD E5            [11] 2485 	push	hl
   82AE 3E 0A         [ 7] 2486 	ld	a, #0x0a
   82B0 F5            [11] 2487 	push	af
   82B1 33            [ 6] 2488 	inc	sp
   82B2 DD 6E 08      [19] 2489 	ld	l,8 (ix)
   82B5 DD 66 09      [19] 2490 	ld	h,9 (ix)
   82B8 E5            [11] 2491 	push	hl
   82B9 CD FE 75      [17] 2492 	call	_createRocaEspejo
   82BC 21 07 00      [10] 2493 	ld	hl, #7
   82BF 39            [11] 2494 	add	hl, sp
   82C0 F9            [ 6] 2495 	ld	sp, hl
                           2496 ;src/niveles/niveles.c:305: createRocaEspejo(rocasEspejo,10,6,sin_Movimiento,sprite_RockInmovil2_B,1);
   82C1 21 0A 01      [10] 2497 	ld	hl, #0x010a
   82C4 E5            [11] 2498 	push	hl
   82C5 21 06 00      [10] 2499 	ld	hl, #0x0006
   82C8 E5            [11] 2500 	push	hl
   82C9 3E 0A         [ 7] 2501 	ld	a, #0x0a
   82CB F5            [11] 2502 	push	af
   82CC 33            [ 6] 2503 	inc	sp
   82CD DD 6E 08      [19] 2504 	ld	l,8 (ix)
   82D0 DD 66 09      [19] 2505 	ld	h,9 (ix)
   82D3 E5            [11] 2506 	push	hl
   82D4 CD FE 75      [17] 2507 	call	_createRocaEspejo
   82D7 21 07 00      [10] 2508 	ld	hl, #7
   82DA 39            [11] 2509 	add	hl, sp
   82DB F9            [ 6] 2510 	ld	sp, hl
                           2511 ;src/niveles/niveles.c:306: createRocaEspejo(rocasEspejo,14,5,sin_Movimiento,sprite_RockInmovil6_B,1);
   82DC 21 12 01      [10] 2512 	ld	hl, #0x0112
   82DF E5            [11] 2513 	push	hl
   82E0 21 05 00      [10] 2514 	ld	hl, #0x0005
   82E3 E5            [11] 2515 	push	hl
   82E4 3E 0E         [ 7] 2516 	ld	a, #0x0e
   82E6 F5            [11] 2517 	push	af
   82E7 33            [ 6] 2518 	inc	sp
   82E8 DD 6E 08      [19] 2519 	ld	l,8 (ix)
   82EB DD 66 09      [19] 2520 	ld	h,9 (ix)
   82EE E5            [11] 2521 	push	hl
   82EF CD FE 75      [17] 2522 	call	_createRocaEspejo
   82F2 21 07 00      [10] 2523 	ld	hl, #7
   82F5 39            [11] 2524 	add	hl, sp
   82F6 F9            [ 6] 2525 	ld	sp, hl
                           2526 ;src/niveles/niveles.c:307: createRocaEspejo(rocasEspejo,14,4,sin_Movimiento,sprite_RockInmovil7_B,1);
   82F7 21 14 01      [10] 2527 	ld	hl, #0x0114
   82FA E5            [11] 2528 	push	hl
   82FB 21 04 00      [10] 2529 	ld	hl, #0x0004
   82FE E5            [11] 2530 	push	hl
   82FF 3E 0E         [ 7] 2531 	ld	a, #0x0e
   8301 F5            [11] 2532 	push	af
   8302 33            [ 6] 2533 	inc	sp
   8303 DD 6E 08      [19] 2534 	ld	l,8 (ix)
   8306 DD 66 09      [19] 2535 	ld	h,9 (ix)
   8309 E5            [11] 2536 	push	hl
   830A CD FE 75      [17] 2537 	call	_createRocaEspejo
   830D 21 07 00      [10] 2538 	ld	hl, #7
   8310 39            [11] 2539 	add	hl, sp
   8311 F9            [ 6] 2540 	ld	sp, hl
                           2541 ;src/niveles/niveles.c:308: createRocaEspejo(rocasEspejo,12,7,sin_Movimiento, sprite_Muro_Solid1,1);
   8312 21 1D 01      [10] 2542 	ld	hl, #0x011d
   8315 E5            [11] 2543 	push	hl
   8316 21 07 00      [10] 2544 	ld	hl, #0x0007
   8319 E5            [11] 2545 	push	hl
   831A 3E 0C         [ 7] 2546 	ld	a, #0x0c
   831C F5            [11] 2547 	push	af
   831D 33            [ 6] 2548 	inc	sp
   831E DD 6E 08      [19] 2549 	ld	l,8 (ix)
   8321 DD 66 09      [19] 2550 	ld	h,9 (ix)
   8324 E5            [11] 2551 	push	hl
   8325 CD FE 75      [17] 2552 	call	_createRocaEspejo
   8328 21 07 00      [10] 2553 	ld	hl, #7
   832B 39            [11] 2554 	add	hl, sp
   832C F9            [ 6] 2555 	ld	sp, hl
                           2556 ;src/niveles/niveles.c:309: createRocaEspejo(rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Solid1,1);
   832D 21 1D 01      [10] 2557 	ld	hl, #0x011d
   8330 E5            [11] 2558 	push	hl
   8331 21 06 00      [10] 2559 	ld	hl, #0x0006
   8334 E5            [11] 2560 	push	hl
   8335 3E 09         [ 7] 2561 	ld	a, #0x09
   8337 F5            [11] 2562 	push	af
   8338 33            [ 6] 2563 	inc	sp
   8339 DD 6E 08      [19] 2564 	ld	l,8 (ix)
   833C DD 66 09      [19] 2565 	ld	h,9 (ix)
   833F E5            [11] 2566 	push	hl
   8340 CD FE 75      [17] 2567 	call	_createRocaEspejo
   8343 21 07 00      [10] 2568 	ld	hl, #7
   8346 39            [11] 2569 	add	hl, sp
   8347 F9            [ 6] 2570 	ld	sp, hl
                           2571 ;src/niveles/niveles.c:310: createRocaEspejo(rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Solid1,1);
   8348 21 1D 01      [10] 2572 	ld	hl, #0x011d
   834B E5            [11] 2573 	push	hl
   834C 21 06 00      [10] 2574 	ld	hl, #0x0006
   834F E5            [11] 2575 	push	hl
   8350 3E 0B         [ 7] 2576 	ld	a, #0x0b
   8352 F5            [11] 2577 	push	af
   8353 33            [ 6] 2578 	inc	sp
   8354 DD 6E 08      [19] 2579 	ld	l,8 (ix)
   8357 DD 66 09      [19] 2580 	ld	h,9 (ix)
   835A E5            [11] 2581 	push	hl
   835B CD FE 75      [17] 2582 	call	_createRocaEspejo
   835E 21 07 00      [10] 2583 	ld	hl, #7
   8361 39            [11] 2584 	add	hl, sp
   8362 F9            [ 6] 2585 	ld	sp, hl
                           2586 ;src/niveles/niveles.c:311: createHoleDerecha(rocasEspejo,15,3,sprite_hole,1);
   8363 21 24 01      [10] 2587 	ld	hl, #0x0124
   8366 E5            [11] 2588 	push	hl
   8367 21 0F 03      [10] 2589 	ld	hl, #0x030f
   836A E5            [11] 2590 	push	hl
   836B DD 6E 08      [19] 2591 	ld	l,8 (ix)
   836E DD 66 09      [19] 2592 	ld	h,9 (ix)
   8371 E5            [11] 2593 	push	hl
   8372 CD ED 77      [17] 2594 	call	_createHoleDerecha
   8375 21 06 00      [10] 2595 	ld	hl, #6
   8378 39            [11] 2596 	add	hl, sp
   8379 F9            [ 6] 2597 	ld	sp, hl
                           2598 ;src/niveles/niveles.c:312: createHoleDerecha(rocasEspejo,15,6,sprite_hole,1);
   837A 21 24 01      [10] 2599 	ld	hl, #0x0124
   837D E5            [11] 2600 	push	hl
   837E 21 0F 06      [10] 2601 	ld	hl, #0x060f
   8381 E5            [11] 2602 	push	hl
   8382 DD 6E 08      [19] 2603 	ld	l,8 (ix)
   8385 DD 66 09      [19] 2604 	ld	h,9 (ix)
   8388 E5            [11] 2605 	push	hl
   8389 CD ED 77      [17] 2606 	call	_createHoleDerecha
   838C 21 06 00      [10] 2607 	ld	hl, #6
   838F 39            [11] 2608 	add	hl, sp
   8390 F9            [ 6] 2609 	ld	sp, hl
   8391 DD E1         [14] 2610 	pop	ix
   8393 C9            [10] 2611 	ret
                           2612 ;src/niveles/niveles.c:319: void crearNievel4(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           2613 ;	---------------------------------
                           2614 ; Function crearNievel4
                           2615 ; ---------------------------------
   8394                    2616 _crearNievel4::
   8394 DD E5         [15] 2617 	push	ix
   8396 DD 21 00 00   [14] 2618 	ld	ix,#0
   839A DD 39         [15] 2619 	add	ix,sp
                           2620 ;src/niveles/niveles.c:321: createPlayer(player,14,4,posicion);
   839C DD 6E 10      [19] 2621 	ld	l,16 (ix)
   839F DD 66 11      [19] 2622 	ld	h,17 (ix)
   83A2 E5            [11] 2623 	push	hl
   83A3 21 0E 04      [10] 2624 	ld	hl, #0x040e
   83A6 E5            [11] 2625 	push	hl
   83A7 DD 6E 04      [19] 2626 	ld	l,4 (ix)
   83AA DD 66 05      [19] 2627 	ld	h,5 (ix)
   83AD E5            [11] 2628 	push	hl
   83AE CD 29 75      [17] 2629 	call	_createPlayer
   83B1 21 06 00      [10] 2630 	ld	hl, #6
   83B4 39            [11] 2631 	add	hl, sp
   83B5 F9            [ 6] 2632 	ld	sp, hl
                           2633 ;src/niveles/niveles.c:322: createMarco(si);
   83B6 AF            [ 4] 2634 	xor	a, a
   83B7 F5            [11] 2635 	push	af
   83B8 33            [ 6] 2636 	inc	sp
   83B9 CD 1A 75      [17] 2637 	call	_createMarco
   83BC 33            [ 6] 2638 	inc	sp
                           2639 ;src/niveles/niveles.c:323: createPortal(portales,rocas,rocasEspejo,si);
   83BD AF            [ 4] 2640 	xor	a, a
   83BE F5            [11] 2641 	push	af
   83BF 33            [ 6] 2642 	inc	sp
   83C0 DD 6E 08      [19] 2643 	ld	l,8 (ix)
   83C3 DD 66 09      [19] 2644 	ld	h,9 (ix)
   83C6 E5            [11] 2645 	push	hl
   83C7 DD 6E 06      [19] 2646 	ld	l,6 (ix)
   83CA DD 66 07      [19] 2647 	ld	h,7 (ix)
   83CD E5            [11] 2648 	push	hl
   83CE DD 6E 0C      [19] 2649 	ld	l,12 (ix)
   83D1 DD 66 0D      [19] 2650 	ld	h,13 (ix)
   83D4 E5            [11] 2651 	push	hl
   83D5 CD 0D 77      [17] 2652 	call	_createPortal
   83D8 21 07 00      [10] 2653 	ld	hl, #7
   83DB 39            [11] 2654 	add	hl, sp
   83DC F9            [ 6] 2655 	ld	sp, hl
                           2656 ;src/niveles/niveles.c:324: createPuerta(puertas,15,4,sprite_Puerta_G,nivel_02);
   83DD 21 1E 04      [10] 2657 	ld	hl, #0x041e
   83E0 E5            [11] 2658 	push	hl
   83E1 2E 0F         [ 7] 2659 	ld	l, #0x0f
   83E3 E5            [11] 2660 	push	hl
   83E4 DD 6E 0A      [19] 2661 	ld	l,10 (ix)
   83E7 DD 66 0B      [19] 2662 	ld	h,11 (ix)
   83EA E5            [11] 2663 	push	hl
   83EB CD 94 76      [17] 2664 	call	_createPuerta
   83EE 21 06 00      [10] 2665 	ld	hl, #6
   83F1 39            [11] 2666 	add	hl, sp
   83F2 F9            [ 6] 2667 	ld	sp, hl
                           2668 ;src/niveles/niveles.c:325: createPuerta(puertas,3,1,sprite_Puerta_G,nivel_05);
   83F3 21 1E 08      [10] 2669 	ld	hl, #0x081e
   83F6 E5            [11] 2670 	push	hl
   83F7 21 03 01      [10] 2671 	ld	hl, #0x0103
   83FA E5            [11] 2672 	push	hl
   83FB DD 6E 0A      [19] 2673 	ld	l,10 (ix)
   83FE DD 66 0B      [19] 2674 	ld	h,11 (ix)
   8401 E5            [11] 2675 	push	hl
   8402 CD 94 76      [17] 2676 	call	_createPuerta
   8405 21 06 00      [10] 2677 	ld	hl, #6
   8408 39            [11] 2678 	add	hl, sp
   8409 F9            [ 6] 2679 	ld	sp, hl
                           2680 ;src/niveles/niveles.c:326: createPuerta(puertas,1,4,sprite_Puerta_G,nivel_04_01);
   840A 21 1E 07      [10] 2681 	ld	hl, #0x071e
   840D E5            [11] 2682 	push	hl
   840E 21 01 04      [10] 2683 	ld	hl, #0x0401
   8411 E5            [11] 2684 	push	hl
   8412 DD 6E 0A      [19] 2685 	ld	l,10 (ix)
   8415 DD 66 0B      [19] 2686 	ld	h,11 (ix)
   8418 E5            [11] 2687 	push	hl
   8419 CD 94 76      [17] 2688 	call	_createPuerta
   841C 21 06 00      [10] 2689 	ld	hl, #6
   841F 39            [11] 2690 	add	hl, sp
   8420 F9            [ 6] 2691 	ld	sp, hl
                           2692 ;src/niveles/niveles.c:332: createRoca(rocas,3,4,mover_1,sprite_Rock_G,2);
   8421 21 02 02      [10] 2693 	ld	hl, #0x0202
   8424 E5            [11] 2694 	push	hl
   8425 21 04 01      [10] 2695 	ld	hl, #0x0104
   8428 E5            [11] 2696 	push	hl
   8429 3E 03         [ 7] 2697 	ld	a, #0x03
   842B F5            [11] 2698 	push	af
   842C 33            [ 6] 2699 	inc	sp
   842D DD 6E 06      [19] 2700 	ld	l,6 (ix)
   8430 DD 66 07      [19] 2701 	ld	h,7 (ix)
   8433 E5            [11] 2702 	push	hl
   8434 CD 68 75      [17] 2703 	call	_createRoca
   8437 21 07 00      [10] 2704 	ld	hl, #7
   843A 39            [11] 2705 	add	hl, sp
   843B F9            [ 6] 2706 	ld	sp, hl
                           2707 ;src/niveles/niveles.c:333: createRocaEspejo(rocasEspejo,13,4,mover_1,sprite_Rock_G,2);
   843C 21 02 02      [10] 2708 	ld	hl, #0x0202
   843F E5            [11] 2709 	push	hl
   8440 21 04 01      [10] 2710 	ld	hl, #0x0104
   8443 E5            [11] 2711 	push	hl
   8444 3E 0D         [ 7] 2712 	ld	a, #0x0d
   8446 F5            [11] 2713 	push	af
   8447 33            [ 6] 2714 	inc	sp
   8448 DD 6E 08      [19] 2715 	ld	l,8 (ix)
   844B DD 66 09      [19] 2716 	ld	h,9 (ix)
   844E E5            [11] 2717 	push	hl
   844F CD FE 75      [17] 2718 	call	_createRocaEspejo
   8452 21 07 00      [10] 2719 	ld	hl, #7
   8455 39            [11] 2720 	add	hl, sp
   8456 F9            [ 6] 2721 	ld	sp, hl
                           2722 ;src/niveles/niveles.c:334: createRoca(rocas,3,3,mover_1,sprite_Rock_G,3);
   8457 21 02 03      [10] 2723 	ld	hl, #0x0302
   845A E5            [11] 2724 	push	hl
   845B 21 03 01      [10] 2725 	ld	hl, #0x0103
   845E E5            [11] 2726 	push	hl
   845F 3E 03         [ 7] 2727 	ld	a, #0x03
   8461 F5            [11] 2728 	push	af
   8462 33            [ 6] 2729 	inc	sp
   8463 DD 6E 06      [19] 2730 	ld	l,6 (ix)
   8466 DD 66 07      [19] 2731 	ld	h,7 (ix)
   8469 E5            [11] 2732 	push	hl
   846A CD 68 75      [17] 2733 	call	_createRoca
   846D 21 07 00      [10] 2734 	ld	hl, #7
   8470 39            [11] 2735 	add	hl, sp
   8471 F9            [ 6] 2736 	ld	sp, hl
                           2737 ;src/niveles/niveles.c:335: createRocaEspejo(rocasEspejo,13,3,sin_Movimiento,sprite_Rock_nomove_B,3);
   8472 21 04 03      [10] 2738 	ld	hl, #0x0304
   8475 E5            [11] 2739 	push	hl
   8476 21 03 00      [10] 2740 	ld	hl, #0x0003
   8479 E5            [11] 2741 	push	hl
   847A 3E 0D         [ 7] 2742 	ld	a, #0x0d
   847C F5            [11] 2743 	push	af
   847D 33            [ 6] 2744 	inc	sp
   847E DD 6E 08      [19] 2745 	ld	l,8 (ix)
   8481 DD 66 09      [19] 2746 	ld	h,9 (ix)
   8484 E5            [11] 2747 	push	hl
   8485 CD FE 75      [17] 2748 	call	_createRocaEspejo
   8488 21 07 00      [10] 2749 	ld	hl, #7
   848B 39            [11] 2750 	add	hl, sp
   848C F9            [ 6] 2751 	ld	sp, hl
                           2752 ;src/niveles/niveles.c:336: createRoca(rocas,3,5,mover_1,sprite_Rock_G,4);
   848D 21 02 04      [10] 2753 	ld	hl, #0x0402
   8490 E5            [11] 2754 	push	hl
   8491 21 05 01      [10] 2755 	ld	hl, #0x0105
   8494 E5            [11] 2756 	push	hl
   8495 3E 03         [ 7] 2757 	ld	a, #0x03
   8497 F5            [11] 2758 	push	af
   8498 33            [ 6] 2759 	inc	sp
   8499 DD 6E 06      [19] 2760 	ld	l,6 (ix)
   849C DD 66 07      [19] 2761 	ld	h,7 (ix)
   849F E5            [11] 2762 	push	hl
   84A0 CD 68 75      [17] 2763 	call	_createRoca
   84A3 21 07 00      [10] 2764 	ld	hl, #7
   84A6 39            [11] 2765 	add	hl, sp
   84A7 F9            [ 6] 2766 	ld	sp, hl
                           2767 ;src/niveles/niveles.c:337: createRocaEspejo(rocasEspejo,13,5,mover_Linea,sprite_RockLineal1_G,4);
   84A8 21 05 04      [10] 2768 	ld	hl, #0x0405
   84AB E5            [11] 2769 	push	hl
   84AC 26 02         [ 7] 2770 	ld	h, #0x02
   84AE E5            [11] 2771 	push	hl
   84AF 3E 0D         [ 7] 2772 	ld	a, #0x0d
   84B1 F5            [11] 2773 	push	af
   84B2 33            [ 6] 2774 	inc	sp
   84B3 DD 6E 08      [19] 2775 	ld	l,8 (ix)
   84B6 DD 66 09      [19] 2776 	ld	h,9 (ix)
   84B9 E5            [11] 2777 	push	hl
   84BA CD FE 75      [17] 2778 	call	_createRocaEspejo
   84BD 21 07 00      [10] 2779 	ld	hl, #7
   84C0 39            [11] 2780 	add	hl, sp
   84C1 F9            [ 6] 2781 	ld	sp, hl
                           2782 ;src/niveles/niveles.c:342: createRoca(rocas,1,2,sin_Movimiento,sprite_RockInmovil8_G,1);
   84C2 21 15 01      [10] 2783 	ld	hl, #0x0115
   84C5 E5            [11] 2784 	push	hl
   84C6 21 02 00      [10] 2785 	ld	hl, #0x0002
   84C9 E5            [11] 2786 	push	hl
   84CA 3E 01         [ 7] 2787 	ld	a, #0x01
   84CC F5            [11] 2788 	push	af
   84CD 33            [ 6] 2789 	inc	sp
   84CE DD 6E 06      [19] 2790 	ld	l,6 (ix)
   84D1 DD 66 07      [19] 2791 	ld	h,7 (ix)
   84D4 E5            [11] 2792 	push	hl
   84D5 CD 68 75      [17] 2793 	call	_createRoca
   84D8 21 07 00      [10] 2794 	ld	hl, #7
   84DB 39            [11] 2795 	add	hl, sp
   84DC F9            [ 6] 2796 	ld	sp, hl
                           2797 ;src/niveles/niveles.c:343: createRoca(rocas,1,3,sin_Movimiento,sprite_RockInmovil9_G,1);
   84DD 21 17 01      [10] 2798 	ld	hl, #0x0117
   84E0 E5            [11] 2799 	push	hl
   84E1 21 03 00      [10] 2800 	ld	hl, #0x0003
   84E4 E5            [11] 2801 	push	hl
   84E5 3E 01         [ 7] 2802 	ld	a, #0x01
   84E7 F5            [11] 2803 	push	af
   84E8 33            [ 6] 2804 	inc	sp
   84E9 DD 6E 06      [19] 2805 	ld	l,6 (ix)
   84EC DD 66 07      [19] 2806 	ld	h,7 (ix)
   84EF E5            [11] 2807 	push	hl
   84F0 CD 68 75      [17] 2808 	call	_createRoca
   84F3 21 07 00      [10] 2809 	ld	hl, #7
   84F6 39            [11] 2810 	add	hl, sp
   84F7 F9            [ 6] 2811 	ld	sp, hl
                           2812 ;src/niveles/niveles.c:344: createRoca(rocas,6,2,sin_Movimiento,sprite_RockInmovil8_G,1);
   84F8 21 15 01      [10] 2813 	ld	hl, #0x0115
   84FB E5            [11] 2814 	push	hl
   84FC 21 02 00      [10] 2815 	ld	hl, #0x0002
   84FF E5            [11] 2816 	push	hl
   8500 3E 06         [ 7] 2817 	ld	a, #0x06
   8502 F5            [11] 2818 	push	af
   8503 33            [ 6] 2819 	inc	sp
   8504 DD 6E 06      [19] 2820 	ld	l,6 (ix)
   8507 DD 66 07      [19] 2821 	ld	h,7 (ix)
   850A E5            [11] 2822 	push	hl
   850B CD 68 75      [17] 2823 	call	_createRoca
   850E 21 07 00      [10] 2824 	ld	hl, #7
   8511 39            [11] 2825 	add	hl, sp
   8512 F9            [ 6] 2826 	ld	sp, hl
                           2827 ;src/niveles/niveles.c:345: createRoca(rocas,6,3,sin_Movimiento,sprite_RockInmovil9_G,1);
   8513 21 17 01      [10] 2828 	ld	hl, #0x0117
   8516 E5            [11] 2829 	push	hl
   8517 21 03 00      [10] 2830 	ld	hl, #0x0003
   851A E5            [11] 2831 	push	hl
   851B 3E 06         [ 7] 2832 	ld	a, #0x06
   851D F5            [11] 2833 	push	af
   851E 33            [ 6] 2834 	inc	sp
   851F DD 6E 06      [19] 2835 	ld	l,6 (ix)
   8522 DD 66 07      [19] 2836 	ld	h,7 (ix)
   8525 E5            [11] 2837 	push	hl
   8526 CD 68 75      [17] 2838 	call	_createRoca
   8529 21 07 00      [10] 2839 	ld	hl, #7
   852C 39            [11] 2840 	add	hl, sp
   852D F9            [ 6] 2841 	ld	sp, hl
                           2842 ;src/niveles/niveles.c:346: createRoca(rocas,1,5,sin_Movimiento,sprite_RockInmovil8_G,1);
   852E 21 15 01      [10] 2843 	ld	hl, #0x0115
   8531 E5            [11] 2844 	push	hl
   8532 21 05 00      [10] 2845 	ld	hl, #0x0005
   8535 E5            [11] 2846 	push	hl
   8536 3E 01         [ 7] 2847 	ld	a, #0x01
   8538 F5            [11] 2848 	push	af
   8539 33            [ 6] 2849 	inc	sp
   853A DD 6E 06      [19] 2850 	ld	l,6 (ix)
   853D DD 66 07      [19] 2851 	ld	h,7 (ix)
   8540 E5            [11] 2852 	push	hl
   8541 CD 68 75      [17] 2853 	call	_createRoca
   8544 21 07 00      [10] 2854 	ld	hl, #7
   8547 39            [11] 2855 	add	hl, sp
   8548 F9            [ 6] 2856 	ld	sp, hl
                           2857 ;src/niveles/niveles.c:347: createRoca(rocas,1,6,sin_Movimiento,sprite_RockInmovil9_G,1);
   8549 21 17 01      [10] 2858 	ld	hl, #0x0117
   854C E5            [11] 2859 	push	hl
   854D 21 06 00      [10] 2860 	ld	hl, #0x0006
   8550 E5            [11] 2861 	push	hl
   8551 3E 01         [ 7] 2862 	ld	a, #0x01
   8553 F5            [11] 2863 	push	af
   8554 33            [ 6] 2864 	inc	sp
   8555 DD 6E 06      [19] 2865 	ld	l,6 (ix)
   8558 DD 66 07      [19] 2866 	ld	h,7 (ix)
   855B E5            [11] 2867 	push	hl
   855C CD 68 75      [17] 2868 	call	_createRoca
   855F 21 07 00      [10] 2869 	ld	hl, #7
   8562 39            [11] 2870 	add	hl, sp
   8563 F9            [ 6] 2871 	ld	sp, hl
                           2872 ;src/niveles/niveles.c:348: createRoca(rocas,6,5,sin_Movimiento,sprite_RockInmovil8_G,1);
   8564 21 15 01      [10] 2873 	ld	hl, #0x0115
   8567 E5            [11] 2874 	push	hl
   8568 21 05 00      [10] 2875 	ld	hl, #0x0005
   856B E5            [11] 2876 	push	hl
   856C 3E 06         [ 7] 2877 	ld	a, #0x06
   856E F5            [11] 2878 	push	af
   856F 33            [ 6] 2879 	inc	sp
   8570 DD 6E 06      [19] 2880 	ld	l,6 (ix)
   8573 DD 66 07      [19] 2881 	ld	h,7 (ix)
   8576 E5            [11] 2882 	push	hl
   8577 CD 68 75      [17] 2883 	call	_createRoca
   857A 21 07 00      [10] 2884 	ld	hl, #7
   857D 39            [11] 2885 	add	hl, sp
   857E F9            [ 6] 2886 	ld	sp, hl
                           2887 ;src/niveles/niveles.c:349: createRoca(rocas,6,6,sin_Movimiento,sprite_RockInmovil9_G,1);
   857F 21 17 01      [10] 2888 	ld	hl, #0x0117
   8582 E5            [11] 2889 	push	hl
   8583 21 06 00      [10] 2890 	ld	hl, #0x0006
   8586 E5            [11] 2891 	push	hl
   8587 3E 06         [ 7] 2892 	ld	a, #0x06
   8589 F5            [11] 2893 	push	af
   858A 33            [ 6] 2894 	inc	sp
   858B DD 6E 06      [19] 2895 	ld	l,6 (ix)
   858E DD 66 07      [19] 2896 	ld	h,7 (ix)
   8591 E5            [11] 2897 	push	hl
   8592 CD 68 75      [17] 2898 	call	_createRoca
   8595 21 07 00      [10] 2899 	ld	hl, #7
   8598 39            [11] 2900 	add	hl, sp
   8599 F9            [ 6] 2901 	ld	sp, hl
                           2902 ;src/niveles/niveles.c:350: createRoca(rocas,4,2,sin_Movimiento,sprite_RockInmovil1_G,1);
   859A 21 07 01      [10] 2903 	ld	hl, #0x0107
   859D E5            [11] 2904 	push	hl
   859E 21 02 00      [10] 2905 	ld	hl, #0x0002
   85A1 E5            [11] 2906 	push	hl
   85A2 3E 04         [ 7] 2907 	ld	a, #0x04
   85A4 F5            [11] 2908 	push	af
   85A5 33            [ 6] 2909 	inc	sp
   85A6 DD 6E 06      [19] 2910 	ld	l,6 (ix)
   85A9 DD 66 07      [19] 2911 	ld	h,7 (ix)
   85AC E5            [11] 2912 	push	hl
   85AD CD 68 75      [17] 2913 	call	_createRoca
   85B0 21 07 00      [10] 2914 	ld	hl, #7
   85B3 39            [11] 2915 	add	hl, sp
   85B4 F9            [ 6] 2916 	ld	sp, hl
                           2917 ;src/niveles/niveles.c:351: createRoca(rocas,4,6,sin_Movimiento,sprite_RockInmovil1_G,1);
   85B5 21 07 01      [10] 2918 	ld	hl, #0x0107
   85B8 E5            [11] 2919 	push	hl
   85B9 21 06 00      [10] 2920 	ld	hl, #0x0006
   85BC E5            [11] 2921 	push	hl
   85BD 3E 04         [ 7] 2922 	ld	a, #0x04
   85BF F5            [11] 2923 	push	af
   85C0 33            [ 6] 2924 	inc	sp
   85C1 DD 6E 06      [19] 2925 	ld	l,6 (ix)
   85C4 DD 66 07      [19] 2926 	ld	h,7 (ix)
   85C7 E5            [11] 2927 	push	hl
   85C8 CD 68 75      [17] 2928 	call	_createRoca
   85CB 21 07 00      [10] 2929 	ld	hl, #7
   85CE 39            [11] 2930 	add	hl, sp
   85CF F9            [ 6] 2931 	ld	sp, hl
                           2932 ;src/niveles/niveles.c:352: createRoca(rocas,2,3,sin_Movimiento,sprite_RockInmovil2_G,1);
   85D0 21 09 01      [10] 2933 	ld	hl, #0x0109
   85D3 E5            [11] 2934 	push	hl
   85D4 21 03 00      [10] 2935 	ld	hl, #0x0003
   85D7 E5            [11] 2936 	push	hl
   85D8 3E 02         [ 7] 2937 	ld	a, #0x02
   85DA F5            [11] 2938 	push	af
   85DB 33            [ 6] 2939 	inc	sp
   85DC DD 6E 06      [19] 2940 	ld	l,6 (ix)
   85DF DD 66 07      [19] 2941 	ld	h,7 (ix)
   85E2 E5            [11] 2942 	push	hl
   85E3 CD 68 75      [17] 2943 	call	_createRoca
   85E6 21 07 00      [10] 2944 	ld	hl, #7
   85E9 39            [11] 2945 	add	hl, sp
   85EA F9            [ 6] 2946 	ld	sp, hl
                           2947 ;src/niveles/niveles.c:353: createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil2_G,1);
   85EB 21 09 01      [10] 2948 	ld	hl, #0x0109
   85EE E5            [11] 2949 	push	hl
   85EF 21 05 00      [10] 2950 	ld	hl, #0x0005
   85F2 E5            [11] 2951 	push	hl
   85F3 3E 02         [ 7] 2952 	ld	a, #0x02
   85F5 F5            [11] 2953 	push	af
   85F6 33            [ 6] 2954 	inc	sp
   85F7 DD 6E 06      [19] 2955 	ld	l,6 (ix)
   85FA DD 66 07      [19] 2956 	ld	h,7 (ix)
   85FD E5            [11] 2957 	push	hl
   85FE CD 68 75      [17] 2958 	call	_createRoca
   8601 21 07 00      [10] 2959 	ld	hl, #7
   8604 39            [11] 2960 	add	hl, sp
   8605 F9            [ 6] 2961 	ld	sp, hl
                           2962 ;src/niveles/niveles.c:354: createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil5_G,1);
   8606 21 0F 01      [10] 2963 	ld	hl, #0x010f
   8609 E5            [11] 2964 	push	hl
   860A 21 02 00      [10] 2965 	ld	hl, #0x0002
   860D E5            [11] 2966 	push	hl
   860E 3E 02         [ 7] 2967 	ld	a, #0x02
   8610 F5            [11] 2968 	push	af
   8611 33            [ 6] 2969 	inc	sp
   8612 DD 6E 06      [19] 2970 	ld	l,6 (ix)
   8615 DD 66 07      [19] 2971 	ld	h,7 (ix)
   8618 E5            [11] 2972 	push	hl
   8619 CD 68 75      [17] 2973 	call	_createRoca
   861C 21 07 00      [10] 2974 	ld	hl, #7
   861F 39            [11] 2975 	add	hl, sp
   8620 F9            [ 6] 2976 	ld	sp, hl
                           2977 ;src/niveles/niveles.c:355: createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil5_G,1);
   8621 21 0F 01      [10] 2978 	ld	hl, #0x010f
   8624 E5            [11] 2979 	push	hl
   8625 21 06 00      [10] 2980 	ld	hl, #0x0006
   8628 E5            [11] 2981 	push	hl
   8629 3E 02         [ 7] 2982 	ld	a, #0x02
   862B F5            [11] 2983 	push	af
   862C 33            [ 6] 2984 	inc	sp
   862D DD 6E 06      [19] 2985 	ld	l,6 (ix)
   8630 DD 66 07      [19] 2986 	ld	h,7 (ix)
   8633 E5            [11] 2987 	push	hl
   8634 CD 68 75      [17] 2988 	call	_createRoca
   8637 21 07 00      [10] 2989 	ld	hl, #7
   863A 39            [11] 2990 	add	hl, sp
   863B F9            [ 6] 2991 	ld	sp, hl
                           2992 ;src/niveles/niveles.c:356: createHoleIzquierda(rocas,4,1,sprite_hole,4);
   863C 21 24 04      [10] 2993 	ld	hl, #0x0424
   863F E5            [11] 2994 	push	hl
   8640 21 04 01      [10] 2995 	ld	hl, #0x0104
   8643 E5            [11] 2996 	push	hl
   8644 DD 6E 06      [19] 2997 	ld	l,6 (ix)
   8647 DD 66 07      [19] 2998 	ld	h,7 (ix)
   864A E5            [11] 2999 	push	hl
   864B CD 59 77      [17] 3000 	call	_createHoleIzquierda
   864E 21 06 00      [10] 3001 	ld	hl, #6
   8651 39            [11] 3002 	add	hl, sp
   8652 F9            [ 6] 3003 	ld	sp, hl
                           3004 ;src/niveles/niveles.c:357: createHoleIzquierda(rocas,4,7,sprite_hole,4);
   8653 21 24 04      [10] 3005 	ld	hl, #0x0424
   8656 E5            [11] 3006 	push	hl
   8657 21 04 07      [10] 3007 	ld	hl, #0x0704
   865A E5            [11] 3008 	push	hl
   865B DD 6E 06      [19] 3009 	ld	l,6 (ix)
   865E DD 66 07      [19] 3010 	ld	h,7 (ix)
   8661 E5            [11] 3011 	push	hl
   8662 CD 59 77      [17] 3012 	call	_createHoleIzquierda
   8665 21 06 00      [10] 3013 	ld	hl, #6
   8668 39            [11] 3014 	add	hl, sp
   8669 F9            [ 6] 3015 	ld	sp, hl
                           3016 ;src/niveles/niveles.c:363: createRocaEspejo(rocasEspejo,12,4,sin_Movimiento,sprite_RockInmovil1_B,1);
   866A 21 08 01      [10] 3017 	ld	hl, #0x0108
   866D E5            [11] 3018 	push	hl
   866E 21 04 00      [10] 3019 	ld	hl, #0x0004
   8671 E5            [11] 3020 	push	hl
   8672 3E 0C         [ 7] 3021 	ld	a, #0x0c
   8674 F5            [11] 3022 	push	af
   8675 33            [ 6] 3023 	inc	sp
   8676 DD 6E 08      [19] 3024 	ld	l,8 (ix)
   8679 DD 66 09      [19] 3025 	ld	h,9 (ix)
   867C E5            [11] 3026 	push	hl
   867D CD FE 75      [17] 3027 	call	_createRocaEspejo
   8680 21 07 00      [10] 3028 	ld	hl, #7
   8683 39            [11] 3029 	add	hl, sp
   8684 F9            [ 6] 3030 	ld	sp, hl
                           3031 ;src/niveles/niveles.c:364: createHoleDerecha(rocasEspejo,10,3,sprite_hole,4);
   8685 21 24 04      [10] 3032 	ld	hl, #0x0424
   8688 E5            [11] 3033 	push	hl
   8689 21 0A 03      [10] 3034 	ld	hl, #0x030a
   868C E5            [11] 3035 	push	hl
   868D DD 6E 08      [19] 3036 	ld	l,8 (ix)
   8690 DD 66 09      [19] 3037 	ld	h,9 (ix)
   8693 E5            [11] 3038 	push	hl
   8694 CD ED 77      [17] 3039 	call	_createHoleDerecha
   8697 21 06 00      [10] 3040 	ld	hl, #6
   869A 39            [11] 3041 	add	hl, sp
   869B F9            [ 6] 3042 	ld	sp, hl
                           3043 ;src/niveles/niveles.c:365: createHoleDerecha(rocasEspejo,10,5,sprite_hole,4);
   869C 21 24 04      [10] 3044 	ld	hl, #0x0424
   869F E5            [11] 3045 	push	hl
   86A0 21 0A 05      [10] 3046 	ld	hl, #0x050a
   86A3 E5            [11] 3047 	push	hl
   86A4 DD 6E 08      [19] 3048 	ld	l,8 (ix)
   86A7 DD 66 09      [19] 3049 	ld	h,9 (ix)
   86AA E5            [11] 3050 	push	hl
   86AB CD ED 77      [17] 3051 	call	_createHoleDerecha
   86AE 21 06 00      [10] 3052 	ld	hl, #6
   86B1 39            [11] 3053 	add	hl, sp
   86B2 F9            [ 6] 3054 	ld	sp, hl
                           3055 ;src/niveles/niveles.c:366: createHoleDerecha(rocasEspejo,11,2,sprite_hole,4);
   86B3 21 24 04      [10] 3056 	ld	hl, #0x0424
   86B6 E5            [11] 3057 	push	hl
   86B7 21 0B 02      [10] 3058 	ld	hl, #0x020b
   86BA E5            [11] 3059 	push	hl
   86BB DD 6E 08      [19] 3060 	ld	l,8 (ix)
   86BE DD 66 09      [19] 3061 	ld	h,9 (ix)
   86C1 E5            [11] 3062 	push	hl
   86C2 CD ED 77      [17] 3063 	call	_createHoleDerecha
   86C5 21 06 00      [10] 3064 	ld	hl, #6
   86C8 39            [11] 3065 	add	hl, sp
   86C9 F9            [ 6] 3066 	ld	sp, hl
                           3067 ;src/niveles/niveles.c:367: createHoleDerecha(rocasEspejo,11,4,sprite_hole,4);
   86CA 21 24 04      [10] 3068 	ld	hl, #0x0424
   86CD E5            [11] 3069 	push	hl
   86CE 2E 0B         [ 7] 3070 	ld	l, #0x0b
   86D0 E5            [11] 3071 	push	hl
   86D1 DD 6E 08      [19] 3072 	ld	l,8 (ix)
   86D4 DD 66 09      [19] 3073 	ld	h,9 (ix)
   86D7 E5            [11] 3074 	push	hl
   86D8 CD ED 77      [17] 3075 	call	_createHoleDerecha
   86DB 21 06 00      [10] 3076 	ld	hl, #6
   86DE 39            [11] 3077 	add	hl, sp
   86DF F9            [ 6] 3078 	ld	sp, hl
                           3079 ;src/niveles/niveles.c:368: createHoleDerecha(rocasEspejo,11,6,sprite_hole,4);
   86E0 21 24 04      [10] 3080 	ld	hl, #0x0424
   86E3 E5            [11] 3081 	push	hl
   86E4 21 0B 06      [10] 3082 	ld	hl, #0x060b
   86E7 E5            [11] 3083 	push	hl
   86E8 DD 6E 08      [19] 3084 	ld	l,8 (ix)
   86EB DD 66 09      [19] 3085 	ld	h,9 (ix)
   86EE E5            [11] 3086 	push	hl
   86EF CD ED 77      [17] 3087 	call	_createHoleDerecha
   86F2 21 06 00      [10] 3088 	ld	hl, #6
   86F5 39            [11] 3089 	add	hl, sp
   86F6 F9            [ 6] 3090 	ld	sp, hl
   86F7 DD E1         [14] 3091 	pop	ix
   86F9 C9            [10] 3092 	ret
                           3093 ;src/niveles/niveles.c:371: void crearNievel4_01(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           3094 ;	---------------------------------
                           3095 ; Function crearNievel4_01
                           3096 ; ---------------------------------
   86FA                    3097 _crearNievel4_01::
   86FA DD E5         [15] 3098 	push	ix
   86FC DD 21 00 00   [14] 3099 	ld	ix,#0
   8700 DD 39         [15] 3100 	add	ix,sp
                           3101 ;src/niveles/niveles.c:373: createPlayer(player,6,4,posicion);
   8702 DD 6E 10      [19] 3102 	ld	l,16 (ix)
   8705 DD 66 11      [19] 3103 	ld	h,17 (ix)
   8708 E5            [11] 3104 	push	hl
   8709 21 06 04      [10] 3105 	ld	hl, #0x0406
   870C E5            [11] 3106 	push	hl
   870D DD 6E 04      [19] 3107 	ld	l,4 (ix)
   8710 DD 66 05      [19] 3108 	ld	h,5 (ix)
   8713 E5            [11] 3109 	push	hl
   8714 CD 29 75      [17] 3110 	call	_createPlayer
   8717 21 06 00      [10] 3111 	ld	hl, #6
   871A 39            [11] 3112 	add	hl, sp
   871B F9            [ 6] 3113 	ld	sp, hl
                           3114 ;src/niveles/niveles.c:374: createMarco(no);
   871C 3E 01         [ 7] 3115 	ld	a, #0x01
   871E F5            [11] 3116 	push	af
   871F 33            [ 6] 3117 	inc	sp
   8720 CD 1A 75      [17] 3118 	call	_createMarco
   8723 33            [ 6] 3119 	inc	sp
                           3120 ;src/niveles/niveles.c:375: createPortal(portales,rocas,rocasEspejo,no);
   8724 3E 01         [ 7] 3121 	ld	a, #0x01
   8726 F5            [11] 3122 	push	af
   8727 33            [ 6] 3123 	inc	sp
   8728 DD 6E 08      [19] 3124 	ld	l,8 (ix)
   872B DD 66 09      [19] 3125 	ld	h,9 (ix)
   872E E5            [11] 3126 	push	hl
   872F DD 6E 06      [19] 3127 	ld	l,6 (ix)
   8732 DD 66 07      [19] 3128 	ld	h,7 (ix)
   8735 E5            [11] 3129 	push	hl
   8736 DD 6E 0C      [19] 3130 	ld	l,12 (ix)
   8739 DD 66 0D      [19] 3131 	ld	h,13 (ix)
   873C E5            [11] 3132 	push	hl
   873D CD 0D 77      [17] 3133 	call	_createPortal
   8740 21 07 00      [10] 3134 	ld	hl, #7
   8743 39            [11] 3135 	add	hl, sp
   8744 F9            [ 6] 3136 	ld	sp, hl
                           3137 ;src/niveles/niveles.c:376: createPuerta(puertas,7,4,sprite_Puerta_B,nivel_04);
   8745 21 1F 06      [10] 3138 	ld	hl, #0x061f
   8748 E5            [11] 3139 	push	hl
   8749 21 07 04      [10] 3140 	ld	hl, #0x0407
   874C E5            [11] 3141 	push	hl
   874D DD 6E 0A      [19] 3142 	ld	l,10 (ix)
   8750 DD 66 0B      [19] 3143 	ld	h,11 (ix)
   8753 E5            [11] 3144 	push	hl
   8754 CD 94 76      [17] 3145 	call	_createPuerta
   8757 21 06 00      [10] 3146 	ld	hl, #6
   875A 39            [11] 3147 	add	hl, sp
   875B F9            [ 6] 3148 	ld	sp, hl
                           3149 ;src/niveles/niveles.c:377: createPuerta(puertas,1,4,sprite_Puerta_B,nivel_TRAP_01);
   875C 21 1F 03      [10] 3150 	ld	hl, #0x031f
   875F E5            [11] 3151 	push	hl
   8760 21 01 04      [10] 3152 	ld	hl, #0x0401
   8763 E5            [11] 3153 	push	hl
   8764 DD 6E 0A      [19] 3154 	ld	l,10 (ix)
   8767 DD 66 0B      [19] 3155 	ld	h,11 (ix)
   876A E5            [11] 3156 	push	hl
   876B CD 94 76      [17] 3157 	call	_createPuerta
   876E 21 06 00      [10] 3158 	ld	hl, #6
   8771 39            [11] 3159 	add	hl, sp
   8772 F9            [ 6] 3160 	ld	sp, hl
                           3161 ;src/niveles/niveles.c:380: createRoca(rocas,5,4,mover_1,sprite_Rock_B,1);
   8773 21 03 01      [10] 3162 	ld	hl, #0x0103
   8776 E5            [11] 3163 	push	hl
   8777 2E 04         [ 7] 3164 	ld	l, #0x04
   8779 E5            [11] 3165 	push	hl
   877A 3E 05         [ 7] 3166 	ld	a, #0x05
   877C F5            [11] 3167 	push	af
   877D 33            [ 6] 3168 	inc	sp
   877E DD 6E 06      [19] 3169 	ld	l,6 (ix)
   8781 DD 66 07      [19] 3170 	ld	h,7 (ix)
   8784 E5            [11] 3171 	push	hl
   8785 CD 68 75      [17] 3172 	call	_createRoca
   8788 21 07 00      [10] 3173 	ld	hl, #7
   878B 39            [11] 3174 	add	hl, sp
   878C F9            [ 6] 3175 	ld	sp, hl
                           3176 ;src/niveles/niveles.c:384: createColeccionabeAmstr(col,3,4,4);
   878D 21 04 04      [10] 3177 	ld	hl, #0x0404
   8790 E5            [11] 3178 	push	hl
   8791 3E 03         [ 7] 3179 	ld	a, #0x03
   8793 F5            [11] 3180 	push	af
   8794 33            [ 6] 3181 	inc	sp
   8795 DD 6E 0E      [19] 3182 	ld	l,14 (ix)
   8798 DD 66 0F      [19] 3183 	ld	h,15 (ix)
   879B E5            [11] 3184 	push	hl
   879C CD 73 79      [17] 3185 	call	_createColeccionabeAmstr
   879F F1            [10] 3186 	pop	af
                           3187 ;src/niveles/niveles.c:388: createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   87A0 33            [ 6] 3188 	inc	sp
   87A1 21 1C 01      [10] 3189 	ld	hl,#0x011c
   87A4 E3            [19] 3190 	ex	(sp),hl
   87A5 21 01 00      [10] 3191 	ld	hl, #0x0001
   87A8 E5            [11] 3192 	push	hl
   87A9 3E 01         [ 7] 3193 	ld	a, #0x01
   87AB F5            [11] 3194 	push	af
   87AC 33            [ 6] 3195 	inc	sp
   87AD DD 6E 06      [19] 3196 	ld	l,6 (ix)
   87B0 DD 66 07      [19] 3197 	ld	h,7 (ix)
   87B3 E5            [11] 3198 	push	hl
   87B4 CD 68 75      [17] 3199 	call	_createRoca
   87B7 21 07 00      [10] 3200 	ld	hl, #7
   87BA 39            [11] 3201 	add	hl, sp
   87BB F9            [ 6] 3202 	ld	sp, hl
                           3203 ;src/niveles/niveles.c:389: createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   87BC 21 1C 01      [10] 3204 	ld	hl, #0x011c
   87BF E5            [11] 3205 	push	hl
   87C0 21 01 00      [10] 3206 	ld	hl, #0x0001
   87C3 E5            [11] 3207 	push	hl
   87C4 3E 02         [ 7] 3208 	ld	a, #0x02
   87C6 F5            [11] 3209 	push	af
   87C7 33            [ 6] 3210 	inc	sp
   87C8 DD 6E 06      [19] 3211 	ld	l,6 (ix)
   87CB DD 66 07      [19] 3212 	ld	h,7 (ix)
   87CE E5            [11] 3213 	push	hl
   87CF CD 68 75      [17] 3214 	call	_createRoca
   87D2 21 07 00      [10] 3215 	ld	hl, #7
   87D5 39            [11] 3216 	add	hl, sp
   87D6 F9            [ 6] 3217 	ld	sp, hl
                           3218 ;src/niveles/niveles.c:390: createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   87D7 21 1C 01      [10] 3219 	ld	hl, #0x011c
   87DA E5            [11] 3220 	push	hl
   87DB 21 01 00      [10] 3221 	ld	hl, #0x0001
   87DE E5            [11] 3222 	push	hl
   87DF 3E 03         [ 7] 3223 	ld	a, #0x03
   87E1 F5            [11] 3224 	push	af
   87E2 33            [ 6] 3225 	inc	sp
   87E3 DD 6E 06      [19] 3226 	ld	l,6 (ix)
   87E6 DD 66 07      [19] 3227 	ld	h,7 (ix)
   87E9 E5            [11] 3228 	push	hl
   87EA CD 68 75      [17] 3229 	call	_createRoca
   87ED 21 07 00      [10] 3230 	ld	hl, #7
   87F0 39            [11] 3231 	add	hl, sp
   87F1 F9            [ 6] 3232 	ld	sp, hl
                           3233 ;src/niveles/niveles.c:391: createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   87F2 21 1C 01      [10] 3234 	ld	hl, #0x011c
   87F5 E5            [11] 3235 	push	hl
   87F6 21 01 00      [10] 3236 	ld	hl, #0x0001
   87F9 E5            [11] 3237 	push	hl
   87FA 3E 04         [ 7] 3238 	ld	a, #0x04
   87FC F5            [11] 3239 	push	af
   87FD 33            [ 6] 3240 	inc	sp
   87FE DD 6E 06      [19] 3241 	ld	l,6 (ix)
   8801 DD 66 07      [19] 3242 	ld	h,7 (ix)
   8804 E5            [11] 3243 	push	hl
   8805 CD 68 75      [17] 3244 	call	_createRoca
   8808 21 07 00      [10] 3245 	ld	hl, #7
   880B 39            [11] 3246 	add	hl, sp
   880C F9            [ 6] 3247 	ld	sp, hl
                           3248 ;src/niveles/niveles.c:392: createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   880D 21 1C 01      [10] 3249 	ld	hl, #0x011c
   8810 E5            [11] 3250 	push	hl
   8811 21 01 00      [10] 3251 	ld	hl, #0x0001
   8814 E5            [11] 3252 	push	hl
   8815 3E 05         [ 7] 3253 	ld	a, #0x05
   8817 F5            [11] 3254 	push	af
   8818 33            [ 6] 3255 	inc	sp
   8819 DD 6E 06      [19] 3256 	ld	l,6 (ix)
   881C DD 66 07      [19] 3257 	ld	h,7 (ix)
   881F E5            [11] 3258 	push	hl
   8820 CD 68 75      [17] 3259 	call	_createRoca
   8823 21 07 00      [10] 3260 	ld	hl, #7
   8826 39            [11] 3261 	add	hl, sp
   8827 F9            [ 6] 3262 	ld	sp, hl
                           3263 ;src/niveles/niveles.c:393: createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   8828 21 1C 01      [10] 3264 	ld	hl, #0x011c
   882B E5            [11] 3265 	push	hl
   882C 21 01 00      [10] 3266 	ld	hl, #0x0001
   882F E5            [11] 3267 	push	hl
   8830 3E 06         [ 7] 3268 	ld	a, #0x06
   8832 F5            [11] 3269 	push	af
   8833 33            [ 6] 3270 	inc	sp
   8834 DD 6E 06      [19] 3271 	ld	l,6 (ix)
   8837 DD 66 07      [19] 3272 	ld	h,7 (ix)
   883A E5            [11] 3273 	push	hl
   883B CD 68 75      [17] 3274 	call	_createRoca
   883E 21 07 00      [10] 3275 	ld	hl, #7
   8841 39            [11] 3276 	add	hl, sp
   8842 F9            [ 6] 3277 	ld	sp, hl
                           3278 ;src/niveles/niveles.c:394: createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   8843 21 1C 01      [10] 3279 	ld	hl, #0x011c
   8846 E5            [11] 3280 	push	hl
   8847 21 01 00      [10] 3281 	ld	hl, #0x0001
   884A E5            [11] 3282 	push	hl
   884B 3E 07         [ 7] 3283 	ld	a, #0x07
   884D F5            [11] 3284 	push	af
   884E 33            [ 6] 3285 	inc	sp
   884F DD 6E 06      [19] 3286 	ld	l,6 (ix)
   8852 DD 66 07      [19] 3287 	ld	h,7 (ix)
   8855 E5            [11] 3288 	push	hl
   8856 CD 68 75      [17] 3289 	call	_createRoca
   8859 21 07 00      [10] 3290 	ld	hl, #7
   885C 39            [11] 3291 	add	hl, sp
   885D F9            [ 6] 3292 	ld	sp, hl
                           3293 ;src/niveles/niveles.c:395: createRoca(rocas,8,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   885E 21 1C 01      [10] 3294 	ld	hl, #0x011c
   8861 E5            [11] 3295 	push	hl
   8862 21 01 00      [10] 3296 	ld	hl, #0x0001
   8865 E5            [11] 3297 	push	hl
   8866 3E 08         [ 7] 3298 	ld	a, #0x08
   8868 F5            [11] 3299 	push	af
   8869 33            [ 6] 3300 	inc	sp
   886A DD 6E 06      [19] 3301 	ld	l,6 (ix)
   886D DD 66 07      [19] 3302 	ld	h,7 (ix)
   8870 E5            [11] 3303 	push	hl
   8871 CD 68 75      [17] 3304 	call	_createRoca
   8874 21 07 00      [10] 3305 	ld	hl, #7
   8877 39            [11] 3306 	add	hl, sp
   8878 F9            [ 6] 3307 	ld	sp, hl
                           3308 ;src/niveles/niveles.c:396: createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   8879 21 1C 01      [10] 3309 	ld	hl, #0x011c
   887C E5            [11] 3310 	push	hl
   887D 21 07 00      [10] 3311 	ld	hl, #0x0007
   8880 E5            [11] 3312 	push	hl
   8881 3E 01         [ 7] 3313 	ld	a, #0x01
   8883 F5            [11] 3314 	push	af
   8884 33            [ 6] 3315 	inc	sp
   8885 DD 6E 06      [19] 3316 	ld	l,6 (ix)
   8888 DD 66 07      [19] 3317 	ld	h,7 (ix)
   888B E5            [11] 3318 	push	hl
   888C CD 68 75      [17] 3319 	call	_createRoca
   888F 21 07 00      [10] 3320 	ld	hl, #7
   8892 39            [11] 3321 	add	hl, sp
   8893 F9            [ 6] 3322 	ld	sp, hl
                           3323 ;src/niveles/niveles.c:397: createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   8894 21 1C 01      [10] 3324 	ld	hl, #0x011c
   8897 E5            [11] 3325 	push	hl
   8898 21 07 00      [10] 3326 	ld	hl, #0x0007
   889B E5            [11] 3327 	push	hl
   889C 3E 02         [ 7] 3328 	ld	a, #0x02
   889E F5            [11] 3329 	push	af
   889F 33            [ 6] 3330 	inc	sp
   88A0 DD 6E 06      [19] 3331 	ld	l,6 (ix)
   88A3 DD 66 07      [19] 3332 	ld	h,7 (ix)
   88A6 E5            [11] 3333 	push	hl
   88A7 CD 68 75      [17] 3334 	call	_createRoca
   88AA 21 07 00      [10] 3335 	ld	hl, #7
   88AD 39            [11] 3336 	add	hl, sp
   88AE F9            [ 6] 3337 	ld	sp, hl
                           3338 ;src/niveles/niveles.c:398: createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   88AF 21 1C 01      [10] 3339 	ld	hl, #0x011c
   88B2 E5            [11] 3340 	push	hl
   88B3 21 07 00      [10] 3341 	ld	hl, #0x0007
   88B6 E5            [11] 3342 	push	hl
   88B7 3E 03         [ 7] 3343 	ld	a, #0x03
   88B9 F5            [11] 3344 	push	af
   88BA 33            [ 6] 3345 	inc	sp
   88BB DD 6E 06      [19] 3346 	ld	l,6 (ix)
   88BE DD 66 07      [19] 3347 	ld	h,7 (ix)
   88C1 E5            [11] 3348 	push	hl
   88C2 CD 68 75      [17] 3349 	call	_createRoca
   88C5 21 07 00      [10] 3350 	ld	hl, #7
   88C8 39            [11] 3351 	add	hl, sp
   88C9 F9            [ 6] 3352 	ld	sp, hl
                           3353 ;src/niveles/niveles.c:399: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   88CA 21 1C 01      [10] 3354 	ld	hl, #0x011c
   88CD E5            [11] 3355 	push	hl
   88CE 21 07 00      [10] 3356 	ld	hl, #0x0007
   88D1 E5            [11] 3357 	push	hl
   88D2 3E 04         [ 7] 3358 	ld	a, #0x04
   88D4 F5            [11] 3359 	push	af
   88D5 33            [ 6] 3360 	inc	sp
   88D6 DD 6E 06      [19] 3361 	ld	l,6 (ix)
   88D9 DD 66 07      [19] 3362 	ld	h,7 (ix)
   88DC E5            [11] 3363 	push	hl
   88DD CD 68 75      [17] 3364 	call	_createRoca
   88E0 21 07 00      [10] 3365 	ld	hl, #7
   88E3 39            [11] 3366 	add	hl, sp
   88E4 F9            [ 6] 3367 	ld	sp, hl
                           3368 ;src/niveles/niveles.c:400: createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   88E5 21 1C 01      [10] 3369 	ld	hl, #0x011c
   88E8 E5            [11] 3370 	push	hl
   88E9 21 07 00      [10] 3371 	ld	hl, #0x0007
   88EC E5            [11] 3372 	push	hl
   88ED 3E 05         [ 7] 3373 	ld	a, #0x05
   88EF F5            [11] 3374 	push	af
   88F0 33            [ 6] 3375 	inc	sp
   88F1 DD 6E 06      [19] 3376 	ld	l,6 (ix)
   88F4 DD 66 07      [19] 3377 	ld	h,7 (ix)
   88F7 E5            [11] 3378 	push	hl
   88F8 CD 68 75      [17] 3379 	call	_createRoca
   88FB 21 07 00      [10] 3380 	ld	hl, #7
   88FE 39            [11] 3381 	add	hl, sp
   88FF F9            [ 6] 3382 	ld	sp, hl
                           3383 ;src/niveles/niveles.c:401: createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   8900 21 1C 01      [10] 3384 	ld	hl, #0x011c
   8903 E5            [11] 3385 	push	hl
   8904 21 07 00      [10] 3386 	ld	hl, #0x0007
   8907 E5            [11] 3387 	push	hl
   8908 3E 06         [ 7] 3388 	ld	a, #0x06
   890A F5            [11] 3389 	push	af
   890B 33            [ 6] 3390 	inc	sp
   890C DD 6E 06      [19] 3391 	ld	l,6 (ix)
   890F DD 66 07      [19] 3392 	ld	h,7 (ix)
   8912 E5            [11] 3393 	push	hl
   8913 CD 68 75      [17] 3394 	call	_createRoca
   8916 21 07 00      [10] 3395 	ld	hl, #7
   8919 39            [11] 3396 	add	hl, sp
   891A F9            [ 6] 3397 	ld	sp, hl
                           3398 ;src/niveles/niveles.c:402: createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   891B 21 1C 01      [10] 3399 	ld	hl, #0x011c
   891E E5            [11] 3400 	push	hl
   891F 21 07 00      [10] 3401 	ld	hl, #0x0007
   8922 E5            [11] 3402 	push	hl
   8923 3E 07         [ 7] 3403 	ld	a, #0x07
   8925 F5            [11] 3404 	push	af
   8926 33            [ 6] 3405 	inc	sp
   8927 DD 6E 06      [19] 3406 	ld	l,6 (ix)
   892A DD 66 07      [19] 3407 	ld	h,7 (ix)
   892D E5            [11] 3408 	push	hl
   892E CD 68 75      [17] 3409 	call	_createRoca
   8931 21 07 00      [10] 3410 	ld	hl, #7
   8934 39            [11] 3411 	add	hl, sp
   8935 F9            [ 6] 3412 	ld	sp, hl
                           3413 ;src/niveles/niveles.c:403: createRoca(rocas,8,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   8936 21 1C 01      [10] 3414 	ld	hl, #0x011c
   8939 E5            [11] 3415 	push	hl
   893A 21 07 00      [10] 3416 	ld	hl, #0x0007
   893D E5            [11] 3417 	push	hl
   893E 3E 08         [ 7] 3418 	ld	a, #0x08
   8940 F5            [11] 3419 	push	af
   8941 33            [ 6] 3420 	inc	sp
   8942 DD 6E 06      [19] 3421 	ld	l,6 (ix)
   8945 DD 66 07      [19] 3422 	ld	h,7 (ix)
   8948 E5            [11] 3423 	push	hl
   8949 CD 68 75      [17] 3424 	call	_createRoca
   894C 21 07 00      [10] 3425 	ld	hl, #7
   894F 39            [11] 3426 	add	hl, sp
   8950 F9            [ 6] 3427 	ld	sp, hl
                           3428 ;src/niveles/niveles.c:404: createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
   8951 21 1C 01      [10] 3429 	ld	hl, #0x011c
   8954 E5            [11] 3430 	push	hl
   8955 21 02 00      [10] 3431 	ld	hl, #0x0002
   8958 E5            [11] 3432 	push	hl
   8959 3E 01         [ 7] 3433 	ld	a, #0x01
   895B F5            [11] 3434 	push	af
   895C 33            [ 6] 3435 	inc	sp
   895D DD 6E 06      [19] 3436 	ld	l,6 (ix)
   8960 DD 66 07      [19] 3437 	ld	h,7 (ix)
   8963 E5            [11] 3438 	push	hl
   8964 CD 68 75      [17] 3439 	call	_createRoca
   8967 21 07 00      [10] 3440 	ld	hl, #7
   896A 39            [11] 3441 	add	hl, sp
   896B F9            [ 6] 3442 	ld	sp, hl
                           3443 ;src/niveles/niveles.c:405: createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
   896C 21 1C 01      [10] 3444 	ld	hl, #0x011c
   896F E5            [11] 3445 	push	hl
   8970 21 03 00      [10] 3446 	ld	hl, #0x0003
   8973 E5            [11] 3447 	push	hl
   8974 3E 01         [ 7] 3448 	ld	a, #0x01
   8976 F5            [11] 3449 	push	af
   8977 33            [ 6] 3450 	inc	sp
   8978 DD 6E 06      [19] 3451 	ld	l,6 (ix)
   897B DD 66 07      [19] 3452 	ld	h,7 (ix)
   897E E5            [11] 3453 	push	hl
   897F CD 68 75      [17] 3454 	call	_createRoca
   8982 21 07 00      [10] 3455 	ld	hl, #7
   8985 39            [11] 3456 	add	hl, sp
   8986 F9            [ 6] 3457 	ld	sp, hl
                           3458 ;src/niveles/niveles.c:406: createRoca(rocas,1,4,sin_Movimiento, sprite_Muro_Polvo1,1);
   8987 21 1C 01      [10] 3459 	ld	hl, #0x011c
   898A E5            [11] 3460 	push	hl
   898B 21 04 00      [10] 3461 	ld	hl, #0x0004
   898E E5            [11] 3462 	push	hl
   898F 3E 01         [ 7] 3463 	ld	a, #0x01
   8991 F5            [11] 3464 	push	af
   8992 33            [ 6] 3465 	inc	sp
   8993 DD 6E 06      [19] 3466 	ld	l,6 (ix)
   8996 DD 66 07      [19] 3467 	ld	h,7 (ix)
   8999 E5            [11] 3468 	push	hl
   899A CD 68 75      [17] 3469 	call	_createRoca
   899D 21 07 00      [10] 3470 	ld	hl, #7
   89A0 39            [11] 3471 	add	hl, sp
   89A1 F9            [ 6] 3472 	ld	sp, hl
                           3473 ;src/niveles/niveles.c:407: createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
   89A2 21 1C 01      [10] 3474 	ld	hl, #0x011c
   89A5 E5            [11] 3475 	push	hl
   89A6 21 05 00      [10] 3476 	ld	hl, #0x0005
   89A9 E5            [11] 3477 	push	hl
   89AA 3E 01         [ 7] 3478 	ld	a, #0x01
   89AC F5            [11] 3479 	push	af
   89AD 33            [ 6] 3480 	inc	sp
   89AE DD 6E 06      [19] 3481 	ld	l,6 (ix)
   89B1 DD 66 07      [19] 3482 	ld	h,7 (ix)
   89B4 E5            [11] 3483 	push	hl
   89B5 CD 68 75      [17] 3484 	call	_createRoca
   89B8 21 07 00      [10] 3485 	ld	hl, #7
   89BB 39            [11] 3486 	add	hl, sp
   89BC F9            [ 6] 3487 	ld	sp, hl
                           3488 ;src/niveles/niveles.c:408: createRoca(rocas,1,6,sin_Movimiento, sprite_Muro_Polvo1,1);
   89BD 21 1C 01      [10] 3489 	ld	hl, #0x011c
   89C0 E5            [11] 3490 	push	hl
   89C1 21 06 00      [10] 3491 	ld	hl, #0x0006
   89C4 E5            [11] 3492 	push	hl
   89C5 3E 01         [ 7] 3493 	ld	a, #0x01
   89C7 F5            [11] 3494 	push	af
   89C8 33            [ 6] 3495 	inc	sp
   89C9 DD 6E 06      [19] 3496 	ld	l,6 (ix)
   89CC DD 66 07      [19] 3497 	ld	h,7 (ix)
   89CF E5            [11] 3498 	push	hl
   89D0 CD 68 75      [17] 3499 	call	_createRoca
   89D3 21 07 00      [10] 3500 	ld	hl, #7
   89D6 39            [11] 3501 	add	hl, sp
   89D7 F9            [ 6] 3502 	ld	sp, hl
                           3503 ;src/niveles/niveles.c:409: createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Polvo1,1);
   89D8 21 1C 01      [10] 3504 	ld	hl, #0x011c
   89DB E5            [11] 3505 	push	hl
   89DC 21 02 00      [10] 3506 	ld	hl, #0x0002
   89DF E5            [11] 3507 	push	hl
   89E0 3E 08         [ 7] 3508 	ld	a, #0x08
   89E2 F5            [11] 3509 	push	af
   89E3 33            [ 6] 3510 	inc	sp
   89E4 DD 6E 06      [19] 3511 	ld	l,6 (ix)
   89E7 DD 66 07      [19] 3512 	ld	h,7 (ix)
   89EA E5            [11] 3513 	push	hl
   89EB CD 68 75      [17] 3514 	call	_createRoca
   89EE 21 07 00      [10] 3515 	ld	hl, #7
   89F1 39            [11] 3516 	add	hl, sp
   89F2 F9            [ 6] 3517 	ld	sp, hl
                           3518 ;src/niveles/niveles.c:410: createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Polvo1,1);
   89F3 21 1C 01      [10] 3519 	ld	hl, #0x011c
   89F6 E5            [11] 3520 	push	hl
   89F7 21 03 00      [10] 3521 	ld	hl, #0x0003
   89FA E5            [11] 3522 	push	hl
   89FB 3E 08         [ 7] 3523 	ld	a, #0x08
   89FD F5            [11] 3524 	push	af
   89FE 33            [ 6] 3525 	inc	sp
   89FF DD 6E 06      [19] 3526 	ld	l,6 (ix)
   8A02 DD 66 07      [19] 3527 	ld	h,7 (ix)
   8A05 E5            [11] 3528 	push	hl
   8A06 CD 68 75      [17] 3529 	call	_createRoca
   8A09 21 07 00      [10] 3530 	ld	hl, #7
   8A0C 39            [11] 3531 	add	hl, sp
   8A0D F9            [ 6] 3532 	ld	sp, hl
                           3533 ;src/niveles/niveles.c:411: createRoca(rocas,8,4,sin_Movimiento, sprite_Muro_Polvo1,1);
   8A0E 21 1C 01      [10] 3534 	ld	hl, #0x011c
   8A11 E5            [11] 3535 	push	hl
   8A12 21 04 00      [10] 3536 	ld	hl, #0x0004
   8A15 E5            [11] 3537 	push	hl
   8A16 3E 08         [ 7] 3538 	ld	a, #0x08
   8A18 F5            [11] 3539 	push	af
   8A19 33            [ 6] 3540 	inc	sp
   8A1A DD 6E 06      [19] 3541 	ld	l,6 (ix)
   8A1D DD 66 07      [19] 3542 	ld	h,7 (ix)
   8A20 E5            [11] 3543 	push	hl
   8A21 CD 68 75      [17] 3544 	call	_createRoca
   8A24 21 07 00      [10] 3545 	ld	hl, #7
   8A27 39            [11] 3546 	add	hl, sp
   8A28 F9            [ 6] 3547 	ld	sp, hl
                           3548 ;src/niveles/niveles.c:412: createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Polvo1,1);
   8A29 21 1C 01      [10] 3549 	ld	hl, #0x011c
   8A2C E5            [11] 3550 	push	hl
   8A2D 21 05 00      [10] 3551 	ld	hl, #0x0005
   8A30 E5            [11] 3552 	push	hl
   8A31 3E 08         [ 7] 3553 	ld	a, #0x08
   8A33 F5            [11] 3554 	push	af
   8A34 33            [ 6] 3555 	inc	sp
   8A35 DD 6E 06      [19] 3556 	ld	l,6 (ix)
   8A38 DD 66 07      [19] 3557 	ld	h,7 (ix)
   8A3B E5            [11] 3558 	push	hl
   8A3C CD 68 75      [17] 3559 	call	_createRoca
   8A3F 21 07 00      [10] 3560 	ld	hl, #7
   8A42 39            [11] 3561 	add	hl, sp
   8A43 F9            [ 6] 3562 	ld	sp, hl
                           3563 ;src/niveles/niveles.c:413: createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Polvo1,1);
   8A44 21 1C 01      [10] 3564 	ld	hl, #0x011c
   8A47 E5            [11] 3565 	push	hl
   8A48 21 06 00      [10] 3566 	ld	hl, #0x0006
   8A4B E5            [11] 3567 	push	hl
   8A4C 3E 08         [ 7] 3568 	ld	a, #0x08
   8A4E F5            [11] 3569 	push	af
   8A4F 33            [ 6] 3570 	inc	sp
   8A50 DD 6E 06      [19] 3571 	ld	l,6 (ix)
   8A53 DD 66 07      [19] 3572 	ld	h,7 (ix)
   8A56 E5            [11] 3573 	push	hl
   8A57 CD 68 75      [17] 3574 	call	_createRoca
   8A5A 21 07 00      [10] 3575 	ld	hl, #7
   8A5D 39            [11] 3576 	add	hl, sp
   8A5E F9            [ 6] 3577 	ld	sp, hl
                           3578 ;src/niveles/niveles.c:414: createRoca(rocas,2,3,sin_Movimiento,sprite_RockInmovil1_B,1);
   8A5F 21 08 01      [10] 3579 	ld	hl, #0x0108
   8A62 E5            [11] 3580 	push	hl
   8A63 21 03 00      [10] 3581 	ld	hl, #0x0003
   8A66 E5            [11] 3582 	push	hl
   8A67 3E 02         [ 7] 3583 	ld	a, #0x02
   8A69 F5            [11] 3584 	push	af
   8A6A 33            [ 6] 3585 	inc	sp
   8A6B DD 6E 06      [19] 3586 	ld	l,6 (ix)
   8A6E DD 66 07      [19] 3587 	ld	h,7 (ix)
   8A71 E5            [11] 3588 	push	hl
   8A72 CD 68 75      [17] 3589 	call	_createRoca
   8A75 21 07 00      [10] 3590 	ld	hl, #7
   8A78 39            [11] 3591 	add	hl, sp
   8A79 F9            [ 6] 3592 	ld	sp, hl
                           3593 ;src/niveles/niveles.c:415: createRoca(rocas,2,5,sin_Movimiento,sprite_RockInmovil1_B,1);
   8A7A 21 08 01      [10] 3594 	ld	hl, #0x0108
   8A7D E5            [11] 3595 	push	hl
   8A7E 21 05 00      [10] 3596 	ld	hl, #0x0005
   8A81 E5            [11] 3597 	push	hl
   8A82 3E 02         [ 7] 3598 	ld	a, #0x02
   8A84 F5            [11] 3599 	push	af
   8A85 33            [ 6] 3600 	inc	sp
   8A86 DD 6E 06      [19] 3601 	ld	l,6 (ix)
   8A89 DD 66 07      [19] 3602 	ld	h,7 (ix)
   8A8C E5            [11] 3603 	push	hl
   8A8D CD 68 75      [17] 3604 	call	_createRoca
   8A90 21 07 00      [10] 3605 	ld	hl, #7
   8A93 39            [11] 3606 	add	hl, sp
   8A94 F9            [ 6] 3607 	ld	sp, hl
                           3608 ;src/niveles/niveles.c:416: createRoca(rocas,7,3,sin_Movimiento,sprite_RockInmovil1_B,1);
   8A95 21 08 01      [10] 3609 	ld	hl, #0x0108
   8A98 E5            [11] 3610 	push	hl
   8A99 21 03 00      [10] 3611 	ld	hl, #0x0003
   8A9C E5            [11] 3612 	push	hl
   8A9D 3E 07         [ 7] 3613 	ld	a, #0x07
   8A9F F5            [11] 3614 	push	af
   8AA0 33            [ 6] 3615 	inc	sp
   8AA1 DD 6E 06      [19] 3616 	ld	l,6 (ix)
   8AA4 DD 66 07      [19] 3617 	ld	h,7 (ix)
   8AA7 E5            [11] 3618 	push	hl
   8AA8 CD 68 75      [17] 3619 	call	_createRoca
   8AAB 21 07 00      [10] 3620 	ld	hl, #7
   8AAE 39            [11] 3621 	add	hl, sp
   8AAF F9            [ 6] 3622 	ld	sp, hl
                           3623 ;src/niveles/niveles.c:417: createRoca(rocas,7,5,sin_Movimiento,sprite_RockInmovil1_B,1);
   8AB0 21 08 01      [10] 3624 	ld	hl, #0x0108
   8AB3 E5            [11] 3625 	push	hl
   8AB4 21 05 00      [10] 3626 	ld	hl, #0x0005
   8AB7 E5            [11] 3627 	push	hl
   8AB8 3E 07         [ 7] 3628 	ld	a, #0x07
   8ABA F5            [11] 3629 	push	af
   8ABB 33            [ 6] 3630 	inc	sp
   8ABC DD 6E 06      [19] 3631 	ld	l,6 (ix)
   8ABF DD 66 07      [19] 3632 	ld	h,7 (ix)
   8AC2 E5            [11] 3633 	push	hl
   8AC3 CD 68 75      [17] 3634 	call	_createRoca
   8AC6 21 07 00      [10] 3635 	ld	hl, #7
   8AC9 39            [11] 3636 	add	hl, sp
   8ACA F9            [ 6] 3637 	ld	sp, hl
                           3638 ;src/niveles/niveles.c:418: createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil2_B,1);
   8ACB 21 0A 01      [10] 3639 	ld	hl, #0x010a
   8ACE E5            [11] 3640 	push	hl
   8ACF 21 02 00      [10] 3641 	ld	hl, #0x0002
   8AD2 E5            [11] 3642 	push	hl
   8AD3 3E 02         [ 7] 3643 	ld	a, #0x02
   8AD5 F5            [11] 3644 	push	af
   8AD6 33            [ 6] 3645 	inc	sp
   8AD7 DD 6E 06      [19] 3646 	ld	l,6 (ix)
   8ADA DD 66 07      [19] 3647 	ld	h,7 (ix)
   8ADD E5            [11] 3648 	push	hl
   8ADE CD 68 75      [17] 3649 	call	_createRoca
   8AE1 21 07 00      [10] 3650 	ld	hl, #7
   8AE4 39            [11] 3651 	add	hl, sp
   8AE5 F9            [ 6] 3652 	ld	sp, hl
                           3653 ;src/niveles/niveles.c:419: createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil2_B,1);
   8AE6 21 0A 01      [10] 3654 	ld	hl, #0x010a
   8AE9 E5            [11] 3655 	push	hl
   8AEA 21 06 00      [10] 3656 	ld	hl, #0x0006
   8AED E5            [11] 3657 	push	hl
   8AEE 3E 02         [ 7] 3658 	ld	a, #0x02
   8AF0 F5            [11] 3659 	push	af
   8AF1 33            [ 6] 3660 	inc	sp
   8AF2 DD 6E 06      [19] 3661 	ld	l,6 (ix)
   8AF5 DD 66 07      [19] 3662 	ld	h,7 (ix)
   8AF8 E5            [11] 3663 	push	hl
   8AF9 CD 68 75      [17] 3664 	call	_createRoca
   8AFC 21 07 00      [10] 3665 	ld	hl, #7
   8AFF 39            [11] 3666 	add	hl, sp
   8B00 F9            [ 6] 3667 	ld	sp, hl
                           3668 ;src/niveles/niveles.c:420: createHoleIzquierda(rocas,2,4,sprite_hole,4);
   8B01 21 24 04      [10] 3669 	ld	hl, #0x0424
   8B04 E5            [11] 3670 	push	hl
   8B05 2E 02         [ 7] 3671 	ld	l, #0x02
   8B07 E5            [11] 3672 	push	hl
   8B08 DD 6E 06      [19] 3673 	ld	l,6 (ix)
   8B0B DD 66 07      [19] 3674 	ld	h,7 (ix)
   8B0E E5            [11] 3675 	push	hl
   8B0F CD 59 77      [17] 3676 	call	_createHoleIzquierda
   8B12 21 06 00      [10] 3677 	ld	hl, #6
   8B15 39            [11] 3678 	add	hl, sp
   8B16 F9            [ 6] 3679 	ld	sp, hl
   8B17 DD E1         [14] 3680 	pop	ix
   8B19 C9            [10] 3681 	ret
                           3682 ;src/niveles/niveles.c:423: void crearNievel5(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           3683 ;	---------------------------------
                           3684 ; Function crearNievel5
                           3685 ; ---------------------------------
   8B1A                    3686 _crearNievel5::
   8B1A DD E5         [15] 3687 	push	ix
   8B1C DD 21 00 00   [14] 3688 	ld	ix,#0
   8B20 DD 39         [15] 3689 	add	ix,sp
                           3690 ;src/niveles/niveles.c:425: createPlayer(player,3,5,posicion);
   8B22 DD 6E 10      [19] 3691 	ld	l,16 (ix)
   8B25 DD 66 11      [19] 3692 	ld	h,17 (ix)
   8B28 E5            [11] 3693 	push	hl
   8B29 21 03 05      [10] 3694 	ld	hl, #0x0503
   8B2C E5            [11] 3695 	push	hl
   8B2D DD 6E 04      [19] 3696 	ld	l,4 (ix)
   8B30 DD 66 05      [19] 3697 	ld	h,5 (ix)
   8B33 E5            [11] 3698 	push	hl
   8B34 CD 29 75      [17] 3699 	call	_createPlayer
   8B37 21 06 00      [10] 3700 	ld	hl, #6
   8B3A 39            [11] 3701 	add	hl, sp
   8B3B F9            [ 6] 3702 	ld	sp, hl
                           3703 ;src/niveles/niveles.c:426: createMarco(no);
   8B3C 3E 01         [ 7] 3704 	ld	a, #0x01
   8B3E F5            [11] 3705 	push	af
   8B3F 33            [ 6] 3706 	inc	sp
   8B40 CD 1A 75      [17] 3707 	call	_createMarco
   8B43 33            [ 6] 3708 	inc	sp
                           3709 ;src/niveles/niveles.c:427: createPortal(portales,rocas,rocasEspejo,si);
   8B44 AF            [ 4] 3710 	xor	a, a
   8B45 F5            [11] 3711 	push	af
   8B46 33            [ 6] 3712 	inc	sp
   8B47 DD 6E 08      [19] 3713 	ld	l,8 (ix)
   8B4A DD 66 09      [19] 3714 	ld	h,9 (ix)
   8B4D E5            [11] 3715 	push	hl
   8B4E DD 6E 06      [19] 3716 	ld	l,6 (ix)
   8B51 DD 66 07      [19] 3717 	ld	h,7 (ix)
   8B54 E5            [11] 3718 	push	hl
   8B55 DD 6E 0C      [19] 3719 	ld	l,12 (ix)
   8B58 DD 66 0D      [19] 3720 	ld	h,13 (ix)
   8B5B E5            [11] 3721 	push	hl
   8B5C CD 0D 77      [17] 3722 	call	_createPortal
   8B5F 21 07 00      [10] 3723 	ld	hl, #7
   8B62 39            [11] 3724 	add	hl, sp
   8B63 F9            [ 6] 3725 	ld	sp, hl
                           3726 ;src/niveles/niveles.c:428: createPuerta(puertas,3,6,sprite_Puerta_G,nivel_04);
   8B64 21 1E 06      [10] 3727 	ld	hl, #0x061e
   8B67 E5            [11] 3728 	push	hl
   8B68 2E 03         [ 7] 3729 	ld	l, #0x03
   8B6A E5            [11] 3730 	push	hl
   8B6B DD 6E 0A      [19] 3731 	ld	l,10 (ix)
   8B6E DD 66 0B      [19] 3732 	ld	h,11 (ix)
   8B71 E5            [11] 3733 	push	hl
   8B72 CD 94 76      [17] 3734 	call	_createPuerta
   8B75 21 06 00      [10] 3735 	ld	hl, #6
   8B78 39            [11] 3736 	add	hl, sp
   8B79 F9            [ 6] 3737 	ld	sp, hl
                           3738 ;src/niveles/niveles.c:432: createRoca(rocas,5,5,mover_1,sprite_Rock_G,2);
   8B7A 21 02 02      [10] 3739 	ld	hl, #0x0202
   8B7D E5            [11] 3740 	push	hl
   8B7E 21 05 01      [10] 3741 	ld	hl, #0x0105
   8B81 E5            [11] 3742 	push	hl
   8B82 3E 05         [ 7] 3743 	ld	a, #0x05
   8B84 F5            [11] 3744 	push	af
   8B85 33            [ 6] 3745 	inc	sp
   8B86 DD 6E 06      [19] 3746 	ld	l,6 (ix)
   8B89 DD 66 07      [19] 3747 	ld	h,7 (ix)
   8B8C E5            [11] 3748 	push	hl
   8B8D CD 68 75      [17] 3749 	call	_createRoca
   8B90 21 07 00      [10] 3750 	ld	hl, #7
   8B93 39            [11] 3751 	add	hl, sp
   8B94 F9            [ 6] 3752 	ld	sp, hl
                           3753 ;src/niveles/niveles.c:433: createRocaEspejo(rocasEspejo,11,5,mover_1, sprite_Rock_B,2);
   8B95 21 03 02      [10] 3754 	ld	hl, #0x0203
   8B98 E5            [11] 3755 	push	hl
   8B99 21 05 01      [10] 3756 	ld	hl, #0x0105
   8B9C E5            [11] 3757 	push	hl
   8B9D 3E 0B         [ 7] 3758 	ld	a, #0x0b
   8B9F F5            [11] 3759 	push	af
   8BA0 33            [ 6] 3760 	inc	sp
   8BA1 DD 6E 08      [19] 3761 	ld	l,8 (ix)
   8BA4 DD 66 09      [19] 3762 	ld	h,9 (ix)
   8BA7 E5            [11] 3763 	push	hl
   8BA8 CD FE 75      [17] 3764 	call	_createRocaEspejo
   8BAB 21 07 00      [10] 3765 	ld	hl, #7
   8BAE 39            [11] 3766 	add	hl, sp
   8BAF F9            [ 6] 3767 	ld	sp, hl
                           3768 ;src/niveles/niveles.c:434: createRoca(rocas,4,3,mover_Linea,sprite_RockLineal1_G,3);
   8BB0 21 05 03      [10] 3769 	ld	hl, #0x0305
   8BB3 E5            [11] 3770 	push	hl
   8BB4 21 03 02      [10] 3771 	ld	hl, #0x0203
   8BB7 E5            [11] 3772 	push	hl
   8BB8 3E 04         [ 7] 3773 	ld	a, #0x04
   8BBA F5            [11] 3774 	push	af
   8BBB 33            [ 6] 3775 	inc	sp
   8BBC DD 6E 06      [19] 3776 	ld	l,6 (ix)
   8BBF DD 66 07      [19] 3777 	ld	h,7 (ix)
   8BC2 E5            [11] 3778 	push	hl
   8BC3 CD 68 75      [17] 3779 	call	_createRoca
   8BC6 21 07 00      [10] 3780 	ld	hl, #7
   8BC9 39            [11] 3781 	add	hl, sp
   8BCA F9            [ 6] 3782 	ld	sp, hl
                           3783 ;src/niveles/niveles.c:435: createRocaEspejo(rocasEspejo,12,3,mover_1, sprite_Rock_B,3);
   8BCB 21 03 03      [10] 3784 	ld	hl, #0x0303
   8BCE E5            [11] 3785 	push	hl
   8BCF 26 01         [ 7] 3786 	ld	h, #0x01
   8BD1 E5            [11] 3787 	push	hl
   8BD2 3E 0C         [ 7] 3788 	ld	a, #0x0c
   8BD4 F5            [11] 3789 	push	af
   8BD5 33            [ 6] 3790 	inc	sp
   8BD6 DD 6E 08      [19] 3791 	ld	l,8 (ix)
   8BD9 DD 66 09      [19] 3792 	ld	h,9 (ix)
   8BDC E5            [11] 3793 	push	hl
   8BDD CD FE 75      [17] 3794 	call	_createRocaEspejo
   8BE0 21 07 00      [10] 3795 	ld	hl, #7
   8BE3 39            [11] 3796 	add	hl, sp
   8BE4 F9            [ 6] 3797 	ld	sp, hl
                           3798 ;src/niveles/niveles.c:439: createColeccionabeLuz(col,12,2,2);
   8BE5 21 02 02      [10] 3799 	ld	hl, #0x0202
   8BE8 E5            [11] 3800 	push	hl
   8BE9 3E 0C         [ 7] 3801 	ld	a, #0x0c
   8BEB F5            [11] 3802 	push	af
   8BEC 33            [ 6] 3803 	inc	sp
   8BED DD 6E 0E      [19] 3804 	ld	l,14 (ix)
   8BF0 DD 66 0F      [19] 3805 	ld	h,15 (ix)
   8BF3 E5            [11] 3806 	push	hl
   8BF4 CD 81 78      [17] 3807 	call	_createColeccionabeLuz
   8BF7 F1            [10] 3808 	pop	af
                           3809 ;src/niveles/niveles.c:442: createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Solid1,1);
   8BF8 33            [ 6] 3810 	inc	sp
   8BF9 21 1D 01      [10] 3811 	ld	hl,#0x011d
   8BFC E3            [19] 3812 	ex	(sp),hl
   8BFD 21 01 00      [10] 3813 	ld	hl, #0x0001
   8C00 E5            [11] 3814 	push	hl
   8C01 3E 02         [ 7] 3815 	ld	a, #0x02
   8C03 F5            [11] 3816 	push	af
   8C04 33            [ 6] 3817 	inc	sp
   8C05 DD 6E 06      [19] 3818 	ld	l,6 (ix)
   8C08 DD 66 07      [19] 3819 	ld	h,7 (ix)
   8C0B E5            [11] 3820 	push	hl
   8C0C CD 68 75      [17] 3821 	call	_createRoca
   8C0F 21 07 00      [10] 3822 	ld	hl, #7
   8C12 39            [11] 3823 	add	hl, sp
   8C13 F9            [ 6] 3824 	ld	sp, hl
                           3825 ;src/niveles/niveles.c:443: createRoca(rocas,2,2,sin_Movimiento, sprite_Muro_Solid1,1);
   8C14 21 1D 01      [10] 3826 	ld	hl, #0x011d
   8C17 E5            [11] 3827 	push	hl
   8C18 21 02 00      [10] 3828 	ld	hl, #0x0002
   8C1B E5            [11] 3829 	push	hl
   8C1C 3E 02         [ 7] 3830 	ld	a, #0x02
   8C1E F5            [11] 3831 	push	af
   8C1F 33            [ 6] 3832 	inc	sp
   8C20 DD 6E 06      [19] 3833 	ld	l,6 (ix)
   8C23 DD 66 07      [19] 3834 	ld	h,7 (ix)
   8C26 E5            [11] 3835 	push	hl
   8C27 CD 68 75      [17] 3836 	call	_createRoca
   8C2A 21 07 00      [10] 3837 	ld	hl, #7
   8C2D 39            [11] 3838 	add	hl, sp
   8C2E F9            [ 6] 3839 	ld	sp, hl
                           3840 ;src/niveles/niveles.c:444: createRoca(rocas,2,3,sin_Movimiento, sprite_Muro_Solid1,1);
   8C2F 21 1D 01      [10] 3841 	ld	hl, #0x011d
   8C32 E5            [11] 3842 	push	hl
   8C33 21 03 00      [10] 3843 	ld	hl, #0x0003
   8C36 E5            [11] 3844 	push	hl
   8C37 3E 02         [ 7] 3845 	ld	a, #0x02
   8C39 F5            [11] 3846 	push	af
   8C3A 33            [ 6] 3847 	inc	sp
   8C3B DD 6E 06      [19] 3848 	ld	l,6 (ix)
   8C3E DD 66 07      [19] 3849 	ld	h,7 (ix)
   8C41 E5            [11] 3850 	push	hl
   8C42 CD 68 75      [17] 3851 	call	_createRoca
   8C45 21 07 00      [10] 3852 	ld	hl, #7
   8C48 39            [11] 3853 	add	hl, sp
   8C49 F9            [ 6] 3854 	ld	sp, hl
                           3855 ;src/niveles/niveles.c:445: createRoca(rocas,2,4,sin_Movimiento, sprite_Muro_Solid1,1);
   8C4A 21 1D 01      [10] 3856 	ld	hl, #0x011d
   8C4D E5            [11] 3857 	push	hl
   8C4E 21 04 00      [10] 3858 	ld	hl, #0x0004
   8C51 E5            [11] 3859 	push	hl
   8C52 3E 02         [ 7] 3860 	ld	a, #0x02
   8C54 F5            [11] 3861 	push	af
   8C55 33            [ 6] 3862 	inc	sp
   8C56 DD 6E 06      [19] 3863 	ld	l,6 (ix)
   8C59 DD 66 07      [19] 3864 	ld	h,7 (ix)
   8C5C E5            [11] 3865 	push	hl
   8C5D CD 68 75      [17] 3866 	call	_createRoca
   8C60 21 07 00      [10] 3867 	ld	hl, #7
   8C63 39            [11] 3868 	add	hl, sp
   8C64 F9            [ 6] 3869 	ld	sp, hl
                           3870 ;src/niveles/niveles.c:446: createRoca(rocas,2,5,sin_Movimiento, sprite_Muro_Solid1,1);
   8C65 21 1D 01      [10] 3871 	ld	hl, #0x011d
   8C68 E5            [11] 3872 	push	hl
   8C69 21 05 00      [10] 3873 	ld	hl, #0x0005
   8C6C E5            [11] 3874 	push	hl
   8C6D 3E 02         [ 7] 3875 	ld	a, #0x02
   8C6F F5            [11] 3876 	push	af
   8C70 33            [ 6] 3877 	inc	sp
   8C71 DD 6E 06      [19] 3878 	ld	l,6 (ix)
   8C74 DD 66 07      [19] 3879 	ld	h,7 (ix)
   8C77 E5            [11] 3880 	push	hl
   8C78 CD 68 75      [17] 3881 	call	_createRoca
   8C7B 21 07 00      [10] 3882 	ld	hl, #7
   8C7E 39            [11] 3883 	add	hl, sp
   8C7F F9            [ 6] 3884 	ld	sp, hl
                           3885 ;src/niveles/niveles.c:447: createRoca(rocas,2,6,sin_Movimiento, sprite_Muro_Solid1,1);
   8C80 21 1D 01      [10] 3886 	ld	hl, #0x011d
   8C83 E5            [11] 3887 	push	hl
   8C84 21 06 00      [10] 3888 	ld	hl, #0x0006
   8C87 E5            [11] 3889 	push	hl
   8C88 3E 02         [ 7] 3890 	ld	a, #0x02
   8C8A F5            [11] 3891 	push	af
   8C8B 33            [ 6] 3892 	inc	sp
   8C8C DD 6E 06      [19] 3893 	ld	l,6 (ix)
   8C8F DD 66 07      [19] 3894 	ld	h,7 (ix)
   8C92 E5            [11] 3895 	push	hl
   8C93 CD 68 75      [17] 3896 	call	_createRoca
   8C96 21 07 00      [10] 3897 	ld	hl, #7
   8C99 39            [11] 3898 	add	hl, sp
   8C9A F9            [ 6] 3899 	ld	sp, hl
                           3900 ;src/niveles/niveles.c:448: createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Solid1,1);
   8C9B 21 1D 01      [10] 3901 	ld	hl, #0x011d
   8C9E E5            [11] 3902 	push	hl
   8C9F 21 07 00      [10] 3903 	ld	hl, #0x0007
   8CA2 E5            [11] 3904 	push	hl
   8CA3 3E 02         [ 7] 3905 	ld	a, #0x02
   8CA5 F5            [11] 3906 	push	af
   8CA6 33            [ 6] 3907 	inc	sp
   8CA7 DD 6E 06      [19] 3908 	ld	l,6 (ix)
   8CAA DD 66 07      [19] 3909 	ld	h,7 (ix)
   8CAD E5            [11] 3910 	push	hl
   8CAE CD 68 75      [17] 3911 	call	_createRoca
   8CB1 21 07 00      [10] 3912 	ld	hl, #7
   8CB4 39            [11] 3913 	add	hl, sp
   8CB5 F9            [ 6] 3914 	ld	sp, hl
                           3915 ;src/niveles/niveles.c:449: createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Solid1,1);
   8CB6 21 1D 01      [10] 3916 	ld	hl, #0x011d
   8CB9 E5            [11] 3917 	push	hl
   8CBA 21 01 00      [10] 3918 	ld	hl, #0x0001
   8CBD E5            [11] 3919 	push	hl
   8CBE 3E 03         [ 7] 3920 	ld	a, #0x03
   8CC0 F5            [11] 3921 	push	af
   8CC1 33            [ 6] 3922 	inc	sp
   8CC2 DD 6E 06      [19] 3923 	ld	l,6 (ix)
   8CC5 DD 66 07      [19] 3924 	ld	h,7 (ix)
   8CC8 E5            [11] 3925 	push	hl
   8CC9 CD 68 75      [17] 3926 	call	_createRoca
   8CCC 21 07 00      [10] 3927 	ld	hl, #7
   8CCF 39            [11] 3928 	add	hl, sp
   8CD0 F9            [ 6] 3929 	ld	sp, hl
                           3930 ;src/niveles/niveles.c:450: createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Solid1,1);
   8CD1 21 1D 01      [10] 3931 	ld	hl, #0x011d
   8CD4 E5            [11] 3932 	push	hl
   8CD5 21 01 00      [10] 3933 	ld	hl, #0x0001
   8CD8 E5            [11] 3934 	push	hl
   8CD9 3E 04         [ 7] 3935 	ld	a, #0x04
   8CDB F5            [11] 3936 	push	af
   8CDC 33            [ 6] 3937 	inc	sp
   8CDD DD 6E 06      [19] 3938 	ld	l,6 (ix)
   8CE0 DD 66 07      [19] 3939 	ld	h,7 (ix)
   8CE3 E5            [11] 3940 	push	hl
   8CE4 CD 68 75      [17] 3941 	call	_createRoca
   8CE7 21 07 00      [10] 3942 	ld	hl, #7
   8CEA 39            [11] 3943 	add	hl, sp
   8CEB F9            [ 6] 3944 	ld	sp, hl
                           3945 ;src/niveles/niveles.c:451: createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Solid1,1);
   8CEC 21 1D 01      [10] 3946 	ld	hl, #0x011d
   8CEF E5            [11] 3947 	push	hl
   8CF0 21 01 00      [10] 3948 	ld	hl, #0x0001
   8CF3 E5            [11] 3949 	push	hl
   8CF4 3E 05         [ 7] 3950 	ld	a, #0x05
   8CF6 F5            [11] 3951 	push	af
   8CF7 33            [ 6] 3952 	inc	sp
   8CF8 DD 6E 06      [19] 3953 	ld	l,6 (ix)
   8CFB DD 66 07      [19] 3954 	ld	h,7 (ix)
   8CFE E5            [11] 3955 	push	hl
   8CFF CD 68 75      [17] 3956 	call	_createRoca
   8D02 21 07 00      [10] 3957 	ld	hl, #7
   8D05 39            [11] 3958 	add	hl, sp
   8D06 F9            [ 6] 3959 	ld	sp, hl
                           3960 ;src/niveles/niveles.c:452: createRoca(rocas,5,2,sin_Movimiento, sprite_Muro_Solid1,1);
   8D07 21 1D 01      [10] 3961 	ld	hl, #0x011d
   8D0A E5            [11] 3962 	push	hl
   8D0B 21 02 00      [10] 3963 	ld	hl, #0x0002
   8D0E E5            [11] 3964 	push	hl
   8D0F 3E 05         [ 7] 3965 	ld	a, #0x05
   8D11 F5            [11] 3966 	push	af
   8D12 33            [ 6] 3967 	inc	sp
   8D13 DD 6E 06      [19] 3968 	ld	l,6 (ix)
   8D16 DD 66 07      [19] 3969 	ld	h,7 (ix)
   8D19 E5            [11] 3970 	push	hl
   8D1A CD 68 75      [17] 3971 	call	_createRoca
   8D1D 21 07 00      [10] 3972 	ld	hl, #7
   8D20 39            [11] 3973 	add	hl, sp
   8D21 F9            [ 6] 3974 	ld	sp, hl
                           3975 ;src/niveles/niveles.c:453: createRoca(rocas,6,2,sin_Movimiento, sprite_Muro_Solid1,1);
   8D22 21 1D 01      [10] 3976 	ld	hl, #0x011d
   8D25 E5            [11] 3977 	push	hl
   8D26 21 02 00      [10] 3978 	ld	hl, #0x0002
   8D29 E5            [11] 3979 	push	hl
   8D2A 3E 06         [ 7] 3980 	ld	a, #0x06
   8D2C F5            [11] 3981 	push	af
   8D2D 33            [ 6] 3982 	inc	sp
   8D2E DD 6E 06      [19] 3983 	ld	l,6 (ix)
   8D31 DD 66 07      [19] 3984 	ld	h,7 (ix)
   8D34 E5            [11] 3985 	push	hl
   8D35 CD 68 75      [17] 3986 	call	_createRoca
   8D38 21 07 00      [10] 3987 	ld	hl, #7
   8D3B 39            [11] 3988 	add	hl, sp
   8D3C F9            [ 6] 3989 	ld	sp, hl
                           3990 ;src/niveles/niveles.c:454: createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Solid1,1);
   8D3D 21 1D 01      [10] 3991 	ld	hl, #0x011d
   8D40 E5            [11] 3992 	push	hl
   8D41 21 02 00      [10] 3993 	ld	hl, #0x0002
   8D44 E5            [11] 3994 	push	hl
   8D45 3E 07         [ 7] 3995 	ld	a, #0x07
   8D47 F5            [11] 3996 	push	af
   8D48 33            [ 6] 3997 	inc	sp
   8D49 DD 6E 06      [19] 3998 	ld	l,6 (ix)
   8D4C DD 66 07      [19] 3999 	ld	h,7 (ix)
   8D4F E5            [11] 4000 	push	hl
   8D50 CD 68 75      [17] 4001 	call	_createRoca
   8D53 21 07 00      [10] 4002 	ld	hl, #7
   8D56 39            [11] 4003 	add	hl, sp
   8D57 F9            [ 6] 4004 	ld	sp, hl
                           4005 ;src/niveles/niveles.c:455: createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Solid1,1);
   8D58 21 1D 01      [10] 4006 	ld	hl, #0x011d
   8D5B E5            [11] 4007 	push	hl
   8D5C 21 07 00      [10] 4008 	ld	hl, #0x0007
   8D5F E5            [11] 4009 	push	hl
   8D60 3E 03         [ 7] 4010 	ld	a, #0x03
   8D62 F5            [11] 4011 	push	af
   8D63 33            [ 6] 4012 	inc	sp
   8D64 DD 6E 06      [19] 4013 	ld	l,6 (ix)
   8D67 DD 66 07      [19] 4014 	ld	h,7 (ix)
   8D6A E5            [11] 4015 	push	hl
   8D6B CD 68 75      [17] 4016 	call	_createRoca
   8D6E 21 07 00      [10] 4017 	ld	hl, #7
   8D71 39            [11] 4018 	add	hl, sp
   8D72 F9            [ 6] 4019 	ld	sp, hl
                           4020 ;src/niveles/niveles.c:456: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
   8D73 21 1D 01      [10] 4021 	ld	hl, #0x011d
   8D76 E5            [11] 4022 	push	hl
   8D77 21 07 00      [10] 4023 	ld	hl, #0x0007
   8D7A E5            [11] 4024 	push	hl
   8D7B 3E 04         [ 7] 4025 	ld	a, #0x04
   8D7D F5            [11] 4026 	push	af
   8D7E 33            [ 6] 4027 	inc	sp
   8D7F DD 6E 06      [19] 4028 	ld	l,6 (ix)
   8D82 DD 66 07      [19] 4029 	ld	h,7 (ix)
   8D85 E5            [11] 4030 	push	hl
   8D86 CD 68 75      [17] 4031 	call	_createRoca
   8D89 21 07 00      [10] 4032 	ld	hl, #7
   8D8C 39            [11] 4033 	add	hl, sp
   8D8D F9            [ 6] 4034 	ld	sp, hl
                           4035 ;src/niveles/niveles.c:457: createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Solid1,1);
   8D8E 21 1D 01      [10] 4036 	ld	hl, #0x011d
   8D91 E5            [11] 4037 	push	hl
   8D92 21 07 00      [10] 4038 	ld	hl, #0x0007
   8D95 E5            [11] 4039 	push	hl
   8D96 3E 05         [ 7] 4040 	ld	a, #0x05
   8D98 F5            [11] 4041 	push	af
   8D99 33            [ 6] 4042 	inc	sp
   8D9A DD 6E 06      [19] 4043 	ld	l,6 (ix)
   8D9D DD 66 07      [19] 4044 	ld	h,7 (ix)
   8DA0 E5            [11] 4045 	push	hl
   8DA1 CD 68 75      [17] 4046 	call	_createRoca
   8DA4 21 07 00      [10] 4047 	ld	hl, #7
   8DA7 39            [11] 4048 	add	hl, sp
   8DA8 F9            [ 6] 4049 	ld	sp, hl
                           4050 ;src/niveles/niveles.c:458: createRoca(rocas,5,6,sin_Movimiento, sprite_Muro_Solid1,1);
   8DA9 21 1D 01      [10] 4051 	ld	hl, #0x011d
   8DAC E5            [11] 4052 	push	hl
   8DAD 21 06 00      [10] 4053 	ld	hl, #0x0006
   8DB0 E5            [11] 4054 	push	hl
   8DB1 3E 05         [ 7] 4055 	ld	a, #0x05
   8DB3 F5            [11] 4056 	push	af
   8DB4 33            [ 6] 4057 	inc	sp
   8DB5 DD 6E 06      [19] 4058 	ld	l,6 (ix)
   8DB8 DD 66 07      [19] 4059 	ld	h,7 (ix)
   8DBB E5            [11] 4060 	push	hl
   8DBC CD 68 75      [17] 4061 	call	_createRoca
   8DBF 21 07 00      [10] 4062 	ld	hl, #7
   8DC2 39            [11] 4063 	add	hl, sp
   8DC3 F9            [ 6] 4064 	ld	sp, hl
                           4065 ;src/niveles/niveles.c:459: createRoca(rocas,6,6,sin_Movimiento, sprite_Muro_Solid1,1);
   8DC4 21 1D 01      [10] 4066 	ld	hl, #0x011d
   8DC7 E5            [11] 4067 	push	hl
   8DC8 21 06 00      [10] 4068 	ld	hl, #0x0006
   8DCB E5            [11] 4069 	push	hl
   8DCC 3E 06         [ 7] 4070 	ld	a, #0x06
   8DCE F5            [11] 4071 	push	af
   8DCF 33            [ 6] 4072 	inc	sp
   8DD0 DD 6E 06      [19] 4073 	ld	l,6 (ix)
   8DD3 DD 66 07      [19] 4074 	ld	h,7 (ix)
   8DD6 E5            [11] 4075 	push	hl
   8DD7 CD 68 75      [17] 4076 	call	_createRoca
   8DDA 21 07 00      [10] 4077 	ld	hl, #7
   8DDD 39            [11] 4078 	add	hl, sp
   8DDE F9            [ 6] 4079 	ld	sp, hl
                           4080 ;src/niveles/niveles.c:460: createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Solid1,1);
   8DDF 21 1D 01      [10] 4081 	ld	hl, #0x011d
   8DE2 E5            [11] 4082 	push	hl
   8DE3 21 06 00      [10] 4083 	ld	hl, #0x0006
   8DE6 E5            [11] 4084 	push	hl
   8DE7 3E 07         [ 7] 4085 	ld	a, #0x07
   8DE9 F5            [11] 4086 	push	af
   8DEA 33            [ 6] 4087 	inc	sp
   8DEB DD 6E 06      [19] 4088 	ld	l,6 (ix)
   8DEE DD 66 07      [19] 4089 	ld	h,7 (ix)
   8DF1 E5            [11] 4090 	push	hl
   8DF2 CD 68 75      [17] 4091 	call	_createRoca
   8DF5 21 07 00      [10] 4092 	ld	hl, #7
   8DF8 39            [11] 4093 	add	hl, sp
   8DF9 F9            [ 6] 4094 	ld	sp, hl
                           4095 ;src/niveles/niveles.c:461: createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Solid1,1);
   8DFA 21 1D 01      [10] 4096 	ld	hl, #0x011d
   8DFD E5            [11] 4097 	push	hl
   8DFE 21 02 00      [10] 4098 	ld	hl, #0x0002
   8E01 E5            [11] 4099 	push	hl
   8E02 3E 08         [ 7] 4100 	ld	a, #0x08
   8E04 F5            [11] 4101 	push	af
   8E05 33            [ 6] 4102 	inc	sp
   8E06 DD 6E 06      [19] 4103 	ld	l,6 (ix)
   8E09 DD 66 07      [19] 4104 	ld	h,7 (ix)
   8E0C E5            [11] 4105 	push	hl
   8E0D CD 68 75      [17] 4106 	call	_createRoca
   8E10 21 07 00      [10] 4107 	ld	hl, #7
   8E13 39            [11] 4108 	add	hl, sp
   8E14 F9            [ 6] 4109 	ld	sp, hl
                           4110 ;src/niveles/niveles.c:462: createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Solid1,1);
   8E15 21 1D 01      [10] 4111 	ld	hl, #0x011d
   8E18 E5            [11] 4112 	push	hl
   8E19 21 03 00      [10] 4113 	ld	hl, #0x0003
   8E1C E5            [11] 4114 	push	hl
   8E1D 3E 08         [ 7] 4115 	ld	a, #0x08
   8E1F F5            [11] 4116 	push	af
   8E20 33            [ 6] 4117 	inc	sp
   8E21 DD 6E 06      [19] 4118 	ld	l,6 (ix)
   8E24 DD 66 07      [19] 4119 	ld	h,7 (ix)
   8E27 E5            [11] 4120 	push	hl
   8E28 CD 68 75      [17] 4121 	call	_createRoca
   8E2B 21 07 00      [10] 4122 	ld	hl, #7
   8E2E 39            [11] 4123 	add	hl, sp
   8E2F F9            [ 6] 4124 	ld	sp, hl
                           4125 ;src/niveles/niveles.c:463: createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Solid1,1);
   8E30 21 1D 01      [10] 4126 	ld	hl, #0x011d
   8E33 E5            [11] 4127 	push	hl
   8E34 21 05 00      [10] 4128 	ld	hl, #0x0005
   8E37 E5            [11] 4129 	push	hl
   8E38 3E 08         [ 7] 4130 	ld	a, #0x08
   8E3A F5            [11] 4131 	push	af
   8E3B 33            [ 6] 4132 	inc	sp
   8E3C DD 6E 06      [19] 4133 	ld	l,6 (ix)
   8E3F DD 66 07      [19] 4134 	ld	h,7 (ix)
   8E42 E5            [11] 4135 	push	hl
   8E43 CD 68 75      [17] 4136 	call	_createRoca
   8E46 21 07 00      [10] 4137 	ld	hl, #7
   8E49 39            [11] 4138 	add	hl, sp
   8E4A F9            [ 6] 4139 	ld	sp, hl
                           4140 ;src/niveles/niveles.c:464: createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Solid1,1);
   8E4B 21 1D 01      [10] 4141 	ld	hl, #0x011d
   8E4E E5            [11] 4142 	push	hl
   8E4F 21 06 00      [10] 4143 	ld	hl, #0x0006
   8E52 E5            [11] 4144 	push	hl
   8E53 3E 08         [ 7] 4145 	ld	a, #0x08
   8E55 F5            [11] 4146 	push	af
   8E56 33            [ 6] 4147 	inc	sp
   8E57 DD 6E 06      [19] 4148 	ld	l,6 (ix)
   8E5A DD 66 07      [19] 4149 	ld	h,7 (ix)
   8E5D E5            [11] 4150 	push	hl
   8E5E CD 68 75      [17] 4151 	call	_createRoca
   8E61 21 07 00      [10] 4152 	ld	hl, #7
   8E64 39            [11] 4153 	add	hl, sp
   8E65 F9            [ 6] 4154 	ld	sp, hl
                           4155 ;src/niveles/niveles.c:465: createRoca(rocas,7,3,sin_Movimiento,sprite_RockInmovil1_G,1);
   8E66 21 07 01      [10] 4156 	ld	hl, #0x0107
   8E69 E5            [11] 4157 	push	hl
   8E6A 21 03 00      [10] 4158 	ld	hl, #0x0003
   8E6D E5            [11] 4159 	push	hl
   8E6E 3E 07         [ 7] 4160 	ld	a, #0x07
   8E70 F5            [11] 4161 	push	af
   8E71 33            [ 6] 4162 	inc	sp
   8E72 DD 6E 06      [19] 4163 	ld	l,6 (ix)
   8E75 DD 66 07      [19] 4164 	ld	h,7 (ix)
   8E78 E5            [11] 4165 	push	hl
   8E79 CD 68 75      [17] 4166 	call	_createRoca
   8E7C 21 07 00      [10] 4167 	ld	hl, #7
   8E7F 39            [11] 4168 	add	hl, sp
   8E80 F9            [ 6] 4169 	ld	sp, hl
                           4170 ;src/niveles/niveles.c:466: createRoca(rocas,7,5,sin_Movimiento,sprite_RockInmovil1_G,1);
   8E81 21 07 01      [10] 4171 	ld	hl, #0x0107
   8E84 E5            [11] 4172 	push	hl
   8E85 21 05 00      [10] 4173 	ld	hl, #0x0005
   8E88 E5            [11] 4174 	push	hl
   8E89 3E 07         [ 7] 4175 	ld	a, #0x07
   8E8B F5            [11] 4176 	push	af
   8E8C 33            [ 6] 4177 	inc	sp
   8E8D DD 6E 06      [19] 4178 	ld	l,6 (ix)
   8E90 DD 66 07      [19] 4179 	ld	h,7 (ix)
   8E93 E5            [11] 4180 	push	hl
   8E94 CD 68 75      [17] 4181 	call	_createRoca
   8E97 21 07 00      [10] 4182 	ld	hl, #7
   8E9A 39            [11] 4183 	add	hl, sp
   8E9B F9            [ 6] 4184 	ld	sp, hl
                           4185 ;src/niveles/niveles.c:470: createRocaEspejo(rocasEspejo,14,1,sin_Movimiento, sprite_Muro_Solid1,1);
   8E9C 21 1D 01      [10] 4186 	ld	hl, #0x011d
   8E9F E5            [11] 4187 	push	hl
   8EA0 21 01 00      [10] 4188 	ld	hl, #0x0001
   8EA3 E5            [11] 4189 	push	hl
   8EA4 3E 0E         [ 7] 4190 	ld	a, #0x0e
   8EA6 F5            [11] 4191 	push	af
   8EA7 33            [ 6] 4192 	inc	sp
   8EA8 DD 6E 08      [19] 4193 	ld	l,8 (ix)
   8EAB DD 66 09      [19] 4194 	ld	h,9 (ix)
   8EAE E5            [11] 4195 	push	hl
   8EAF CD FE 75      [17] 4196 	call	_createRocaEspejo
   8EB2 21 07 00      [10] 4197 	ld	hl, #7
   8EB5 39            [11] 4198 	add	hl, sp
   8EB6 F9            [ 6] 4199 	ld	sp, hl
                           4200 ;src/niveles/niveles.c:471: createRocaEspejo(rocasEspejo,14,2,sin_Movimiento, sprite_Muro_Solid1,1);
   8EB7 21 1D 01      [10] 4201 	ld	hl, #0x011d
   8EBA E5            [11] 4202 	push	hl
   8EBB 21 02 00      [10] 4203 	ld	hl, #0x0002
   8EBE E5            [11] 4204 	push	hl
   8EBF 3E 0E         [ 7] 4205 	ld	a, #0x0e
   8EC1 F5            [11] 4206 	push	af
   8EC2 33            [ 6] 4207 	inc	sp
   8EC3 DD 6E 08      [19] 4208 	ld	l,8 (ix)
   8EC6 DD 66 09      [19] 4209 	ld	h,9 (ix)
   8EC9 E5            [11] 4210 	push	hl
   8ECA CD FE 75      [17] 4211 	call	_createRocaEspejo
   8ECD 21 07 00      [10] 4212 	ld	hl, #7
   8ED0 39            [11] 4213 	add	hl, sp
   8ED1 F9            [ 6] 4214 	ld	sp, hl
                           4215 ;src/niveles/niveles.c:472: createRocaEspejo(rocasEspejo,14,3,sin_Movimiento, sprite_Muro_Solid1,1);
   8ED2 21 1D 01      [10] 4216 	ld	hl, #0x011d
   8ED5 E5            [11] 4217 	push	hl
   8ED6 21 03 00      [10] 4218 	ld	hl, #0x0003
   8ED9 E5            [11] 4219 	push	hl
   8EDA 3E 0E         [ 7] 4220 	ld	a, #0x0e
   8EDC F5            [11] 4221 	push	af
   8EDD 33            [ 6] 4222 	inc	sp
   8EDE DD 6E 08      [19] 4223 	ld	l,8 (ix)
   8EE1 DD 66 09      [19] 4224 	ld	h,9 (ix)
   8EE4 E5            [11] 4225 	push	hl
   8EE5 CD FE 75      [17] 4226 	call	_createRocaEspejo
   8EE8 21 07 00      [10] 4227 	ld	hl, #7
   8EEB 39            [11] 4228 	add	hl, sp
   8EEC F9            [ 6] 4229 	ld	sp, hl
                           4230 ;src/niveles/niveles.c:473: createRocaEspejo(rocasEspejo,14,4,sin_Movimiento, sprite_Muro_Solid1,1);
   8EED 21 1D 01      [10] 4231 	ld	hl, #0x011d
   8EF0 E5            [11] 4232 	push	hl
   8EF1 21 04 00      [10] 4233 	ld	hl, #0x0004
   8EF4 E5            [11] 4234 	push	hl
   8EF5 3E 0E         [ 7] 4235 	ld	a, #0x0e
   8EF7 F5            [11] 4236 	push	af
   8EF8 33            [ 6] 4237 	inc	sp
   8EF9 DD 6E 08      [19] 4238 	ld	l,8 (ix)
   8EFC DD 66 09      [19] 4239 	ld	h,9 (ix)
   8EFF E5            [11] 4240 	push	hl
   8F00 CD FE 75      [17] 4241 	call	_createRocaEspejo
   8F03 21 07 00      [10] 4242 	ld	hl, #7
   8F06 39            [11] 4243 	add	hl, sp
   8F07 F9            [ 6] 4244 	ld	sp, hl
                           4245 ;src/niveles/niveles.c:474: createRocaEspejo(rocasEspejo,14,5,sin_Movimiento, sprite_Muro_Solid1,1);
   8F08 21 1D 01      [10] 4246 	ld	hl, #0x011d
   8F0B E5            [11] 4247 	push	hl
   8F0C 21 05 00      [10] 4248 	ld	hl, #0x0005
   8F0F E5            [11] 4249 	push	hl
   8F10 3E 0E         [ 7] 4250 	ld	a, #0x0e
   8F12 F5            [11] 4251 	push	af
   8F13 33            [ 6] 4252 	inc	sp
   8F14 DD 6E 08      [19] 4253 	ld	l,8 (ix)
   8F17 DD 66 09      [19] 4254 	ld	h,9 (ix)
   8F1A E5            [11] 4255 	push	hl
   8F1B CD FE 75      [17] 4256 	call	_createRocaEspejo
   8F1E 21 07 00      [10] 4257 	ld	hl, #7
   8F21 39            [11] 4258 	add	hl, sp
   8F22 F9            [ 6] 4259 	ld	sp, hl
                           4260 ;src/niveles/niveles.c:475: createRocaEspejo(rocasEspejo,14,6,sin_Movimiento, sprite_Muro_Solid1,1);
   8F23 21 1D 01      [10] 4261 	ld	hl, #0x011d
   8F26 E5            [11] 4262 	push	hl
   8F27 21 06 00      [10] 4263 	ld	hl, #0x0006
   8F2A E5            [11] 4264 	push	hl
   8F2B 3E 0E         [ 7] 4265 	ld	a, #0x0e
   8F2D F5            [11] 4266 	push	af
   8F2E 33            [ 6] 4267 	inc	sp
   8F2F DD 6E 08      [19] 4268 	ld	l,8 (ix)
   8F32 DD 66 09      [19] 4269 	ld	h,9 (ix)
   8F35 E5            [11] 4270 	push	hl
   8F36 CD FE 75      [17] 4271 	call	_createRocaEspejo
   8F39 21 07 00      [10] 4272 	ld	hl, #7
   8F3C 39            [11] 4273 	add	hl, sp
   8F3D F9            [ 6] 4274 	ld	sp, hl
                           4275 ;src/niveles/niveles.c:476: createRocaEspejo(rocasEspejo,14,7,sin_Movimiento, sprite_Muro_Solid1,1);
   8F3E 21 1D 01      [10] 4276 	ld	hl, #0x011d
   8F41 E5            [11] 4277 	push	hl
   8F42 21 07 00      [10] 4278 	ld	hl, #0x0007
   8F45 E5            [11] 4279 	push	hl
   8F46 3E 0E         [ 7] 4280 	ld	a, #0x0e
   8F48 F5            [11] 4281 	push	af
   8F49 33            [ 6] 4282 	inc	sp
   8F4A DD 6E 08      [19] 4283 	ld	l,8 (ix)
   8F4D DD 66 09      [19] 4284 	ld	h,9 (ix)
   8F50 E5            [11] 4285 	push	hl
   8F51 CD FE 75      [17] 4286 	call	_createRocaEspejo
   8F54 21 07 00      [10] 4287 	ld	hl, #7
   8F57 39            [11] 4288 	add	hl, sp
   8F58 F9            [ 6] 4289 	ld	sp, hl
                           4290 ;src/niveles/niveles.c:477: createRocaEspejo(rocasEspejo,11,1,sin_Movimiento, sprite_Muro_Solid1,1);
   8F59 21 1D 01      [10] 4291 	ld	hl, #0x011d
   8F5C E5            [11] 4292 	push	hl
   8F5D 21 01 00      [10] 4293 	ld	hl, #0x0001
   8F60 E5            [11] 4294 	push	hl
   8F61 3E 0B         [ 7] 4295 	ld	a, #0x0b
   8F63 F5            [11] 4296 	push	af
   8F64 33            [ 6] 4297 	inc	sp
   8F65 DD 6E 08      [19] 4298 	ld	l,8 (ix)
   8F68 DD 66 09      [19] 4299 	ld	h,9 (ix)
   8F6B E5            [11] 4300 	push	hl
   8F6C CD FE 75      [17] 4301 	call	_createRocaEspejo
   8F6F 21 07 00      [10] 4302 	ld	hl, #7
   8F72 39            [11] 4303 	add	hl, sp
   8F73 F9            [ 6] 4304 	ld	sp, hl
                           4305 ;src/niveles/niveles.c:478: createRocaEspejo(rocasEspejo,12,1,sin_Movimiento, sprite_Muro_Solid1,1);
   8F74 21 1D 01      [10] 4306 	ld	hl, #0x011d
   8F77 E5            [11] 4307 	push	hl
   8F78 21 01 00      [10] 4308 	ld	hl, #0x0001
   8F7B E5            [11] 4309 	push	hl
   8F7C 3E 0C         [ 7] 4310 	ld	a, #0x0c
   8F7E F5            [11] 4311 	push	af
   8F7F 33            [ 6] 4312 	inc	sp
   8F80 DD 6E 08      [19] 4313 	ld	l,8 (ix)
   8F83 DD 66 09      [19] 4314 	ld	h,9 (ix)
   8F86 E5            [11] 4315 	push	hl
   8F87 CD FE 75      [17] 4316 	call	_createRocaEspejo
   8F8A 21 07 00      [10] 4317 	ld	hl, #7
   8F8D 39            [11] 4318 	add	hl, sp
   8F8E F9            [ 6] 4319 	ld	sp, hl
                           4320 ;src/niveles/niveles.c:479: createRocaEspejo(rocasEspejo,13,1,sin_Movimiento, sprite_Muro_Solid1,1);
   8F8F 21 1D 01      [10] 4321 	ld	hl, #0x011d
   8F92 E5            [11] 4322 	push	hl
   8F93 21 01 00      [10] 4323 	ld	hl, #0x0001
   8F96 E5            [11] 4324 	push	hl
   8F97 3E 0D         [ 7] 4325 	ld	a, #0x0d
   8F99 F5            [11] 4326 	push	af
   8F9A 33            [ 6] 4327 	inc	sp
   8F9B DD 6E 08      [19] 4328 	ld	l,8 (ix)
   8F9E DD 66 09      [19] 4329 	ld	h,9 (ix)
   8FA1 E5            [11] 4330 	push	hl
   8FA2 CD FE 75      [17] 4331 	call	_createRocaEspejo
   8FA5 21 07 00      [10] 4332 	ld	hl, #7
   8FA8 39            [11] 4333 	add	hl, sp
   8FA9 F9            [ 6] 4334 	ld	sp, hl
                           4335 ;src/niveles/niveles.c:480: createRocaEspejo(rocasEspejo,11,2,sin_Movimiento, sprite_Muro_Solid1,1);
   8FAA 21 1D 01      [10] 4336 	ld	hl, #0x011d
   8FAD E5            [11] 4337 	push	hl
   8FAE 21 02 00      [10] 4338 	ld	hl, #0x0002
   8FB1 E5            [11] 4339 	push	hl
   8FB2 3E 0B         [ 7] 4340 	ld	a, #0x0b
   8FB4 F5            [11] 4341 	push	af
   8FB5 33            [ 6] 4342 	inc	sp
   8FB6 DD 6E 08      [19] 4343 	ld	l,8 (ix)
   8FB9 DD 66 09      [19] 4344 	ld	h,9 (ix)
   8FBC E5            [11] 4345 	push	hl
   8FBD CD FE 75      [17] 4346 	call	_createRocaEspejo
   8FC0 21 07 00      [10] 4347 	ld	hl, #7
   8FC3 39            [11] 4348 	add	hl, sp
   8FC4 F9            [ 6] 4349 	ld	sp, hl
                           4350 ;src/niveles/niveles.c:481: createRocaEspejo(rocasEspejo,10,2,sin_Movimiento, sprite_Muro_Solid1,1);
   8FC5 21 1D 01      [10] 4351 	ld	hl, #0x011d
   8FC8 E5            [11] 4352 	push	hl
   8FC9 21 02 00      [10] 4353 	ld	hl, #0x0002
   8FCC E5            [11] 4354 	push	hl
   8FCD 3E 0A         [ 7] 4355 	ld	a, #0x0a
   8FCF F5            [11] 4356 	push	af
   8FD0 33            [ 6] 4357 	inc	sp
   8FD1 DD 6E 08      [19] 4358 	ld	l,8 (ix)
   8FD4 DD 66 09      [19] 4359 	ld	h,9 (ix)
   8FD7 E5            [11] 4360 	push	hl
   8FD8 CD FE 75      [17] 4361 	call	_createRocaEspejo
   8FDB 21 07 00      [10] 4362 	ld	hl, #7
   8FDE 39            [11] 4363 	add	hl, sp
   8FDF F9            [ 6] 4364 	ld	sp, hl
                           4365 ;src/niveles/niveles.c:482: createRocaEspejo(rocasEspejo,9,2,sin_Movimiento, sprite_Muro_Solid1,1);
   8FE0 21 1D 01      [10] 4366 	ld	hl, #0x011d
   8FE3 E5            [11] 4367 	push	hl
   8FE4 21 02 00      [10] 4368 	ld	hl, #0x0002
   8FE7 E5            [11] 4369 	push	hl
   8FE8 3E 09         [ 7] 4370 	ld	a, #0x09
   8FEA F5            [11] 4371 	push	af
   8FEB 33            [ 6] 4372 	inc	sp
   8FEC DD 6E 08      [19] 4373 	ld	l,8 (ix)
   8FEF DD 66 09      [19] 4374 	ld	h,9 (ix)
   8FF2 E5            [11] 4375 	push	hl
   8FF3 CD FE 75      [17] 4376 	call	_createRocaEspejo
   8FF6 21 07 00      [10] 4377 	ld	hl, #7
   8FF9 39            [11] 4378 	add	hl, sp
   8FFA F9            [ 6] 4379 	ld	sp, hl
                           4380 ;src/niveles/niveles.c:483: createRocaEspejo(rocasEspejo,11,7,sin_Movimiento, sprite_Muro_Solid1,1);
   8FFB 21 1D 01      [10] 4381 	ld	hl, #0x011d
   8FFE E5            [11] 4382 	push	hl
   8FFF 21 07 00      [10] 4383 	ld	hl, #0x0007
   9002 E5            [11] 4384 	push	hl
   9003 3E 0B         [ 7] 4385 	ld	a, #0x0b
   9005 F5            [11] 4386 	push	af
   9006 33            [ 6] 4387 	inc	sp
   9007 DD 6E 08      [19] 4388 	ld	l,8 (ix)
   900A DD 66 09      [19] 4389 	ld	h,9 (ix)
   900D E5            [11] 4390 	push	hl
   900E CD FE 75      [17] 4391 	call	_createRocaEspejo
   9011 21 07 00      [10] 4392 	ld	hl, #7
   9014 39            [11] 4393 	add	hl, sp
   9015 F9            [ 6] 4394 	ld	sp, hl
                           4395 ;src/niveles/niveles.c:484: createRocaEspejo(rocasEspejo,12,7,sin_Movimiento, sprite_Muro_Solid1,1);
   9016 21 1D 01      [10] 4396 	ld	hl, #0x011d
   9019 E5            [11] 4397 	push	hl
   901A 21 07 00      [10] 4398 	ld	hl, #0x0007
   901D E5            [11] 4399 	push	hl
   901E 3E 0C         [ 7] 4400 	ld	a, #0x0c
   9020 F5            [11] 4401 	push	af
   9021 33            [ 6] 4402 	inc	sp
   9022 DD 6E 08      [19] 4403 	ld	l,8 (ix)
   9025 DD 66 09      [19] 4404 	ld	h,9 (ix)
   9028 E5            [11] 4405 	push	hl
   9029 CD FE 75      [17] 4406 	call	_createRocaEspejo
   902C 21 07 00      [10] 4407 	ld	hl, #7
   902F 39            [11] 4408 	add	hl, sp
   9030 F9            [ 6] 4409 	ld	sp, hl
                           4410 ;src/niveles/niveles.c:485: createRocaEspejo(rocasEspejo,13,7,sin_Movimiento, sprite_Muro_Solid1,1);
   9031 21 1D 01      [10] 4411 	ld	hl, #0x011d
   9034 E5            [11] 4412 	push	hl
   9035 21 07 00      [10] 4413 	ld	hl, #0x0007
   9038 E5            [11] 4414 	push	hl
   9039 3E 0D         [ 7] 4415 	ld	a, #0x0d
   903B F5            [11] 4416 	push	af
   903C 33            [ 6] 4417 	inc	sp
   903D DD 6E 08      [19] 4418 	ld	l,8 (ix)
   9040 DD 66 09      [19] 4419 	ld	h,9 (ix)
   9043 E5            [11] 4420 	push	hl
   9044 CD FE 75      [17] 4421 	call	_createRocaEspejo
   9047 21 07 00      [10] 4422 	ld	hl, #7
   904A 39            [11] 4423 	add	hl, sp
   904B F9            [ 6] 4424 	ld	sp, hl
                           4425 ;src/niveles/niveles.c:486: createRocaEspejo(rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Solid1,1);
   904C 21 1D 01      [10] 4426 	ld	hl, #0x011d
   904F E5            [11] 4427 	push	hl
   9050 21 06 00      [10] 4428 	ld	hl, #0x0006
   9053 E5            [11] 4429 	push	hl
   9054 3E 0B         [ 7] 4430 	ld	a, #0x0b
   9056 F5            [11] 4431 	push	af
   9057 33            [ 6] 4432 	inc	sp
   9058 DD 6E 08      [19] 4433 	ld	l,8 (ix)
   905B DD 66 09      [19] 4434 	ld	h,9 (ix)
   905E E5            [11] 4435 	push	hl
   905F CD FE 75      [17] 4436 	call	_createRocaEspejo
   9062 21 07 00      [10] 4437 	ld	hl, #7
   9065 39            [11] 4438 	add	hl, sp
   9066 F9            [ 6] 4439 	ld	sp, hl
                           4440 ;src/niveles/niveles.c:487: createRocaEspejo(rocasEspejo,10,6,sin_Movimiento, sprite_Muro_Solid1,1);
   9067 21 1D 01      [10] 4441 	ld	hl, #0x011d
   906A E5            [11] 4442 	push	hl
   906B 21 06 00      [10] 4443 	ld	hl, #0x0006
   906E E5            [11] 4444 	push	hl
   906F 3E 0A         [ 7] 4445 	ld	a, #0x0a
   9071 F5            [11] 4446 	push	af
   9072 33            [ 6] 4447 	inc	sp
   9073 DD 6E 08      [19] 4448 	ld	l,8 (ix)
   9076 DD 66 09      [19] 4449 	ld	h,9 (ix)
   9079 E5            [11] 4450 	push	hl
   907A CD FE 75      [17] 4451 	call	_createRocaEspejo
   907D 21 07 00      [10] 4452 	ld	hl, #7
   9080 39            [11] 4453 	add	hl, sp
   9081 F9            [ 6] 4454 	ld	sp, hl
                           4455 ;src/niveles/niveles.c:488: createRocaEspejo(rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Solid1,1);
   9082 21 1D 01      [10] 4456 	ld	hl, #0x011d
   9085 E5            [11] 4457 	push	hl
   9086 21 06 00      [10] 4458 	ld	hl, #0x0006
   9089 E5            [11] 4459 	push	hl
   908A 3E 09         [ 7] 4460 	ld	a, #0x09
   908C F5            [11] 4461 	push	af
   908D 33            [ 6] 4462 	inc	sp
   908E DD 6E 08      [19] 4463 	ld	l,8 (ix)
   9091 DD 66 09      [19] 4464 	ld	h,9 (ix)
   9094 E5            [11] 4465 	push	hl
   9095 CD FE 75      [17] 4466 	call	_createRocaEspejo
   9098 21 07 00      [10] 4467 	ld	hl, #7
   909B 39            [11] 4468 	add	hl, sp
   909C F9            [ 6] 4469 	ld	sp, hl
                           4470 ;src/niveles/niveles.c:489: createHoleDerecha(rocasEspejo,10,4,sprite_hole,1);
   909D 21 24 01      [10] 4471 	ld	hl, #0x0124
   90A0 E5            [11] 4472 	push	hl
   90A1 21 0A 04      [10] 4473 	ld	hl, #0x040a
   90A4 E5            [11] 4474 	push	hl
   90A5 DD 6E 08      [19] 4475 	ld	l,8 (ix)
   90A8 DD 66 09      [19] 4476 	ld	h,9 (ix)
   90AB E5            [11] 4477 	push	hl
   90AC CD ED 77      [17] 4478 	call	_createHoleDerecha
   90AF 21 06 00      [10] 4479 	ld	hl, #6
   90B2 39            [11] 4480 	add	hl, sp
   90B3 F9            [ 6] 4481 	ld	sp, hl
                           4482 ;src/niveles/niveles.c:490: createRocaEspejo(rocasEspejo,9,3,sin_Movimiento,sprite_RockInmovil1_B,1);
   90B4 21 08 01      [10] 4483 	ld	hl, #0x0108
   90B7 E5            [11] 4484 	push	hl
   90B8 21 03 00      [10] 4485 	ld	hl, #0x0003
   90BB E5            [11] 4486 	push	hl
   90BC 3E 09         [ 7] 4487 	ld	a, #0x09
   90BE F5            [11] 4488 	push	af
   90BF 33            [ 6] 4489 	inc	sp
   90C0 DD 6E 08      [19] 4490 	ld	l,8 (ix)
   90C3 DD 66 09      [19] 4491 	ld	h,9 (ix)
   90C6 E5            [11] 4492 	push	hl
   90C7 CD FE 75      [17] 4493 	call	_createRocaEspejo
   90CA 21 07 00      [10] 4494 	ld	hl, #7
   90CD 39            [11] 4495 	add	hl, sp
   90CE F9            [ 6] 4496 	ld	sp, hl
                           4497 ;src/niveles/niveles.c:491: createRocaEspejo(rocasEspejo,9,5,sin_Movimiento,sprite_RockInmovil1_B,1);
   90CF 21 08 01      [10] 4498 	ld	hl, #0x0108
   90D2 E5            [11] 4499 	push	hl
   90D3 21 05 00      [10] 4500 	ld	hl, #0x0005
   90D6 E5            [11] 4501 	push	hl
   90D7 3E 09         [ 7] 4502 	ld	a, #0x09
   90D9 F5            [11] 4503 	push	af
   90DA 33            [ 6] 4504 	inc	sp
   90DB DD 6E 08      [19] 4505 	ld	l,8 (ix)
   90DE DD 66 09      [19] 4506 	ld	h,9 (ix)
   90E1 E5            [11] 4507 	push	hl
   90E2 CD FE 75      [17] 4508 	call	_createRocaEspejo
   90E5 21 07 00      [10] 4509 	ld	hl, #7
   90E8 39            [11] 4510 	add	hl, sp
   90E9 F9            [ 6] 4511 	ld	sp, hl
   90EA DD E1         [14] 4512 	pop	ix
   90EC C9            [10] 4513 	ret
                           4514 ;src/niveles/niveles.c:495: void crearNievel6(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           4515 ;	---------------------------------
                           4516 ; Function crearNievel6
                           4517 ; ---------------------------------
   90ED                    4518 _crearNievel6::
   90ED DD E5         [15] 4519 	push	ix
   90EF DD 21 00 00   [14] 4520 	ld	ix,#0
   90F3 DD 39         [15] 4521 	add	ix,sp
                           4522 ;src/niveles/niveles.c:497: createPlayer(player,4,2,posicion);
   90F5 DD 6E 10      [19] 4523 	ld	l,16 (ix)
   90F8 DD 66 11      [19] 4524 	ld	h,17 (ix)
   90FB E5            [11] 4525 	push	hl
   90FC 21 04 02      [10] 4526 	ld	hl, #0x0204
   90FF E5            [11] 4527 	push	hl
   9100 DD 6E 04      [19] 4528 	ld	l,4 (ix)
   9103 DD 66 05      [19] 4529 	ld	h,5 (ix)
   9106 E5            [11] 4530 	push	hl
   9107 CD 29 75      [17] 4531 	call	_createPlayer
   910A 21 06 00      [10] 4532 	ld	hl, #6
   910D 39            [11] 4533 	add	hl, sp
   910E F9            [ 6] 4534 	ld	sp, hl
                           4535 ;src/niveles/niveles.c:498: createMarco(no);
   910F 3E 01         [ 7] 4536 	ld	a, #0x01
   9111 F5            [11] 4537 	push	af
   9112 33            [ 6] 4538 	inc	sp
   9113 CD 1A 75      [17] 4539 	call	_createMarco
   9116 33            [ 6] 4540 	inc	sp
                           4541 ;src/niveles/niveles.c:499: createPortal(portales,rocas,rocasEspejo,si);
   9117 AF            [ 4] 4542 	xor	a, a
   9118 F5            [11] 4543 	push	af
   9119 33            [ 6] 4544 	inc	sp
   911A DD 6E 08      [19] 4545 	ld	l,8 (ix)
   911D DD 66 09      [19] 4546 	ld	h,9 (ix)
   9120 E5            [11] 4547 	push	hl
   9121 DD 6E 06      [19] 4548 	ld	l,6 (ix)
   9124 DD 66 07      [19] 4549 	ld	h,7 (ix)
   9127 E5            [11] 4550 	push	hl
   9128 DD 6E 0C      [19] 4551 	ld	l,12 (ix)
   912B DD 66 0D      [19] 4552 	ld	h,13 (ix)
   912E E5            [11] 4553 	push	hl
   912F CD 0D 77      [17] 4554 	call	_createPortal
   9132 21 07 00      [10] 4555 	ld	hl, #7
   9135 39            [11] 4556 	add	hl, sp
   9136 F9            [ 6] 4557 	ld	sp, hl
                           4558 ;src/niveles/niveles.c:500: createPuerta(puertas,3,2,sprite_Puerta_G,nivel_04);
   9137 21 1E 06      [10] 4559 	ld	hl, #0x061e
   913A E5            [11] 4560 	push	hl
   913B 21 03 02      [10] 4561 	ld	hl, #0x0203
   913E E5            [11] 4562 	push	hl
   913F DD 6E 0A      [19] 4563 	ld	l,10 (ix)
   9142 DD 66 0B      [19] 4564 	ld	h,11 (ix)
   9145 E5            [11] 4565 	push	hl
   9146 CD 94 76      [17] 4566 	call	_createPuerta
   9149 21 06 00      [10] 4567 	ld	hl, #6
   914C 39            [11] 4568 	add	hl, sp
   914D F9            [ 6] 4569 	ld	sp, hl
                           4570 ;src/niveles/niveles.c:504: createRoca(rocas,5,4,mover_Linea,sprite_RockLineal1_G,2);
   914E 21 05 02      [10] 4571 	ld	hl, #0x0205
   9151 E5            [11] 4572 	push	hl
   9152 2E 04         [ 7] 4573 	ld	l, #0x04
   9154 E5            [11] 4574 	push	hl
   9155 3E 05         [ 7] 4575 	ld	a, #0x05
   9157 F5            [11] 4576 	push	af
   9158 33            [ 6] 4577 	inc	sp
   9159 DD 6E 06      [19] 4578 	ld	l,6 (ix)
   915C DD 66 07      [19] 4579 	ld	h,7 (ix)
   915F E5            [11] 4580 	push	hl
   9160 CD 68 75      [17] 4581 	call	_createRoca
   9163 21 07 00      [10] 4582 	ld	hl, #7
   9166 39            [11] 4583 	add	hl, sp
   9167 F9            [ 6] 4584 	ld	sp, hl
                           4585 ;src/niveles/niveles.c:505: createRoca(rocas,6,4,mover_Linea,sprite_RockLineal1_G,3);
   9168 21 05 03      [10] 4586 	ld	hl, #0x0305
   916B E5            [11] 4587 	push	hl
   916C 21 04 02      [10] 4588 	ld	hl, #0x0204
   916F E5            [11] 4589 	push	hl
   9170 3E 06         [ 7] 4590 	ld	a, #0x06
   9172 F5            [11] 4591 	push	af
   9173 33            [ 6] 4592 	inc	sp
   9174 DD 6E 06      [19] 4593 	ld	l,6 (ix)
   9177 DD 66 07      [19] 4594 	ld	h,7 (ix)
   917A E5            [11] 4595 	push	hl
   917B CD 68 75      [17] 4596 	call	_createRoca
   917E 21 07 00      [10] 4597 	ld	hl, #7
   9181 39            [11] 4598 	add	hl, sp
   9182 F9            [ 6] 4599 	ld	sp, hl
                           4600 ;src/niveles/niveles.c:506: createRocaEspejo(rocasEspejo,10,4,sin_Movimiento,sprite_Rock_nomove_B,3);
   9183 21 04 03      [10] 4601 	ld	hl, #0x0304
   9186 E5            [11] 4602 	push	hl
   9187 26 00         [ 7] 4603 	ld	h, #0x00
   9189 E5            [11] 4604 	push	hl
   918A 3E 0A         [ 7] 4605 	ld	a, #0x0a
   918C F5            [11] 4606 	push	af
   918D 33            [ 6] 4607 	inc	sp
   918E DD 6E 08      [19] 4608 	ld	l,8 (ix)
   9191 DD 66 09      [19] 4609 	ld	h,9 (ix)
   9194 E5            [11] 4610 	push	hl
   9195 CD FE 75      [17] 4611 	call	_createRocaEspejo
   9198 21 07 00      [10] 4612 	ld	hl, #7
   919B 39            [11] 4613 	add	hl, sp
   919C F9            [ 6] 4614 	ld	sp, hl
                           4615 ;src/niveles/niveles.c:507: createRocaEspejo(rocasEspejo,11,4,sin_Movimiento,sprite_Rock_nomove_B,2);
   919D 21 04 02      [10] 4616 	ld	hl, #0x0204
   91A0 E5            [11] 4617 	push	hl
   91A1 26 00         [ 7] 4618 	ld	h, #0x00
   91A3 E5            [11] 4619 	push	hl
   91A4 3E 0B         [ 7] 4620 	ld	a, #0x0b
   91A6 F5            [11] 4621 	push	af
   91A7 33            [ 6] 4622 	inc	sp
   91A8 DD 6E 08      [19] 4623 	ld	l,8 (ix)
   91AB DD 66 09      [19] 4624 	ld	h,9 (ix)
   91AE E5            [11] 4625 	push	hl
   91AF CD FE 75      [17] 4626 	call	_createRocaEspejo
   91B2 21 07 00      [10] 4627 	ld	hl, #7
   91B5 39            [11] 4628 	add	hl, sp
   91B6 F9            [ 6] 4629 	ld	sp, hl
                           4630 ;src/niveles/niveles.c:513: createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Solid1,1);
   91B7 21 1D 01      [10] 4631 	ld	hl, #0x011d
   91BA E5            [11] 4632 	push	hl
   91BB 21 01 00      [10] 4633 	ld	hl, #0x0001
   91BE E5            [11] 4634 	push	hl
   91BF 3E 02         [ 7] 4635 	ld	a, #0x02
   91C1 F5            [11] 4636 	push	af
   91C2 33            [ 6] 4637 	inc	sp
   91C3 DD 6E 06      [19] 4638 	ld	l,6 (ix)
   91C6 DD 66 07      [19] 4639 	ld	h,7 (ix)
   91C9 E5            [11] 4640 	push	hl
   91CA CD 68 75      [17] 4641 	call	_createRoca
   91CD 21 07 00      [10] 4642 	ld	hl, #7
   91D0 39            [11] 4643 	add	hl, sp
   91D1 F9            [ 6] 4644 	ld	sp, hl
                           4645 ;src/niveles/niveles.c:514: createRoca(rocas,2,2,sin_Movimiento, sprite_Muro_Solid1,1);
   91D2 21 1D 01      [10] 4646 	ld	hl, #0x011d
   91D5 E5            [11] 4647 	push	hl
   91D6 21 02 00      [10] 4648 	ld	hl, #0x0002
   91D9 E5            [11] 4649 	push	hl
   91DA 3E 02         [ 7] 4650 	ld	a, #0x02
   91DC F5            [11] 4651 	push	af
   91DD 33            [ 6] 4652 	inc	sp
   91DE DD 6E 06      [19] 4653 	ld	l,6 (ix)
   91E1 DD 66 07      [19] 4654 	ld	h,7 (ix)
   91E4 E5            [11] 4655 	push	hl
   91E5 CD 68 75      [17] 4656 	call	_createRoca
   91E8 21 07 00      [10] 4657 	ld	hl, #7
   91EB 39            [11] 4658 	add	hl, sp
   91EC F9            [ 6] 4659 	ld	sp, hl
                           4660 ;src/niveles/niveles.c:515: createRoca(rocas,2,3,sin_Movimiento, sprite_Muro_Solid1,1);
   91ED 21 1D 01      [10] 4661 	ld	hl, #0x011d
   91F0 E5            [11] 4662 	push	hl
   91F1 21 03 00      [10] 4663 	ld	hl, #0x0003
   91F4 E5            [11] 4664 	push	hl
   91F5 3E 02         [ 7] 4665 	ld	a, #0x02
   91F7 F5            [11] 4666 	push	af
   91F8 33            [ 6] 4667 	inc	sp
   91F9 DD 6E 06      [19] 4668 	ld	l,6 (ix)
   91FC DD 66 07      [19] 4669 	ld	h,7 (ix)
   91FF E5            [11] 4670 	push	hl
   9200 CD 68 75      [17] 4671 	call	_createRoca
   9203 21 07 00      [10] 4672 	ld	hl, #7
   9206 39            [11] 4673 	add	hl, sp
   9207 F9            [ 6] 4674 	ld	sp, hl
                           4675 ;src/niveles/niveles.c:516: createRoca(rocas,2,4,sin_Movimiento, sprite_Muro_Solid1,1);
   9208 21 1D 01      [10] 4676 	ld	hl, #0x011d
   920B E5            [11] 4677 	push	hl
   920C 21 04 00      [10] 4678 	ld	hl, #0x0004
   920F E5            [11] 4679 	push	hl
   9210 3E 02         [ 7] 4680 	ld	a, #0x02
   9212 F5            [11] 4681 	push	af
   9213 33            [ 6] 4682 	inc	sp
   9214 DD 6E 06      [19] 4683 	ld	l,6 (ix)
   9217 DD 66 07      [19] 4684 	ld	h,7 (ix)
   921A E5            [11] 4685 	push	hl
   921B CD 68 75      [17] 4686 	call	_createRoca
   921E 21 07 00      [10] 4687 	ld	hl, #7
   9221 39            [11] 4688 	add	hl, sp
   9222 F9            [ 6] 4689 	ld	sp, hl
                           4690 ;src/niveles/niveles.c:517: createRoca(rocas,2,5,sin_Movimiento, sprite_Muro_Solid1,1);
   9223 21 1D 01      [10] 4691 	ld	hl, #0x011d
   9226 E5            [11] 4692 	push	hl
   9227 21 05 00      [10] 4693 	ld	hl, #0x0005
   922A E5            [11] 4694 	push	hl
   922B 3E 02         [ 7] 4695 	ld	a, #0x02
   922D F5            [11] 4696 	push	af
   922E 33            [ 6] 4697 	inc	sp
   922F DD 6E 06      [19] 4698 	ld	l,6 (ix)
   9232 DD 66 07      [19] 4699 	ld	h,7 (ix)
   9235 E5            [11] 4700 	push	hl
   9236 CD 68 75      [17] 4701 	call	_createRoca
   9239 21 07 00      [10] 4702 	ld	hl, #7
   923C 39            [11] 4703 	add	hl, sp
   923D F9            [ 6] 4704 	ld	sp, hl
                           4705 ;src/niveles/niveles.c:518: createRoca(rocas,2,6,sin_Movimiento, sprite_Muro_Solid1,1);
   923E 21 1D 01      [10] 4706 	ld	hl, #0x011d
   9241 E5            [11] 4707 	push	hl
   9242 21 06 00      [10] 4708 	ld	hl, #0x0006
   9245 E5            [11] 4709 	push	hl
   9246 3E 02         [ 7] 4710 	ld	a, #0x02
   9248 F5            [11] 4711 	push	af
   9249 33            [ 6] 4712 	inc	sp
   924A DD 6E 06      [19] 4713 	ld	l,6 (ix)
   924D DD 66 07      [19] 4714 	ld	h,7 (ix)
   9250 E5            [11] 4715 	push	hl
   9251 CD 68 75      [17] 4716 	call	_createRoca
   9254 21 07 00      [10] 4717 	ld	hl, #7
   9257 39            [11] 4718 	add	hl, sp
   9258 F9            [ 6] 4719 	ld	sp, hl
                           4720 ;src/niveles/niveles.c:519: createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Solid1,1);
   9259 21 1D 01      [10] 4721 	ld	hl, #0x011d
   925C E5            [11] 4722 	push	hl
   925D 21 07 00      [10] 4723 	ld	hl, #0x0007
   9260 E5            [11] 4724 	push	hl
   9261 3E 02         [ 7] 4725 	ld	a, #0x02
   9263 F5            [11] 4726 	push	af
   9264 33            [ 6] 4727 	inc	sp
   9265 DD 6E 06      [19] 4728 	ld	l,6 (ix)
   9268 DD 66 07      [19] 4729 	ld	h,7 (ix)
   926B E5            [11] 4730 	push	hl
   926C CD 68 75      [17] 4731 	call	_createRoca
   926F 21 07 00      [10] 4732 	ld	hl, #7
   9272 39            [11] 4733 	add	hl, sp
   9273 F9            [ 6] 4734 	ld	sp, hl
                           4735 ;src/niveles/niveles.c:520: createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Solid1,1);
   9274 21 1D 01      [10] 4736 	ld	hl, #0x011d
   9277 E5            [11] 4737 	push	hl
   9278 21 01 00      [10] 4738 	ld	hl, #0x0001
   927B E5            [11] 4739 	push	hl
   927C 3E 03         [ 7] 4740 	ld	a, #0x03
   927E F5            [11] 4741 	push	af
   927F 33            [ 6] 4742 	inc	sp
   9280 DD 6E 06      [19] 4743 	ld	l,6 (ix)
   9283 DD 66 07      [19] 4744 	ld	h,7 (ix)
   9286 E5            [11] 4745 	push	hl
   9287 CD 68 75      [17] 4746 	call	_createRoca
   928A 21 07 00      [10] 4747 	ld	hl, #7
   928D 39            [11] 4748 	add	hl, sp
   928E F9            [ 6] 4749 	ld	sp, hl
                           4750 ;src/niveles/niveles.c:521: createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Solid1,1);
   928F 21 1D 01      [10] 4751 	ld	hl, #0x011d
   9292 E5            [11] 4752 	push	hl
   9293 21 01 00      [10] 4753 	ld	hl, #0x0001
   9296 E5            [11] 4754 	push	hl
   9297 3E 04         [ 7] 4755 	ld	a, #0x04
   9299 F5            [11] 4756 	push	af
   929A 33            [ 6] 4757 	inc	sp
   929B DD 6E 06      [19] 4758 	ld	l,6 (ix)
   929E DD 66 07      [19] 4759 	ld	h,7 (ix)
   92A1 E5            [11] 4760 	push	hl
   92A2 CD 68 75      [17] 4761 	call	_createRoca
   92A5 21 07 00      [10] 4762 	ld	hl, #7
   92A8 39            [11] 4763 	add	hl, sp
   92A9 F9            [ 6] 4764 	ld	sp, hl
                           4765 ;src/niveles/niveles.c:522: createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Solid1,1);
   92AA 21 1D 01      [10] 4766 	ld	hl, #0x011d
   92AD E5            [11] 4767 	push	hl
   92AE 21 01 00      [10] 4768 	ld	hl, #0x0001
   92B1 E5            [11] 4769 	push	hl
   92B2 3E 05         [ 7] 4770 	ld	a, #0x05
   92B4 F5            [11] 4771 	push	af
   92B5 33            [ 6] 4772 	inc	sp
   92B6 DD 6E 06      [19] 4773 	ld	l,6 (ix)
   92B9 DD 66 07      [19] 4774 	ld	h,7 (ix)
   92BC E5            [11] 4775 	push	hl
   92BD CD 68 75      [17] 4776 	call	_createRoca
   92C0 21 07 00      [10] 4777 	ld	hl, #7
   92C3 39            [11] 4778 	add	hl, sp
   92C4 F9            [ 6] 4779 	ld	sp, hl
                           4780 ;src/niveles/niveles.c:523: createRoca(rocas,5,2,sin_Movimiento, sprite_Muro_Solid1,1);
   92C5 21 1D 01      [10] 4781 	ld	hl, #0x011d
   92C8 E5            [11] 4782 	push	hl
   92C9 21 02 00      [10] 4783 	ld	hl, #0x0002
   92CC E5            [11] 4784 	push	hl
   92CD 3E 05         [ 7] 4785 	ld	a, #0x05
   92CF F5            [11] 4786 	push	af
   92D0 33            [ 6] 4787 	inc	sp
   92D1 DD 6E 06      [19] 4788 	ld	l,6 (ix)
   92D4 DD 66 07      [19] 4789 	ld	h,7 (ix)
   92D7 E5            [11] 4790 	push	hl
   92D8 CD 68 75      [17] 4791 	call	_createRoca
   92DB 21 07 00      [10] 4792 	ld	hl, #7
   92DE 39            [11] 4793 	add	hl, sp
   92DF F9            [ 6] 4794 	ld	sp, hl
                           4795 ;src/niveles/niveles.c:524: createRoca(rocas,6,2,sin_Movimiento, sprite_Muro_Solid1,1);
   92E0 21 1D 01      [10] 4796 	ld	hl, #0x011d
   92E3 E5            [11] 4797 	push	hl
   92E4 21 02 00      [10] 4798 	ld	hl, #0x0002
   92E7 E5            [11] 4799 	push	hl
   92E8 3E 06         [ 7] 4800 	ld	a, #0x06
   92EA F5            [11] 4801 	push	af
   92EB 33            [ 6] 4802 	inc	sp
   92EC DD 6E 06      [19] 4803 	ld	l,6 (ix)
   92EF DD 66 07      [19] 4804 	ld	h,7 (ix)
   92F2 E5            [11] 4805 	push	hl
   92F3 CD 68 75      [17] 4806 	call	_createRoca
   92F6 21 07 00      [10] 4807 	ld	hl, #7
   92F9 39            [11] 4808 	add	hl, sp
   92FA F9            [ 6] 4809 	ld	sp, hl
                           4810 ;src/niveles/niveles.c:525: createRoca(rocas,7,2,sin_Movimiento, sprite_Muro_Solid1,1);
   92FB 21 1D 01      [10] 4811 	ld	hl, #0x011d
   92FE E5            [11] 4812 	push	hl
   92FF 21 02 00      [10] 4813 	ld	hl, #0x0002
   9302 E5            [11] 4814 	push	hl
   9303 3E 07         [ 7] 4815 	ld	a, #0x07
   9305 F5            [11] 4816 	push	af
   9306 33            [ 6] 4817 	inc	sp
   9307 DD 6E 06      [19] 4818 	ld	l,6 (ix)
   930A DD 66 07      [19] 4819 	ld	h,7 (ix)
   930D E5            [11] 4820 	push	hl
   930E CD 68 75      [17] 4821 	call	_createRoca
   9311 21 07 00      [10] 4822 	ld	hl, #7
   9314 39            [11] 4823 	add	hl, sp
   9315 F9            [ 6] 4824 	ld	sp, hl
                           4825 ;src/niveles/niveles.c:526: createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Solid1,1);
   9316 21 1D 01      [10] 4826 	ld	hl, #0x011d
   9319 E5            [11] 4827 	push	hl
   931A 21 07 00      [10] 4828 	ld	hl, #0x0007
   931D E5            [11] 4829 	push	hl
   931E 3E 03         [ 7] 4830 	ld	a, #0x03
   9320 F5            [11] 4831 	push	af
   9321 33            [ 6] 4832 	inc	sp
   9322 DD 6E 06      [19] 4833 	ld	l,6 (ix)
   9325 DD 66 07      [19] 4834 	ld	h,7 (ix)
   9328 E5            [11] 4835 	push	hl
   9329 CD 68 75      [17] 4836 	call	_createRoca
   932C 21 07 00      [10] 4837 	ld	hl, #7
   932F 39            [11] 4838 	add	hl, sp
   9330 F9            [ 6] 4839 	ld	sp, hl
                           4840 ;src/niveles/niveles.c:527: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Solid1,1);
   9331 21 1D 01      [10] 4841 	ld	hl, #0x011d
   9334 E5            [11] 4842 	push	hl
   9335 21 07 00      [10] 4843 	ld	hl, #0x0007
   9338 E5            [11] 4844 	push	hl
   9339 3E 04         [ 7] 4845 	ld	a, #0x04
   933B F5            [11] 4846 	push	af
   933C 33            [ 6] 4847 	inc	sp
   933D DD 6E 06      [19] 4848 	ld	l,6 (ix)
   9340 DD 66 07      [19] 4849 	ld	h,7 (ix)
   9343 E5            [11] 4850 	push	hl
   9344 CD 68 75      [17] 4851 	call	_createRoca
   9347 21 07 00      [10] 4852 	ld	hl, #7
   934A 39            [11] 4853 	add	hl, sp
   934B F9            [ 6] 4854 	ld	sp, hl
                           4855 ;src/niveles/niveles.c:528: createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Solid1,1);
   934C 21 1D 01      [10] 4856 	ld	hl, #0x011d
   934F E5            [11] 4857 	push	hl
   9350 21 07 00      [10] 4858 	ld	hl, #0x0007
   9353 E5            [11] 4859 	push	hl
   9354 3E 05         [ 7] 4860 	ld	a, #0x05
   9356 F5            [11] 4861 	push	af
   9357 33            [ 6] 4862 	inc	sp
   9358 DD 6E 06      [19] 4863 	ld	l,6 (ix)
   935B DD 66 07      [19] 4864 	ld	h,7 (ix)
   935E E5            [11] 4865 	push	hl
   935F CD 68 75      [17] 4866 	call	_createRoca
   9362 21 07 00      [10] 4867 	ld	hl, #7
   9365 39            [11] 4868 	add	hl, sp
   9366 F9            [ 6] 4869 	ld	sp, hl
                           4870 ;src/niveles/niveles.c:529: createRoca(rocas,5,6,sin_Movimiento, sprite_Muro_Solid1,1);
   9367 21 1D 01      [10] 4871 	ld	hl, #0x011d
   936A E5            [11] 4872 	push	hl
   936B 21 06 00      [10] 4873 	ld	hl, #0x0006
   936E E5            [11] 4874 	push	hl
   936F 3E 05         [ 7] 4875 	ld	a, #0x05
   9371 F5            [11] 4876 	push	af
   9372 33            [ 6] 4877 	inc	sp
   9373 DD 6E 06      [19] 4878 	ld	l,6 (ix)
   9376 DD 66 07      [19] 4879 	ld	h,7 (ix)
   9379 E5            [11] 4880 	push	hl
   937A CD 68 75      [17] 4881 	call	_createRoca
   937D 21 07 00      [10] 4882 	ld	hl, #7
   9380 39            [11] 4883 	add	hl, sp
   9381 F9            [ 6] 4884 	ld	sp, hl
                           4885 ;src/niveles/niveles.c:530: createRoca(rocas,6,6,sin_Movimiento, sprite_Muro_Solid1,1);
   9382 21 1D 01      [10] 4886 	ld	hl, #0x011d
   9385 E5            [11] 4887 	push	hl
   9386 21 06 00      [10] 4888 	ld	hl, #0x0006
   9389 E5            [11] 4889 	push	hl
   938A 3E 06         [ 7] 4890 	ld	a, #0x06
   938C F5            [11] 4891 	push	af
   938D 33            [ 6] 4892 	inc	sp
   938E DD 6E 06      [19] 4893 	ld	l,6 (ix)
   9391 DD 66 07      [19] 4894 	ld	h,7 (ix)
   9394 E5            [11] 4895 	push	hl
   9395 CD 68 75      [17] 4896 	call	_createRoca
   9398 21 07 00      [10] 4897 	ld	hl, #7
   939B 39            [11] 4898 	add	hl, sp
   939C F9            [ 6] 4899 	ld	sp, hl
                           4900 ;src/niveles/niveles.c:531: createRoca(rocas,7,6,sin_Movimiento, sprite_Muro_Solid1,1);
   939D 21 1D 01      [10] 4901 	ld	hl, #0x011d
   93A0 E5            [11] 4902 	push	hl
   93A1 21 06 00      [10] 4903 	ld	hl, #0x0006
   93A4 E5            [11] 4904 	push	hl
   93A5 3E 07         [ 7] 4905 	ld	a, #0x07
   93A7 F5            [11] 4906 	push	af
   93A8 33            [ 6] 4907 	inc	sp
   93A9 DD 6E 06      [19] 4908 	ld	l,6 (ix)
   93AC DD 66 07      [19] 4909 	ld	h,7 (ix)
   93AF E5            [11] 4910 	push	hl
   93B0 CD 68 75      [17] 4911 	call	_createRoca
   93B3 21 07 00      [10] 4912 	ld	hl, #7
   93B6 39            [11] 4913 	add	hl, sp
   93B7 F9            [ 6] 4914 	ld	sp, hl
                           4915 ;src/niveles/niveles.c:532: createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Solid1,1);
   93B8 21 1D 01      [10] 4916 	ld	hl, #0x011d
   93BB E5            [11] 4917 	push	hl
   93BC 21 02 00      [10] 4918 	ld	hl, #0x0002
   93BF E5            [11] 4919 	push	hl
   93C0 3E 08         [ 7] 4920 	ld	a, #0x08
   93C2 F5            [11] 4921 	push	af
   93C3 33            [ 6] 4922 	inc	sp
   93C4 DD 6E 06      [19] 4923 	ld	l,6 (ix)
   93C7 DD 66 07      [19] 4924 	ld	h,7 (ix)
   93CA E5            [11] 4925 	push	hl
   93CB CD 68 75      [17] 4926 	call	_createRoca
   93CE 21 07 00      [10] 4927 	ld	hl, #7
   93D1 39            [11] 4928 	add	hl, sp
   93D2 F9            [ 6] 4929 	ld	sp, hl
                           4930 ;src/niveles/niveles.c:533: createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Solid1,1);
   93D3 21 1D 01      [10] 4931 	ld	hl, #0x011d
   93D6 E5            [11] 4932 	push	hl
   93D7 21 03 00      [10] 4933 	ld	hl, #0x0003
   93DA E5            [11] 4934 	push	hl
   93DB 3E 08         [ 7] 4935 	ld	a, #0x08
   93DD F5            [11] 4936 	push	af
   93DE 33            [ 6] 4937 	inc	sp
   93DF DD 6E 06      [19] 4938 	ld	l,6 (ix)
   93E2 DD 66 07      [19] 4939 	ld	h,7 (ix)
   93E5 E5            [11] 4940 	push	hl
   93E6 CD 68 75      [17] 4941 	call	_createRoca
   93E9 21 07 00      [10] 4942 	ld	hl, #7
   93EC 39            [11] 4943 	add	hl, sp
   93ED F9            [ 6] 4944 	ld	sp, hl
                           4945 ;src/niveles/niveles.c:534: createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Solid1,1);
   93EE 21 1D 01      [10] 4946 	ld	hl, #0x011d
   93F1 E5            [11] 4947 	push	hl
   93F2 21 05 00      [10] 4948 	ld	hl, #0x0005
   93F5 E5            [11] 4949 	push	hl
   93F6 3E 08         [ 7] 4950 	ld	a, #0x08
   93F8 F5            [11] 4951 	push	af
   93F9 33            [ 6] 4952 	inc	sp
   93FA DD 6E 06      [19] 4953 	ld	l,6 (ix)
   93FD DD 66 07      [19] 4954 	ld	h,7 (ix)
   9400 E5            [11] 4955 	push	hl
   9401 CD 68 75      [17] 4956 	call	_createRoca
   9404 21 07 00      [10] 4957 	ld	hl, #7
   9407 39            [11] 4958 	add	hl, sp
   9408 F9            [ 6] 4959 	ld	sp, hl
                           4960 ;src/niveles/niveles.c:535: createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Solid1,1);
   9409 21 1D 01      [10] 4961 	ld	hl, #0x011d
   940C E5            [11] 4962 	push	hl
   940D 21 06 00      [10] 4963 	ld	hl, #0x0006
   9410 E5            [11] 4964 	push	hl
   9411 3E 08         [ 7] 4965 	ld	a, #0x08
   9413 F5            [11] 4966 	push	af
   9414 33            [ 6] 4967 	inc	sp
   9415 DD 6E 06      [19] 4968 	ld	l,6 (ix)
   9418 DD 66 07      [19] 4969 	ld	h,7 (ix)
   941B E5            [11] 4970 	push	hl
   941C CD 68 75      [17] 4971 	call	_createRoca
   941F 21 07 00      [10] 4972 	ld	hl, #7
   9422 39            [11] 4973 	add	hl, sp
   9423 F9            [ 6] 4974 	ld	sp, hl
                           4975 ;src/niveles/niveles.c:536: createRoca(rocas,3,3,sin_Movimiento,sprite_RockInmovil5_G,1);
   9424 21 0F 01      [10] 4976 	ld	hl, #0x010f
   9427 E5            [11] 4977 	push	hl
   9428 21 03 00      [10] 4978 	ld	hl, #0x0003
   942B E5            [11] 4979 	push	hl
   942C 3E 03         [ 7] 4980 	ld	a, #0x03
   942E F5            [11] 4981 	push	af
   942F 33            [ 6] 4982 	inc	sp
   9430 DD 6E 06      [19] 4983 	ld	l,6 (ix)
   9433 DD 66 07      [19] 4984 	ld	h,7 (ix)
   9436 E5            [11] 4985 	push	hl
   9437 CD 68 75      [17] 4986 	call	_createRoca
   943A 21 07 00      [10] 4987 	ld	hl, #7
   943D 39            [11] 4988 	add	hl, sp
   943E F9            [ 6] 4989 	ld	sp, hl
                           4990 ;src/niveles/niveles.c:541: createRocaEspejo(rocasEspejo,14,1,sin_Movimiento, sprite_Muro_Solid1,1);
   943F 21 1D 01      [10] 4991 	ld	hl, #0x011d
   9442 E5            [11] 4992 	push	hl
   9443 21 01 00      [10] 4993 	ld	hl, #0x0001
   9446 E5            [11] 4994 	push	hl
   9447 3E 0E         [ 7] 4995 	ld	a, #0x0e
   9449 F5            [11] 4996 	push	af
   944A 33            [ 6] 4997 	inc	sp
   944B DD 6E 08      [19] 4998 	ld	l,8 (ix)
   944E DD 66 09      [19] 4999 	ld	h,9 (ix)
   9451 E5            [11] 5000 	push	hl
   9452 CD FE 75      [17] 5001 	call	_createRocaEspejo
   9455 21 07 00      [10] 5002 	ld	hl, #7
   9458 39            [11] 5003 	add	hl, sp
   9459 F9            [ 6] 5004 	ld	sp, hl
                           5005 ;src/niveles/niveles.c:542: createRocaEspejo(rocasEspejo,14,2,sin_Movimiento, sprite_Muro_Solid1,1);
   945A 21 1D 01      [10] 5006 	ld	hl, #0x011d
   945D E5            [11] 5007 	push	hl
   945E 21 02 00      [10] 5008 	ld	hl, #0x0002
   9461 E5            [11] 5009 	push	hl
   9462 3E 0E         [ 7] 5010 	ld	a, #0x0e
   9464 F5            [11] 5011 	push	af
   9465 33            [ 6] 5012 	inc	sp
   9466 DD 6E 08      [19] 5013 	ld	l,8 (ix)
   9469 DD 66 09      [19] 5014 	ld	h,9 (ix)
   946C E5            [11] 5015 	push	hl
   946D CD FE 75      [17] 5016 	call	_createRocaEspejo
   9470 21 07 00      [10] 5017 	ld	hl, #7
   9473 39            [11] 5018 	add	hl, sp
   9474 F9            [ 6] 5019 	ld	sp, hl
                           5020 ;src/niveles/niveles.c:543: createRocaEspejo(rocasEspejo,14,3,sin_Movimiento, sprite_Muro_Solid1,1);
   9475 21 1D 01      [10] 5021 	ld	hl, #0x011d
   9478 E5            [11] 5022 	push	hl
   9479 21 03 00      [10] 5023 	ld	hl, #0x0003
   947C E5            [11] 5024 	push	hl
   947D 3E 0E         [ 7] 5025 	ld	a, #0x0e
   947F F5            [11] 5026 	push	af
   9480 33            [ 6] 5027 	inc	sp
   9481 DD 6E 08      [19] 5028 	ld	l,8 (ix)
   9484 DD 66 09      [19] 5029 	ld	h,9 (ix)
   9487 E5            [11] 5030 	push	hl
   9488 CD FE 75      [17] 5031 	call	_createRocaEspejo
   948B 21 07 00      [10] 5032 	ld	hl, #7
   948E 39            [11] 5033 	add	hl, sp
   948F F9            [ 6] 5034 	ld	sp, hl
                           5035 ;src/niveles/niveles.c:544: createRocaEspejo(rocasEspejo,14,4,sin_Movimiento, sprite_Muro_Solid1,1);
   9490 21 1D 01      [10] 5036 	ld	hl, #0x011d
   9493 E5            [11] 5037 	push	hl
   9494 21 04 00      [10] 5038 	ld	hl, #0x0004
   9497 E5            [11] 5039 	push	hl
   9498 3E 0E         [ 7] 5040 	ld	a, #0x0e
   949A F5            [11] 5041 	push	af
   949B 33            [ 6] 5042 	inc	sp
   949C DD 6E 08      [19] 5043 	ld	l,8 (ix)
   949F DD 66 09      [19] 5044 	ld	h,9 (ix)
   94A2 E5            [11] 5045 	push	hl
   94A3 CD FE 75      [17] 5046 	call	_createRocaEspejo
   94A6 21 07 00      [10] 5047 	ld	hl, #7
   94A9 39            [11] 5048 	add	hl, sp
   94AA F9            [ 6] 5049 	ld	sp, hl
                           5050 ;src/niveles/niveles.c:545: createRocaEspejo(rocasEspejo,14,5,sin_Movimiento, sprite_Muro_Solid1,1);
   94AB 21 1D 01      [10] 5051 	ld	hl, #0x011d
   94AE E5            [11] 5052 	push	hl
   94AF 21 05 00      [10] 5053 	ld	hl, #0x0005
   94B2 E5            [11] 5054 	push	hl
   94B3 3E 0E         [ 7] 5055 	ld	a, #0x0e
   94B5 F5            [11] 5056 	push	af
   94B6 33            [ 6] 5057 	inc	sp
   94B7 DD 6E 08      [19] 5058 	ld	l,8 (ix)
   94BA DD 66 09      [19] 5059 	ld	h,9 (ix)
   94BD E5            [11] 5060 	push	hl
   94BE CD FE 75      [17] 5061 	call	_createRocaEspejo
   94C1 21 07 00      [10] 5062 	ld	hl, #7
   94C4 39            [11] 5063 	add	hl, sp
   94C5 F9            [ 6] 5064 	ld	sp, hl
                           5065 ;src/niveles/niveles.c:546: createRocaEspejo(rocasEspejo,14,6,sin_Movimiento, sprite_Muro_Solid1,1);
   94C6 21 1D 01      [10] 5066 	ld	hl, #0x011d
   94C9 E5            [11] 5067 	push	hl
   94CA 21 06 00      [10] 5068 	ld	hl, #0x0006
   94CD E5            [11] 5069 	push	hl
   94CE 3E 0E         [ 7] 5070 	ld	a, #0x0e
   94D0 F5            [11] 5071 	push	af
   94D1 33            [ 6] 5072 	inc	sp
   94D2 DD 6E 08      [19] 5073 	ld	l,8 (ix)
   94D5 DD 66 09      [19] 5074 	ld	h,9 (ix)
   94D8 E5            [11] 5075 	push	hl
   94D9 CD FE 75      [17] 5076 	call	_createRocaEspejo
   94DC 21 07 00      [10] 5077 	ld	hl, #7
   94DF 39            [11] 5078 	add	hl, sp
   94E0 F9            [ 6] 5079 	ld	sp, hl
                           5080 ;src/niveles/niveles.c:547: createRocaEspejo(rocasEspejo,14,7,sin_Movimiento, sprite_Muro_Solid1,1);
   94E1 21 1D 01      [10] 5081 	ld	hl, #0x011d
   94E4 E5            [11] 5082 	push	hl
   94E5 21 07 00      [10] 5083 	ld	hl, #0x0007
   94E8 E5            [11] 5084 	push	hl
   94E9 3E 0E         [ 7] 5085 	ld	a, #0x0e
   94EB F5            [11] 5086 	push	af
   94EC 33            [ 6] 5087 	inc	sp
   94ED DD 6E 08      [19] 5088 	ld	l,8 (ix)
   94F0 DD 66 09      [19] 5089 	ld	h,9 (ix)
   94F3 E5            [11] 5090 	push	hl
   94F4 CD FE 75      [17] 5091 	call	_createRocaEspejo
   94F7 21 07 00      [10] 5092 	ld	hl, #7
   94FA 39            [11] 5093 	add	hl, sp
   94FB F9            [ 6] 5094 	ld	sp, hl
                           5095 ;src/niveles/niveles.c:548: createRocaEspejo(rocasEspejo,11,1,sin_Movimiento, sprite_Muro_Solid1,1);
   94FC 21 1D 01      [10] 5096 	ld	hl, #0x011d
   94FF E5            [11] 5097 	push	hl
   9500 21 01 00      [10] 5098 	ld	hl, #0x0001
   9503 E5            [11] 5099 	push	hl
   9504 3E 0B         [ 7] 5100 	ld	a, #0x0b
   9506 F5            [11] 5101 	push	af
   9507 33            [ 6] 5102 	inc	sp
   9508 DD 6E 08      [19] 5103 	ld	l,8 (ix)
   950B DD 66 09      [19] 5104 	ld	h,9 (ix)
   950E E5            [11] 5105 	push	hl
   950F CD FE 75      [17] 5106 	call	_createRocaEspejo
   9512 21 07 00      [10] 5107 	ld	hl, #7
   9515 39            [11] 5108 	add	hl, sp
   9516 F9            [ 6] 5109 	ld	sp, hl
                           5110 ;src/niveles/niveles.c:549: createRocaEspejo(rocasEspejo,12,1,sin_Movimiento, sprite_Muro_Solid1,1);
   9517 21 1D 01      [10] 5111 	ld	hl, #0x011d
   951A E5            [11] 5112 	push	hl
   951B 21 01 00      [10] 5113 	ld	hl, #0x0001
   951E E5            [11] 5114 	push	hl
   951F 3E 0C         [ 7] 5115 	ld	a, #0x0c
   9521 F5            [11] 5116 	push	af
   9522 33            [ 6] 5117 	inc	sp
   9523 DD 6E 08      [19] 5118 	ld	l,8 (ix)
   9526 DD 66 09      [19] 5119 	ld	h,9 (ix)
   9529 E5            [11] 5120 	push	hl
   952A CD FE 75      [17] 5121 	call	_createRocaEspejo
   952D 21 07 00      [10] 5122 	ld	hl, #7
   9530 39            [11] 5123 	add	hl, sp
   9531 F9            [ 6] 5124 	ld	sp, hl
                           5125 ;src/niveles/niveles.c:550: createRocaEspejo(rocasEspejo,13,1,sin_Movimiento, sprite_Muro_Solid1,1);
   9532 21 1D 01      [10] 5126 	ld	hl, #0x011d
   9535 E5            [11] 5127 	push	hl
   9536 21 01 00      [10] 5128 	ld	hl, #0x0001
   9539 E5            [11] 5129 	push	hl
   953A 3E 0D         [ 7] 5130 	ld	a, #0x0d
   953C F5            [11] 5131 	push	af
   953D 33            [ 6] 5132 	inc	sp
   953E DD 6E 08      [19] 5133 	ld	l,8 (ix)
   9541 DD 66 09      [19] 5134 	ld	h,9 (ix)
   9544 E5            [11] 5135 	push	hl
   9545 CD FE 75      [17] 5136 	call	_createRocaEspejo
   9548 21 07 00      [10] 5137 	ld	hl, #7
   954B 39            [11] 5138 	add	hl, sp
   954C F9            [ 6] 5139 	ld	sp, hl
                           5140 ;src/niveles/niveles.c:551: createRocaEspejo(rocasEspejo,11,2,sin_Movimiento, sprite_Muro_Solid1,1);
   954D 21 1D 01      [10] 5141 	ld	hl, #0x011d
   9550 E5            [11] 5142 	push	hl
   9551 21 02 00      [10] 5143 	ld	hl, #0x0002
   9554 E5            [11] 5144 	push	hl
   9555 3E 0B         [ 7] 5145 	ld	a, #0x0b
   9557 F5            [11] 5146 	push	af
   9558 33            [ 6] 5147 	inc	sp
   9559 DD 6E 08      [19] 5148 	ld	l,8 (ix)
   955C DD 66 09      [19] 5149 	ld	h,9 (ix)
   955F E5            [11] 5150 	push	hl
   9560 CD FE 75      [17] 5151 	call	_createRocaEspejo
   9563 21 07 00      [10] 5152 	ld	hl, #7
   9566 39            [11] 5153 	add	hl, sp
   9567 F9            [ 6] 5154 	ld	sp, hl
                           5155 ;src/niveles/niveles.c:552: createRocaEspejo(rocasEspejo,10,2,sin_Movimiento, sprite_Muro_Solid1,1);
   9568 21 1D 01      [10] 5156 	ld	hl, #0x011d
   956B E5            [11] 5157 	push	hl
   956C 21 02 00      [10] 5158 	ld	hl, #0x0002
   956F E5            [11] 5159 	push	hl
   9570 3E 0A         [ 7] 5160 	ld	a, #0x0a
   9572 F5            [11] 5161 	push	af
   9573 33            [ 6] 5162 	inc	sp
   9574 DD 6E 08      [19] 5163 	ld	l,8 (ix)
   9577 DD 66 09      [19] 5164 	ld	h,9 (ix)
   957A E5            [11] 5165 	push	hl
   957B CD FE 75      [17] 5166 	call	_createRocaEspejo
   957E 21 07 00      [10] 5167 	ld	hl, #7
   9581 39            [11] 5168 	add	hl, sp
   9582 F9            [ 6] 5169 	ld	sp, hl
                           5170 ;src/niveles/niveles.c:553: createRocaEspejo(rocasEspejo,9,2,sin_Movimiento, sprite_Muro_Solid1,1);
   9583 21 1D 01      [10] 5171 	ld	hl, #0x011d
   9586 E5            [11] 5172 	push	hl
   9587 21 02 00      [10] 5173 	ld	hl, #0x0002
   958A E5            [11] 5174 	push	hl
   958B 3E 09         [ 7] 5175 	ld	a, #0x09
   958D F5            [11] 5176 	push	af
   958E 33            [ 6] 5177 	inc	sp
   958F DD 6E 08      [19] 5178 	ld	l,8 (ix)
   9592 DD 66 09      [19] 5179 	ld	h,9 (ix)
   9595 E5            [11] 5180 	push	hl
   9596 CD FE 75      [17] 5181 	call	_createRocaEspejo
   9599 21 07 00      [10] 5182 	ld	hl, #7
   959C 39            [11] 5183 	add	hl, sp
   959D F9            [ 6] 5184 	ld	sp, hl
                           5185 ;src/niveles/niveles.c:554: createRocaEspejo(rocasEspejo,11,7,sin_Movimiento, sprite_Muro_Solid1,1);
   959E 21 1D 01      [10] 5186 	ld	hl, #0x011d
   95A1 E5            [11] 5187 	push	hl
   95A2 21 07 00      [10] 5188 	ld	hl, #0x0007
   95A5 E5            [11] 5189 	push	hl
   95A6 3E 0B         [ 7] 5190 	ld	a, #0x0b
   95A8 F5            [11] 5191 	push	af
   95A9 33            [ 6] 5192 	inc	sp
   95AA DD 6E 08      [19] 5193 	ld	l,8 (ix)
   95AD DD 66 09      [19] 5194 	ld	h,9 (ix)
   95B0 E5            [11] 5195 	push	hl
   95B1 CD FE 75      [17] 5196 	call	_createRocaEspejo
   95B4 21 07 00      [10] 5197 	ld	hl, #7
   95B7 39            [11] 5198 	add	hl, sp
   95B8 F9            [ 6] 5199 	ld	sp, hl
                           5200 ;src/niveles/niveles.c:555: createRocaEspejo(rocasEspejo,12,7,sin_Movimiento, sprite_Muro_Solid1,1);
   95B9 21 1D 01      [10] 5201 	ld	hl, #0x011d
   95BC E5            [11] 5202 	push	hl
   95BD 21 07 00      [10] 5203 	ld	hl, #0x0007
   95C0 E5            [11] 5204 	push	hl
   95C1 3E 0C         [ 7] 5205 	ld	a, #0x0c
   95C3 F5            [11] 5206 	push	af
   95C4 33            [ 6] 5207 	inc	sp
   95C5 DD 6E 08      [19] 5208 	ld	l,8 (ix)
   95C8 DD 66 09      [19] 5209 	ld	h,9 (ix)
   95CB E5            [11] 5210 	push	hl
   95CC CD FE 75      [17] 5211 	call	_createRocaEspejo
   95CF 21 07 00      [10] 5212 	ld	hl, #7
   95D2 39            [11] 5213 	add	hl, sp
   95D3 F9            [ 6] 5214 	ld	sp, hl
                           5215 ;src/niveles/niveles.c:556: createRocaEspejo(rocasEspejo,13,7,sin_Movimiento, sprite_Muro_Solid1,1);
   95D4 21 1D 01      [10] 5216 	ld	hl, #0x011d
   95D7 E5            [11] 5217 	push	hl
   95D8 21 07 00      [10] 5218 	ld	hl, #0x0007
   95DB E5            [11] 5219 	push	hl
   95DC 3E 0D         [ 7] 5220 	ld	a, #0x0d
   95DE F5            [11] 5221 	push	af
   95DF 33            [ 6] 5222 	inc	sp
   95E0 DD 6E 08      [19] 5223 	ld	l,8 (ix)
   95E3 DD 66 09      [19] 5224 	ld	h,9 (ix)
   95E6 E5            [11] 5225 	push	hl
   95E7 CD FE 75      [17] 5226 	call	_createRocaEspejo
   95EA 21 07 00      [10] 5227 	ld	hl, #7
   95ED 39            [11] 5228 	add	hl, sp
   95EE F9            [ 6] 5229 	ld	sp, hl
                           5230 ;src/niveles/niveles.c:557: createRocaEspejo(rocasEspejo,11,6,sin_Movimiento, sprite_Muro_Solid1,1);
   95EF 21 1D 01      [10] 5231 	ld	hl, #0x011d
   95F2 E5            [11] 5232 	push	hl
   95F3 21 06 00      [10] 5233 	ld	hl, #0x0006
   95F6 E5            [11] 5234 	push	hl
   95F7 3E 0B         [ 7] 5235 	ld	a, #0x0b
   95F9 F5            [11] 5236 	push	af
   95FA 33            [ 6] 5237 	inc	sp
   95FB DD 6E 08      [19] 5238 	ld	l,8 (ix)
   95FE DD 66 09      [19] 5239 	ld	h,9 (ix)
   9601 E5            [11] 5240 	push	hl
   9602 CD FE 75      [17] 5241 	call	_createRocaEspejo
   9605 21 07 00      [10] 5242 	ld	hl, #7
   9608 39            [11] 5243 	add	hl, sp
   9609 F9            [ 6] 5244 	ld	sp, hl
                           5245 ;src/niveles/niveles.c:558: createRocaEspejo(rocasEspejo,10,6,sin_Movimiento, sprite_Muro_Solid1,1);
   960A 21 1D 01      [10] 5246 	ld	hl, #0x011d
   960D E5            [11] 5247 	push	hl
   960E 21 06 00      [10] 5248 	ld	hl, #0x0006
   9611 E5            [11] 5249 	push	hl
   9612 3E 0A         [ 7] 5250 	ld	a, #0x0a
   9614 F5            [11] 5251 	push	af
   9615 33            [ 6] 5252 	inc	sp
   9616 DD 6E 08      [19] 5253 	ld	l,8 (ix)
   9619 DD 66 09      [19] 5254 	ld	h,9 (ix)
   961C E5            [11] 5255 	push	hl
   961D CD FE 75      [17] 5256 	call	_createRocaEspejo
   9620 21 07 00      [10] 5257 	ld	hl, #7
   9623 39            [11] 5258 	add	hl, sp
   9624 F9            [ 6] 5259 	ld	sp, hl
                           5260 ;src/niveles/niveles.c:559: createRocaEspejo(rocasEspejo,9,6,sin_Movimiento, sprite_Muro_Solid1,1);
   9625 21 1D 01      [10] 5261 	ld	hl, #0x011d
   9628 E5            [11] 5262 	push	hl
   9629 21 06 00      [10] 5263 	ld	hl, #0x0006
   962C E5            [11] 5264 	push	hl
   962D 3E 09         [ 7] 5265 	ld	a, #0x09
   962F F5            [11] 5266 	push	af
   9630 33            [ 6] 5267 	inc	sp
   9631 DD 6E 08      [19] 5268 	ld	l,8 (ix)
   9634 DD 66 09      [19] 5269 	ld	h,9 (ix)
   9637 E5            [11] 5270 	push	hl
   9638 CD FE 75      [17] 5271 	call	_createRocaEspejo
   963B 21 07 00      [10] 5272 	ld	hl, #7
   963E 39            [11] 5273 	add	hl, sp
   963F F9            [ 6] 5274 	ld	sp, hl
                           5275 ;src/niveles/niveles.c:560: createHoleDerecha(rocasEspejo,11,3,sprite_hole,1);
   9640 21 24 01      [10] 5276 	ld	hl, #0x0124
   9643 E5            [11] 5277 	push	hl
   9644 21 0B 03      [10] 5278 	ld	hl, #0x030b
   9647 E5            [11] 5279 	push	hl
   9648 DD 6E 08      [19] 5280 	ld	l,8 (ix)
   964B DD 66 09      [19] 5281 	ld	h,9 (ix)
   964E E5            [11] 5282 	push	hl
   964F CD ED 77      [17] 5283 	call	_createHoleDerecha
   9652 21 06 00      [10] 5284 	ld	hl, #6
   9655 39            [11] 5285 	add	hl, sp
   9656 F9            [ 6] 5286 	ld	sp, hl
                           5287 ;src/niveles/niveles.c:561: createHoleDerecha(rocasEspejo,12,3,sprite_hole,1);
   9657 21 24 01      [10] 5288 	ld	hl, #0x0124
   965A E5            [11] 5289 	push	hl
   965B 21 0C 03      [10] 5290 	ld	hl, #0x030c
   965E E5            [11] 5291 	push	hl
   965F DD 6E 08      [19] 5292 	ld	l,8 (ix)
   9662 DD 66 09      [19] 5293 	ld	h,9 (ix)
   9665 E5            [11] 5294 	push	hl
   9666 CD ED 77      [17] 5295 	call	_createHoleDerecha
   9669 21 06 00      [10] 5296 	ld	hl, #6
   966C 39            [11] 5297 	add	hl, sp
   966D F9            [ 6] 5298 	ld	sp, hl
                           5299 ;src/niveles/niveles.c:562: createRocaEspejo(rocasEspejo,13,3,sin_Movimiento,sprite_RockInmovil5_B,1);
   966E 21 10 01      [10] 5300 	ld	hl, #0x0110
   9671 E5            [11] 5301 	push	hl
   9672 21 03 00      [10] 5302 	ld	hl, #0x0003
   9675 E5            [11] 5303 	push	hl
   9676 3E 0D         [ 7] 5304 	ld	a, #0x0d
   9678 F5            [11] 5305 	push	af
   9679 33            [ 6] 5306 	inc	sp
   967A DD 6E 08      [19] 5307 	ld	l,8 (ix)
   967D DD 66 09      [19] 5308 	ld	h,9 (ix)
   9680 E5            [11] 5309 	push	hl
   9681 CD FE 75      [17] 5310 	call	_createRocaEspejo
   9684 21 07 00      [10] 5311 	ld	hl, #7
   9687 39            [11] 5312 	add	hl, sp
   9688 F9            [ 6] 5313 	ld	sp, hl
   9689 DD E1         [14] 5314 	pop	ix
   968B C9            [10] 5315 	ret
                           5316 ;src/niveles/niveles.c:565: void crearNievel7(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           5317 ;	---------------------------------
                           5318 ; Function crearNievel7
                           5319 ; ---------------------------------
   968C                    5320 _crearNievel7::
   968C DD E5         [15] 5321 	push	ix
   968E DD 21 00 00   [14] 5322 	ld	ix,#0
   9692 DD 39         [15] 5323 	add	ix,sp
                           5324 ;src/niveles/niveles.c:567: createPlayer(player,7,4,posicion);
   9694 DD 6E 10      [19] 5325 	ld	l,16 (ix)
   9697 DD 66 11      [19] 5326 	ld	h,17 (ix)
   969A E5            [11] 5327 	push	hl
   969B 21 07 04      [10] 5328 	ld	hl, #0x0407
   969E E5            [11] 5329 	push	hl
   969F DD 6E 04      [19] 5330 	ld	l,4 (ix)
   96A2 DD 66 05      [19] 5331 	ld	h,5 (ix)
   96A5 E5            [11] 5332 	push	hl
   96A6 CD 29 75      [17] 5333 	call	_createPlayer
   96A9 21 06 00      [10] 5334 	ld	hl, #6
   96AC 39            [11] 5335 	add	hl, sp
   96AD F9            [ 6] 5336 	ld	sp, hl
                           5337 ;src/niveles/niveles.c:568: createMarco(no);
   96AE 3E 01         [ 7] 5338 	ld	a, #0x01
   96B0 F5            [11] 5339 	push	af
   96B1 33            [ 6] 5340 	inc	sp
   96B2 CD 1A 75      [17] 5341 	call	_createMarco
   96B5 33            [ 6] 5342 	inc	sp
                           5343 ;src/niveles/niveles.c:569: createPortal(portales,rocas,rocasEspejo,no);
   96B6 3E 01         [ 7] 5344 	ld	a, #0x01
   96B8 F5            [11] 5345 	push	af
   96B9 33            [ 6] 5346 	inc	sp
   96BA DD 6E 08      [19] 5347 	ld	l,8 (ix)
   96BD DD 66 09      [19] 5348 	ld	h,9 (ix)
   96C0 E5            [11] 5349 	push	hl
   96C1 DD 6E 06      [19] 5350 	ld	l,6 (ix)
   96C4 DD 66 07      [19] 5351 	ld	h,7 (ix)
   96C7 E5            [11] 5352 	push	hl
   96C8 DD 6E 0C      [19] 5353 	ld	l,12 (ix)
   96CB DD 66 0D      [19] 5354 	ld	h,13 (ix)
   96CE E5            [11] 5355 	push	hl
   96CF CD 0D 77      [17] 5356 	call	_createPortal
   96D2 21 07 00      [10] 5357 	ld	hl, #7
   96D5 39            [11] 5358 	add	hl, sp
   96D6 F9            [ 6] 5359 	ld	sp, hl
                           5360 ;src/niveles/niveles.c:570: createPuerta(puertas,8,2,sprite_Puerta_B,nivel_05);
   96D7 21 1F 08      [10] 5361 	ld	hl, #0x081f
   96DA E5            [11] 5362 	push	hl
   96DB 21 08 02      [10] 5363 	ld	hl, #0x0208
   96DE E5            [11] 5364 	push	hl
   96DF DD 6E 0A      [19] 5365 	ld	l,10 (ix)
   96E2 DD 66 0B      [19] 5366 	ld	h,11 (ix)
   96E5 E5            [11] 5367 	push	hl
   96E6 CD 94 76      [17] 5368 	call	_createPuerta
   96E9 21 06 00      [10] 5369 	ld	hl, #6
   96EC 39            [11] 5370 	add	hl, sp
   96ED F9            [ 6] 5371 	ld	sp, hl
                           5372 ;src/niveles/niveles.c:571: createPuerta(puertas,8,6,sprite_Puerta_B,nivel_06);
   96EE 21 1F 09      [10] 5373 	ld	hl, #0x091f
   96F1 E5            [11] 5374 	push	hl
   96F2 21 08 06      [10] 5375 	ld	hl, #0x0608
   96F5 E5            [11] 5376 	push	hl
   96F6 DD 6E 0A      [19] 5377 	ld	l,10 (ix)
   96F9 DD 66 0B      [19] 5378 	ld	h,11 (ix)
   96FC E5            [11] 5379 	push	hl
   96FD CD 94 76      [17] 5380 	call	_createPuerta
   9700 21 06 00      [10] 5381 	ld	hl, #6
   9703 39            [11] 5382 	add	hl, sp
   9704 F9            [ 6] 5383 	ld	sp, hl
                           5384 ;src/niveles/niveles.c:574: createRoca(rocas,6,4,mover_1,sprite_Rock_B,1);
   9705 21 03 01      [10] 5385 	ld	hl, #0x0103
   9708 E5            [11] 5386 	push	hl
   9709 2E 04         [ 7] 5387 	ld	l, #0x04
   970B E5            [11] 5388 	push	hl
   970C 3E 06         [ 7] 5389 	ld	a, #0x06
   970E F5            [11] 5390 	push	af
   970F 33            [ 6] 5391 	inc	sp
   9710 DD 6E 06      [19] 5392 	ld	l,6 (ix)
   9713 DD 66 07      [19] 5393 	ld	h,7 (ix)
   9716 E5            [11] 5394 	push	hl
   9717 CD 68 75      [17] 5395 	call	_createRoca
   971A 21 07 00      [10] 5396 	ld	hl, #7
   971D 39            [11] 5397 	add	hl, sp
   971E F9            [ 6] 5398 	ld	sp, hl
                           5399 ;src/niveles/niveles.c:575: createRoca(rocas,6,2,mover_Linea,sprite_RockLineal1_B,1);
   971F 21 06 01      [10] 5400 	ld	hl, #0x0106
   9722 E5            [11] 5401 	push	hl
   9723 21 02 02      [10] 5402 	ld	hl, #0x0202
   9726 E5            [11] 5403 	push	hl
   9727 3E 06         [ 7] 5404 	ld	a, #0x06
   9729 F5            [11] 5405 	push	af
   972A 33            [ 6] 5406 	inc	sp
   972B DD 6E 06      [19] 5407 	ld	l,6 (ix)
   972E DD 66 07      [19] 5408 	ld	h,7 (ix)
   9731 E5            [11] 5409 	push	hl
   9732 CD 68 75      [17] 5410 	call	_createRoca
   9735 21 07 00      [10] 5411 	ld	hl, #7
   9738 39            [11] 5412 	add	hl, sp
   9739 F9            [ 6] 5413 	ld	sp, hl
                           5414 ;src/niveles/niveles.c:576: createRoca(rocas,6,6,mover_Linea,sprite_RockLineal1_B,1);
   973A 21 06 01      [10] 5415 	ld	hl, #0x0106
   973D E5            [11] 5416 	push	hl
   973E 26 02         [ 7] 5417 	ld	h, #0x02
   9740 E5            [11] 5418 	push	hl
   9741 3E 06         [ 7] 5419 	ld	a, #0x06
   9743 F5            [11] 5420 	push	af
   9744 33            [ 6] 5421 	inc	sp
   9745 DD 6E 06      [19] 5422 	ld	l,6 (ix)
   9748 DD 66 07      [19] 5423 	ld	h,7 (ix)
   974B E5            [11] 5424 	push	hl
   974C CD 68 75      [17] 5425 	call	_createRoca
   974F 21 07 00      [10] 5426 	ld	hl, #7
   9752 39            [11] 5427 	add	hl, sp
   9753 F9            [ 6] 5428 	ld	sp, hl
                           5429 ;src/niveles/niveles.c:577: createRoca(rocas,5,4,mover_Linea,sprite_RockLineal1_B,1);
   9754 21 06 01      [10] 5430 	ld	hl, #0x0106
   9757 E5            [11] 5431 	push	hl
   9758 21 04 02      [10] 5432 	ld	hl, #0x0204
   975B E5            [11] 5433 	push	hl
   975C 3E 05         [ 7] 5434 	ld	a, #0x05
   975E F5            [11] 5435 	push	af
   975F 33            [ 6] 5436 	inc	sp
   9760 DD 6E 06      [19] 5437 	ld	l,6 (ix)
   9763 DD 66 07      [19] 5438 	ld	h,7 (ix)
   9766 E5            [11] 5439 	push	hl
   9767 CD 68 75      [17] 5440 	call	_createRoca
   976A 21 07 00      [10] 5441 	ld	hl, #7
   976D 39            [11] 5442 	add	hl, sp
   976E F9            [ 6] 5443 	ld	sp, hl
                           5444 ;src/niveles/niveles.c:578: createRoca(rocas,4,4,mover_Linea,sprite_RockLineal1_B,1);
   976F 21 06 01      [10] 5445 	ld	hl, #0x0106
   9772 E5            [11] 5446 	push	hl
   9773 21 04 02      [10] 5447 	ld	hl, #0x0204
   9776 E5            [11] 5448 	push	hl
   9777 3E 04         [ 7] 5449 	ld	a, #0x04
   9779 F5            [11] 5450 	push	af
   977A 33            [ 6] 5451 	inc	sp
   977B DD 6E 06      [19] 5452 	ld	l,6 (ix)
   977E DD 66 07      [19] 5453 	ld	h,7 (ix)
   9781 E5            [11] 5454 	push	hl
   9782 CD 68 75      [17] 5455 	call	_createRoca
   9785 21 07 00      [10] 5456 	ld	hl, #7
   9788 39            [11] 5457 	add	hl, sp
   9789 F9            [ 6] 5458 	ld	sp, hl
                           5459 ;src/niveles/niveles.c:579: createRoca(rocas,4,3,mover_Linea,sprite_RockLineal1_B,1);
   978A 21 06 01      [10] 5460 	ld	hl, #0x0106
   978D E5            [11] 5461 	push	hl
   978E 21 03 02      [10] 5462 	ld	hl, #0x0203
   9791 E5            [11] 5463 	push	hl
   9792 3E 04         [ 7] 5464 	ld	a, #0x04
   9794 F5            [11] 5465 	push	af
   9795 33            [ 6] 5466 	inc	sp
   9796 DD 6E 06      [19] 5467 	ld	l,6 (ix)
   9799 DD 66 07      [19] 5468 	ld	h,7 (ix)
   979C E5            [11] 5469 	push	hl
   979D CD 68 75      [17] 5470 	call	_createRoca
   97A0 21 07 00      [10] 5471 	ld	hl, #7
   97A3 39            [11] 5472 	add	hl, sp
   97A4 F9            [ 6] 5473 	ld	sp, hl
                           5474 ;src/niveles/niveles.c:580: createRoca(rocas,4,5,mover_Linea,sprite_RockLineal1_B,1);
   97A5 21 06 01      [10] 5475 	ld	hl, #0x0106
   97A8 E5            [11] 5476 	push	hl
   97A9 21 05 02      [10] 5477 	ld	hl, #0x0205
   97AC E5            [11] 5478 	push	hl
   97AD 3E 04         [ 7] 5479 	ld	a, #0x04
   97AF F5            [11] 5480 	push	af
   97B0 33            [ 6] 5481 	inc	sp
   97B1 DD 6E 06      [19] 5482 	ld	l,6 (ix)
   97B4 DD 66 07      [19] 5483 	ld	h,7 (ix)
   97B7 E5            [11] 5484 	push	hl
   97B8 CD 68 75      [17] 5485 	call	_createRoca
   97BB 21 07 00      [10] 5486 	ld	hl, #7
   97BE 39            [11] 5487 	add	hl, sp
   97BF F9            [ 6] 5488 	ld	sp, hl
                           5489 ;src/niveles/niveles.c:584: createColeccionabeLuz(col,2,4,6);
   97C0 21 04 06      [10] 5490 	ld	hl, #0x0604
   97C3 E5            [11] 5491 	push	hl
   97C4 3E 02         [ 7] 5492 	ld	a, #0x02
   97C6 F5            [11] 5493 	push	af
   97C7 33            [ 6] 5494 	inc	sp
   97C8 DD 6E 0E      [19] 5495 	ld	l,14 (ix)
   97CB DD 66 0F      [19] 5496 	ld	h,15 (ix)
   97CE E5            [11] 5497 	push	hl
   97CF CD 81 78      [17] 5498 	call	_createColeccionabeLuz
   97D2 F1            [10] 5499 	pop	af
                           5500 ;src/niveles/niveles.c:588: createRoca(rocas,1,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   97D3 33            [ 6] 5501 	inc	sp
   97D4 21 1C 01      [10] 5502 	ld	hl,#0x011c
   97D7 E3            [19] 5503 	ex	(sp),hl
   97D8 21 01 00      [10] 5504 	ld	hl, #0x0001
   97DB E5            [11] 5505 	push	hl
   97DC 3E 01         [ 7] 5506 	ld	a, #0x01
   97DE F5            [11] 5507 	push	af
   97DF 33            [ 6] 5508 	inc	sp
   97E0 DD 6E 06      [19] 5509 	ld	l,6 (ix)
   97E3 DD 66 07      [19] 5510 	ld	h,7 (ix)
   97E6 E5            [11] 5511 	push	hl
   97E7 CD 68 75      [17] 5512 	call	_createRoca
   97EA 21 07 00      [10] 5513 	ld	hl, #7
   97ED 39            [11] 5514 	add	hl, sp
   97EE F9            [ 6] 5515 	ld	sp, hl
                           5516 ;src/niveles/niveles.c:589: createRoca(rocas,2,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   97EF 21 1C 01      [10] 5517 	ld	hl, #0x011c
   97F2 E5            [11] 5518 	push	hl
   97F3 21 01 00      [10] 5519 	ld	hl, #0x0001
   97F6 E5            [11] 5520 	push	hl
   97F7 3E 02         [ 7] 5521 	ld	a, #0x02
   97F9 F5            [11] 5522 	push	af
   97FA 33            [ 6] 5523 	inc	sp
   97FB DD 6E 06      [19] 5524 	ld	l,6 (ix)
   97FE DD 66 07      [19] 5525 	ld	h,7 (ix)
   9801 E5            [11] 5526 	push	hl
   9802 CD 68 75      [17] 5527 	call	_createRoca
   9805 21 07 00      [10] 5528 	ld	hl, #7
   9808 39            [11] 5529 	add	hl, sp
   9809 F9            [ 6] 5530 	ld	sp, hl
                           5531 ;src/niveles/niveles.c:590: createRoca(rocas,3,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   980A 21 1C 01      [10] 5532 	ld	hl, #0x011c
   980D E5            [11] 5533 	push	hl
   980E 21 01 00      [10] 5534 	ld	hl, #0x0001
   9811 E5            [11] 5535 	push	hl
   9812 3E 03         [ 7] 5536 	ld	a, #0x03
   9814 F5            [11] 5537 	push	af
   9815 33            [ 6] 5538 	inc	sp
   9816 DD 6E 06      [19] 5539 	ld	l,6 (ix)
   9819 DD 66 07      [19] 5540 	ld	h,7 (ix)
   981C E5            [11] 5541 	push	hl
   981D CD 68 75      [17] 5542 	call	_createRoca
   9820 21 07 00      [10] 5543 	ld	hl, #7
   9823 39            [11] 5544 	add	hl, sp
   9824 F9            [ 6] 5545 	ld	sp, hl
                           5546 ;src/niveles/niveles.c:591: createRoca(rocas,4,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   9825 21 1C 01      [10] 5547 	ld	hl, #0x011c
   9828 E5            [11] 5548 	push	hl
   9829 21 01 00      [10] 5549 	ld	hl, #0x0001
   982C E5            [11] 5550 	push	hl
   982D 3E 04         [ 7] 5551 	ld	a, #0x04
   982F F5            [11] 5552 	push	af
   9830 33            [ 6] 5553 	inc	sp
   9831 DD 6E 06      [19] 5554 	ld	l,6 (ix)
   9834 DD 66 07      [19] 5555 	ld	h,7 (ix)
   9837 E5            [11] 5556 	push	hl
   9838 CD 68 75      [17] 5557 	call	_createRoca
   983B 21 07 00      [10] 5558 	ld	hl, #7
   983E 39            [11] 5559 	add	hl, sp
   983F F9            [ 6] 5560 	ld	sp, hl
                           5561 ;src/niveles/niveles.c:592: createRoca(rocas,5,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   9840 21 1C 01      [10] 5562 	ld	hl, #0x011c
   9843 E5            [11] 5563 	push	hl
   9844 21 01 00      [10] 5564 	ld	hl, #0x0001
   9847 E5            [11] 5565 	push	hl
   9848 3E 05         [ 7] 5566 	ld	a, #0x05
   984A F5            [11] 5567 	push	af
   984B 33            [ 6] 5568 	inc	sp
   984C DD 6E 06      [19] 5569 	ld	l,6 (ix)
   984F DD 66 07      [19] 5570 	ld	h,7 (ix)
   9852 E5            [11] 5571 	push	hl
   9853 CD 68 75      [17] 5572 	call	_createRoca
   9856 21 07 00      [10] 5573 	ld	hl, #7
   9859 39            [11] 5574 	add	hl, sp
   985A F9            [ 6] 5575 	ld	sp, hl
                           5576 ;src/niveles/niveles.c:593: createRoca(rocas,6,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   985B 21 1C 01      [10] 5577 	ld	hl, #0x011c
   985E E5            [11] 5578 	push	hl
   985F 21 01 00      [10] 5579 	ld	hl, #0x0001
   9862 E5            [11] 5580 	push	hl
   9863 3E 06         [ 7] 5581 	ld	a, #0x06
   9865 F5            [11] 5582 	push	af
   9866 33            [ 6] 5583 	inc	sp
   9867 DD 6E 06      [19] 5584 	ld	l,6 (ix)
   986A DD 66 07      [19] 5585 	ld	h,7 (ix)
   986D E5            [11] 5586 	push	hl
   986E CD 68 75      [17] 5587 	call	_createRoca
   9871 21 07 00      [10] 5588 	ld	hl, #7
   9874 39            [11] 5589 	add	hl, sp
   9875 F9            [ 6] 5590 	ld	sp, hl
                           5591 ;src/niveles/niveles.c:594: createRoca(rocas,7,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   9876 21 1C 01      [10] 5592 	ld	hl, #0x011c
   9879 E5            [11] 5593 	push	hl
   987A 21 01 00      [10] 5594 	ld	hl, #0x0001
   987D E5            [11] 5595 	push	hl
   987E 3E 07         [ 7] 5596 	ld	a, #0x07
   9880 F5            [11] 5597 	push	af
   9881 33            [ 6] 5598 	inc	sp
   9882 DD 6E 06      [19] 5599 	ld	l,6 (ix)
   9885 DD 66 07      [19] 5600 	ld	h,7 (ix)
   9888 E5            [11] 5601 	push	hl
   9889 CD 68 75      [17] 5602 	call	_createRoca
   988C 21 07 00      [10] 5603 	ld	hl, #7
   988F 39            [11] 5604 	add	hl, sp
   9890 F9            [ 6] 5605 	ld	sp, hl
                           5606 ;src/niveles/niveles.c:595: createRoca(rocas,8,1,sin_Movimiento, sprite_Muro_Polvo1,1);
   9891 21 1C 01      [10] 5607 	ld	hl, #0x011c
   9894 E5            [11] 5608 	push	hl
   9895 21 01 00      [10] 5609 	ld	hl, #0x0001
   9898 E5            [11] 5610 	push	hl
   9899 3E 08         [ 7] 5611 	ld	a, #0x08
   989B F5            [11] 5612 	push	af
   989C 33            [ 6] 5613 	inc	sp
   989D DD 6E 06      [19] 5614 	ld	l,6 (ix)
   98A0 DD 66 07      [19] 5615 	ld	h,7 (ix)
   98A3 E5            [11] 5616 	push	hl
   98A4 CD 68 75      [17] 5617 	call	_createRoca
   98A7 21 07 00      [10] 5618 	ld	hl, #7
   98AA 39            [11] 5619 	add	hl, sp
   98AB F9            [ 6] 5620 	ld	sp, hl
                           5621 ;src/niveles/niveles.c:596: createRoca(rocas,1,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   98AC 21 1C 01      [10] 5622 	ld	hl, #0x011c
   98AF E5            [11] 5623 	push	hl
   98B0 21 07 00      [10] 5624 	ld	hl, #0x0007
   98B3 E5            [11] 5625 	push	hl
   98B4 3E 01         [ 7] 5626 	ld	a, #0x01
   98B6 F5            [11] 5627 	push	af
   98B7 33            [ 6] 5628 	inc	sp
   98B8 DD 6E 06      [19] 5629 	ld	l,6 (ix)
   98BB DD 66 07      [19] 5630 	ld	h,7 (ix)
   98BE E5            [11] 5631 	push	hl
   98BF CD 68 75      [17] 5632 	call	_createRoca
   98C2 21 07 00      [10] 5633 	ld	hl, #7
   98C5 39            [11] 5634 	add	hl, sp
   98C6 F9            [ 6] 5635 	ld	sp, hl
                           5636 ;src/niveles/niveles.c:597: createRoca(rocas,2,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   98C7 21 1C 01      [10] 5637 	ld	hl, #0x011c
   98CA E5            [11] 5638 	push	hl
   98CB 21 07 00      [10] 5639 	ld	hl, #0x0007
   98CE E5            [11] 5640 	push	hl
   98CF 3E 02         [ 7] 5641 	ld	a, #0x02
   98D1 F5            [11] 5642 	push	af
   98D2 33            [ 6] 5643 	inc	sp
   98D3 DD 6E 06      [19] 5644 	ld	l,6 (ix)
   98D6 DD 66 07      [19] 5645 	ld	h,7 (ix)
   98D9 E5            [11] 5646 	push	hl
   98DA CD 68 75      [17] 5647 	call	_createRoca
   98DD 21 07 00      [10] 5648 	ld	hl, #7
   98E0 39            [11] 5649 	add	hl, sp
   98E1 F9            [ 6] 5650 	ld	sp, hl
                           5651 ;src/niveles/niveles.c:598: createRoca(rocas,3,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   98E2 21 1C 01      [10] 5652 	ld	hl, #0x011c
   98E5 E5            [11] 5653 	push	hl
   98E6 21 07 00      [10] 5654 	ld	hl, #0x0007
   98E9 E5            [11] 5655 	push	hl
   98EA 3E 03         [ 7] 5656 	ld	a, #0x03
   98EC F5            [11] 5657 	push	af
   98ED 33            [ 6] 5658 	inc	sp
   98EE DD 6E 06      [19] 5659 	ld	l,6 (ix)
   98F1 DD 66 07      [19] 5660 	ld	h,7 (ix)
   98F4 E5            [11] 5661 	push	hl
   98F5 CD 68 75      [17] 5662 	call	_createRoca
   98F8 21 07 00      [10] 5663 	ld	hl, #7
   98FB 39            [11] 5664 	add	hl, sp
   98FC F9            [ 6] 5665 	ld	sp, hl
                           5666 ;src/niveles/niveles.c:599: createRoca(rocas,4,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   98FD 21 1C 01      [10] 5667 	ld	hl, #0x011c
   9900 E5            [11] 5668 	push	hl
   9901 21 07 00      [10] 5669 	ld	hl, #0x0007
   9904 E5            [11] 5670 	push	hl
   9905 3E 04         [ 7] 5671 	ld	a, #0x04
   9907 F5            [11] 5672 	push	af
   9908 33            [ 6] 5673 	inc	sp
   9909 DD 6E 06      [19] 5674 	ld	l,6 (ix)
   990C DD 66 07      [19] 5675 	ld	h,7 (ix)
   990F E5            [11] 5676 	push	hl
   9910 CD 68 75      [17] 5677 	call	_createRoca
   9913 21 07 00      [10] 5678 	ld	hl, #7
   9916 39            [11] 5679 	add	hl, sp
   9917 F9            [ 6] 5680 	ld	sp, hl
                           5681 ;src/niveles/niveles.c:600: createRoca(rocas,5,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   9918 21 1C 01      [10] 5682 	ld	hl, #0x011c
   991B E5            [11] 5683 	push	hl
   991C 21 07 00      [10] 5684 	ld	hl, #0x0007
   991F E5            [11] 5685 	push	hl
   9920 3E 05         [ 7] 5686 	ld	a, #0x05
   9922 F5            [11] 5687 	push	af
   9923 33            [ 6] 5688 	inc	sp
   9924 DD 6E 06      [19] 5689 	ld	l,6 (ix)
   9927 DD 66 07      [19] 5690 	ld	h,7 (ix)
   992A E5            [11] 5691 	push	hl
   992B CD 68 75      [17] 5692 	call	_createRoca
   992E 21 07 00      [10] 5693 	ld	hl, #7
   9931 39            [11] 5694 	add	hl, sp
   9932 F9            [ 6] 5695 	ld	sp, hl
                           5696 ;src/niveles/niveles.c:601: createRoca(rocas,6,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   9933 21 1C 01      [10] 5697 	ld	hl, #0x011c
   9936 E5            [11] 5698 	push	hl
   9937 21 07 00      [10] 5699 	ld	hl, #0x0007
   993A E5            [11] 5700 	push	hl
   993B 3E 06         [ 7] 5701 	ld	a, #0x06
   993D F5            [11] 5702 	push	af
   993E 33            [ 6] 5703 	inc	sp
   993F DD 6E 06      [19] 5704 	ld	l,6 (ix)
   9942 DD 66 07      [19] 5705 	ld	h,7 (ix)
   9945 E5            [11] 5706 	push	hl
   9946 CD 68 75      [17] 5707 	call	_createRoca
   9949 21 07 00      [10] 5708 	ld	hl, #7
   994C 39            [11] 5709 	add	hl, sp
   994D F9            [ 6] 5710 	ld	sp, hl
                           5711 ;src/niveles/niveles.c:602: createRoca(rocas,7,7,sin_Movimiento, sprite_Muro_Polvo1,1);
   994E 21 1C 01      [10] 5712 	ld	hl, #0x011c
   9951 E5            [11] 5713 	push	hl
   9952 21 07 00      [10] 5714 	ld	hl, #0x0007
   9955 E5            [11] 5715 	push	hl
   9956 3E 07         [ 7] 5716 	ld	a, #0x07
   9958 F5            [11] 5717 	push	af
   9959 33            [ 6] 5718 	inc	sp
   995A DD 6E 06      [19] 5719 	ld	l,6 (ix)
   995D DD 66 07      [19] 5720 	ld	h,7 (ix)
   9960 E5            [11] 5721 	push	hl
   9961 CD 68 75      [17] 5722 	call	_createRoca
   9964 21 07 00      [10] 5723 	ld	hl, #7
   9967 39            [11] 5724 	add	hl, sp
   9968 F9            [ 6] 5725 	ld	sp, hl
                           5726 ;src/niveles/niveles.c:603: createRoca(rocas,8,8,sin_Movimiento, sprite_Muro_Polvo1,1);
   9969 21 1C 01      [10] 5727 	ld	hl, #0x011c
   996C E5            [11] 5728 	push	hl
   996D 21 08 00      [10] 5729 	ld	hl, #0x0008
   9970 E5            [11] 5730 	push	hl
   9971 3E 08         [ 7] 5731 	ld	a, #0x08
   9973 F5            [11] 5732 	push	af
   9974 33            [ 6] 5733 	inc	sp
   9975 DD 6E 06      [19] 5734 	ld	l,6 (ix)
   9978 DD 66 07      [19] 5735 	ld	h,7 (ix)
   997B E5            [11] 5736 	push	hl
   997C CD 68 75      [17] 5737 	call	_createRoca
   997F 21 07 00      [10] 5738 	ld	hl, #7
   9982 39            [11] 5739 	add	hl, sp
   9983 F9            [ 6] 5740 	ld	sp, hl
                           5741 ;src/niveles/niveles.c:604: createRoca(rocas,1,2,sin_Movimiento, sprite_Muro_Polvo1,1);
   9984 21 1C 01      [10] 5742 	ld	hl, #0x011c
   9987 E5            [11] 5743 	push	hl
   9988 21 02 00      [10] 5744 	ld	hl, #0x0002
   998B E5            [11] 5745 	push	hl
   998C 3E 01         [ 7] 5746 	ld	a, #0x01
   998E F5            [11] 5747 	push	af
   998F 33            [ 6] 5748 	inc	sp
   9990 DD 6E 06      [19] 5749 	ld	l,6 (ix)
   9993 DD 66 07      [19] 5750 	ld	h,7 (ix)
   9996 E5            [11] 5751 	push	hl
   9997 CD 68 75      [17] 5752 	call	_createRoca
   999A 21 07 00      [10] 5753 	ld	hl, #7
   999D 39            [11] 5754 	add	hl, sp
   999E F9            [ 6] 5755 	ld	sp, hl
                           5756 ;src/niveles/niveles.c:605: createRoca(rocas,1,3,sin_Movimiento, sprite_Muro_Polvo1,1);
   999F 21 1C 01      [10] 5757 	ld	hl, #0x011c
   99A2 E5            [11] 5758 	push	hl
   99A3 21 03 00      [10] 5759 	ld	hl, #0x0003
   99A6 E5            [11] 5760 	push	hl
   99A7 3E 01         [ 7] 5761 	ld	a, #0x01
   99A9 F5            [11] 5762 	push	af
   99AA 33            [ 6] 5763 	inc	sp
   99AB DD 6E 06      [19] 5764 	ld	l,6 (ix)
   99AE DD 66 07      [19] 5765 	ld	h,7 (ix)
   99B1 E5            [11] 5766 	push	hl
   99B2 CD 68 75      [17] 5767 	call	_createRoca
   99B5 21 07 00      [10] 5768 	ld	hl, #7
   99B8 39            [11] 5769 	add	hl, sp
   99B9 F9            [ 6] 5770 	ld	sp, hl
                           5771 ;src/niveles/niveles.c:606: createRoca(rocas,1,5,sin_Movimiento, sprite_Muro_Polvo1,1);
   99BA 21 1C 01      [10] 5772 	ld	hl, #0x011c
   99BD E5            [11] 5773 	push	hl
   99BE 21 05 00      [10] 5774 	ld	hl, #0x0005
   99C1 E5            [11] 5775 	push	hl
   99C2 3E 01         [ 7] 5776 	ld	a, #0x01
   99C4 F5            [11] 5777 	push	af
   99C5 33            [ 6] 5778 	inc	sp
   99C6 DD 6E 06      [19] 5779 	ld	l,6 (ix)
   99C9 DD 66 07      [19] 5780 	ld	h,7 (ix)
   99CC E5            [11] 5781 	push	hl
   99CD CD 68 75      [17] 5782 	call	_createRoca
   99D0 21 07 00      [10] 5783 	ld	hl, #7
   99D3 39            [11] 5784 	add	hl, sp
   99D4 F9            [ 6] 5785 	ld	sp, hl
                           5786 ;src/niveles/niveles.c:607: createRoca(rocas,1,6,sin_Movimiento, sprite_Muro_Polvo1,1);
   99D5 21 1C 01      [10] 5787 	ld	hl, #0x011c
   99D8 E5            [11] 5788 	push	hl
   99D9 21 06 00      [10] 5789 	ld	hl, #0x0006
   99DC E5            [11] 5790 	push	hl
   99DD 3E 01         [ 7] 5791 	ld	a, #0x01
   99DF F5            [11] 5792 	push	af
   99E0 33            [ 6] 5793 	inc	sp
   99E1 DD 6E 06      [19] 5794 	ld	l,6 (ix)
   99E4 DD 66 07      [19] 5795 	ld	h,7 (ix)
   99E7 E5            [11] 5796 	push	hl
   99E8 CD 68 75      [17] 5797 	call	_createRoca
   99EB 21 07 00      [10] 5798 	ld	hl, #7
   99EE 39            [11] 5799 	add	hl, sp
   99EF F9            [ 6] 5800 	ld	sp, hl
                           5801 ;src/niveles/niveles.c:608: createRoca(rocas,8,2,sin_Movimiento, sprite_Muro_Polvo1,1);
   99F0 21 1C 01      [10] 5802 	ld	hl, #0x011c
   99F3 E5            [11] 5803 	push	hl
   99F4 21 02 00      [10] 5804 	ld	hl, #0x0002
   99F7 E5            [11] 5805 	push	hl
   99F8 3E 08         [ 7] 5806 	ld	a, #0x08
   99FA F5            [11] 5807 	push	af
   99FB 33            [ 6] 5808 	inc	sp
   99FC DD 6E 06      [19] 5809 	ld	l,6 (ix)
   99FF DD 66 07      [19] 5810 	ld	h,7 (ix)
   9A02 E5            [11] 5811 	push	hl
   9A03 CD 68 75      [17] 5812 	call	_createRoca
   9A06 21 07 00      [10] 5813 	ld	hl, #7
   9A09 39            [11] 5814 	add	hl, sp
   9A0A F9            [ 6] 5815 	ld	sp, hl
                           5816 ;src/niveles/niveles.c:609: createRoca(rocas,8,3,sin_Movimiento, sprite_Muro_Polvo1,1);
   9A0B 21 1C 01      [10] 5817 	ld	hl, #0x011c
   9A0E E5            [11] 5818 	push	hl
   9A0F 21 03 00      [10] 5819 	ld	hl, #0x0003
   9A12 E5            [11] 5820 	push	hl
   9A13 3E 08         [ 7] 5821 	ld	a, #0x08
   9A15 F5            [11] 5822 	push	af
   9A16 33            [ 6] 5823 	inc	sp
   9A17 DD 6E 06      [19] 5824 	ld	l,6 (ix)
   9A1A DD 66 07      [19] 5825 	ld	h,7 (ix)
   9A1D E5            [11] 5826 	push	hl
   9A1E CD 68 75      [17] 5827 	call	_createRoca
   9A21 21 07 00      [10] 5828 	ld	hl, #7
   9A24 39            [11] 5829 	add	hl, sp
   9A25 F9            [ 6] 5830 	ld	sp, hl
                           5831 ;src/niveles/niveles.c:610: createRoca(rocas,8,4,sin_Movimiento, sprite_Muro_Polvo1,1);
   9A26 21 1C 01      [10] 5832 	ld	hl, #0x011c
   9A29 E5            [11] 5833 	push	hl
   9A2A 21 04 00      [10] 5834 	ld	hl, #0x0004
   9A2D E5            [11] 5835 	push	hl
   9A2E 3E 08         [ 7] 5836 	ld	a, #0x08
   9A30 F5            [11] 5837 	push	af
   9A31 33            [ 6] 5838 	inc	sp
   9A32 DD 6E 06      [19] 5839 	ld	l,6 (ix)
   9A35 DD 66 07      [19] 5840 	ld	h,7 (ix)
   9A38 E5            [11] 5841 	push	hl
   9A39 CD 68 75      [17] 5842 	call	_createRoca
   9A3C 21 07 00      [10] 5843 	ld	hl, #7
   9A3F 39            [11] 5844 	add	hl, sp
   9A40 F9            [ 6] 5845 	ld	sp, hl
                           5846 ;src/niveles/niveles.c:611: createRoca(rocas,8,5,sin_Movimiento, sprite_Muro_Polvo1,1);
   9A41 21 1C 01      [10] 5847 	ld	hl, #0x011c
   9A44 E5            [11] 5848 	push	hl
   9A45 21 05 00      [10] 5849 	ld	hl, #0x0005
   9A48 E5            [11] 5850 	push	hl
   9A49 3E 08         [ 7] 5851 	ld	a, #0x08
   9A4B F5            [11] 5852 	push	af
   9A4C 33            [ 6] 5853 	inc	sp
   9A4D DD 6E 06      [19] 5854 	ld	l,6 (ix)
   9A50 DD 66 07      [19] 5855 	ld	h,7 (ix)
   9A53 E5            [11] 5856 	push	hl
   9A54 CD 68 75      [17] 5857 	call	_createRoca
   9A57 21 07 00      [10] 5858 	ld	hl, #7
   9A5A 39            [11] 5859 	add	hl, sp
   9A5B F9            [ 6] 5860 	ld	sp, hl
                           5861 ;src/niveles/niveles.c:612: createRoca(rocas,8,6,sin_Movimiento, sprite_Muro_Polvo1,1);
   9A5C 21 1C 01      [10] 5862 	ld	hl, #0x011c
   9A5F E5            [11] 5863 	push	hl
   9A60 21 06 00      [10] 5864 	ld	hl, #0x0006
   9A63 E5            [11] 5865 	push	hl
   9A64 3E 08         [ 7] 5866 	ld	a, #0x08
   9A66 F5            [11] 5867 	push	af
   9A67 33            [ 6] 5868 	inc	sp
   9A68 DD 6E 06      [19] 5869 	ld	l,6 (ix)
   9A6B DD 66 07      [19] 5870 	ld	h,7 (ix)
   9A6E E5            [11] 5871 	push	hl
   9A6F CD 68 75      [17] 5872 	call	_createRoca
   9A72 21 07 00      [10] 5873 	ld	hl, #7
   9A75 39            [11] 5874 	add	hl, sp
   9A76 F9            [ 6] 5875 	ld	sp, hl
                           5876 ;src/niveles/niveles.c:613: createRoca(rocas,2,2,sin_Movimiento,sprite_RockInmovil2_B,1);
   9A77 21 0A 01      [10] 5877 	ld	hl, #0x010a
   9A7A E5            [11] 5878 	push	hl
   9A7B 21 02 00      [10] 5879 	ld	hl, #0x0002
   9A7E E5            [11] 5880 	push	hl
   9A7F 3E 02         [ 7] 5881 	ld	a, #0x02
   9A81 F5            [11] 5882 	push	af
   9A82 33            [ 6] 5883 	inc	sp
   9A83 DD 6E 06      [19] 5884 	ld	l,6 (ix)
   9A86 DD 66 07      [19] 5885 	ld	h,7 (ix)
   9A89 E5            [11] 5886 	push	hl
   9A8A CD 68 75      [17] 5887 	call	_createRoca
   9A8D 21 07 00      [10] 5888 	ld	hl, #7
   9A90 39            [11] 5889 	add	hl, sp
   9A91 F9            [ 6] 5890 	ld	sp, hl
                           5891 ;src/niveles/niveles.c:614: createRoca(rocas,2,6,sin_Movimiento,sprite_RockInmovil2_B,1);
   9A92 21 0A 01      [10] 5892 	ld	hl, #0x010a
   9A95 E5            [11] 5893 	push	hl
   9A96 21 06 00      [10] 5894 	ld	hl, #0x0006
   9A99 E5            [11] 5895 	push	hl
   9A9A 3E 02         [ 7] 5896 	ld	a, #0x02
   9A9C F5            [11] 5897 	push	af
   9A9D 33            [ 6] 5898 	inc	sp
   9A9E DD 6E 06      [19] 5899 	ld	l,6 (ix)
   9AA1 DD 66 07      [19] 5900 	ld	h,7 (ix)
   9AA4 E5            [11] 5901 	push	hl
   9AA5 CD 68 75      [17] 5902 	call	_createRoca
   9AA8 21 07 00      [10] 5903 	ld	hl, #7
   9AAB 39            [11] 5904 	add	hl, sp
   9AAC F9            [ 6] 5905 	ld	sp, hl
   9AAD DD E1         [14] 5906 	pop	ix
   9AAF C9            [10] 5907 	ret
                           5908 	.area _CODE
                           5909 	.area _INITIALIZER
                           5910 	.area _CABS (ABS)
