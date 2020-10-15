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
                             12 	.globl _initNiveles
                             13 	.globl _crearNivel
                             14 	.globl _resetLevel
                             15 	.globl _createMarco
                             16 	.globl _createPlayer
                             17 	.globl _createRoca
                             18 	.globl _createRocaEspejo
                             19 	.globl _createPuerta
                             20 	.globl _createPortal
                             21 	.globl _createHoleIzquierda
                             22 	.globl _createHoleDerecha
                             23 	.globl _createColeccionabeLuz
                             24 	.globl _createColeccionabeFamilia
                             25 	.globl _createColeccionabeAmstr
                             26 	.globl _crearNivel1
                             27 	.globl _crearNivel2
                             28 	.globl _crearNivel3
                             29 ;--------------------------------------------------------
                             30 ; special function registers
                             31 ;--------------------------------------------------------
                             32 ;--------------------------------------------------------
                             33 ; ram data
                             34 ;--------------------------------------------------------
                             35 	.area _DATA
   7AB5                      36 _niveles:
   7AB5                      37 	.ds 100
   7B19                      38 _contadorRocas:
   7B19                      39 	.ds 1
   7B1A                      40 _contadorRocasEspejo:
   7B1A                      41 	.ds 1
   7B1B                      42 _contadorPuertas:
   7B1B                      43 	.ds 1
   7B1C                      44 _contadorColeccionables:
   7B1C                      45 	.ds 1
   7B1D                      46 _P_colList2:
   7B1D                      47 	.ds 2
                             48 ;--------------------------------------------------------
                             49 ; ram data
                             50 ;--------------------------------------------------------
                             51 	.area _INITIALIZED
                             52 ;--------------------------------------------------------
                             53 ; absolute external ram data
                             54 ;--------------------------------------------------------
                             55 	.area _DABS (ABS)
                             56 ;--------------------------------------------------------
                             57 ; global & static initialisations
                             58 ;--------------------------------------------------------
                             59 	.area _HOME
                             60 	.area _GSINIT
                             61 	.area _GSFINAL
                             62 	.area _GSINIT
                             63 ;--------------------------------------------------------
                             64 ; Home
                             65 ;--------------------------------------------------------
                             66 	.area _HOME
                             67 	.area _HOME
                             68 ;--------------------------------------------------------
                             69 ; code
                             70 ;--------------------------------------------------------
                             71 	.area _CODE
                             72 ;src/niveles/niveles.c:8: void initNiveles(u8* collist){
                             73 ;	---------------------------------
                             74 ; Function initNiveles
                             75 ; ---------------------------------
   64B0                      76 _initNiveles::
                             77 ;src/niveles/niveles.c:10: niveles[nivel_0]=crearNivel1;
   64B0 21 7E 6B      [10]   78 	ld	hl, #_crearNivel1
   64B3 22 B7 7A      [16]   79 	ld	((_niveles + 0x0002)), hl
                             80 ;src/niveles/niveles.c:11: niveles[nivel_1]=crearNivel2;    
   64B6 21 C9 6E      [10]   81 	ld	hl, #_crearNivel2
   64B9 22 B9 7A      [16]   82 	ld	((_niveles + 0x0004)), hl
                             83 ;src/niveles/niveles.c:12: niveles[nivel_2]=crearNivel3;    
   64BC 21 CA 6E      [10]   84 	ld	hl, #_crearNivel3
   64BF 22 BB 7A      [16]   85 	ld	((_niveles + 0x0006)), hl
                             86 ;src/niveles/niveles.c:14: P_colList2=collist;
   64C2 21 02 00      [10]   87 	ld	hl, #2+0
   64C5 39            [11]   88 	add	hl, sp
   64C6 7E            [ 7]   89 	ld	a, (hl)
   64C7 32 1D 7B      [13]   90 	ld	(#_P_colList2 + 0),a
   64CA 21 03 00      [10]   91 	ld	hl, #2+1
   64CD 39            [11]   92 	add	hl, sp
   64CE 7E            [ 7]   93 	ld	a, (hl)
   64CF 32 1E 7B      [13]   94 	ld	(#_P_colList2 + 1),a
                             95 ;src/niveles/niveles.c:15: contadorRocas=0;
   64D2 21 19 7B      [10]   96 	ld	hl,#_contadorRocas + 0
   64D5 36 00         [10]   97 	ld	(hl), #0x00
                             98 ;src/niveles/niveles.c:16: contadorRocasEspejo=0;
   64D7 21 1A 7B      [10]   99 	ld	hl,#_contadorRocasEspejo + 0
   64DA 36 00         [10]  100 	ld	(hl), #0x00
                            101 ;src/niveles/niveles.c:17: contadorPuertas=0;
   64DC 21 1B 7B      [10]  102 	ld	hl,#_contadorPuertas + 0
   64DF 36 00         [10]  103 	ld	(hl), #0x00
                            104 ;src/niveles/niveles.c:18: contadorColeccionables=0;
   64E1 21 1C 7B      [10]  105 	ld	hl,#_contadorColeccionables + 0
   64E4 36 00         [10]  106 	ld	(hl), #0x00
   64E6 C9            [10]  107 	ret
                            108 ;src/niveles/niveles.c:22: void crearNivel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables,u8* posicion,u8 nivel){
                            109 ;	---------------------------------
                            110 ; Function crearNivel
                            111 ; ---------------------------------
   64E7                     112 _crearNivel::
   64E7 DD E5         [15]  113 	push	ix
   64E9 DD 21 00 00   [14]  114 	ld	ix,#0
   64ED DD 39         [15]  115 	add	ix,sp
                            116 ;src/niveles/niveles.c:23: resetLevel(player,rocas,rocasEspejo,puertas,portales,coleccionables);    
   64EF DD 6E 0E      [19]  117 	ld	l,14 (ix)
   64F2 DD 66 0F      [19]  118 	ld	h,15 (ix)
   64F5 E5            [11]  119 	push	hl
   64F6 DD 6E 0C      [19]  120 	ld	l,12 (ix)
   64F9 DD 66 0D      [19]  121 	ld	h,13 (ix)
   64FC E5            [11]  122 	push	hl
   64FD DD 6E 0A      [19]  123 	ld	l,10 (ix)
   6500 DD 66 0B      [19]  124 	ld	h,11 (ix)
   6503 E5            [11]  125 	push	hl
   6504 DD 6E 08      [19]  126 	ld	l,8 (ix)
   6507 DD 66 09      [19]  127 	ld	h,9 (ix)
   650A E5            [11]  128 	push	hl
   650B DD 6E 06      [19]  129 	ld	l,6 (ix)
   650E DD 66 07      [19]  130 	ld	h,7 (ix)
   6511 E5            [11]  131 	push	hl
   6512 DD 6E 04      [19]  132 	ld	l,4 (ix)
   6515 DD 66 05      [19]  133 	ld	h,5 (ix)
   6518 E5            [11]  134 	push	hl
   6519 CD 6B 65      [17]  135 	call	_resetLevel
   651C 21 0C 00      [10]  136 	ld	hl, #12
   651F 39            [11]  137 	add	hl, sp
   6520 F9            [ 6]  138 	ld	sp, hl
                            139 ;src/niveles/niveles.c:24: niveles[nivel](player,rocas,rocasEspejo,puertas,portales,coleccionables,posicion);
   6521 01 B5 7A      [10]  140 	ld	bc, #_niveles+0
   6524 DD 6E 12      [19]  141 	ld	l, 18 (ix)
   6527 26 00         [ 7]  142 	ld	h, #0x00
   6529 29            [11]  143 	add	hl, hl
   652A 09            [11]  144 	add	hl, bc
   652B 4E            [ 7]  145 	ld	c, (hl)
   652C 23            [ 6]  146 	inc	hl
   652D 66            [ 7]  147 	ld	h, (hl)
   652E DD 5E 10      [19]  148 	ld	e,16 (ix)
   6531 DD 56 11      [19]  149 	ld	d,17 (ix)
   6534 D5            [11]  150 	push	de
   6535 DD 5E 0E      [19]  151 	ld	e,14 (ix)
   6538 DD 56 0F      [19]  152 	ld	d,15 (ix)
   653B D5            [11]  153 	push	de
   653C DD 5E 0C      [19]  154 	ld	e,12 (ix)
   653F DD 56 0D      [19]  155 	ld	d,13 (ix)
   6542 D5            [11]  156 	push	de
   6543 DD 5E 0A      [19]  157 	ld	e,10 (ix)
   6546 DD 56 0B      [19]  158 	ld	d,11 (ix)
   6549 D5            [11]  159 	push	de
   654A DD 5E 08      [19]  160 	ld	e,8 (ix)
   654D DD 56 09      [19]  161 	ld	d,9 (ix)
   6550 D5            [11]  162 	push	de
   6551 DD 5E 06      [19]  163 	ld	e,6 (ix)
   6554 DD 56 07      [19]  164 	ld	d,7 (ix)
   6557 D5            [11]  165 	push	de
   6558 DD 5E 04      [19]  166 	ld	e,4 (ix)
   655B DD 56 05      [19]  167 	ld	d,5 (ix)
   655E D5            [11]  168 	push	de
   655F 69            [ 4]  169 	ld	l, c
   6560 CD B5 75      [17]  170 	call	___sdcc_call_hl
   6563 21 0E 00      [10]  171 	ld	hl, #14
   6566 39            [11]  172 	add	hl, sp
   6567 F9            [ 6]  173 	ld	sp, hl
   6568 DD E1         [14]  174 	pop	ix
   656A C9            [10]  175 	ret
                            176 ;src/niveles/niveles.c:28: void resetLevel(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* coleccionables){
                            177 ;	---------------------------------
                            178 ; Function resetLevel
                            179 ; ---------------------------------
   656B                     180 _resetLevel::
   656B DD E5         [15]  181 	push	ix
   656D DD 21 00 00   [14]  182 	ld	ix,#0
   6571 DD 39         [15]  183 	add	ix,sp
                            184 ;src/niveles/niveles.c:29: player->posx=0;
   6573 DD 4E 04      [19]  185 	ld	c,4 (ix)
   6576 DD 46 05      [19]  186 	ld	b,5 (ix)
   6579 03            [ 6]  187 	inc	bc
   657A AF            [ 4]  188 	xor	a, a
   657B 02            [ 7]  189 	ld	(bc), a
                            190 ;src/niveles/niveles.c:30: for(u8 i =0;i<RocasMaximas;i++){
   657C 0E 00         [ 7]  191 	ld	c, #0x00
   657E                     192 00106$:
   657E 79            [ 4]  193 	ld	a, c
   657F D6 28         [ 7]  194 	sub	a, #0x28
   6581 30 16         [12]  195 	jr	NC,00101$
                            196 ;src/niveles/niveles.c:31: rocas[i].posx=0; 
   6583 06 00         [ 7]  197 	ld	b,#0x00
   6585 69            [ 4]  198 	ld	l, c
   6586 60            [ 4]  199 	ld	h, b
   6587 29            [11]  200 	add	hl, hl
   6588 09            [11]  201 	add	hl, bc
   6589 29            [11]  202 	add	hl, hl
   658A 09            [11]  203 	add	hl, bc
   658B EB            [ 4]  204 	ex	de,hl
   658C DD 6E 06      [19]  205 	ld	l,6 (ix)
   658F DD 66 07      [19]  206 	ld	h,7 (ix)
   6592 19            [11]  207 	add	hl, de
   6593 23            [ 6]  208 	inc	hl
   6594 36 00         [10]  209 	ld	(hl), #0x00
                            210 ;src/niveles/niveles.c:30: for(u8 i =0;i<RocasMaximas;i++){
   6596 0C            [ 4]  211 	inc	c
   6597 18 E5         [12]  212 	jr	00106$
   6599                     213 00101$:
                            214 ;src/niveles/niveles.c:33: for(u8 i =0;i<RocasMaximas;i++){
   6599 0E 00         [ 7]  215 	ld	c, #0x00
   659B                     216 00109$:
   659B 79            [ 4]  217 	ld	a, c
   659C D6 28         [ 7]  218 	sub	a, #0x28
   659E 30 16         [12]  219 	jr	NC,00102$
                            220 ;src/niveles/niveles.c:34: rocasEspejo[i].posx=0; 
   65A0 06 00         [ 7]  221 	ld	b,#0x00
   65A2 69            [ 4]  222 	ld	l, c
   65A3 60            [ 4]  223 	ld	h, b
   65A4 29            [11]  224 	add	hl, hl
   65A5 09            [11]  225 	add	hl, bc
   65A6 29            [11]  226 	add	hl, hl
   65A7 09            [11]  227 	add	hl, bc
   65A8 EB            [ 4]  228 	ex	de,hl
   65A9 DD 6E 08      [19]  229 	ld	l,8 (ix)
   65AC DD 66 09      [19]  230 	ld	h,9 (ix)
   65AF 19            [11]  231 	add	hl, de
   65B0 23            [ 6]  232 	inc	hl
   65B1 36 00         [10]  233 	ld	(hl), #0x00
                            234 ;src/niveles/niveles.c:33: for(u8 i =0;i<RocasMaximas;i++){
   65B3 0C            [ 4]  235 	inc	c
   65B4 18 E5         [12]  236 	jr	00109$
   65B6                     237 00102$:
                            238 ;src/niveles/niveles.c:36: for(u8 i =0;i<PuertasMaximas;i++){
   65B6 0E 00         [ 7]  239 	ld	c, #0x00
   65B8                     240 00112$:
   65B8 79            [ 4]  241 	ld	a, c
   65B9 D6 03         [ 7]  242 	sub	a, #0x03
   65BB 30 16         [12]  243 	jr	NC,00103$
                            244 ;src/niveles/niveles.c:37: puertas[i].posx=0; 
   65BD 06 00         [ 7]  245 	ld	b,#0x00
   65BF 69            [ 4]  246 	ld	l, c
   65C0 60            [ 4]  247 	ld	h, b
   65C1 29            [11]  248 	add	hl, hl
   65C2 09            [11]  249 	add	hl, bc
   65C3 29            [11]  250 	add	hl, hl
   65C4 09            [11]  251 	add	hl, bc
   65C5 EB            [ 4]  252 	ex	de,hl
   65C6 DD 6E 0A      [19]  253 	ld	l,10 (ix)
   65C9 DD 66 0B      [19]  254 	ld	h,11 (ix)
   65CC 19            [11]  255 	add	hl, de
   65CD 23            [ 6]  256 	inc	hl
   65CE 36 00         [10]  257 	ld	(hl), #0x00
                            258 ;src/niveles/niveles.c:36: for(u8 i =0;i<PuertasMaximas;i++){
   65D0 0C            [ 4]  259 	inc	c
   65D1 18 E5         [12]  260 	jr	00112$
   65D3                     261 00103$:
                            262 ;src/niveles/niveles.c:39: portales[0].posx=0;
   65D3 DD 4E 0C      [19]  263 	ld	c,12 (ix)
   65D6 DD 46 0D      [19]  264 	ld	b,13 (ix)
   65D9 59            [ 4]  265 	ld	e, c
   65DA 50            [ 4]  266 	ld	d, b
   65DB 13            [ 6]  267 	inc	de
   65DC AF            [ 4]  268 	xor	a, a
   65DD 12            [ 7]  269 	ld	(de), a
                            270 ;src/niveles/niveles.c:40: portales[1].posx=0;
   65DE 21 08 00      [10]  271 	ld	hl, #0x0008
   65E1 09            [11]  272 	add	hl, bc
   65E2 36 00         [10]  273 	ld	(hl), #0x00
                            274 ;src/niveles/niveles.c:42: for(u8 i =0;i<ColeccionablesMaximos;i++){
   65E4 0E 00         [ 7]  275 	ld	c, #0x00
   65E6                     276 00115$:
   65E6 79            [ 4]  277 	ld	a, c
   65E7 D6 03         [ 7]  278 	sub	a, #0x03
   65E9 30 13         [12]  279 	jr	NC,00104$
                            280 ;src/niveles/niveles.c:43: coleccionables[i].posx=0; 
   65EB 69            [ 4]  281 	ld	l, c
   65EC 26 00         [ 7]  282 	ld	h, #0x00
   65EE 29            [11]  283 	add	hl, hl
   65EF 29            [11]  284 	add	hl, hl
   65F0 EB            [ 4]  285 	ex	de,hl
   65F1 DD 6E 0E      [19]  286 	ld	l,14 (ix)
   65F4 DD 66 0F      [19]  287 	ld	h,15 (ix)
   65F7 19            [11]  288 	add	hl, de
   65F8 23            [ 6]  289 	inc	hl
   65F9 36 00         [10]  290 	ld	(hl), #0x00
                            291 ;src/niveles/niveles.c:42: for(u8 i =0;i<ColeccionablesMaximos;i++){
   65FB 0C            [ 4]  292 	inc	c
   65FC 18 E8         [12]  293 	jr	00115$
   65FE                     294 00104$:
                            295 ;src/niveles/niveles.c:46: contadorRocas=0;
   65FE 21 19 7B      [10]  296 	ld	hl,#_contadorRocas + 0
   6601 36 00         [10]  297 	ld	(hl), #0x00
                            298 ;src/niveles/niveles.c:47: contadorRocasEspejo=0;
   6603 21 1A 7B      [10]  299 	ld	hl,#_contadorRocasEspejo + 0
   6606 36 00         [10]  300 	ld	(hl), #0x00
                            301 ;src/niveles/niveles.c:48: contadorPuertas=0;
   6608 21 1B 7B      [10]  302 	ld	hl,#_contadorPuertas + 0
   660B 36 00         [10]  303 	ld	(hl), #0x00
                            304 ;src/niveles/niveles.c:49: contadorColeccionables=0;
   660D 21 1C 7B      [10]  305 	ld	hl,#_contadorColeccionables + 0
   6610 36 00         [10]  306 	ld	(hl), #0x00
   6612 DD E1         [14]  307 	pop	ix
   6614 C9            [10]  308 	ret
                            309 ;src/niveles/niveles.c:52: void createMarco(u8 hay){
                            310 ;	---------------------------------
                            311 ; Function createMarco
                            312 ; ---------------------------------
   6615                     313 _createMarco::
                            314 ;src/niveles/niveles.c:53: if (hay==si){
   6615 21 02 00      [10]  315 	ld	hl, #2+0
   6618 39            [11]  316 	add	hl, sp
   6619 7E            [ 7]  317 	ld	a, (hl)
   661A B7            [ 4]  318 	or	a, a
   661B C0            [11]  319 	ret	NZ
                            320 ;src/niveles/niveles.c:54: crearMapa(0);  
   661C AF            [ 4]  321 	xor	a, a
   661D F5            [11]  322 	push	af
   661E 33            [ 6]  323 	inc	sp
   661F CD 59 62      [17]  324 	call	_crearMapa
   6622 33            [ 6]  325 	inc	sp
   6623 C9            [10]  326 	ret
                            327 ;src/niveles/niveles.c:59: void createPlayer(TGameObject* player,u8 posx, u8 posy,u8* posicion){
                            328 ;	---------------------------------
                            329 ; Function createPlayer
                            330 ; ---------------------------------
   6624                     331 _createPlayer::
                            332 ;src/niveles/niveles.c:61: *posicion=posicion_Izquieda;
   6624 21 06 00      [10]  333 	ld	hl, #6
   6627 39            [11]  334 	add	hl, sp
   6628 4E            [ 7]  335 	ld	c, (hl)
   6629 23            [ 6]  336 	inc	hl
   662A 46            [ 7]  337 	ld	b, (hl)
                            338 ;src/niveles/niveles.c:60: if(posx<9){
   662B 21 04 00      [10]  339 	ld	hl, #4+0
   662E 39            [11]  340 	add	hl, sp
   662F 7E            [ 7]  341 	ld	a, (hl)
   6630 D6 09         [ 7]  342 	sub	a, #0x09
   6632 30 04         [12]  343 	jr	NC,00102$
                            344 ;src/niveles/niveles.c:61: *posicion=posicion_Izquieda;
   6634 AF            [ 4]  345 	xor	a, a
   6635 02            [ 7]  346 	ld	(bc), a
   6636 18 03         [12]  347 	jr	00103$
   6638                     348 00102$:
                            349 ;src/niveles/niveles.c:63: *posicion=posicion_Derecha;        
   6638 3E 01         [ 7]  350 	ld	a, #0x01
   663A 02            [ 7]  351 	ld	(bc), a
   663B                     352 00103$:
                            353 ;src/niveles/niveles.c:65: player->num=-1;
   663B D1            [10]  354 	pop	de
   663C C1            [10]  355 	pop	bc
   663D C5            [11]  356 	push	bc
   663E D5            [11]  357 	push	de
   663F 3E FF         [ 7]  358 	ld	a, #0xff
   6641 02            [ 7]  359 	ld	(bc), a
                            360 ;src/niveles/niveles.c:66: player->posx=posx;
   6642 59            [ 4]  361 	ld	e, c
   6643 50            [ 4]  362 	ld	d, b
   6644 13            [ 6]  363 	inc	de
   6645 21 04 00      [10]  364 	ld	hl, #4+0
   6648 39            [11]  365 	add	hl, sp
   6649 7E            [ 7]  366 	ld	a, (hl)
   664A 12            [ 7]  367 	ld	(de), a
                            368 ;src/niveles/niveles.c:67: player->posy=posy;   
   664B 59            [ 4]  369 	ld	e, c
   664C 50            [ 4]  370 	ld	d, b
   664D 13            [ 6]  371 	inc	de
   664E 13            [ 6]  372 	inc	de
   664F 21 05 00      [10]  373 	ld	hl, #5+0
   6652 39            [11]  374 	add	hl, sp
   6653 7E            [ 7]  375 	ld	a, (hl)
   6654 12            [ 7]  376 	ld	(de), a
                            377 ;src/niveles/niveles.c:68: player->sprite=sprite_Player;
   6655 69            [ 4]  378 	ld	l, c
   6656 60            [ 4]  379 	ld	h, b
   6657 23            [ 6]  380 	inc	hl
   6658 23            [ 6]  381 	inc	hl
   6659 23            [ 6]  382 	inc	hl
   665A 36 01         [10]  383 	ld	(hl), #0x01
                            384 ;src/niveles/niveles.c:69: player->movimiento=mover_1;
   665C 21 04 00      [10]  385 	ld	hl, #0x0004
   665F 09            [11]  386 	add	hl, bc
   6660 36 01         [10]  387 	ld	(hl), #0x01
   6662 C9            [10]  388 	ret
                            389 ;src/niveles/niveles.c:71: void createRoca(TGameObject* rocas,TGameObject* rocasEspejo,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria,u8 simetrico){
                            390 ;	---------------------------------
                            391 ; Function createRoca
                            392 ; ---------------------------------
   6663                     393 _createRoca::
   6663 DD E5         [15]  394 	push	ix
   6665 DD 21 00 00   [14]  395 	ld	ix,#0
   6669 DD 39         [15]  396 	add	ix,sp
                            397 ;src/niveles/niveles.c:72: rocas[contadorRocas].num=simetria;
   666B ED 4B 19 7B   [20]  398 	ld	bc, (_contadorRocas)
   666F 06 00         [ 7]  399 	ld	b, #0x00
   6671 69            [ 4]  400 	ld	l, c
   6672 60            [ 4]  401 	ld	h, b
   6673 29            [11]  402 	add	hl, hl
   6674 09            [11]  403 	add	hl, bc
   6675 29            [11]  404 	add	hl, hl
   6676 09            [11]  405 	add	hl, bc
   6677 4D            [ 4]  406 	ld	c, l
   6678 44            [ 4]  407 	ld	b, h
   6679 DD 6E 04      [19]  408 	ld	l,4 (ix)
   667C DD 66 05      [19]  409 	ld	h,5 (ix)
   667F 09            [11]  410 	add	hl, bc
   6680 DD 7E 0C      [19]  411 	ld	a, 12 (ix)
   6683 77            [ 7]  412 	ld	(hl), a
                            413 ;src/niveles/niveles.c:73: rocas[contadorRocas].posx=posx;
   6684 ED 4B 19 7B   [20]  414 	ld	bc, (_contadorRocas)
   6688 06 00         [ 7]  415 	ld	b, #0x00
   668A 69            [ 4]  416 	ld	l, c
   668B 60            [ 4]  417 	ld	h, b
   668C 29            [11]  418 	add	hl, hl
   668D 09            [11]  419 	add	hl, bc
   668E 29            [11]  420 	add	hl, hl
   668F 09            [11]  421 	add	hl, bc
   6690 4D            [ 4]  422 	ld	c, l
   6691 44            [ 4]  423 	ld	b, h
   6692 DD 6E 04      [19]  424 	ld	l,4 (ix)
   6695 DD 66 05      [19]  425 	ld	h,5 (ix)
   6698 09            [11]  426 	add	hl, bc
   6699 23            [ 6]  427 	inc	hl
   669A DD 7E 08      [19]  428 	ld	a, 8 (ix)
   669D 77            [ 7]  429 	ld	(hl), a
                            430 ;src/niveles/niveles.c:74: rocas[contadorRocas].posy=posy;
   669E ED 4B 19 7B   [20]  431 	ld	bc, (_contadorRocas)
   66A2 06 00         [ 7]  432 	ld	b, #0x00
   66A4 69            [ 4]  433 	ld	l, c
   66A5 60            [ 4]  434 	ld	h, b
   66A6 29            [11]  435 	add	hl, hl
   66A7 09            [11]  436 	add	hl, bc
   66A8 29            [11]  437 	add	hl, hl
   66A9 09            [11]  438 	add	hl, bc
   66AA 4D            [ 4]  439 	ld	c, l
   66AB 44            [ 4]  440 	ld	b, h
   66AC DD 6E 04      [19]  441 	ld	l,4 (ix)
   66AF DD 66 05      [19]  442 	ld	h,5 (ix)
   66B2 09            [11]  443 	add	hl, bc
   66B3 23            [ 6]  444 	inc	hl
   66B4 23            [ 6]  445 	inc	hl
   66B5 DD 7E 09      [19]  446 	ld	a, 9 (ix)
   66B8 77            [ 7]  447 	ld	(hl), a
                            448 ;src/niveles/niveles.c:75: rocas[contadorRocas].sprite=sprite;
   66B9 ED 4B 19 7B   [20]  449 	ld	bc, (_contadorRocas)
   66BD 06 00         [ 7]  450 	ld	b, #0x00
   66BF 69            [ 4]  451 	ld	l, c
   66C0 60            [ 4]  452 	ld	h, b
   66C1 29            [11]  453 	add	hl, hl
   66C2 09            [11]  454 	add	hl, bc
   66C3 29            [11]  455 	add	hl, hl
   66C4 09            [11]  456 	add	hl, bc
   66C5 4D            [ 4]  457 	ld	c, l
   66C6 44            [ 4]  458 	ld	b, h
   66C7 DD 6E 04      [19]  459 	ld	l,4 (ix)
   66CA DD 66 05      [19]  460 	ld	h,5 (ix)
   66CD 09            [11]  461 	add	hl, bc
   66CE 23            [ 6]  462 	inc	hl
   66CF 23            [ 6]  463 	inc	hl
   66D0 23            [ 6]  464 	inc	hl
   66D1 DD 7E 0B      [19]  465 	ld	a, 11 (ix)
   66D4 77            [ 7]  466 	ld	(hl), a
                            467 ;src/niveles/niveles.c:76: rocas[contadorRocas].movimiento=mivimiento;
   66D5 ED 4B 19 7B   [20]  468 	ld	bc, (_contadorRocas)
   66D9 06 00         [ 7]  469 	ld	b, #0x00
   66DB 69            [ 4]  470 	ld	l, c
   66DC 60            [ 4]  471 	ld	h, b
   66DD 29            [11]  472 	add	hl, hl
   66DE 09            [11]  473 	add	hl, bc
   66DF 29            [11]  474 	add	hl, hl
   66E0 09            [11]  475 	add	hl, bc
   66E1 4D            [ 4]  476 	ld	c, l
   66E2 44            [ 4]  477 	ld	b, h
   66E3 DD 6E 04      [19]  478 	ld	l,4 (ix)
   66E6 DD 66 05      [19]  479 	ld	h,5 (ix)
   66E9 09            [11]  480 	add	hl, bc
   66EA 01 04 00      [10]  481 	ld	bc, #0x0004
   66ED 09            [11]  482 	add	hl, bc
   66EE DD 7E 0A      [19]  483 	ld	a, 10 (ix)
   66F1 77            [ 7]  484 	ld	(hl), a
                            485 ;src/niveles/niveles.c:77: contadorRocas++;
   66F2 21 19 7B      [10]  486 	ld	hl, #_contadorRocas+0
   66F5 34            [11]  487 	inc	(hl)
                            488 ;src/niveles/niveles.c:78: if(simetrico==si){
   66F6 DD 7E 0D      [19]  489 	ld	a, 13 (ix)
   66F9 B7            [ 4]  490 	or	a, a
   66FA C2 86 67      [10]  491 	jp	NZ, 00103$
                            492 ;src/niveles/niveles.c:79: rocasEspejo[contadorRocas].num=simetria;
   66FD ED 4B 19 7B   [20]  493 	ld	bc, (_contadorRocas)
   6701 06 00         [ 7]  494 	ld	b, #0x00
   6703 69            [ 4]  495 	ld	l, c
   6704 60            [ 4]  496 	ld	h, b
   6705 29            [11]  497 	add	hl, hl
   6706 09            [11]  498 	add	hl, bc
   6707 29            [11]  499 	add	hl, hl
   6708 09            [11]  500 	add	hl, bc
   6709 4D            [ 4]  501 	ld	c, l
   670A 44            [ 4]  502 	ld	b, h
   670B DD 6E 06      [19]  503 	ld	l,6 (ix)
   670E DD 66 07      [19]  504 	ld	h,7 (ix)
   6711 09            [11]  505 	add	hl, bc
   6712 DD 7E 0C      [19]  506 	ld	a, 12 (ix)
   6715 77            [ 7]  507 	ld	(hl), a
                            508 ;src/niveles/niveles.c:80: rocasEspejo[contadorRocas].posx=16-posx;
   6716 ED 4B 19 7B   [20]  509 	ld	bc, (_contadorRocas)
   671A 06 00         [ 7]  510 	ld	b, #0x00
   671C 69            [ 4]  511 	ld	l, c
   671D 60            [ 4]  512 	ld	h, b
   671E 29            [11]  513 	add	hl, hl
   671F 09            [11]  514 	add	hl, bc
   6720 29            [11]  515 	add	hl, hl
   6721 09            [11]  516 	add	hl, bc
   6722 4D            [ 4]  517 	ld	c, l
   6723 44            [ 4]  518 	ld	b, h
   6724 DD 6E 06      [19]  519 	ld	l,6 (ix)
   6727 DD 66 07      [19]  520 	ld	h,7 (ix)
   672A 09            [11]  521 	add	hl, bc
   672B 23            [ 6]  522 	inc	hl
   672C 3E 10         [ 7]  523 	ld	a, #0x10
   672E DD 96 08      [19]  524 	sub	a, 8 (ix)
   6731 77            [ 7]  525 	ld	(hl), a
                            526 ;src/niveles/niveles.c:81: rocasEspejo[contadorRocas].posy=posy;
   6732 ED 4B 19 7B   [20]  527 	ld	bc, (_contadorRocas)
   6736 06 00         [ 7]  528 	ld	b, #0x00
   6738 69            [ 4]  529 	ld	l, c
   6739 60            [ 4]  530 	ld	h, b
   673A 29            [11]  531 	add	hl, hl
   673B 09            [11]  532 	add	hl, bc
   673C 29            [11]  533 	add	hl, hl
   673D 09            [11]  534 	add	hl, bc
   673E 4D            [ 4]  535 	ld	c, l
   673F 44            [ 4]  536 	ld	b, h
   6740 DD 6E 06      [19]  537 	ld	l,6 (ix)
   6743 DD 66 07      [19]  538 	ld	h,7 (ix)
   6746 09            [11]  539 	add	hl, bc
   6747 23            [ 6]  540 	inc	hl
   6748 23            [ 6]  541 	inc	hl
   6749 DD 7E 09      [19]  542 	ld	a, 9 (ix)
   674C 77            [ 7]  543 	ld	(hl), a
                            544 ;src/niveles/niveles.c:82: rocasEspejo[contadorRocas].sprite=sprite;
   674D ED 4B 19 7B   [20]  545 	ld	bc, (_contadorRocas)
   6751 06 00         [ 7]  546 	ld	b, #0x00
   6753 69            [ 4]  547 	ld	l, c
   6754 60            [ 4]  548 	ld	h, b
   6755 29            [11]  549 	add	hl, hl
   6756 09            [11]  550 	add	hl, bc
   6757 29            [11]  551 	add	hl, hl
   6758 09            [11]  552 	add	hl, bc
   6759 4D            [ 4]  553 	ld	c, l
   675A 44            [ 4]  554 	ld	b, h
   675B DD 6E 06      [19]  555 	ld	l,6 (ix)
   675E DD 66 07      [19]  556 	ld	h,7 (ix)
   6761 09            [11]  557 	add	hl, bc
   6762 23            [ 6]  558 	inc	hl
   6763 23            [ 6]  559 	inc	hl
   6764 23            [ 6]  560 	inc	hl
   6765 DD 7E 0B      [19]  561 	ld	a, 11 (ix)
   6768 77            [ 7]  562 	ld	(hl), a
                            563 ;src/niveles/niveles.c:83: rocasEspejo[contadorRocas].movimiento=mivimiento;
   6769 ED 4B 19 7B   [20]  564 	ld	bc, (_contadorRocas)
   676D 06 00         [ 7]  565 	ld	b, #0x00
   676F 69            [ 4]  566 	ld	l, c
   6770 60            [ 4]  567 	ld	h, b
   6771 29            [11]  568 	add	hl, hl
   6772 09            [11]  569 	add	hl, bc
   6773 29            [11]  570 	add	hl, hl
   6774 09            [11]  571 	add	hl, bc
   6775 4D            [ 4]  572 	ld	c, l
   6776 44            [ 4]  573 	ld	b, h
   6777 DD 6E 06      [19]  574 	ld	l,6 (ix)
   677A DD 66 07      [19]  575 	ld	h,7 (ix)
   677D 09            [11]  576 	add	hl, bc
   677E 01 04 00      [10]  577 	ld	bc, #0x0004
   6781 09            [11]  578 	add	hl, bc
   6782 DD 7E 0A      [19]  579 	ld	a, 10 (ix)
   6785 77            [ 7]  580 	ld	(hl), a
   6786                     581 00103$:
   6786 DD E1         [14]  582 	pop	ix
   6788 C9            [10]  583 	ret
                            584 ;src/niveles/niveles.c:86: void createRocaEspejo(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 mivimiento,u8 sprite, u8 simetria){
                            585 ;	---------------------------------
                            586 ; Function createRocaEspejo
                            587 ; ---------------------------------
   6789                     588 _createRocaEspejo::
   6789 DD E5         [15]  589 	push	ix
   678B DD 21 00 00   [14]  590 	ld	ix,#0
   678F DD 39         [15]  591 	add	ix,sp
                            592 ;src/niveles/niveles.c:87: rocasEspejo[contadorRocasEspejo].num=simetria;
   6791 ED 4B 1A 7B   [20]  593 	ld	bc, (_contadorRocasEspejo)
   6795 06 00         [ 7]  594 	ld	b, #0x00
   6797 69            [ 4]  595 	ld	l, c
   6798 60            [ 4]  596 	ld	h, b
   6799 29            [11]  597 	add	hl, hl
   679A 09            [11]  598 	add	hl, bc
   679B 29            [11]  599 	add	hl, hl
   679C 09            [11]  600 	add	hl, bc
   679D 4D            [ 4]  601 	ld	c, l
   679E 44            [ 4]  602 	ld	b, h
   679F DD 6E 04      [19]  603 	ld	l,4 (ix)
   67A2 DD 66 05      [19]  604 	ld	h,5 (ix)
   67A5 09            [11]  605 	add	hl, bc
   67A6 DD 7E 0A      [19]  606 	ld	a, 10 (ix)
   67A9 77            [ 7]  607 	ld	(hl), a
                            608 ;src/niveles/niveles.c:88: rocasEspejo[contadorRocasEspejo].posx=posx;
   67AA ED 4B 1A 7B   [20]  609 	ld	bc, (_contadorRocasEspejo)
   67AE 06 00         [ 7]  610 	ld	b, #0x00
   67B0 69            [ 4]  611 	ld	l, c
   67B1 60            [ 4]  612 	ld	h, b
   67B2 29            [11]  613 	add	hl, hl
   67B3 09            [11]  614 	add	hl, bc
   67B4 29            [11]  615 	add	hl, hl
   67B5 09            [11]  616 	add	hl, bc
   67B6 4D            [ 4]  617 	ld	c, l
   67B7 44            [ 4]  618 	ld	b, h
   67B8 DD 6E 04      [19]  619 	ld	l,4 (ix)
   67BB DD 66 05      [19]  620 	ld	h,5 (ix)
   67BE 09            [11]  621 	add	hl, bc
   67BF 23            [ 6]  622 	inc	hl
   67C0 DD 7E 06      [19]  623 	ld	a, 6 (ix)
   67C3 77            [ 7]  624 	ld	(hl), a
                            625 ;src/niveles/niveles.c:89: rocasEspejo[contadorRocasEspejo].posy=posy;
   67C4 ED 4B 1A 7B   [20]  626 	ld	bc, (_contadorRocasEspejo)
   67C8 06 00         [ 7]  627 	ld	b, #0x00
   67CA 69            [ 4]  628 	ld	l, c
   67CB 60            [ 4]  629 	ld	h, b
   67CC 29            [11]  630 	add	hl, hl
   67CD 09            [11]  631 	add	hl, bc
   67CE 29            [11]  632 	add	hl, hl
   67CF 09            [11]  633 	add	hl, bc
   67D0 4D            [ 4]  634 	ld	c, l
   67D1 44            [ 4]  635 	ld	b, h
   67D2 DD 6E 04      [19]  636 	ld	l,4 (ix)
   67D5 DD 66 05      [19]  637 	ld	h,5 (ix)
   67D8 09            [11]  638 	add	hl, bc
   67D9 23            [ 6]  639 	inc	hl
   67DA 23            [ 6]  640 	inc	hl
   67DB DD 7E 07      [19]  641 	ld	a, 7 (ix)
   67DE 77            [ 7]  642 	ld	(hl), a
                            643 ;src/niveles/niveles.c:90: rocasEspejo[contadorRocasEspejo].sprite=sprite;
   67DF ED 4B 1A 7B   [20]  644 	ld	bc, (_contadorRocasEspejo)
   67E3 06 00         [ 7]  645 	ld	b, #0x00
   67E5 69            [ 4]  646 	ld	l, c
   67E6 60            [ 4]  647 	ld	h, b
   67E7 29            [11]  648 	add	hl, hl
   67E8 09            [11]  649 	add	hl, bc
   67E9 29            [11]  650 	add	hl, hl
   67EA 09            [11]  651 	add	hl, bc
   67EB 4D            [ 4]  652 	ld	c, l
   67EC 44            [ 4]  653 	ld	b, h
   67ED DD 6E 04      [19]  654 	ld	l,4 (ix)
   67F0 DD 66 05      [19]  655 	ld	h,5 (ix)
   67F3 09            [11]  656 	add	hl, bc
   67F4 23            [ 6]  657 	inc	hl
   67F5 23            [ 6]  658 	inc	hl
   67F6 23            [ 6]  659 	inc	hl
   67F7 DD 7E 09      [19]  660 	ld	a, 9 (ix)
   67FA 77            [ 7]  661 	ld	(hl), a
                            662 ;src/niveles/niveles.c:91: rocasEspejo[contadorRocasEspejo].movimiento=mivimiento;
   67FB ED 4B 1A 7B   [20]  663 	ld	bc, (_contadorRocasEspejo)
   67FF 06 00         [ 7]  664 	ld	b, #0x00
   6801 69            [ 4]  665 	ld	l, c
   6802 60            [ 4]  666 	ld	h, b
   6803 29            [11]  667 	add	hl, hl
   6804 09            [11]  668 	add	hl, bc
   6805 29            [11]  669 	add	hl, hl
   6806 09            [11]  670 	add	hl, bc
   6807 4D            [ 4]  671 	ld	c, l
   6808 44            [ 4]  672 	ld	b, h
   6809 DD 6E 04      [19]  673 	ld	l,4 (ix)
   680C DD 66 05      [19]  674 	ld	h,5 (ix)
   680F 09            [11]  675 	add	hl, bc
   6810 01 04 00      [10]  676 	ld	bc, #0x0004
   6813 09            [11]  677 	add	hl, bc
   6814 DD 7E 08      [19]  678 	ld	a, 8 (ix)
   6817 77            [ 7]  679 	ld	(hl), a
                            680 ;src/niveles/niveles.c:92: contadorRocasEspejo++;
   6818 21 1A 7B      [10]  681 	ld	hl, #_contadorRocasEspejo+0
   681B 34            [11]  682 	inc	(hl)
   681C DD E1         [14]  683 	pop	ix
   681E C9            [10]  684 	ret
                            685 ;src/niveles/niveles.c:94: void createPuerta(TGameObject* puertas,u8 posx,u8 posy,u8 sprite,u8 nivel){
                            686 ;	---------------------------------
                            687 ; Function createPuerta
                            688 ; ---------------------------------
   681F                     689 _createPuerta::
   681F DD E5         [15]  690 	push	ix
   6821 DD 21 00 00   [14]  691 	ld	ix,#0
   6825 DD 39         [15]  692 	add	ix,sp
                            693 ;src/niveles/niveles.c:95: puertas[contadorPuertas].num=nivel;
   6827 ED 4B 1B 7B   [20]  694 	ld	bc, (_contadorPuertas)
   682B 06 00         [ 7]  695 	ld	b, #0x00
   682D 69            [ 4]  696 	ld	l, c
   682E 60            [ 4]  697 	ld	h, b
   682F 29            [11]  698 	add	hl, hl
   6830 09            [11]  699 	add	hl, bc
   6831 29            [11]  700 	add	hl, hl
   6832 09            [11]  701 	add	hl, bc
   6833 4D            [ 4]  702 	ld	c, l
   6834 44            [ 4]  703 	ld	b, h
   6835 DD 6E 04      [19]  704 	ld	l,4 (ix)
   6838 DD 66 05      [19]  705 	ld	h,5 (ix)
   683B 09            [11]  706 	add	hl, bc
   683C DD 7E 09      [19]  707 	ld	a, 9 (ix)
   683F 77            [ 7]  708 	ld	(hl), a
                            709 ;src/niveles/niveles.c:96: puertas[contadorPuertas].posx=posx;
   6840 ED 4B 1B 7B   [20]  710 	ld	bc, (_contadorPuertas)
   6844 06 00         [ 7]  711 	ld	b, #0x00
   6846 69            [ 4]  712 	ld	l, c
   6847 60            [ 4]  713 	ld	h, b
   6848 29            [11]  714 	add	hl, hl
   6849 09            [11]  715 	add	hl, bc
   684A 29            [11]  716 	add	hl, hl
   684B 09            [11]  717 	add	hl, bc
   684C 4D            [ 4]  718 	ld	c, l
   684D 44            [ 4]  719 	ld	b, h
   684E DD 6E 04      [19]  720 	ld	l,4 (ix)
   6851 DD 66 05      [19]  721 	ld	h,5 (ix)
   6854 09            [11]  722 	add	hl, bc
   6855 23            [ 6]  723 	inc	hl
   6856 DD 7E 06      [19]  724 	ld	a, 6 (ix)
   6859 77            [ 7]  725 	ld	(hl), a
                            726 ;src/niveles/niveles.c:97: puertas[contadorPuertas].posy=posy;
   685A ED 4B 1B 7B   [20]  727 	ld	bc, (_contadorPuertas)
   685E 06 00         [ 7]  728 	ld	b, #0x00
   6860 69            [ 4]  729 	ld	l, c
   6861 60            [ 4]  730 	ld	h, b
   6862 29            [11]  731 	add	hl, hl
   6863 09            [11]  732 	add	hl, bc
   6864 29            [11]  733 	add	hl, hl
   6865 09            [11]  734 	add	hl, bc
   6866 4D            [ 4]  735 	ld	c, l
   6867 44            [ 4]  736 	ld	b, h
   6868 DD 6E 04      [19]  737 	ld	l,4 (ix)
   686B DD 66 05      [19]  738 	ld	h,5 (ix)
   686E 09            [11]  739 	add	hl, bc
   686F 23            [ 6]  740 	inc	hl
   6870 23            [ 6]  741 	inc	hl
   6871 DD 7E 07      [19]  742 	ld	a, 7 (ix)
   6874 77            [ 7]  743 	ld	(hl), a
                            744 ;src/niveles/niveles.c:98: puertas[contadorPuertas].sprite=sprite;
   6875 ED 4B 1B 7B   [20]  745 	ld	bc, (_contadorPuertas)
   6879 06 00         [ 7]  746 	ld	b, #0x00
   687B 69            [ 4]  747 	ld	l, c
   687C 60            [ 4]  748 	ld	h, b
   687D 29            [11]  749 	add	hl, hl
   687E 09            [11]  750 	add	hl, bc
   687F 29            [11]  751 	add	hl, hl
   6880 09            [11]  752 	add	hl, bc
   6881 4D            [ 4]  753 	ld	c, l
   6882 44            [ 4]  754 	ld	b, h
   6883 DD 6E 04      [19]  755 	ld	l,4 (ix)
   6886 DD 66 05      [19]  756 	ld	h,5 (ix)
   6889 09            [11]  757 	add	hl, bc
   688A 23            [ 6]  758 	inc	hl
   688B 23            [ 6]  759 	inc	hl
   688C 23            [ 6]  760 	inc	hl
   688D DD 7E 08      [19]  761 	ld	a, 8 (ix)
   6890 77            [ 7]  762 	ld	(hl), a
                            763 ;src/niveles/niveles.c:99: contadorPuertas++;
   6891 21 1B 7B      [10]  764 	ld	hl, #_contadorPuertas+0
   6894 34            [11]  765 	inc	(hl)
   6895 DD E1         [14]  766 	pop	ix
   6897 C9            [10]  767 	ret
                            768 ;src/niveles/niveles.c:101: void createPortal(TGameObject* portal,TGameObject* roca,TGameObject* rocasEspejo,u8 hay){
                            769 ;	---------------------------------
                            770 ; Function createPortal
                            771 ; ---------------------------------
   6898                     772 _createPortal::
                            773 ;src/niveles/niveles.c:102: if(hay==si){
   6898 21 08 00      [10]  774 	ld	hl, #8+0
   689B 39            [11]  775 	add	hl, sp
   689C 7E            [ 7]  776 	ld	a, (hl)
   689D B7            [ 4]  777 	or	a, a
   689E C0            [11]  778 	ret	NZ
                            779 ;src/niveles/niveles.c:103: portal[0].posx=7;
   689F D1            [10]  780 	pop	de
   68A0 C1            [10]  781 	pop	bc
   68A1 C5            [11]  782 	push	bc
   68A2 D5            [11]  783 	push	de
   68A3 69            [ 4]  784 	ld	l, c
   68A4 60            [ 4]  785 	ld	h, b
   68A5 23            [ 6]  786 	inc	hl
   68A6 36 07         [10]  787 	ld	(hl), #0x07
                            788 ;src/niveles/niveles.c:104: portal[0].posy=4;
   68A8 69            [ 4]  789 	ld	l, c
   68A9 60            [ 4]  790 	ld	h, b
   68AA 23            [ 6]  791 	inc	hl
   68AB 23            [ 6]  792 	inc	hl
   68AC 36 04         [10]  793 	ld	(hl), #0x04
                            794 ;src/niveles/niveles.c:105: portal[0].sprite=sprite_PuertaPortal_G;
   68AE 69            [ 4]  795 	ld	l, c
   68AF 60            [ 4]  796 	ld	h, b
   68B0 23            [ 6]  797 	inc	hl
   68B1 23            [ 6]  798 	inc	hl
   68B2 23            [ 6]  799 	inc	hl
   68B3 36 10         [10]  800 	ld	(hl), #0x10
                            801 ;src/niveles/niveles.c:107: portal[1].posx=9;
   68B5 21 08 00      [10]  802 	ld	hl, #0x0008
   68B8 09            [11]  803 	add	hl, bc
   68B9 36 09         [10]  804 	ld	(hl), #0x09
                            805 ;src/niveles/niveles.c:108: portal[1].posy=4;
   68BB 21 09 00      [10]  806 	ld	hl, #0x0009
   68BE 09            [11]  807 	add	hl, bc
   68BF 36 04         [10]  808 	ld	(hl), #0x04
                            809 ;src/niveles/niveles.c:109: portal[1].sprite=sprite_PuertaPortal_B;
   68C1 21 0A 00      [10]  810 	ld	hl, #0x000a
   68C4 09            [11]  811 	add	hl, bc
   68C5 36 11         [10]  812 	ld	(hl), #0x11
                            813 ;src/niveles/niveles.c:110: createRoca(roca,rocasEspejo,8,4,sin_Movimiento,sprite_PortalMuro,1,no);
   68C7 21 01 01      [10]  814 	ld	hl, #0x0101
   68CA E5            [11]  815 	push	hl
   68CB 21 00 0F      [10]  816 	ld	hl, #0x0f00
   68CE E5            [11]  817 	push	hl
   68CF 21 08 04      [10]  818 	ld	hl, #0x0408
   68D2 E5            [11]  819 	push	hl
   68D3 21 0C 00      [10]  820 	ld	hl, #12
   68D6 39            [11]  821 	add	hl, sp
   68D7 4E            [ 7]  822 	ld	c, (hl)
   68D8 23            [ 6]  823 	inc	hl
   68D9 46            [ 7]  824 	ld	b, (hl)
   68DA C5            [11]  825 	push	bc
   68DB 21 0C 00      [10]  826 	ld	hl, #12
   68DE 39            [11]  827 	add	hl, sp
   68DF 4E            [ 7]  828 	ld	c, (hl)
   68E0 23            [ 6]  829 	inc	hl
   68E1 46            [ 7]  830 	ld	b, (hl)
   68E2 C5            [11]  831 	push	bc
   68E3 CD 63 66      [17]  832 	call	_createRoca
   68E6 21 0A 00      [10]  833 	ld	hl, #10
   68E9 39            [11]  834 	add	hl, sp
   68EA F9            [ 6]  835 	ld	sp, hl
   68EB C9            [10]  836 	ret
                            837 ;src/niveles/niveles.c:115: void createHoleIzquierda(TGameObject* rocas,u8 posx, u8 posy,u8 sprite, u8 simetria){
                            838 ;	---------------------------------
                            839 ; Function createHoleIzquierda
                            840 ; ---------------------------------
   68EC                     841 _createHoleIzquierda::
   68EC DD E5         [15]  842 	push	ix
   68EE DD 21 00 00   [14]  843 	ld	ix,#0
   68F2 DD 39         [15]  844 	add	ix,sp
                            845 ;src/niveles/niveles.c:116: rocas[contadorRocas].num=simetria;
   68F4 ED 4B 19 7B   [20]  846 	ld	bc, (_contadorRocas)
   68F8 06 00         [ 7]  847 	ld	b, #0x00
   68FA 69            [ 4]  848 	ld	l, c
   68FB 60            [ 4]  849 	ld	h, b
   68FC 29            [11]  850 	add	hl, hl
   68FD 09            [11]  851 	add	hl, bc
   68FE 29            [11]  852 	add	hl, hl
   68FF 09            [11]  853 	add	hl, bc
   6900 4D            [ 4]  854 	ld	c, l
   6901 44            [ 4]  855 	ld	b, h
   6902 DD 6E 04      [19]  856 	ld	l,4 (ix)
   6905 DD 66 05      [19]  857 	ld	h,5 (ix)
   6908 09            [11]  858 	add	hl, bc
   6909 DD 7E 09      [19]  859 	ld	a, 9 (ix)
   690C 77            [ 7]  860 	ld	(hl), a
                            861 ;src/niveles/niveles.c:117: rocas[contadorRocas].posx=posx;
   690D ED 4B 19 7B   [20]  862 	ld	bc, (_contadorRocas)
   6911 06 00         [ 7]  863 	ld	b, #0x00
   6913 69            [ 4]  864 	ld	l, c
   6914 60            [ 4]  865 	ld	h, b
   6915 29            [11]  866 	add	hl, hl
   6916 09            [11]  867 	add	hl, bc
   6917 29            [11]  868 	add	hl, hl
   6918 09            [11]  869 	add	hl, bc
   6919 4D            [ 4]  870 	ld	c, l
   691A 44            [ 4]  871 	ld	b, h
   691B DD 6E 04      [19]  872 	ld	l,4 (ix)
   691E DD 66 05      [19]  873 	ld	h,5 (ix)
   6921 09            [11]  874 	add	hl, bc
   6922 23            [ 6]  875 	inc	hl
   6923 DD 7E 06      [19]  876 	ld	a, 6 (ix)
   6926 77            [ 7]  877 	ld	(hl), a
                            878 ;src/niveles/niveles.c:118: rocas[contadorRocas].posy=posy;
   6927 ED 4B 19 7B   [20]  879 	ld	bc, (_contadorRocas)
   692B 06 00         [ 7]  880 	ld	b, #0x00
   692D 69            [ 4]  881 	ld	l, c
   692E 60            [ 4]  882 	ld	h, b
   692F 29            [11]  883 	add	hl, hl
   6930 09            [11]  884 	add	hl, bc
   6931 29            [11]  885 	add	hl, hl
   6932 09            [11]  886 	add	hl, bc
   6933 4D            [ 4]  887 	ld	c, l
   6934 44            [ 4]  888 	ld	b, h
   6935 DD 6E 04      [19]  889 	ld	l,4 (ix)
   6938 DD 66 05      [19]  890 	ld	h,5 (ix)
   693B 09            [11]  891 	add	hl, bc
   693C 23            [ 6]  892 	inc	hl
   693D 23            [ 6]  893 	inc	hl
   693E DD 7E 07      [19]  894 	ld	a, 7 (ix)
   6941 77            [ 7]  895 	ld	(hl), a
                            896 ;src/niveles/niveles.c:119: rocas[contadorRocas].sprite=sprite;
   6942 ED 4B 19 7B   [20]  897 	ld	bc, (_contadorRocas)
   6946 06 00         [ 7]  898 	ld	b, #0x00
   6948 69            [ 4]  899 	ld	l, c
   6949 60            [ 4]  900 	ld	h, b
   694A 29            [11]  901 	add	hl, hl
   694B 09            [11]  902 	add	hl, bc
   694C 29            [11]  903 	add	hl, hl
   694D 09            [11]  904 	add	hl, bc
   694E 4D            [ 4]  905 	ld	c, l
   694F 44            [ 4]  906 	ld	b, h
   6950 DD 6E 04      [19]  907 	ld	l,4 (ix)
   6953 DD 66 05      [19]  908 	ld	h,5 (ix)
   6956 09            [11]  909 	add	hl, bc
   6957 23            [ 6]  910 	inc	hl
   6958 23            [ 6]  911 	inc	hl
   6959 23            [ 6]  912 	inc	hl
   695A DD 7E 08      [19]  913 	ld	a, 8 (ix)
   695D 77            [ 7]  914 	ld	(hl), a
                            915 ;src/niveles/niveles.c:120: rocas[contadorRocas].movimiento=sin_Movimiento;
   695E ED 4B 19 7B   [20]  916 	ld	bc, (_contadorRocas)
   6962 06 00         [ 7]  917 	ld	b, #0x00
   6964 69            [ 4]  918 	ld	l, c
   6965 60            [ 4]  919 	ld	h, b
   6966 29            [11]  920 	add	hl, hl
   6967 09            [11]  921 	add	hl, bc
   6968 29            [11]  922 	add	hl, hl
   6969 09            [11]  923 	add	hl, bc
   696A 4D            [ 4]  924 	ld	c, l
   696B 44            [ 4]  925 	ld	b, h
   696C DD 6E 04      [19]  926 	ld	l,4 (ix)
   696F DD 66 05      [19]  927 	ld	h,5 (ix)
   6972 09            [11]  928 	add	hl, bc
   6973 01 04 00      [10]  929 	ld	bc, #0x0004
   6976 09            [11]  930 	add	hl, bc
   6977 36 00         [10]  931 	ld	(hl), #0x00
                            932 ;src/niveles/niveles.c:121: contadorRocas++;
   6979 21 19 7B      [10]  933 	ld	hl, #_contadorRocas+0
   697C 34            [11]  934 	inc	(hl)
   697D DD E1         [14]  935 	pop	ix
   697F C9            [10]  936 	ret
                            937 ;src/niveles/niveles.c:123: void createHoleDerecha(TGameObject* rocasEspejo,u8 posx, u8 posy,u8 sprite, u8 simetria){
                            938 ;	---------------------------------
                            939 ; Function createHoleDerecha
                            940 ; ---------------------------------
   6980                     941 _createHoleDerecha::
   6980 DD E5         [15]  942 	push	ix
   6982 DD 21 00 00   [14]  943 	ld	ix,#0
   6986 DD 39         [15]  944 	add	ix,sp
                            945 ;src/niveles/niveles.c:124: rocasEspejo[contadorRocasEspejo].num=simetria;
   6988 ED 4B 1A 7B   [20]  946 	ld	bc, (_contadorRocasEspejo)
   698C 06 00         [ 7]  947 	ld	b, #0x00
   698E 69            [ 4]  948 	ld	l, c
   698F 60            [ 4]  949 	ld	h, b
   6990 29            [11]  950 	add	hl, hl
   6991 09            [11]  951 	add	hl, bc
   6992 29            [11]  952 	add	hl, hl
   6993 09            [11]  953 	add	hl, bc
   6994 4D            [ 4]  954 	ld	c, l
   6995 44            [ 4]  955 	ld	b, h
   6996 DD 6E 04      [19]  956 	ld	l,4 (ix)
   6999 DD 66 05      [19]  957 	ld	h,5 (ix)
   699C 09            [11]  958 	add	hl, bc
   699D DD 7E 09      [19]  959 	ld	a, 9 (ix)
   69A0 77            [ 7]  960 	ld	(hl), a
                            961 ;src/niveles/niveles.c:125: rocasEspejo[contadorRocasEspejo].posx=posx;
   69A1 ED 4B 1A 7B   [20]  962 	ld	bc, (_contadorRocasEspejo)
   69A5 06 00         [ 7]  963 	ld	b, #0x00
   69A7 69            [ 4]  964 	ld	l, c
   69A8 60            [ 4]  965 	ld	h, b
   69A9 29            [11]  966 	add	hl, hl
   69AA 09            [11]  967 	add	hl, bc
   69AB 29            [11]  968 	add	hl, hl
   69AC 09            [11]  969 	add	hl, bc
   69AD 4D            [ 4]  970 	ld	c, l
   69AE 44            [ 4]  971 	ld	b, h
   69AF DD 6E 04      [19]  972 	ld	l,4 (ix)
   69B2 DD 66 05      [19]  973 	ld	h,5 (ix)
   69B5 09            [11]  974 	add	hl, bc
   69B6 23            [ 6]  975 	inc	hl
   69B7 DD 7E 06      [19]  976 	ld	a, 6 (ix)
   69BA 77            [ 7]  977 	ld	(hl), a
                            978 ;src/niveles/niveles.c:126: rocasEspejo[contadorRocasEspejo].posy=posy;
   69BB ED 4B 1A 7B   [20]  979 	ld	bc, (_contadorRocasEspejo)
   69BF 06 00         [ 7]  980 	ld	b, #0x00
   69C1 69            [ 4]  981 	ld	l, c
   69C2 60            [ 4]  982 	ld	h, b
   69C3 29            [11]  983 	add	hl, hl
   69C4 09            [11]  984 	add	hl, bc
   69C5 29            [11]  985 	add	hl, hl
   69C6 09            [11]  986 	add	hl, bc
   69C7 4D            [ 4]  987 	ld	c, l
   69C8 44            [ 4]  988 	ld	b, h
   69C9 DD 6E 04      [19]  989 	ld	l,4 (ix)
   69CC DD 66 05      [19]  990 	ld	h,5 (ix)
   69CF 09            [11]  991 	add	hl, bc
   69D0 23            [ 6]  992 	inc	hl
   69D1 23            [ 6]  993 	inc	hl
   69D2 DD 7E 07      [19]  994 	ld	a, 7 (ix)
   69D5 77            [ 7]  995 	ld	(hl), a
                            996 ;src/niveles/niveles.c:127: rocasEspejo[contadorRocasEspejo].sprite=sprite;
   69D6 ED 4B 1A 7B   [20]  997 	ld	bc, (_contadorRocasEspejo)
   69DA 06 00         [ 7]  998 	ld	b, #0x00
   69DC 69            [ 4]  999 	ld	l, c
   69DD 60            [ 4] 1000 	ld	h, b
   69DE 29            [11] 1001 	add	hl, hl
   69DF 09            [11] 1002 	add	hl, bc
   69E0 29            [11] 1003 	add	hl, hl
   69E1 09            [11] 1004 	add	hl, bc
   69E2 4D            [ 4] 1005 	ld	c, l
   69E3 44            [ 4] 1006 	ld	b, h
   69E4 DD 6E 04      [19] 1007 	ld	l,4 (ix)
   69E7 DD 66 05      [19] 1008 	ld	h,5 (ix)
   69EA 09            [11] 1009 	add	hl, bc
   69EB 23            [ 6] 1010 	inc	hl
   69EC 23            [ 6] 1011 	inc	hl
   69ED 23            [ 6] 1012 	inc	hl
   69EE DD 7E 08      [19] 1013 	ld	a, 8 (ix)
   69F1 77            [ 7] 1014 	ld	(hl), a
                           1015 ;src/niveles/niveles.c:128: rocasEspejo[contadorRocasEspejo].movimiento=sin_Movimiento;
   69F2 ED 4B 1A 7B   [20] 1016 	ld	bc, (_contadorRocasEspejo)
   69F6 06 00         [ 7] 1017 	ld	b, #0x00
   69F8 69            [ 4] 1018 	ld	l, c
   69F9 60            [ 4] 1019 	ld	h, b
   69FA 29            [11] 1020 	add	hl, hl
   69FB 09            [11] 1021 	add	hl, bc
   69FC 29            [11] 1022 	add	hl, hl
   69FD 09            [11] 1023 	add	hl, bc
   69FE 4D            [ 4] 1024 	ld	c, l
   69FF 44            [ 4] 1025 	ld	b, h
   6A00 DD 6E 04      [19] 1026 	ld	l,4 (ix)
   6A03 DD 66 05      [19] 1027 	ld	h,5 (ix)
   6A06 09            [11] 1028 	add	hl, bc
   6A07 01 04 00      [10] 1029 	ld	bc, #0x0004
   6A0A 09            [11] 1030 	add	hl, bc
   6A0B 36 00         [10] 1031 	ld	(hl), #0x00
                           1032 ;src/niveles/niveles.c:129: contadorRocasEspejo++;
   6A0D 21 1A 7B      [10] 1033 	ld	hl, #_contadorRocasEspejo+0
   6A10 34            [11] 1034 	inc	(hl)
   6A11 DD E1         [14] 1035 	pop	ix
   6A13 C9            [10] 1036 	ret
                           1037 ;src/niveles/niveles.c:131: void createColeccionabeLuz(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
                           1038 ;	---------------------------------
                           1039 ; Function createColeccionabeLuz
                           1040 ; ---------------------------------
   6A14                    1041 _createColeccionabeLuz::
   6A14 DD E5         [15] 1042 	push	ix
   6A16 DD 21 00 00   [14] 1043 	ld	ix,#0
   6A1A DD 39         [15] 1044 	add	ix,sp
                           1045 ;src/niveles/niveles.c:132: if(P_colList2[id]==coleccionable_activo){
   6A1C FD 21 1D 7B   [14] 1046 	ld	iy, #_P_colList2
   6A20 FD 7E 00      [19] 1047 	ld	a, 0 (iy)
   6A23 DD 86 08      [19] 1048 	add	a, 8 (ix)
   6A26 4F            [ 4] 1049 	ld	c, a
   6A27 FD 7E 01      [19] 1050 	ld	a, 1 (iy)
   6A2A CE 00         [ 7] 1051 	adc	a, #0x00
   6A2C 47            [ 4] 1052 	ld	b, a
   6A2D 0A            [ 7] 1053 	ld	a, (bc)
   6A2E B7            [ 4] 1054 	or	a, a
   6A2F 20 58         [12] 1055 	jr	NZ,00103$
                           1056 ;src/niveles/niveles.c:133: coleccionable[contadorColeccionables].num=id;
   6A31 FD 21 1C 7B   [14] 1057 	ld	iy, #_contadorColeccionables
   6A35 FD 6E 00      [19] 1058 	ld	l, 0 (iy)
   6A38 26 00         [ 7] 1059 	ld	h, #0x00
   6A3A 29            [11] 1060 	add	hl, hl
   6A3B 29            [11] 1061 	add	hl, hl
   6A3C 4D            [ 4] 1062 	ld	c, l
   6A3D 44            [ 4] 1063 	ld	b, h
   6A3E DD 6E 04      [19] 1064 	ld	l,4 (ix)
   6A41 DD 66 05      [19] 1065 	ld	h,5 (ix)
   6A44 09            [11] 1066 	add	hl, bc
   6A45 DD 7E 08      [19] 1067 	ld	a, 8 (ix)
   6A48 77            [ 7] 1068 	ld	(hl), a
                           1069 ;src/niveles/niveles.c:134: coleccionable[contadorColeccionables].posx=posx;
   6A49 FD 6E 00      [19] 1070 	ld	l, 0 (iy)
   6A4C 26 00         [ 7] 1071 	ld	h, #0x00
   6A4E 29            [11] 1072 	add	hl, hl
   6A4F 29            [11] 1073 	add	hl, hl
   6A50 4D            [ 4] 1074 	ld	c, l
   6A51 44            [ 4] 1075 	ld	b, h
   6A52 DD 6E 04      [19] 1076 	ld	l,4 (ix)
   6A55 DD 66 05      [19] 1077 	ld	h,5 (ix)
   6A58 09            [11] 1078 	add	hl, bc
   6A59 23            [ 6] 1079 	inc	hl
   6A5A DD 7E 06      [19] 1080 	ld	a, 6 (ix)
   6A5D 77            [ 7] 1081 	ld	(hl), a
                           1082 ;src/niveles/niveles.c:135: coleccionable[contadorColeccionables].posy=posy;
   6A5E FD 6E 00      [19] 1083 	ld	l, 0 (iy)
   6A61 26 00         [ 7] 1084 	ld	h, #0x00
   6A63 29            [11] 1085 	add	hl, hl
   6A64 29            [11] 1086 	add	hl, hl
   6A65 4D            [ 4] 1087 	ld	c, l
   6A66 44            [ 4] 1088 	ld	b, h
   6A67 DD 6E 04      [19] 1089 	ld	l,4 (ix)
   6A6A DD 66 05      [19] 1090 	ld	h,5 (ix)
   6A6D 09            [11] 1091 	add	hl, bc
   6A6E 23            [ 6] 1092 	inc	hl
   6A6F 23            [ 6] 1093 	inc	hl
   6A70 DD 7E 07      [19] 1094 	ld	a, 7 (ix)
   6A73 77            [ 7] 1095 	ld	(hl), a
                           1096 ;src/niveles/niveles.c:136: coleccionable[contadorColeccionables].sprite=sprite_luz;
   6A74 FD 6E 00      [19] 1097 	ld	l, 0 (iy)
   6A77 26 00         [ 7] 1098 	ld	h, #0x00
   6A79 29            [11] 1099 	add	hl, hl
   6A7A 29            [11] 1100 	add	hl, hl
   6A7B 4D            [ 4] 1101 	ld	c, l
   6A7C 44            [ 4] 1102 	ld	b, h
   6A7D DD 6E 04      [19] 1103 	ld	l,4 (ix)
   6A80 DD 66 05      [19] 1104 	ld	h,5 (ix)
   6A83 09            [11] 1105 	add	hl, bc
   6A84 23            [ 6] 1106 	inc	hl
   6A85 23            [ 6] 1107 	inc	hl
   6A86 23            [ 6] 1108 	inc	hl
   6A87 36 15         [10] 1109 	ld	(hl), #0x15
   6A89                    1110 00103$:
   6A89 DD E1         [14] 1111 	pop	ix
   6A8B C9            [10] 1112 	ret
                           1113 ;src/niveles/niveles.c:139: void createColeccionabeFamilia(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 sprite,u8 id){
                           1114 ;	---------------------------------
                           1115 ; Function createColeccionabeFamilia
                           1116 ; ---------------------------------
   6A8C                    1117 _createColeccionabeFamilia::
   6A8C DD E5         [15] 1118 	push	ix
   6A8E DD 21 00 00   [14] 1119 	ld	ix,#0
   6A92 DD 39         [15] 1120 	add	ix,sp
                           1121 ;src/niveles/niveles.c:140: if(P_colList2[id]==coleccionable_activo){
   6A94 FD 21 1D 7B   [14] 1122 	ld	iy, #_P_colList2
   6A98 FD 7E 00      [19] 1123 	ld	a, 0 (iy)
   6A9B DD 86 09      [19] 1124 	add	a, 9 (ix)
   6A9E 4F            [ 4] 1125 	ld	c, a
   6A9F FD 7E 01      [19] 1126 	ld	a, 1 (iy)
   6AA2 CE 00         [ 7] 1127 	adc	a, #0x00
   6AA4 47            [ 4] 1128 	ld	b, a
   6AA5 0A            [ 7] 1129 	ld	a, (bc)
   6AA6 B7            [ 4] 1130 	or	a, a
   6AA7 20 5A         [12] 1131 	jr	NZ,00103$
                           1132 ;src/niveles/niveles.c:141: coleccionable[contadorColeccionables].num=id;
   6AA9 FD 21 1C 7B   [14] 1133 	ld	iy, #_contadorColeccionables
   6AAD FD 6E 00      [19] 1134 	ld	l, 0 (iy)
   6AB0 26 00         [ 7] 1135 	ld	h, #0x00
   6AB2 29            [11] 1136 	add	hl, hl
   6AB3 29            [11] 1137 	add	hl, hl
   6AB4 4D            [ 4] 1138 	ld	c, l
   6AB5 44            [ 4] 1139 	ld	b, h
   6AB6 DD 6E 04      [19] 1140 	ld	l,4 (ix)
   6AB9 DD 66 05      [19] 1141 	ld	h,5 (ix)
   6ABC 09            [11] 1142 	add	hl, bc
   6ABD DD 7E 09      [19] 1143 	ld	a, 9 (ix)
   6AC0 77            [ 7] 1144 	ld	(hl), a
                           1145 ;src/niveles/niveles.c:142: coleccionable[contadorColeccionables].posx=posx;
   6AC1 FD 6E 00      [19] 1146 	ld	l, 0 (iy)
   6AC4 26 00         [ 7] 1147 	ld	h, #0x00
   6AC6 29            [11] 1148 	add	hl, hl
   6AC7 29            [11] 1149 	add	hl, hl
   6AC8 4D            [ 4] 1150 	ld	c, l
   6AC9 44            [ 4] 1151 	ld	b, h
   6ACA DD 6E 04      [19] 1152 	ld	l,4 (ix)
   6ACD DD 66 05      [19] 1153 	ld	h,5 (ix)
   6AD0 09            [11] 1154 	add	hl, bc
   6AD1 23            [ 6] 1155 	inc	hl
   6AD2 DD 7E 06      [19] 1156 	ld	a, 6 (ix)
   6AD5 77            [ 7] 1157 	ld	(hl), a
                           1158 ;src/niveles/niveles.c:143: coleccionable[contadorColeccionables].posy=posy;
   6AD6 FD 6E 00      [19] 1159 	ld	l, 0 (iy)
   6AD9 26 00         [ 7] 1160 	ld	h, #0x00
   6ADB 29            [11] 1161 	add	hl, hl
   6ADC 29            [11] 1162 	add	hl, hl
   6ADD 4D            [ 4] 1163 	ld	c, l
   6ADE 44            [ 4] 1164 	ld	b, h
   6ADF DD 6E 04      [19] 1165 	ld	l,4 (ix)
   6AE2 DD 66 05      [19] 1166 	ld	h,5 (ix)
   6AE5 09            [11] 1167 	add	hl, bc
   6AE6 23            [ 6] 1168 	inc	hl
   6AE7 23            [ 6] 1169 	inc	hl
   6AE8 DD 7E 07      [19] 1170 	ld	a, 7 (ix)
   6AEB 77            [ 7] 1171 	ld	(hl), a
                           1172 ;src/niveles/niveles.c:144: coleccionable[contadorColeccionables].sprite=sprite;
   6AEC FD 6E 00      [19] 1173 	ld	l, 0 (iy)
   6AEF 26 00         [ 7] 1174 	ld	h, #0x00
   6AF1 29            [11] 1175 	add	hl, hl
   6AF2 29            [11] 1176 	add	hl, hl
   6AF3 4D            [ 4] 1177 	ld	c, l
   6AF4 44            [ 4] 1178 	ld	b, h
   6AF5 DD 6E 04      [19] 1179 	ld	l,4 (ix)
   6AF8 DD 66 05      [19] 1180 	ld	h,5 (ix)
   6AFB 09            [11] 1181 	add	hl, bc
   6AFC 23            [ 6] 1182 	inc	hl
   6AFD 23            [ 6] 1183 	inc	hl
   6AFE 23            [ 6] 1184 	inc	hl
   6AFF DD 7E 08      [19] 1185 	ld	a, 8 (ix)
   6B02 77            [ 7] 1186 	ld	(hl), a
   6B03                    1187 00103$:
   6B03 DD E1         [14] 1188 	pop	ix
   6B05 C9            [10] 1189 	ret
                           1190 ;src/niveles/niveles.c:147: void createColeccionabeAmstr(TGameObjectCol* coleccionable,u8 posx, u8 posy,u8 id){
                           1191 ;	---------------------------------
                           1192 ; Function createColeccionabeAmstr
                           1193 ; ---------------------------------
   6B06                    1194 _createColeccionabeAmstr::
   6B06 DD E5         [15] 1195 	push	ix
   6B08 DD 21 00 00   [14] 1196 	ld	ix,#0
   6B0C DD 39         [15] 1197 	add	ix,sp
                           1198 ;src/niveles/niveles.c:148: if(P_colList2[id]==coleccionable_activo){
   6B0E FD 21 1D 7B   [14] 1199 	ld	iy, #_P_colList2
   6B12 FD 7E 00      [19] 1200 	ld	a, 0 (iy)
   6B15 DD 86 08      [19] 1201 	add	a, 8 (ix)
   6B18 4F            [ 4] 1202 	ld	c, a
   6B19 FD 7E 01      [19] 1203 	ld	a, 1 (iy)
   6B1C CE 00         [ 7] 1204 	adc	a, #0x00
   6B1E 47            [ 4] 1205 	ld	b, a
   6B1F 0A            [ 7] 1206 	ld	a, (bc)
   6B20 B7            [ 4] 1207 	or	a, a
   6B21 20 58         [12] 1208 	jr	NZ,00103$
                           1209 ;src/niveles/niveles.c:149: coleccionable[contadorColeccionables].num=id;
   6B23 FD 21 1C 7B   [14] 1210 	ld	iy, #_contadorColeccionables
   6B27 FD 6E 00      [19] 1211 	ld	l, 0 (iy)
   6B2A 26 00         [ 7] 1212 	ld	h, #0x00
   6B2C 29            [11] 1213 	add	hl, hl
   6B2D 29            [11] 1214 	add	hl, hl
   6B2E 4D            [ 4] 1215 	ld	c, l
   6B2F 44            [ 4] 1216 	ld	b, h
   6B30 DD 6E 04      [19] 1217 	ld	l,4 (ix)
   6B33 DD 66 05      [19] 1218 	ld	h,5 (ix)
   6B36 09            [11] 1219 	add	hl, bc
   6B37 DD 7E 08      [19] 1220 	ld	a, 8 (ix)
   6B3A 77            [ 7] 1221 	ld	(hl), a
                           1222 ;src/niveles/niveles.c:150: coleccionable[contadorColeccionables].posx=posx;
   6B3B FD 6E 00      [19] 1223 	ld	l, 0 (iy)
   6B3E 26 00         [ 7] 1224 	ld	h, #0x00
   6B40 29            [11] 1225 	add	hl, hl
   6B41 29            [11] 1226 	add	hl, hl
   6B42 4D            [ 4] 1227 	ld	c, l
   6B43 44            [ 4] 1228 	ld	b, h
   6B44 DD 6E 04      [19] 1229 	ld	l,4 (ix)
   6B47 DD 66 05      [19] 1230 	ld	h,5 (ix)
   6B4A 09            [11] 1231 	add	hl, bc
   6B4B 23            [ 6] 1232 	inc	hl
   6B4C DD 7E 06      [19] 1233 	ld	a, 6 (ix)
   6B4F 77            [ 7] 1234 	ld	(hl), a
                           1235 ;src/niveles/niveles.c:151: coleccionable[contadorColeccionables].posy=posy;
   6B50 FD 6E 00      [19] 1236 	ld	l, 0 (iy)
   6B53 26 00         [ 7] 1237 	ld	h, #0x00
   6B55 29            [11] 1238 	add	hl, hl
   6B56 29            [11] 1239 	add	hl, hl
   6B57 4D            [ 4] 1240 	ld	c, l
   6B58 44            [ 4] 1241 	ld	b, h
   6B59 DD 6E 04      [19] 1242 	ld	l,4 (ix)
   6B5C DD 66 05      [19] 1243 	ld	h,5 (ix)
   6B5F 09            [11] 1244 	add	hl, bc
   6B60 23            [ 6] 1245 	inc	hl
   6B61 23            [ 6] 1246 	inc	hl
   6B62 DD 7E 07      [19] 1247 	ld	a, 7 (ix)
   6B65 77            [ 7] 1248 	ld	(hl), a
                           1249 ;src/niveles/niveles.c:152: coleccionable[contadorColeccionables].sprite=sprite_amstradTape;
   6B66 FD 6E 00      [19] 1250 	ld	l, 0 (iy)
   6B69 26 00         [ 7] 1251 	ld	h, #0x00
   6B6B 29            [11] 1252 	add	hl, hl
   6B6C 29            [11] 1253 	add	hl, hl
   6B6D 4D            [ 4] 1254 	ld	c, l
   6B6E 44            [ 4] 1255 	ld	b, h
   6B6F DD 6E 04      [19] 1256 	ld	l,4 (ix)
   6B72 DD 66 05      [19] 1257 	ld	h,5 (ix)
   6B75 09            [11] 1258 	add	hl, bc
   6B76 23            [ 6] 1259 	inc	hl
   6B77 23            [ 6] 1260 	inc	hl
   6B78 23            [ 6] 1261 	inc	hl
   6B79 36 1B         [10] 1262 	ld	(hl), #0x1b
   6B7B                    1263 00103$:
   6B7B DD E1         [14] 1264 	pop	ix
   6B7D C9            [10] 1265 	ret
                           1266 ;src/niveles/niveles.c:158: void crearNivel1(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           1267 ;	---------------------------------
                           1268 ; Function crearNivel1
                           1269 ; ---------------------------------
   6B7E                    1270 _crearNivel1::
   6B7E DD E5         [15] 1271 	push	ix
   6B80 DD 21 00 00   [14] 1272 	ld	ix,#0
   6B84 DD 39         [15] 1273 	add	ix,sp
                           1274 ;src/niveles/niveles.c:160: createPlayer(player,3,4,posicion);
   6B86 DD 6E 10      [19] 1275 	ld	l,16 (ix)
   6B89 DD 66 11      [19] 1276 	ld	h,17 (ix)
   6B8C E5            [11] 1277 	push	hl
   6B8D 21 03 04      [10] 1278 	ld	hl, #0x0403
   6B90 E5            [11] 1279 	push	hl
   6B91 DD 6E 04      [19] 1280 	ld	l,4 (ix)
   6B94 DD 66 05      [19] 1281 	ld	h,5 (ix)
   6B97 E5            [11] 1282 	push	hl
   6B98 CD 24 66      [17] 1283 	call	_createPlayer
   6B9B 21 06 00      [10] 1284 	ld	hl, #6
   6B9E 39            [11] 1285 	add	hl, sp
   6B9F F9            [ 6] 1286 	ld	sp, hl
                           1287 ;src/niveles/niveles.c:161: createMarco(si);
   6BA0 AF            [ 4] 1288 	xor	a, a
   6BA1 F5            [11] 1289 	push	af
   6BA2 33            [ 6] 1290 	inc	sp
   6BA3 CD 15 66      [17] 1291 	call	_createMarco
   6BA6 33            [ 6] 1292 	inc	sp
                           1293 ;src/niveles/niveles.c:162: createPortal(portales,rocas,rocasEspejo,si);
   6BA7 AF            [ 4] 1294 	xor	a, a
   6BA8 F5            [11] 1295 	push	af
   6BA9 33            [ 6] 1296 	inc	sp
   6BAA DD 6E 08      [19] 1297 	ld	l,8 (ix)
   6BAD DD 66 09      [19] 1298 	ld	h,9 (ix)
   6BB0 E5            [11] 1299 	push	hl
   6BB1 DD 6E 06      [19] 1300 	ld	l,6 (ix)
   6BB4 DD 66 07      [19] 1301 	ld	h,7 (ix)
   6BB7 E5            [11] 1302 	push	hl
   6BB8 DD 6E 0C      [19] 1303 	ld	l,12 (ix)
   6BBB DD 66 0D      [19] 1304 	ld	h,13 (ix)
   6BBE E5            [11] 1305 	push	hl
   6BBF CD 98 68      [17] 1306 	call	_createPortal
   6BC2 21 07 00      [10] 1307 	ld	hl, #7
   6BC5 39            [11] 1308 	add	hl, sp
   6BC6 F9            [ 6] 1309 	ld	sp, hl
                           1310 ;src/niveles/niveles.c:163: createPuerta(puertas,3,7,sprite_Puerta_G,nivel_0);
   6BC7 21 12 01      [10] 1311 	ld	hl, #0x0112
   6BCA E5            [11] 1312 	push	hl
   6BCB 21 03 07      [10] 1313 	ld	hl, #0x0703
   6BCE E5            [11] 1314 	push	hl
   6BCF DD 6E 0A      [19] 1315 	ld	l,10 (ix)
   6BD2 DD 66 0B      [19] 1316 	ld	h,11 (ix)
   6BD5 E5            [11] 1317 	push	hl
   6BD6 CD 1F 68      [17] 1318 	call	_createPuerta
   6BD9 21 06 00      [10] 1319 	ld	hl, #6
   6BDC 39            [11] 1320 	add	hl, sp
   6BDD F9            [ 6] 1321 	ld	sp, hl
                           1322 ;src/niveles/niveles.c:164: createPuerta(puertas,13,7,sprite_Puerta_B,nivel_0);
   6BDE 21 13 01      [10] 1323 	ld	hl, #0x0113
   6BE1 E5            [11] 1324 	push	hl
   6BE2 21 0D 07      [10] 1325 	ld	hl, #0x070d
   6BE5 E5            [11] 1326 	push	hl
   6BE6 DD 6E 0A      [19] 1327 	ld	l,10 (ix)
   6BE9 DD 66 0B      [19] 1328 	ld	h,11 (ix)
   6BEC E5            [11] 1329 	push	hl
   6BED CD 1F 68      [17] 1330 	call	_createPuerta
   6BF0 21 06 00      [10] 1331 	ld	hl, #6
   6BF3 39            [11] 1332 	add	hl, sp
   6BF4 F9            [ 6] 1333 	ld	sp, hl
                           1334 ;src/niveles/niveles.c:167: createRoca(rocas,rocasEspejo,2,4,mover_1,sprite_Rock_G,2,no);
   6BF5 21 02 01      [10] 1335 	ld	hl, #0x0102
   6BF8 E5            [11] 1336 	push	hl
   6BF9 21 01 02      [10] 1337 	ld	hl, #0x0201
   6BFC E5            [11] 1338 	push	hl
   6BFD 21 02 04      [10] 1339 	ld	hl, #0x0402
   6C00 E5            [11] 1340 	push	hl
   6C01 DD 6E 08      [19] 1341 	ld	l,8 (ix)
   6C04 DD 66 09      [19] 1342 	ld	h,9 (ix)
   6C07 E5            [11] 1343 	push	hl
   6C08 DD 6E 06      [19] 1344 	ld	l,6 (ix)
   6C0B DD 66 07      [19] 1345 	ld	h,7 (ix)
   6C0E E5            [11] 1346 	push	hl
   6C0F CD 63 66      [17] 1347 	call	_createRoca
   6C12 21 0A 00      [10] 1348 	ld	hl, #10
   6C15 39            [11] 1349 	add	hl, sp
   6C16 F9            [ 6] 1350 	ld	sp, hl
                           1351 ;src/niveles/niveles.c:168: createRocaEspejo(rocasEspejo,14,4,sin_Movimiento,sprite_Rock_nomove_B,2);
   6C17 21 04 02      [10] 1352 	ld	hl, #0x0204
   6C1A E5            [11] 1353 	push	hl
   6C1B 26 00         [ 7] 1354 	ld	h, #0x00
   6C1D E5            [11] 1355 	push	hl
   6C1E 3E 0E         [ 7] 1356 	ld	a, #0x0e
   6C20 F5            [11] 1357 	push	af
   6C21 33            [ 6] 1358 	inc	sp
   6C22 DD 6E 08      [19] 1359 	ld	l,8 (ix)
   6C25 DD 66 09      [19] 1360 	ld	h,9 (ix)
   6C28 E5            [11] 1361 	push	hl
   6C29 CD 89 67      [17] 1362 	call	_createRocaEspejo
   6C2C 21 07 00      [10] 1363 	ld	hl, #7
   6C2F 39            [11] 1364 	add	hl, sp
   6C30 F9            [ 6] 1365 	ld	sp, hl
                           1366 ;src/niveles/niveles.c:171: createColeccionabeLuz(col,15,4,0);
   6C31 21 04 00      [10] 1367 	ld	hl, #0x0004
   6C34 E5            [11] 1368 	push	hl
   6C35 3E 0F         [ 7] 1369 	ld	a, #0x0f
   6C37 F5            [11] 1370 	push	af
   6C38 33            [ 6] 1371 	inc	sp
   6C39 DD 6E 0E      [19] 1372 	ld	l,14 (ix)
   6C3C DD 66 0F      [19] 1373 	ld	h,15 (ix)
   6C3F E5            [11] 1374 	push	hl
   6C40 CD 14 6A      [17] 1375 	call	_createColeccionabeLuz
   6C43 F1            [10] 1376 	pop	af
                           1377 ;src/niveles/niveles.c:174: createRoca(rocas,rocasEspejo,1,2,sin_Movimiento,sprite_RockInmovil3_G,1,no);
   6C44 33            [ 6] 1378 	inc	sp
   6C45 21 01 01      [10] 1379 	ld	hl,#0x0101
   6C48 E3            [19] 1380 	ex	(sp),hl
   6C49 21 00 09      [10] 1381 	ld	hl, #0x0900
   6C4C E5            [11] 1382 	push	hl
   6C4D 21 01 02      [10] 1383 	ld	hl, #0x0201
   6C50 E5            [11] 1384 	push	hl
   6C51 DD 6E 08      [19] 1385 	ld	l,8 (ix)
   6C54 DD 66 09      [19] 1386 	ld	h,9 (ix)
   6C57 E5            [11] 1387 	push	hl
   6C58 DD 6E 06      [19] 1388 	ld	l,6 (ix)
   6C5B DD 66 07      [19] 1389 	ld	h,7 (ix)
   6C5E E5            [11] 1390 	push	hl
   6C5F CD 63 66      [17] 1391 	call	_createRoca
   6C62 21 0A 00      [10] 1392 	ld	hl, #10
   6C65 39            [11] 1393 	add	hl, sp
   6C66 F9            [ 6] 1394 	ld	sp, hl
                           1395 ;src/niveles/niveles.c:175: createRoca(rocas,rocasEspejo,2,2,sin_Movimiento,sprite_RockInmovil4_G,1,no);
   6C67 21 01 01      [10] 1396 	ld	hl, #0x0101
   6C6A E5            [11] 1397 	push	hl
   6C6B 21 00 0B      [10] 1398 	ld	hl, #0x0b00
   6C6E E5            [11] 1399 	push	hl
   6C6F 21 02 02      [10] 1400 	ld	hl, #0x0202
   6C72 E5            [11] 1401 	push	hl
   6C73 DD 6E 08      [19] 1402 	ld	l,8 (ix)
   6C76 DD 66 09      [19] 1403 	ld	h,9 (ix)
   6C79 E5            [11] 1404 	push	hl
   6C7A DD 6E 06      [19] 1405 	ld	l,6 (ix)
   6C7D DD 66 07      [19] 1406 	ld	h,7 (ix)
   6C80 E5            [11] 1407 	push	hl
   6C81 CD 63 66      [17] 1408 	call	_createRoca
   6C84 21 0A 00      [10] 1409 	ld	hl, #10
   6C87 39            [11] 1410 	add	hl, sp
   6C88 F9            [ 6] 1411 	ld	sp, hl
                           1412 ;src/niveles/niveles.c:176: createRoca(rocas,rocasEspejo,1,3,sin_Movimiento,sprite_RockInmovil1_G,1,no);
   6C89 21 01 01      [10] 1413 	ld	hl, #0x0101
   6C8C E5            [11] 1414 	push	hl
   6C8D 21 00 05      [10] 1415 	ld	hl, #0x0500
   6C90 E5            [11] 1416 	push	hl
   6C91 21 01 03      [10] 1417 	ld	hl, #0x0301
   6C94 E5            [11] 1418 	push	hl
   6C95 DD 6E 08      [19] 1419 	ld	l,8 (ix)
   6C98 DD 66 09      [19] 1420 	ld	h,9 (ix)
   6C9B E5            [11] 1421 	push	hl
   6C9C DD 6E 06      [19] 1422 	ld	l,6 (ix)
   6C9F DD 66 07      [19] 1423 	ld	h,7 (ix)
   6CA2 E5            [11] 1424 	push	hl
   6CA3 CD 63 66      [17] 1425 	call	_createRoca
   6CA6 21 0A 00      [10] 1426 	ld	hl, #10
   6CA9 39            [11] 1427 	add	hl, sp
   6CAA F9            [ 6] 1428 	ld	sp, hl
                           1429 ;src/niveles/niveles.c:177: createRoca(rocas,rocasEspejo,6,3,sin_Movimiento,sprite_RockInmovil1_G,1,no);
   6CAB 21 01 01      [10] 1430 	ld	hl, #0x0101
   6CAE E5            [11] 1431 	push	hl
   6CAF 21 00 05      [10] 1432 	ld	hl, #0x0500
   6CB2 E5            [11] 1433 	push	hl
   6CB3 21 06 03      [10] 1434 	ld	hl, #0x0306
   6CB6 E5            [11] 1435 	push	hl
   6CB7 DD 6E 08      [19] 1436 	ld	l,8 (ix)
   6CBA DD 66 09      [19] 1437 	ld	h,9 (ix)
   6CBD E5            [11] 1438 	push	hl
   6CBE DD 6E 06      [19] 1439 	ld	l,6 (ix)
   6CC1 DD 66 07      [19] 1440 	ld	h,7 (ix)
   6CC4 E5            [11] 1441 	push	hl
   6CC5 CD 63 66      [17] 1442 	call	_createRoca
   6CC8 21 0A 00      [10] 1443 	ld	hl, #10
   6CCB 39            [11] 1444 	add	hl, sp
   6CCC F9            [ 6] 1445 	ld	sp, hl
                           1446 ;src/niveles/niveles.c:178: createRoca(rocas,rocasEspejo,1,5,sin_Movimiento,sprite_RockInmovil1_G,1,no);
   6CCD 21 01 01      [10] 1447 	ld	hl, #0x0101
   6CD0 E5            [11] 1448 	push	hl
   6CD1 21 00 05      [10] 1449 	ld	hl, #0x0500
   6CD4 E5            [11] 1450 	push	hl
   6CD5 2E 01         [ 7] 1451 	ld	l, #0x01
   6CD7 E5            [11] 1452 	push	hl
   6CD8 DD 6E 08      [19] 1453 	ld	l,8 (ix)
   6CDB DD 66 09      [19] 1454 	ld	h,9 (ix)
   6CDE E5            [11] 1455 	push	hl
   6CDF DD 6E 06      [19] 1456 	ld	l,6 (ix)
   6CE2 DD 66 07      [19] 1457 	ld	h,7 (ix)
   6CE5 E5            [11] 1458 	push	hl
   6CE6 CD 63 66      [17] 1459 	call	_createRoca
   6CE9 21 0A 00      [10] 1460 	ld	hl, #10
   6CEC 39            [11] 1461 	add	hl, sp
   6CED F9            [ 6] 1462 	ld	sp, hl
                           1463 ;src/niveles/niveles.c:179: createRoca(rocas,rocasEspejo,6,5,sin_Movimiento,sprite_RockInmovil1_G,1,no);
   6CEE 21 01 01      [10] 1464 	ld	hl, #0x0101
   6CF1 E5            [11] 1465 	push	hl
   6CF2 21 00 05      [10] 1466 	ld	hl, #0x0500
   6CF5 E5            [11] 1467 	push	hl
   6CF6 2E 06         [ 7] 1468 	ld	l, #0x06
   6CF8 E5            [11] 1469 	push	hl
   6CF9 DD 6E 08      [19] 1470 	ld	l,8 (ix)
   6CFC DD 66 09      [19] 1471 	ld	h,9 (ix)
   6CFF E5            [11] 1472 	push	hl
   6D00 DD 6E 06      [19] 1473 	ld	l,6 (ix)
   6D03 DD 66 07      [19] 1474 	ld	h,7 (ix)
   6D06 E5            [11] 1475 	push	hl
   6D07 CD 63 66      [17] 1476 	call	_createRoca
   6D0A 21 0A 00      [10] 1477 	ld	hl, #10
   6D0D 39            [11] 1478 	add	hl, sp
   6D0E F9            [ 6] 1479 	ld	sp, hl
                           1480 ;src/niveles/niveles.c:180: createRoca(rocas,rocasEspejo,7,1,sin_Movimiento,sprite_RockInmovil2_G,1,no);
   6D0F 21 01 01      [10] 1481 	ld	hl, #0x0101
   6D12 E5            [11] 1482 	push	hl
   6D13 21 00 07      [10] 1483 	ld	hl, #0x0700
   6D16 E5            [11] 1484 	push	hl
   6D17 21 07 01      [10] 1485 	ld	hl, #0x0107
   6D1A E5            [11] 1486 	push	hl
   6D1B DD 6E 08      [19] 1487 	ld	l,8 (ix)
   6D1E DD 66 09      [19] 1488 	ld	h,9 (ix)
   6D21 E5            [11] 1489 	push	hl
   6D22 DD 6E 06      [19] 1490 	ld	l,6 (ix)
   6D25 DD 66 07      [19] 1491 	ld	h,7 (ix)
   6D28 E5            [11] 1492 	push	hl
   6D29 CD 63 66      [17] 1493 	call	_createRoca
   6D2C 21 0A 00      [10] 1494 	ld	hl, #10
   6D2F 39            [11] 1495 	add	hl, sp
   6D30 F9            [ 6] 1496 	ld	sp, hl
                           1497 ;src/niveles/niveles.c:181: createRoca(rocas,rocasEspejo,7,7,sin_Movimiento,sprite_RockInmovil2_G,1,no);
   6D31 21 01 01      [10] 1498 	ld	hl, #0x0101
   6D34 E5            [11] 1499 	push	hl
   6D35 21 00 07      [10] 1500 	ld	hl, #0x0700
   6D38 E5            [11] 1501 	push	hl
   6D39 2E 07         [ 7] 1502 	ld	l, #0x07
   6D3B E5            [11] 1503 	push	hl
   6D3C DD 6E 08      [19] 1504 	ld	l,8 (ix)
   6D3F DD 66 09      [19] 1505 	ld	h,9 (ix)
   6D42 E5            [11] 1506 	push	hl
   6D43 DD 6E 06      [19] 1507 	ld	l,6 (ix)
   6D46 DD 66 07      [19] 1508 	ld	h,7 (ix)
   6D49 E5            [11] 1509 	push	hl
   6D4A CD 63 66      [17] 1510 	call	_createRoca
   6D4D 21 0A 00      [10] 1511 	ld	hl, #10
   6D50 39            [11] 1512 	add	hl, sp
   6D51 F9            [ 6] 1513 	ld	sp, hl
                           1514 ;src/niveles/niveles.c:182: createRoca(rocas,rocasEspejo,1,4,sin_Movimiento,sprite_amstrad,1,no);
   6D52 21 01 01      [10] 1515 	ld	hl, #0x0101
   6D55 E5            [11] 1516 	push	hl
   6D56 21 00 1A      [10] 1517 	ld	hl, #0x1a00
   6D59 E5            [11] 1518 	push	hl
   6D5A 21 01 04      [10] 1519 	ld	hl, #0x0401
   6D5D E5            [11] 1520 	push	hl
   6D5E DD 6E 08      [19] 1521 	ld	l,8 (ix)
   6D61 DD 66 09      [19] 1522 	ld	h,9 (ix)
   6D64 E5            [11] 1523 	push	hl
   6D65 DD 6E 06      [19] 1524 	ld	l,6 (ix)
   6D68 DD 66 07      [19] 1525 	ld	h,7 (ix)
   6D6B E5            [11] 1526 	push	hl
   6D6C CD 63 66      [17] 1527 	call	_createRoca
   6D6F 21 0A 00      [10] 1528 	ld	hl, #10
   6D72 39            [11] 1529 	add	hl, sp
   6D73 F9            [ 6] 1530 	ld	sp, hl
                           1531 ;src/niveles/niveles.c:183: createRoca(rocas,rocasEspejo,1,1,sin_Movimiento,sprite_PrinceofPersia2_G,1,no);
   6D74 21 01 01      [10] 1532 	ld	hl, #0x0101
   6D77 E5            [11] 1533 	push	hl
   6D78 21 00 1E      [10] 1534 	ld	hl, #0x1e00
   6D7B E5            [11] 1535 	push	hl
   6D7C 21 01 01      [10] 1536 	ld	hl, #0x0101
   6D7F E5            [11] 1537 	push	hl
   6D80 DD 6E 08      [19] 1538 	ld	l,8 (ix)
   6D83 DD 66 09      [19] 1539 	ld	h,9 (ix)
   6D86 E5            [11] 1540 	push	hl
   6D87 DD 6E 06      [19] 1541 	ld	l,6 (ix)
   6D8A DD 66 07      [19] 1542 	ld	h,7 (ix)
   6D8D E5            [11] 1543 	push	hl
   6D8E CD 63 66      [17] 1544 	call	_createRoca
   6D91 21 0A 00      [10] 1545 	ld	hl, #10
   6D94 39            [11] 1546 	add	hl, sp
   6D95 F9            [ 6] 1547 	ld	sp, hl
                           1548 ;src/niveles/niveles.c:184: createRoca(rocas,rocasEspejo,2,1,sin_Movimiento,sprite_PrinceofPersia1_G,1,no);
   6D96 21 01 01      [10] 1549 	ld	hl, #0x0101
   6D99 E5            [11] 1550 	push	hl
   6D9A 21 00 1C      [10] 1551 	ld	hl, #0x1c00
   6D9D E5            [11] 1552 	push	hl
   6D9E 21 02 01      [10] 1553 	ld	hl, #0x0102
   6DA1 E5            [11] 1554 	push	hl
   6DA2 DD 6E 08      [19] 1555 	ld	l,8 (ix)
   6DA5 DD 66 09      [19] 1556 	ld	h,9 (ix)
   6DA8 E5            [11] 1557 	push	hl
   6DA9 DD 6E 06      [19] 1558 	ld	l,6 (ix)
   6DAC DD 66 07      [19] 1559 	ld	h,7 (ix)
   6DAF E5            [11] 1560 	push	hl
   6DB0 CD 63 66      [17] 1561 	call	_createRoca
   6DB3 21 0A 00      [10] 1562 	ld	hl, #10
   6DB6 39            [11] 1563 	add	hl, sp
   6DB7 F9            [ 6] 1564 	ld	sp, hl
                           1565 ;src/niveles/niveles.c:188: createRocaEspejo(rocasEspejo,14,2,sin_Movimiento,sprite_RockInmovil3_B,1);
   6DB8 21 0A 01      [10] 1566 	ld	hl, #0x010a
   6DBB E5            [11] 1567 	push	hl
   6DBC 21 02 00      [10] 1568 	ld	hl, #0x0002
   6DBF E5            [11] 1569 	push	hl
   6DC0 3E 0E         [ 7] 1570 	ld	a, #0x0e
   6DC2 F5            [11] 1571 	push	af
   6DC3 33            [ 6] 1572 	inc	sp
   6DC4 DD 6E 08      [19] 1573 	ld	l,8 (ix)
   6DC7 DD 66 09      [19] 1574 	ld	h,9 (ix)
   6DCA E5            [11] 1575 	push	hl
   6DCB CD 89 67      [17] 1576 	call	_createRocaEspejo
   6DCE 21 07 00      [10] 1577 	ld	hl, #7
   6DD1 39            [11] 1578 	add	hl, sp
   6DD2 F9            [ 6] 1579 	ld	sp, hl
                           1580 ;src/niveles/niveles.c:189: createRocaEspejo(rocasEspejo,15,2,sin_Movimiento,sprite_RockInmovil4_B,1);
   6DD3 21 0C 01      [10] 1581 	ld	hl, #0x010c
   6DD6 E5            [11] 1582 	push	hl
   6DD7 21 02 00      [10] 1583 	ld	hl, #0x0002
   6DDA E5            [11] 1584 	push	hl
   6DDB 3E 0F         [ 7] 1585 	ld	a, #0x0f
   6DDD F5            [11] 1586 	push	af
   6DDE 33            [ 6] 1587 	inc	sp
   6DDF DD 6E 08      [19] 1588 	ld	l,8 (ix)
   6DE2 DD 66 09      [19] 1589 	ld	h,9 (ix)
   6DE5 E5            [11] 1590 	push	hl
   6DE6 CD 89 67      [17] 1591 	call	_createRocaEspejo
   6DE9 21 07 00      [10] 1592 	ld	hl, #7
   6DEC 39            [11] 1593 	add	hl, sp
   6DED F9            [ 6] 1594 	ld	sp, hl
                           1595 ;src/niveles/niveles.c:190: createRocaEspejo(rocasEspejo,15,3,sin_Movimiento,sprite_RockInmovil1_B,1);
   6DEE 21 06 01      [10] 1596 	ld	hl, #0x0106
   6DF1 E5            [11] 1597 	push	hl
   6DF2 21 03 00      [10] 1598 	ld	hl, #0x0003
   6DF5 E5            [11] 1599 	push	hl
   6DF6 3E 0F         [ 7] 1600 	ld	a, #0x0f
   6DF8 F5            [11] 1601 	push	af
   6DF9 33            [ 6] 1602 	inc	sp
   6DFA DD 6E 08      [19] 1603 	ld	l,8 (ix)
   6DFD DD 66 09      [19] 1604 	ld	h,9 (ix)
   6E00 E5            [11] 1605 	push	hl
   6E01 CD 89 67      [17] 1606 	call	_createRocaEspejo
   6E04 21 07 00      [10] 1607 	ld	hl, #7
   6E07 39            [11] 1608 	add	hl, sp
   6E08 F9            [ 6] 1609 	ld	sp, hl
                           1610 ;src/niveles/niveles.c:191: createRocaEspejo(rocasEspejo,10,3,sin_Movimiento,sprite_RockInmovil1_B,1);
   6E09 21 06 01      [10] 1611 	ld	hl, #0x0106
   6E0C E5            [11] 1612 	push	hl
   6E0D 21 03 00      [10] 1613 	ld	hl, #0x0003
   6E10 E5            [11] 1614 	push	hl
   6E11 3E 0A         [ 7] 1615 	ld	a, #0x0a
   6E13 F5            [11] 1616 	push	af
   6E14 33            [ 6] 1617 	inc	sp
   6E15 DD 6E 08      [19] 1618 	ld	l,8 (ix)
   6E18 DD 66 09      [19] 1619 	ld	h,9 (ix)
   6E1B E5            [11] 1620 	push	hl
   6E1C CD 89 67      [17] 1621 	call	_createRocaEspejo
   6E1F 21 07 00      [10] 1622 	ld	hl, #7
   6E22 39            [11] 1623 	add	hl, sp
   6E23 F9            [ 6] 1624 	ld	sp, hl
                           1625 ;src/niveles/niveles.c:192: createRocaEspejo(rocasEspejo,15,5,sin_Movimiento,sprite_RockInmovil1_B,1);
   6E24 21 06 01      [10] 1626 	ld	hl, #0x0106
   6E27 E5            [11] 1627 	push	hl
   6E28 21 05 00      [10] 1628 	ld	hl, #0x0005
   6E2B E5            [11] 1629 	push	hl
   6E2C 3E 0F         [ 7] 1630 	ld	a, #0x0f
   6E2E F5            [11] 1631 	push	af
   6E2F 33            [ 6] 1632 	inc	sp
   6E30 DD 6E 08      [19] 1633 	ld	l,8 (ix)
   6E33 DD 66 09      [19] 1634 	ld	h,9 (ix)
   6E36 E5            [11] 1635 	push	hl
   6E37 CD 89 67      [17] 1636 	call	_createRocaEspejo
   6E3A 21 07 00      [10] 1637 	ld	hl, #7
   6E3D 39            [11] 1638 	add	hl, sp
   6E3E F9            [ 6] 1639 	ld	sp, hl
                           1640 ;src/niveles/niveles.c:193: createRocaEspejo(rocasEspejo,10,5,sin_Movimiento,sprite_RockInmovil1_B,1);
   6E3F 21 06 01      [10] 1641 	ld	hl, #0x0106
   6E42 E5            [11] 1642 	push	hl
   6E43 21 05 00      [10] 1643 	ld	hl, #0x0005
   6E46 E5            [11] 1644 	push	hl
   6E47 3E 0A         [ 7] 1645 	ld	a, #0x0a
   6E49 F5            [11] 1646 	push	af
   6E4A 33            [ 6] 1647 	inc	sp
   6E4B DD 6E 08      [19] 1648 	ld	l,8 (ix)
   6E4E DD 66 09      [19] 1649 	ld	h,9 (ix)
   6E51 E5            [11] 1650 	push	hl
   6E52 CD 89 67      [17] 1651 	call	_createRocaEspejo
   6E55 21 07 00      [10] 1652 	ld	hl, #7
   6E58 39            [11] 1653 	add	hl, sp
   6E59 F9            [ 6] 1654 	ld	sp, hl
                           1655 ;src/niveles/niveles.c:194: createRocaEspejo(rocasEspejo,9,1,sin_Movimiento,sprite_RockInmovil2_B,1);
   6E5A 21 08 01      [10] 1656 	ld	hl, #0x0108
   6E5D E5            [11] 1657 	push	hl
   6E5E 21 01 00      [10] 1658 	ld	hl, #0x0001
   6E61 E5            [11] 1659 	push	hl
   6E62 3E 09         [ 7] 1660 	ld	a, #0x09
   6E64 F5            [11] 1661 	push	af
   6E65 33            [ 6] 1662 	inc	sp
   6E66 DD 6E 08      [19] 1663 	ld	l,8 (ix)
   6E69 DD 66 09      [19] 1664 	ld	h,9 (ix)
   6E6C E5            [11] 1665 	push	hl
   6E6D CD 89 67      [17] 1666 	call	_createRocaEspejo
   6E70 21 07 00      [10] 1667 	ld	hl, #7
   6E73 39            [11] 1668 	add	hl, sp
   6E74 F9            [ 6] 1669 	ld	sp, hl
                           1670 ;src/niveles/niveles.c:195: createRocaEspejo(rocasEspejo,9,7,sin_Movimiento,sprite_RockInmovil2_B,1);
   6E75 21 08 01      [10] 1671 	ld	hl, #0x0108
   6E78 E5            [11] 1672 	push	hl
   6E79 21 07 00      [10] 1673 	ld	hl, #0x0007
   6E7C E5            [11] 1674 	push	hl
   6E7D 3E 09         [ 7] 1675 	ld	a, #0x09
   6E7F F5            [11] 1676 	push	af
   6E80 33            [ 6] 1677 	inc	sp
   6E81 DD 6E 08      [19] 1678 	ld	l,8 (ix)
   6E84 DD 66 09      [19] 1679 	ld	h,9 (ix)
   6E87 E5            [11] 1680 	push	hl
   6E88 CD 89 67      [17] 1681 	call	_createRocaEspejo
   6E8B 21 07 00      [10] 1682 	ld	hl, #7
   6E8E 39            [11] 1683 	add	hl, sp
   6E8F F9            [ 6] 1684 	ld	sp, hl
                           1685 ;src/niveles/niveles.c:196: createRocaEspejo(rocasEspejo,14,1,sin_Movimiento,sprite_PrinceofPersia1_B,1);
   6E90 21 1D 01      [10] 1686 	ld	hl, #0x011d
   6E93 E5            [11] 1687 	push	hl
   6E94 21 01 00      [10] 1688 	ld	hl, #0x0001
   6E97 E5            [11] 1689 	push	hl
   6E98 3E 0E         [ 7] 1690 	ld	a, #0x0e
   6E9A F5            [11] 1691 	push	af
   6E9B 33            [ 6] 1692 	inc	sp
   6E9C DD 6E 08      [19] 1693 	ld	l,8 (ix)
   6E9F DD 66 09      [19] 1694 	ld	h,9 (ix)
   6EA2 E5            [11] 1695 	push	hl
   6EA3 CD 89 67      [17] 1696 	call	_createRocaEspejo
   6EA6 21 07 00      [10] 1697 	ld	hl, #7
   6EA9 39            [11] 1698 	add	hl, sp
   6EAA F9            [ 6] 1699 	ld	sp, hl
                           1700 ;src/niveles/niveles.c:197: createRocaEspejo(rocasEspejo,15,1,sin_Movimiento,sprite_PrinceofPersia2_B,1);
   6EAB 21 1F 01      [10] 1701 	ld	hl, #0x011f
   6EAE E5            [11] 1702 	push	hl
   6EAF 21 01 00      [10] 1703 	ld	hl, #0x0001
   6EB2 E5            [11] 1704 	push	hl
   6EB3 3E 0F         [ 7] 1705 	ld	a, #0x0f
   6EB5 F5            [11] 1706 	push	af
   6EB6 33            [ 6] 1707 	inc	sp
   6EB7 DD 6E 08      [19] 1708 	ld	l,8 (ix)
   6EBA DD 66 09      [19] 1709 	ld	h,9 (ix)
   6EBD E5            [11] 1710 	push	hl
   6EBE CD 89 67      [17] 1711 	call	_createRocaEspejo
   6EC1 21 07 00      [10] 1712 	ld	hl, #7
   6EC4 39            [11] 1713 	add	hl, sp
   6EC5 F9            [ 6] 1714 	ld	sp, hl
   6EC6 DD E1         [14] 1715 	pop	ix
   6EC8 C9            [10] 1716 	ret
                           1717 ;src/niveles/niveles.c:199: void crearNivel2(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           1718 ;	---------------------------------
                           1719 ; Function crearNivel2
                           1720 ; ---------------------------------
   6EC9                    1721 _crearNivel2::
                           1722 ;src/niveles/niveles.c:202: }
   6EC9 C9            [10] 1723 	ret
                           1724 ;src/niveles/niveles.c:203: void crearNivel3(TGameObject* player,TGameObject* rocas,TGameObject* rocasEspejo,TGameObject* puertas,TGameObject* portales,TGameObjectCol* col,u8* posicion){
                           1725 ;	---------------------------------
                           1726 ; Function crearNivel3
                           1727 ; ---------------------------------
   6ECA                    1728 _crearNivel3::
                           1729 ;src/niveles/niveles.c:205: }
   6ECA C9            [10] 1730 	ret
                           1731 	.area _CODE
                           1732 	.area _INITIALIZER
                           1733 	.area _CABS (ABS)
