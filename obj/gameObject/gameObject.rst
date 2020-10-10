                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module gameObject
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _comprobarColisiones1vs1
                             12 	.globl _calcularMaximosyMinimos
                             13 	.globl _calcularPosicionEnPantalla
                             14 	.globl _cpct_drawSprite
                             15 	.globl _cpct_drawSolidBox
                             16 	.globl _initGameobjest
                             17 	.globl _dibujarGameObject
                             18 	.globl _limpiarRastro
                             19 	.globl _moverGameObject
                             20 	.globl _moverElEspejo
                             21 	.globl _cambiarPosicion
                             22 	.globl _moverYdibujar
                             23 	.globl _taparHole
                             24 	.globl _moverTipoPlayer
                             25 	.globl _moverTipoRoca
                             26 	.globl _mover1casilla
                             27 	.globl _movimientoLineal
                             28 	.globl _colisionesSiguientePosicion
                             29 	.globl _comprobarRocas
                             30 	.globl _comprobarPortales
                             31 	.globl _comprobarPuertas
                             32 ;--------------------------------------------------------
                             33 ; special function registers
                             34 ;--------------------------------------------------------
                             35 ;--------------------------------------------------------
                             36 ; ram data
                             37 ;--------------------------------------------------------
                             38 	.area _DATA
   61AA                      39 _P_portal:
   61AA                      40 	.ds 2
   61AC                      41 _P_puertas:
   61AC                      42 	.ds 2
                             43 ;--------------------------------------------------------
                             44 ; ram data
                             45 ;--------------------------------------------------------
                             46 	.area _INITIALIZED
                             47 ;--------------------------------------------------------
                             48 ; absolute external ram data
                             49 ;--------------------------------------------------------
                             50 	.area _DABS (ABS)
                             51 ;--------------------------------------------------------
                             52 ; global & static initialisations
                             53 ;--------------------------------------------------------
                             54 	.area _HOME
                             55 	.area _GSINIT
                             56 	.area _GSFINAL
                             57 	.area _GSINIT
                             58 ;--------------------------------------------------------
                             59 ; Home
                             60 ;--------------------------------------------------------
                             61 	.area _HOME
                             62 	.area _HOME
                             63 ;--------------------------------------------------------
                             64 ; code
                             65 ;--------------------------------------------------------
                             66 	.area _CODE
                             67 ;src/gameObject/gameObject.c:23: void initGameobjest(TGameObject* portales,TGameObject* puertas){
                             68 ;	---------------------------------
                             69 ; Function initGameobjest
                             70 ; ---------------------------------
   4FBF                      71 _initGameobjest::
                             72 ;src/gameObject/gameObject.c:24: P_portal=portales;
   4FBF 21 02 00      [10]   73 	ld	hl, #2+0
   4FC2 39            [11]   74 	add	hl, sp
   4FC3 7E            [ 7]   75 	ld	a, (hl)
   4FC4 32 AA 61      [13]   76 	ld	(#_P_portal + 0),a
   4FC7 21 03 00      [10]   77 	ld	hl, #2+1
   4FCA 39            [11]   78 	add	hl, sp
   4FCB 7E            [ 7]   79 	ld	a, (hl)
   4FCC 32 AB 61      [13]   80 	ld	(#_P_portal + 1),a
                             81 ;src/gameObject/gameObject.c:25: P_puertas=puertas;
   4FCF 21 04 00      [10]   82 	ld	hl, #4+0
   4FD2 39            [11]   83 	add	hl, sp
   4FD3 7E            [ 7]   84 	ld	a, (hl)
   4FD4 32 AC 61      [13]   85 	ld	(#_P_puertas + 0),a
   4FD7 21 05 00      [10]   86 	ld	hl, #4+1
   4FDA 39            [11]   87 	add	hl, sp
   4FDB 7E            [ 7]   88 	ld	a, (hl)
   4FDC 32 AD 61      [13]   89 	ld	(#_P_puertas + 1),a
   4FDF C9            [10]   90 	ret
                             91 ;src/gameObject/gameObject.c:28: void dibujarGameObject(TGameObject* objeto){
                             92 ;	---------------------------------
                             93 ; Function dibujarGameObject
                             94 ; ---------------------------------
   4FE0                      95 _dibujarGameObject::
   4FE0 DD E5         [15]   96 	push	ix
   4FE2 DD 21 00 00   [14]   97 	ld	ix,#0
   4FE6 DD 39         [15]   98 	add	ix,sp
                             99 ;src/gameObject/gameObject.c:29: if(objeto->posx!=0){
   4FE8 DD 4E 04      [19]  100 	ld	c,4 (ix)
   4FEB DD 46 05      [19]  101 	ld	b,5 (ix)
   4FEE 69            [ 4]  102 	ld	l, c
   4FEF 60            [ 4]  103 	ld	h, b
   4FF0 23            [ 6]  104 	inc	hl
   4FF1 56            [ 7]  105 	ld	d, (hl)
   4FF2 7A            [ 4]  106 	ld	a, d
   4FF3 B7            [ 4]  107 	or	a, a
   4FF4 CA BA 50      [10]  108 	jp	Z, 00123$
                            109 ;src/gameObject/gameObject.c:30: if(objeto->sprite==sprite_Player){
   4FF7 69            [ 4]  110 	ld	l, c
   4FF8 60            [ 4]  111 	ld	h, b
   4FF9 23            [ 6]  112 	inc	hl
   4FFA 23            [ 6]  113 	inc	hl
   4FFB 23            [ 6]  114 	inc	hl
   4FFC 5E            [ 7]  115 	ld	e, (hl)
                            116 ;src/gameObject/gameObject.c:31: cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   4FFD 69            [ 4]  117 	ld	l, c
   4FFE 60            [ 4]  118 	ld	h, b
   4FFF 23            [ 6]  119 	inc	hl
   5000 23            [ 6]  120 	inc	hl
                            121 ;src/gameObject/gameObject.c:30: if(objeto->sprite==sprite_Player){
   5001 7B            [ 4]  122 	ld	a, e
   5002 3D            [ 4]  123 	dec	a
   5003 20 18         [12]  124 	jr	NZ,00119$
                            125 ;src/gameObject/gameObject.c:31: cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   5005 46            [ 7]  126 	ld	b, (hl)
   5006 4A            [ 4]  127 	ld	c, d
   5007 C5            [11]  128 	push	bc
   5008 CD C6 5D      [17]  129 	call	_calcularPosicionEnPantalla
   500B F1            [10]  130 	pop	af
   500C 4D            [ 4]  131 	ld	c, l
   500D 44            [ 4]  132 	ld	b, h
   500E 21 04 10      [10]  133 	ld	hl, #0x1004
   5011 E5            [11]  134 	push	hl
   5012 C5            [11]  135 	push	bc
   5013 21 58 4F      [10]  136 	ld	hl, #_playerSprite_0
   5016 E5            [11]  137 	push	hl
   5017 CD 58 5F      [17]  138 	call	_cpct_drawSprite
   501A C3 BA 50      [10]  139 	jp	00123$
   501D                     140 00119$:
                            141 ;src/gameObject/gameObject.c:32: }else if(objeto->sprite==sprite_Rock){
   501D 7B            [ 4]  142 	ld	a, e
   501E D6 02         [ 7]  143 	sub	a, #0x02
   5020 20 18         [12]  144 	jr	NZ,00116$
                            145 ;src/gameObject/gameObject.c:33: cpct_drawSprite(rock_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5022 46            [ 7]  146 	ld	b, (hl)
   5023 4A            [ 4]  147 	ld	c, d
   5024 C5            [11]  148 	push	bc
   5025 CD C6 5D      [17]  149 	call	_calcularPosicionEnPantalla
   5028 F1            [10]  150 	pop	af
   5029 4D            [ 4]  151 	ld	c, l
   502A 44            [ 4]  152 	ld	b, h
   502B 21 04 10      [10]  153 	ld	hl, #0x1004
   502E E5            [11]  154 	push	hl
   502F C5            [11]  155 	push	bc
   5030 21 04 4F      [10]  156 	ld	hl, #_rock_0
   5033 E5            [11]  157 	push	hl
   5034 CD 58 5F      [17]  158 	call	_cpct_drawSprite
   5037 C3 BA 50      [10]  159 	jp	00123$
   503A                     160 00116$:
                            161 ;src/gameObject/gameObject.c:34: }else if(objeto->sprite==sprite_RockInmovil){
   503A 7B            [ 4]  162 	ld	a, e
   503B D6 03         [ 7]  163 	sub	a, #0x03
   503D 20 15         [12]  164 	jr	NZ,00113$
                            165 ;src/gameObject/gameObject.c:35: cpct_drawSprite(rockInmovil_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   503F 46            [ 7]  166 	ld	b, (hl)
   5040 4A            [ 4]  167 	ld	c, d
   5041 C5            [11]  168 	push	bc
   5042 CD C6 5D      [17]  169 	call	_calcularPosicionEnPantalla
   5045 F1            [10]  170 	pop	af
   5046 01 B0 4E      [10]  171 	ld	bc, #_rockInmovil_0+0
   5049 11 04 10      [10]  172 	ld	de, #0x1004
   504C D5            [11]  173 	push	de
   504D E5            [11]  174 	push	hl
   504E C5            [11]  175 	push	bc
   504F CD 58 5F      [17]  176 	call	_cpct_drawSprite
   5052 18 66         [12]  177 	jr	00123$
   5054                     178 00113$:
                            179 ;src/gameObject/gameObject.c:36: }else if(objeto->sprite==sprite_RockLineal){
   5054 7B            [ 4]  180 	ld	a, e
   5055 D6 04         [ 7]  181 	sub	a, #0x04
   5057 20 15         [12]  182 	jr	NZ,00110$
                            183 ;src/gameObject/gameObject.c:37: cpct_drawSprite(rockLineal_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5059 46            [ 7]  184 	ld	b, (hl)
   505A 4A            [ 4]  185 	ld	c, d
   505B C5            [11]  186 	push	bc
   505C CD C6 5D      [17]  187 	call	_calcularPosicionEnPantalla
   505F F1            [10]  188 	pop	af
   5060 01 5C 4E      [10]  189 	ld	bc, #_rockLineal_0+0
   5063 11 04 10      [10]  190 	ld	de, #0x1004
   5066 D5            [11]  191 	push	de
   5067 E5            [11]  192 	push	hl
   5068 C5            [11]  193 	push	bc
   5069 CD 58 5F      [17]  194 	call	_cpct_drawSprite
   506C 18 4C         [12]  195 	jr	00123$
   506E                     196 00110$:
                            197 ;src/gameObject/gameObject.c:38: }else if(objeto->sprite==sprite_Portal){
   506E 7B            [ 4]  198 	ld	a, e
   506F D6 05         [ 7]  199 	sub	a, #0x05
   5071 20 15         [12]  200 	jr	NZ,00107$
                            201 ;src/gameObject/gameObject.c:39: cpct_drawSprite(portalSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5073 46            [ 7]  202 	ld	b, (hl)
   5074 4A            [ 4]  203 	ld	c, d
   5075 C5            [11]  204 	push	bc
   5076 CD C6 5D      [17]  205 	call	_calcularPosicionEnPantalla
   5079 F1            [10]  206 	pop	af
   507A 01 08 4E      [10]  207 	ld	bc, #_portalSprite_0+0
   507D 11 04 10      [10]  208 	ld	de, #0x1004
   5080 D5            [11]  209 	push	de
   5081 E5            [11]  210 	push	hl
   5082 C5            [11]  211 	push	bc
   5083 CD 58 5F      [17]  212 	call	_cpct_drawSprite
   5086 18 32         [12]  213 	jr	00123$
   5088                     214 00107$:
                            215 ;src/gameObject/gameObject.c:40: }else if(objeto->sprite==sprite_Puerta){
   5088 7B            [ 4]  216 	ld	a, e
   5089 D6 06         [ 7]  217 	sub	a, #0x06
   508B 20 15         [12]  218 	jr	NZ,00104$
                            219 ;src/gameObject/gameObject.c:41: cpct_drawSprite(puertalSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   508D 46            [ 7]  220 	ld	b, (hl)
   508E 4A            [ 4]  221 	ld	c, d
   508F C5            [11]  222 	push	bc
   5090 CD C6 5D      [17]  223 	call	_calcularPosicionEnPantalla
   5093 F1            [10]  224 	pop	af
   5094 01 B4 4D      [10]  225 	ld	bc, #_puertalSprite_0+0
   5097 11 04 10      [10]  226 	ld	de, #0x1004
   509A D5            [11]  227 	push	de
   509B E5            [11]  228 	push	hl
   509C C5            [11]  229 	push	bc
   509D CD 58 5F      [17]  230 	call	_cpct_drawSprite
   50A0 18 18         [12]  231 	jr	00123$
   50A2                     232 00104$:
                            233 ;src/gameObject/gameObject.c:42: }else if(objeto->sprite==sprite_hole){
   50A2 7B            [ 4]  234 	ld	a, e
   50A3 D6 07         [ 7]  235 	sub	a, #0x07
   50A5 20 13         [12]  236 	jr	NZ,00123$
                            237 ;src/gameObject/gameObject.c:43: cpct_drawSprite(hole_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   50A7 46            [ 7]  238 	ld	b, (hl)
   50A8 4A            [ 4]  239 	ld	c, d
   50A9 C5            [11]  240 	push	bc
   50AA CD C6 5D      [17]  241 	call	_calcularPosicionEnPantalla
   50AD F1            [10]  242 	pop	af
   50AE 01 60 4D      [10]  243 	ld	bc, #_hole_0+0
   50B1 11 04 10      [10]  244 	ld	de, #0x1004
   50B4 D5            [11]  245 	push	de
   50B5 E5            [11]  246 	push	hl
   50B6 C5            [11]  247 	push	bc
   50B7 CD 58 5F      [17]  248 	call	_cpct_drawSprite
   50BA                     249 00123$:
   50BA DD E1         [14]  250 	pop	ix
   50BC C9            [10]  251 	ret
                            252 ;src/gameObject/gameObject.c:48: void limpiarRastro(u8 posx, u8 posy){
                            253 ;	---------------------------------
                            254 ; Function limpiarRastro
                            255 ; ---------------------------------
   50BD                     256 _limpiarRastro::
                            257 ;src/gameObject/gameObject.c:49: cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
   50BD 21 03 00      [10]  258 	ld	hl, #3+0
   50C0 39            [11]  259 	add	hl, sp
   50C1 7E            [ 7]  260 	ld	a, (hl)
   50C2 F5            [11]  261 	push	af
   50C3 33            [ 6]  262 	inc	sp
   50C4 21 03 00      [10]  263 	ld	hl, #3+0
   50C7 39            [11]  264 	add	hl, sp
   50C8 7E            [ 7]  265 	ld	a, (hl)
   50C9 F5            [11]  266 	push	af
   50CA 33            [ 6]  267 	inc	sp
   50CB CD C6 5D      [17]  268 	call	_calcularPosicionEnPantalla
   50CE F1            [10]  269 	pop	af
   50CF 01 04 10      [10]  270 	ld	bc, #0x1004
   50D2 C5            [11]  271 	push	bc
   50D3 01 00 00      [10]  272 	ld	bc, #0x0000
   50D6 C5            [11]  273 	push	bc
   50D7 E5            [11]  274 	push	hl
   50D8 CD CA 60      [17]  275 	call	_cpct_drawSolidBox
   50DB C9            [10]  276 	ret
                            277 ;src/gameObject/gameObject.c:51: u8 moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
                            278 ;	---------------------------------
                            279 ; Function moverGameObject
                            280 ; ---------------------------------
   50DC                     281 _moverGameObject::
   50DC DD E5         [15]  282 	push	ix
   50DE DD 21 00 00   [14]  283 	ld	ix,#0
   50E2 DD 39         [15]  284 	add	ix,sp
                            285 ;src/gameObject/gameObject.c:52: if(objeto->sprite==sprite_Player){
   50E4 DD 4E 04      [19]  286 	ld	c,4 (ix)
   50E7 DD 46 05      [19]  287 	ld	b,5 (ix)
   50EA 69            [ 4]  288 	ld	l, c
   50EB 60            [ 4]  289 	ld	h, b
   50EC 23            [ 6]  290 	inc	hl
   50ED 23            [ 6]  291 	inc	hl
   50EE 23            [ 6]  292 	inc	hl
   50EF 5E            [ 7]  293 	ld	e, (hl)
   50F0 1D            [ 4]  294 	dec	e
   50F1 20 28         [12]  295 	jr	NZ,00102$
                            296 ;src/gameObject/gameObject.c:53: return moverTipoPlayer(objeto,movimiento,rocasCol,rocasEspejo,posicion);
   50F3 DD 6E 0B      [19]  297 	ld	l,11 (ix)
   50F6 DD 66 0C      [19]  298 	ld	h,12 (ix)
   50F9 E5            [11]  299 	push	hl
   50FA DD 6E 09      [19]  300 	ld	l,9 (ix)
   50FD DD 66 0A      [19]  301 	ld	h,10 (ix)
   5100 E5            [11]  302 	push	hl
   5101 DD 6E 07      [19]  303 	ld	l,7 (ix)
   5104 DD 66 08      [19]  304 	ld	h,8 (ix)
   5107 E5            [11]  305 	push	hl
   5108 DD 7E 06      [19]  306 	ld	a, 6 (ix)
   510B F5            [11]  307 	push	af
   510C 33            [ 6]  308 	inc	sp
   510D C5            [11]  309 	push	bc
   510E CD 82 53      [17]  310 	call	_moverTipoPlayer
   5111 FD 21 09 00   [14]  311 	ld	iy, #9
   5115 FD 39         [15]  312 	add	iy, sp
   5117 FD F9         [10]  313 	ld	sp, iy
   5119 18 26         [12]  314 	jr	00104$
   511B                     315 00102$:
                            316 ;src/gameObject/gameObject.c:55: return moverTipoRoca(objeto,movimiento,rocasCol,rocasEspejo,posicion);
   511B DD 6E 0B      [19]  317 	ld	l,11 (ix)
   511E DD 66 0C      [19]  318 	ld	h,12 (ix)
   5121 E5            [11]  319 	push	hl
   5122 DD 6E 09      [19]  320 	ld	l,9 (ix)
   5125 DD 66 0A      [19]  321 	ld	h,10 (ix)
   5128 E5            [11]  322 	push	hl
   5129 DD 6E 07      [19]  323 	ld	l,7 (ix)
   512C DD 66 08      [19]  324 	ld	h,8 (ix)
   512F E5            [11]  325 	push	hl
   5130 DD 7E 06      [19]  326 	ld	a, 6 (ix)
   5133 F5            [11]  327 	push	af
   5134 33            [ 6]  328 	inc	sp
   5135 C5            [11]  329 	push	bc
   5136 CD 73 55      [17]  330 	call	_moverTipoRoca
   5139 FD 21 09 00   [14]  331 	ld	iy, #9
   513D FD 39         [15]  332 	add	iy, sp
   513F FD F9         [10]  333 	ld	sp, iy
   5141                     334 00104$:
   5141 DD E1         [14]  335 	pop	ix
   5143 C9            [10]  336 	ret
                            337 ;src/gameObject/gameObject.c:59: void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocasEspejo,u8 posicion,u8 numMovimientos){
                            338 ;	---------------------------------
                            339 ; Function moverElEspejo
                            340 ; ---------------------------------
   5144                     341 _moverElEspejo::
   5144 DD E5         [15]  342 	push	ix
   5146 DD 21 00 00   [14]  343 	ld	ix,#0
   514A DD 39         [15]  344 	add	ix,sp
   514C 21 F3 FF      [10]  345 	ld	hl, #-13
   514F 39            [11]  346 	add	hl, sp
   5150 F9            [ 6]  347 	ld	sp, hl
                            348 ;src/gameObject/gameObject.c:61: u8 nextMovimiento=movimiento;
   5151 DD 4E 05      [19]  349 	ld	c, 5 (ix)
                            350 ;src/gameObject/gameObject.c:66: if(movimiento==mover_Izquierda){
   5154 79            [ 4]  351 	ld	a, c
   5155 3D            [ 4]  352 	dec	a
   5156 20 02         [12]  353 	jr	NZ,00102$
                            354 ;src/gameObject/gameObject.c:67: nextMovimiento=mover_Derecha;
   5158 0E 03         [ 7]  355 	ld	c, #0x03
   515A                     356 00102$:
                            357 ;src/gameObject/gameObject.c:68: }if(movimiento==mover_Derecha){
   515A DD 7E 05      [19]  358 	ld	a, 5 (ix)
   515D D6 03         [ 7]  359 	sub	a, #0x03
   515F 20 02         [12]  360 	jr	NZ,00104$
                            361 ;src/gameObject/gameObject.c:69: nextMovimiento=mover_Izquierda;
   5161 0E 01         [ 7]  362 	ld	c, #0x01
   5163                     363 00104$:
                            364 ;src/gameObject/gameObject.c:72: if(posicion==posicion_Izquieda){
   5163 DD 7E 08      [19]  365 	ld	a, 8 (ix)
   5166 B7            [ 4]  366 	or	a, a
   5167 20 06         [12]  367 	jr	NZ,00106$
                            368 ;src/gameObject/gameObject.c:73: posicion=posicion_Derecha;
   5169 DD 36 08 01   [19]  369 	ld	8 (ix), #0x01
   516D 18 04         [12]  370 	jr	00145$
   516F                     371 00106$:
                            372 ;src/gameObject/gameObject.c:75: posicion=posicion_Izquieda;
   516F DD 36 08 00   [19]  373 	ld	8 (ix), #0x00
                            374 ;src/gameObject/gameObject.c:78: for(u8 i=0;i<RocasMaximas;i++){
   5173                     375 00145$:
   5173 06 00         [ 7]  376 	ld	b, #0x00
   5175                     377 00128$:
   5175 78            [ 4]  378 	ld	a, b
   5176 D6 28         [ 7]  379 	sub	a, #0x28
   5178 D2 B7 52      [10]  380 	jp	NC, 00130$
                            381 ;src/gameObject/gameObject.c:79: if(rocasEspejo[i].num==num){
   517B 58            [ 4]  382 	ld	e,b
   517C 16 00         [ 7]  383 	ld	d,#0x00
   517E 6B            [ 4]  384 	ld	l, e
   517F 62            [ 4]  385 	ld	h, d
   5180 29            [11]  386 	add	hl, hl
   5181 19            [11]  387 	add	hl, de
   5182 29            [11]  388 	add	hl, hl
   5183 EB            [ 4]  389 	ex	de,hl
   5184 DD 7E 06      [19]  390 	ld	a, 6 (ix)
   5187 83            [ 4]  391 	add	a, e
   5188 5F            [ 4]  392 	ld	e, a
   5189 DD 7E 07      [19]  393 	ld	a, 7 (ix)
   518C 8A            [ 4]  394 	adc	a, d
   518D 57            [ 4]  395 	ld	d, a
   518E 1A            [ 7]  396 	ld	a, (de)
   518F DD 77 F9      [19]  397 	ld	-7 (ix), a
   5192 DD 7E 04      [19]  398 	ld	a, 4 (ix)
   5195 DD 96 F9      [19]  399 	sub	a, -7 (ix)
   5198 C2 B3 52      [10]  400 	jp	NZ,00129$
                            401 ;src/gameObject/gameObject.c:80: objetoEspejo=&rocasEspejo[i];              
                            402 ;src/gameObject/gameObject.c:82: nextPosx=objetoEspejo->posx;
   519B DD 73 F4      [19]  403 	ld	-12 (ix), e
   519E DD 72 F5      [19]  404 	ld	-11 (ix), d
   51A1 13            [ 6]  405 	inc	de
   51A2 1A            [ 7]  406 	ld	a, (de)
   51A3 DD 77 F9      [19]  407 	ld	-7 (ix), a
   51A6 DD 77 F8      [19]  408 	ld	-8 (ix), a
                            409 ;src/gameObject/gameObject.c:83: nextPosy=objetoEspejo->posy;
   51A9 DD 6E F4      [19]  410 	ld	l,-12 (ix)
   51AC DD 66 F5      [19]  411 	ld	h,-11 (ix)
   51AF 23            [ 6]  412 	inc	hl
   51B0 23            [ 6]  413 	inc	hl
   51B1 7E            [ 7]  414 	ld	a, (hl)
   51B2 DD 77 F7      [19]  415 	ld	-9 (ix), a
                            416 ;src/gameObject/gameObject.c:84: if(objetoEspejo->posx!=0){
   51B5 DD 7E F9      [19]  417 	ld	a, -7 (ix)
   51B8 B7            [ 4]  418 	or	a, a
   51B9 CA B3 52      [10]  419 	jp	Z, 00129$
                            420 ;src/gameObject/gameObject.c:85: posicionObjeto=SinColision;
   51BC DD 36 F6 32   [19]  421 	ld	-10 (ix), #0x32
                            422 ;src/gameObject/gameObject.c:86: for(u8 i=0;i<numMovimientos;i++){
   51C0 DD 75 FA      [19]  423 	ld	-6 (ix), l
   51C3 DD 74 FB      [19]  424 	ld	-5 (ix), h
   51C6 DD 73 FE      [19]  425 	ld	-2 (ix), e
   51C9 DD 72 FF      [19]  426 	ld	-1 (ix), d
   51CC DD 36 F3 00   [19]  427 	ld	-13 (ix), #0x00
   51D0                     428 00125$:
   51D0 DD 7E F3      [19]  429 	ld	a, -13 (ix)
   51D3 DD 96 09      [19]  430 	sub	a, 9 (ix)
   51D6 D2 B3 52      [10]  431 	jp	NC, 00129$
                            432 ;src/gameObject/gameObject.c:87: if(posicionObjeto==SinColision){
   51D9 DD 7E F6      [19]  433 	ld	a, -10 (ix)
   51DC D6 32         [ 7]  434 	sub	a, #0x32
   51DE C2 AD 52      [10]  435 	jp	NZ,00126$
                            436 ;src/gameObject/gameObject.c:88: nextMovimiento=calcularMaximosyMinimos(nextMovimiento,objetoEspejo->posx,objetoEspejo->posy,posicion);            
   51E1 DD 6E FA      [19]  437 	ld	l,-6 (ix)
   51E4 DD 66 FB      [19]  438 	ld	h,-5 (ix)
   51E7 5E            [ 7]  439 	ld	e, (hl)
   51E8 DD 6E FE      [19]  440 	ld	l,-2 (ix)
   51EB DD 66 FF      [19]  441 	ld	h,-1 (ix)
   51EE 56            [ 7]  442 	ld	d, (hl)
   51EF C5            [11]  443 	push	bc
   51F0 DD 7E 08      [19]  444 	ld	a, 8 (ix)
   51F3 F5            [11]  445 	push	af
   51F4 33            [ 6]  446 	inc	sp
   51F5 7B            [ 4]  447 	ld	a, e
   51F6 F5            [11]  448 	push	af
   51F7 33            [ 6]  449 	inc	sp
   51F8 59            [ 4]  450 	ld	e, c
   51F9 D5            [11]  451 	push	de
   51FA CD 0C 5E      [17]  452 	call	_calcularMaximosyMinimos
   51FD F1            [10]  453 	pop	af
   51FE F1            [10]  454 	pop	af
   51FF C1            [10]  455 	pop	bc
   5200 4D            [ 4]  456 	ld	c, l
                            457 ;src/gameObject/gameObject.c:89: if(nextMovimiento!=mover_SinMovimiento){
   5201 79            [ 4]  458 	ld	a, c
   5202 B7            [ 4]  459 	or	a, a
   5203 CA AD 52      [10]  460 	jp	Z, 00126$
                            461 ;src/gameObject/gameObject.c:90: posicionObjeto=colisionesSiguientePosicion(objetoEspejo,objetoEspejo->posx,objetoEspejo->posy,nextMovimiento,rocasEspejo,posicion);                                          
   5206 DD 7E 08      [19]  462 	ld	a, 8 (ix)
   5209 DD 77 FC      [19]  463 	ld	-4 (ix), a
   520C DD 36 FD 00   [19]  464 	ld	-3 (ix), #0x00
   5210 DD 6E FA      [19]  465 	ld	l,-6 (ix)
   5213 DD 66 FB      [19]  466 	ld	h,-5 (ix)
   5216 5E            [ 7]  467 	ld	e, (hl)
   5217 DD 6E FE      [19]  468 	ld	l,-2 (ix)
   521A DD 66 FF      [19]  469 	ld	h,-1 (ix)
   521D 56            [ 7]  470 	ld	d, (hl)
   521E C5            [11]  471 	push	bc
   521F DD 6E FC      [19]  472 	ld	l,-4 (ix)
   5222 DD 66 FD      [19]  473 	ld	h,-3 (ix)
   5225 E5            [11]  474 	push	hl
   5226 DD 6E 06      [19]  475 	ld	l,6 (ix)
   5229 DD 66 07      [19]  476 	ld	h,7 (ix)
   522C E5            [11]  477 	push	hl
   522D 79            [ 4]  478 	ld	a, c
   522E F5            [11]  479 	push	af
   522F 33            [ 6]  480 	inc	sp
   5230 7B            [ 4]  481 	ld	a, e
   5231 F5            [11]  482 	push	af
   5232 33            [ 6]  483 	inc	sp
   5233 D5            [11]  484 	push	de
   5234 33            [ 6]  485 	inc	sp
   5235 DD 6E F4      [19]  486 	ld	l,-12 (ix)
   5238 DD 66 F5      [19]  487 	ld	h,-11 (ix)
   523B E5            [11]  488 	push	hl
   523C CD C8 58      [17]  489 	call	_colisionesSiguientePosicion
   523F FD 21 09 00   [14]  490 	ld	iy, #9
   5243 FD 39         [15]  491 	add	iy, sp
   5245 FD F9         [10]  492 	ld	sp, iy
   5247 C1            [10]  493 	pop	bc
                            494 ;src/gameObject/gameObject.c:87: if(posicionObjeto==SinColision){
   5248 DD 75 F6      [19]  495 	ld	-10 (ix), l
   524B 7D            [ 4]  496 	ld	a, l
   524C D6 32         [ 7]  497 	sub	a, #0x32
   524E 20 04         [12]  498 	jr	NZ,00198$
   5250 3E 01         [ 7]  499 	ld	a,#0x01
   5252 18 01         [12]  500 	jr	00199$
   5254                     501 00198$:
   5254 AF            [ 4]  502 	xor	a,a
   5255                     503 00199$:
                            504 ;src/gameObject/gameObject.c:91: if(posicionObjeto==SinColision){
   5255 B7            [ 4]  505 	or	a, a
   5256 28 2A         [12]  506 	jr	Z,00112$
                            507 ;src/gameObject/gameObject.c:92: mover1casilla(&nextPosx,&nextPosy,nextMovimiento);                                                                                 
   5258 21 04 00      [10]  508 	ld	hl, #0x0004
   525B 39            [11]  509 	add	hl, sp
   525C EB            [ 4]  510 	ex	de,hl
   525D 21 05 00      [10]  511 	ld	hl, #0x0005
   5260 39            [11]  512 	add	hl, sp
   5261 C5            [11]  513 	push	bc
   5262 79            [ 4]  514 	ld	a, c
   5263 F5            [11]  515 	push	af
   5264 33            [ 6]  516 	inc	sp
   5265 D5            [11]  517 	push	de
   5266 E5            [11]  518 	push	hl
   5267 CD D8 57      [17]  519 	call	_mover1casilla
   526A F1            [10]  520 	pop	af
   526B 33            [ 6]  521 	inc	sp
   526C DD 66 F7      [19]  522 	ld	h, -9 (ix)
   526F DD 6E F8      [19]  523 	ld	l, -8 (ix)
   5272 E3            [19]  524 	ex	(sp),hl
   5273 DD 6E F4      [19]  525 	ld	l,-12 (ix)
   5276 DD 66 F5      [19]  526 	ld	h,-11 (ix)
   5279 E5            [11]  527 	push	hl
   527A CD CA 52      [17]  528 	call	_moverYdibujar
   527D F1            [10]  529 	pop	af
   527E F1            [10]  530 	pop	af
   527F C1            [10]  531 	pop	bc
   5280 18 2B         [12]  532 	jr	00126$
   5282                     533 00112$:
                            534 ;src/gameObject/gameObject.c:95: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
   5282 B7            [ 4]  535 	or	a, a
   5283 20 28         [12]  536 	jr	NZ,00126$
   5285 DD 7E F6      [19]  537 	ld	a, -10 (ix)
   5288 D6 33         [ 7]  538 	sub	a, #0x33
   528A 28 21         [12]  539 	jr	Z,00126$
                            540 ;src/gameObject/gameObject.c:96: taparHole(objetoEspejo,&rocasEspejo[posicionObjeto]);                                
   528C DD 5E F6      [19]  541 	ld	e,-10 (ix)
   528F 16 00         [ 7]  542 	ld	d,#0x00
   5291 6B            [ 4]  543 	ld	l, e
   5292 62            [ 4]  544 	ld	h, d
   5293 29            [11]  545 	add	hl, hl
   5294 19            [11]  546 	add	hl, de
   5295 29            [11]  547 	add	hl, hl
   5296 EB            [ 4]  548 	ex	de,hl
   5297 DD 6E 06      [19]  549 	ld	l,6 (ix)
   529A DD 66 07      [19]  550 	ld	h,7 (ix)
   529D 19            [11]  551 	add	hl, de
   529E C5            [11]  552 	push	bc
   529F E5            [11]  553 	push	hl
   52A0 DD 6E F4      [19]  554 	ld	l,-12 (ix)
   52A3 DD 66 F5      [19]  555 	ld	h,-11 (ix)
   52A6 E5            [11]  556 	push	hl
   52A7 CD 05 53      [17]  557 	call	_taparHole
   52AA F1            [10]  558 	pop	af
   52AB F1            [10]  559 	pop	af
   52AC C1            [10]  560 	pop	bc
   52AD                     561 00126$:
                            562 ;src/gameObject/gameObject.c:86: for(u8 i=0;i<numMovimientos;i++){
   52AD DD 34 F3      [23]  563 	inc	-13 (ix)
   52B0 C3 D0 51      [10]  564 	jp	00125$
   52B3                     565 00129$:
                            566 ;src/gameObject/gameObject.c:78: for(u8 i=0;i<RocasMaximas;i++){
   52B3 04            [ 4]  567 	inc	b
   52B4 C3 75 51      [10]  568 	jp	00128$
   52B7                     569 00130$:
   52B7 DD F9         [10]  570 	ld	sp, ix
   52B9 DD E1         [14]  571 	pop	ix
   52BB C9            [10]  572 	ret
                            573 ;src/gameObject/gameObject.c:108: void cambiarPosicion(u8* posicion){    
                            574 ;	---------------------------------
                            575 ; Function cambiarPosicion
                            576 ; ---------------------------------
   52BC                     577 _cambiarPosicion::
                            578 ;src/gameObject/gameObject.c:109: if(*posicion==posicion_Izquieda){
   52BC C1            [10]  579 	pop	bc
   52BD E1            [10]  580 	pop	hl
   52BE E5            [11]  581 	push	hl
   52BF C5            [11]  582 	push	bc
   52C0 7E            [ 7]  583 	ld	a, (hl)
   52C1 B7            [ 4]  584 	or	a, a
   52C2 20 03         [12]  585 	jr	NZ,00102$
                            586 ;src/gameObject/gameObject.c:110: *posicion=posicion_Derecha;        
   52C4 36 01         [10]  587 	ld	(hl), #0x01
   52C6 C9            [10]  588 	ret
   52C7                     589 00102$:
                            590 ;src/gameObject/gameObject.c:112: *posicion=posicion_Izquieda;       
   52C7 36 00         [10]  591 	ld	(hl), #0x00
   52C9 C9            [10]  592 	ret
                            593 ;src/gameObject/gameObject.c:117: void moverYdibujar(TGameObject* objeto,u8 posx,u8 posy){
                            594 ;	---------------------------------
                            595 ; Function moverYdibujar
                            596 ; ---------------------------------
   52CA                     597 _moverYdibujar::
   52CA DD E5         [15]  598 	push	ix
   52CC DD 21 00 00   [14]  599 	ld	ix,#0
   52D0 DD 39         [15]  600 	add	ix,sp
   52D2 F5            [11]  601 	push	af
                            602 ;src/gameObject/gameObject.c:118: limpiarRastro(objeto->posx,objeto->posy);    
   52D3 DD 4E 04      [19]  603 	ld	c,4 (ix)
   52D6 DD 46 05      [19]  604 	ld	b,5 (ix)
   52D9 21 02 00      [10]  605 	ld	hl, #0x0002
   52DC 09            [11]  606 	add	hl,bc
   52DD E3            [19]  607 	ex	(sp), hl
   52DE E1            [10]  608 	pop	hl
   52DF E5            [11]  609 	push	hl
   52E0 5E            [ 7]  610 	ld	e, (hl)
   52E1 69            [ 4]  611 	ld	l, c
   52E2 60            [ 4]  612 	ld	h, b
   52E3 23            [ 6]  613 	inc	hl
   52E4 56            [ 7]  614 	ld	d, (hl)
   52E5 E5            [11]  615 	push	hl
   52E6 C5            [11]  616 	push	bc
   52E7 7B            [ 4]  617 	ld	a, e
   52E8 F5            [11]  618 	push	af
   52E9 33            [ 6]  619 	inc	sp
   52EA D5            [11]  620 	push	de
   52EB 33            [ 6]  621 	inc	sp
   52EC CD BD 50      [17]  622 	call	_limpiarRastro
   52EF F1            [10]  623 	pop	af
   52F0 C1            [10]  624 	pop	bc
   52F1 E1            [10]  625 	pop	hl
                            626 ;src/gameObject/gameObject.c:119: objeto->posx=posx;
   52F2 DD 7E 06      [19]  627 	ld	a, 6 (ix)
   52F5 77            [ 7]  628 	ld	(hl), a
                            629 ;src/gameObject/gameObject.c:120: objeto->posy=posy;
   52F6 E1            [10]  630 	pop	hl
   52F7 E5            [11]  631 	push	hl
   52F8 DD 7E 07      [19]  632 	ld	a, 7 (ix)
   52FB 77            [ 7]  633 	ld	(hl), a
                            634 ;src/gameObject/gameObject.c:121: dibujarGameObject(objeto);
   52FC C5            [11]  635 	push	bc
   52FD CD E0 4F      [17]  636 	call	_dibujarGameObject
   5300 DD F9         [10]  637 	ld	sp,ix
   5302 DD E1         [14]  638 	pop	ix
   5304 C9            [10]  639 	ret
                            640 ;src/gameObject/gameObject.c:123: void taparHole(TGameObject* roca,TGameObject* hole){
                            641 ;	---------------------------------
                            642 ; Function taparHole
                            643 ; ---------------------------------
   5305                     644 _taparHole::
   5305 DD E5         [15]  645 	push	ix
   5307 DD 21 00 00   [14]  646 	ld	ix,#0
   530B DD 39         [15]  647 	add	ix,sp
   530D 21 FA FF      [10]  648 	ld	hl, #-6
   5310 39            [11]  649 	add	hl, sp
   5311 F9            [ 6]  650 	ld	sp, hl
                            651 ;src/gameObject/gameObject.c:124: if(hole->sprite==sprite_hole){
   5312 DD 4E 06      [19]  652 	ld	c,6 (ix)
   5315 DD 46 07      [19]  653 	ld	b,7 (ix)
   5318 69            [ 4]  654 	ld	l, c
   5319 60            [ 4]  655 	ld	h, b
   531A 23            [ 6]  656 	inc	hl
   531B 23            [ 6]  657 	inc	hl
   531C 23            [ 6]  658 	inc	hl
   531D 7E            [ 7]  659 	ld	a, (hl)
   531E D6 07         [ 7]  660 	sub	a, #0x07
   5320 20 5B         [12]  661 	jr	NZ,00103$
                            662 ;src/gameObject/gameObject.c:125: limpiarRastro(roca->posx,roca->posy);
   5322 DD 5E 04      [19]  663 	ld	e,4 (ix)
   5325 DD 56 05      [19]  664 	ld	d,5 (ix)
   5328 21 02 00      [10]  665 	ld	hl, #0x0002
   532B 19            [11]  666 	add	hl,de
   532C DD 75 FB      [19]  667 	ld	-5 (ix), l
   532F DD 74 FC      [19]  668 	ld	-4 (ix), h
   5332 7E            [ 7]  669 	ld	a, (hl)
   5333 DD 77 FA      [19]  670 	ld	-6 (ix), a
   5336 13            [ 6]  671 	inc	de
   5337 DD 73 FE      [19]  672 	ld	-2 (ix), e
   533A DD 72 FF      [19]  673 	ld	-1 (ix), d
   533D 6B            [ 4]  674 	ld	l, e
   533E 62            [ 4]  675 	ld	h, d
   533F 56            [ 7]  676 	ld	d, (hl)
   5340 C5            [11]  677 	push	bc
   5341 DD 7E FA      [19]  678 	ld	a, -6 (ix)
   5344 F5            [11]  679 	push	af
   5345 33            [ 6]  680 	inc	sp
   5346 D5            [11]  681 	push	de
   5347 33            [ 6]  682 	inc	sp
   5348 CD BD 50      [17]  683 	call	_limpiarRastro
   534B F1            [10]  684 	pop	af
   534C C1            [10]  685 	pop	bc
                            686 ;src/gameObject/gameObject.c:126: limpiarRastro(hole->posx,hole->posy);
   534D 59            [ 4]  687 	ld	e, c
   534E 50            [ 4]  688 	ld	d, b
   534F 13            [ 6]  689 	inc	de
   5350 13            [ 6]  690 	inc	de
   5351 1A            [ 7]  691 	ld	a, (de)
   5352 DD 77 FA      [19]  692 	ld	-6 (ix), a
   5355 03            [ 6]  693 	inc	bc
   5356 0A            [ 7]  694 	ld	a, (bc)
   5357 DD 77 FD      [19]  695 	ld	-3 (ix), a
   535A C5            [11]  696 	push	bc
   535B D5            [11]  697 	push	de
   535C DD 66 FA      [19]  698 	ld	h, -6 (ix)
   535F DD 6E FD      [19]  699 	ld	l, -3 (ix)
   5362 E5            [11]  700 	push	hl
   5363 CD BD 50      [17]  701 	call	_limpiarRastro
   5366 F1            [10]  702 	pop	af
   5367 D1            [10]  703 	pop	de
   5368 C1            [10]  704 	pop	bc
                            705 ;src/gameObject/gameObject.c:127: roca->posx=0;
   5369 DD 6E FE      [19]  706 	ld	l,-2 (ix)
   536C DD 66 FF      [19]  707 	ld	h,-1 (ix)
   536F 36 00         [10]  708 	ld	(hl), #0x00
                            709 ;src/gameObject/gameObject.c:128: roca->posy=0;
   5371 DD 6E FB      [19]  710 	ld	l,-5 (ix)
   5374 DD 66 FC      [19]  711 	ld	h,-4 (ix)
   5377 36 00         [10]  712 	ld	(hl), #0x00
                            713 ;src/gameObject/gameObject.c:129: hole->posx=0;
   5379 AF            [ 4]  714 	xor	a, a
   537A 02            [ 7]  715 	ld	(bc), a
                            716 ;src/gameObject/gameObject.c:130: hole->posy=0;
   537B AF            [ 4]  717 	xor	a, a
   537C 12            [ 7]  718 	ld	(de), a
   537D                     719 00103$:
   537D DD F9         [10]  720 	ld	sp, ix
   537F DD E1         [14]  721 	pop	ix
   5381 C9            [10]  722 	ret
                            723 ;src/gameObject/gameObject.c:140: u8 moverTipoPlayer(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
                            724 ;	---------------------------------
                            725 ; Function moverTipoPlayer
                            726 ; ---------------------------------
   5382                     727 _moverTipoPlayer::
   5382 DD E5         [15]  728 	push	ix
   5384 DD 21 00 00   [14]  729 	ld	ix,#0
   5388 DD 39         [15]  730 	add	ix,sp
   538A 21 EF FF      [10]  731 	ld	hl, #-17
   538D 39            [11]  732 	add	hl, sp
   538E F9            [ 6]  733 	ld	sp, hl
                            734 ;src/gameObject/gameObject.c:141: if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){    
   538F DD 7E 04      [19]  735 	ld	a, 4 (ix)
   5392 DD 77 FE      [19]  736 	ld	-2 (ix), a
   5395 DD 7E 05      [19]  737 	ld	a, 5 (ix)
   5398 DD 77 FF      [19]  738 	ld	-1 (ix), a
   539B DD 7E FE      [19]  739 	ld	a, -2 (ix)
   539E C6 05         [ 7]  740 	add	a, #0x05
   53A0 DD 77 F7      [19]  741 	ld	-9 (ix), a
   53A3 DD 7E FF      [19]  742 	ld	a, -1 (ix)
   53A6 CE 00         [ 7]  743 	adc	a, #0x00
   53A8 DD 77 F8      [19]  744 	ld	-8 (ix), a
   53AB DD 6E F7      [19]  745 	ld	l,-9 (ix)
   53AE DD 66 F8      [19]  746 	ld	h,-8 (ix)
   53B1 4E            [ 7]  747 	ld	c, (hl)
   53B2 79            [ 4]  748 	ld	a, c
   53B3 B7            [ 4]  749 	or	a, a
   53B4 28 0E         [12]  750 	jr	Z,00116$
   53B6 DD 6E FE      [19]  751 	ld	l,-2 (ix)
   53B9 DD 66 FF      [19]  752 	ld	h,-1 (ix)
   53BC 23            [ 6]  753 	inc	hl
   53BD 23            [ 6]  754 	inc	hl
   53BE 23            [ 6]  755 	inc	hl
   53BF 46            [ 7]  756 	ld	b, (hl)
   53C0 05            [ 4]  757 	dec	b
   53C1 CA 64 55      [10]  758 	jp	Z,00117$
   53C4                     759 00116$:
                            760 ;src/gameObject/gameObject.c:142: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);            
   53C4 DD 4E 0B      [19]  761 	ld	c,11 (ix)
   53C7 DD 46 0C      [19]  762 	ld	b,12 (ix)
   53CA 0A            [ 7]  763 	ld	a, (bc)
   53CB DD 77 F9      [19]  764 	ld	-7 (ix), a
   53CE DD 7E FE      [19]  765 	ld	a, -2 (ix)
   53D1 C6 02         [ 7]  766 	add	a, #0x02
   53D3 DD 77 FA      [19]  767 	ld	-6 (ix), a
   53D6 DD 7E FF      [19]  768 	ld	a, -1 (ix)
   53D9 CE 00         [ 7]  769 	adc	a, #0x00
   53DB DD 77 FB      [19]  770 	ld	-5 (ix), a
   53DE DD 6E FA      [19]  771 	ld	l,-6 (ix)
   53E1 DD 66 FB      [19]  772 	ld	h,-5 (ix)
   53E4 7E            [ 7]  773 	ld	a, (hl)
   53E5 DD 77 F6      [19]  774 	ld	-10 (ix), a
   53E8 DD 5E FE      [19]  775 	ld	e,-2 (ix)
   53EB DD 56 FF      [19]  776 	ld	d,-1 (ix)
   53EE 13            [ 6]  777 	inc	de
   53EF 1A            [ 7]  778 	ld	a, (de)
   53F0 DD 77 F5      [19]  779 	ld	-11 (ix), a
   53F3 C5            [11]  780 	push	bc
   53F4 D5            [11]  781 	push	de
   53F5 DD 66 F9      [19]  782 	ld	h, -7 (ix)
   53F8 DD 6E F6      [19]  783 	ld	l, -10 (ix)
   53FB E5            [11]  784 	push	hl
   53FC DD 66 F5      [19]  785 	ld	h, -11 (ix)
   53FF DD 6E 06      [19]  786 	ld	l, 6 (ix)
   5402 E5            [11]  787 	push	hl
   5403 CD 0C 5E      [17]  788 	call	_calcularMaximosyMinimos
   5406 F1            [10]  789 	pop	af
   5407 F1            [10]  790 	pop	af
   5408 DD 75 F5      [19]  791 	ld	-11 (ix), l
   540B D1            [10]  792 	pop	de
   540C C1            [10]  793 	pop	bc
                            794 ;src/gameObject/gameObject.c:143: if(movimiento!=mover_SinMovimiento){                  
   540D DD 7E F5      [19]  795 	ld	a, -11 (ix)
   5410 B7            [ 4]  796 	or	a, a
   5411 CA 6C 55      [10]  797 	jp	Z, 00118$
                            798 ;src/gameObject/gameObject.c:144: u8 nextPosx=objeto->posx;
   5414 1A            [ 7]  799 	ld	a, (de)
   5415 DD 77 EF      [19]  800 	ld	-17 (ix), a
                            801 ;src/gameObject/gameObject.c:145: u8 nextPosy=objeto->posy;
   5418 DD 6E FA      [19]  802 	ld	l,-6 (ix)
   541B DD 66 FB      [19]  803 	ld	h,-5 (ix)
   541E 7E            [ 7]  804 	ld	a, (hl)
   541F DD 77 F1      [19]  805 	ld	-15 (ix), a
                            806 ;src/gameObject/gameObject.c:148: u8 moverRoca=mover_roca;
   5422 1E 00         [ 7]  807 	ld	e, #0x00
                            808 ;src/gameObject/gameObject.c:152: mover1casilla(&nextPosx,&nextPosy,movimiento);            
   5424 21 02 00      [10]  809 	ld	hl, #0x0002
   5427 39            [11]  810 	add	hl, sp
   5428 DD 75 FA      [19]  811 	ld	-6 (ix), l
   542B DD 74 FB      [19]  812 	ld	-5 (ix), h
   542E DD 7E FA      [19]  813 	ld	a, -6 (ix)
   5431 DD 77 F3      [19]  814 	ld	-13 (ix), a
   5434 DD 7E FB      [19]  815 	ld	a, -5 (ix)
   5437 DD 77 F4      [19]  816 	ld	-12 (ix), a
   543A 21 00 00      [10]  817 	ld	hl, #0x0000
   543D 39            [11]  818 	add	hl, sp
   543E DD 75 FC      [19]  819 	ld	-4 (ix), l
   5441 DD 74 FD      [19]  820 	ld	-3 (ix), h
   5444 E5            [11]  821 	push	hl
   5445 DD 6E FC      [19]  822 	ld	l, -4 (ix)
   5448 DD 66 FD      [19]  823 	ld	h, -3 (ix)
   544B E5            [11]  824 	push	hl
   544C FD E1         [14]  825 	pop	iy
   544E E1            [10]  826 	pop	hl
   544F C5            [11]  827 	push	bc
   5450 D5            [11]  828 	push	de
   5451 DD 7E F5      [19]  829 	ld	a, -11 (ix)
   5454 F5            [11]  830 	push	af
   5455 33            [ 6]  831 	inc	sp
   5456 DD 6E F3      [19]  832 	ld	l,-13 (ix)
   5459 DD 66 F4      [19]  833 	ld	h,-12 (ix)
   545C E5            [11]  834 	push	hl
   545D FD E5         [15]  835 	push	iy
   545F CD D8 57      [17]  836 	call	_mover1casilla
   5462 F1            [10]  837 	pop	af
   5463 33            [ 6]  838 	inc	sp
   5464 DD 66 F1      [19]  839 	ld	h, -15 (ix)
   5467 DD 6E EF      [19]  840 	ld	l, -17 (ix)
   546A E3            [19]  841 	ex	(sp),hl
   546B CD DB 5A      [17]  842 	call	_comprobarPuertas
   546E F1            [10]  843 	pop	af
   546F D1            [10]  844 	pop	de
   5470 C1            [10]  845 	pop	bc
                            846 ;src/gameObject/gameObject.c:155: if(colisionPuerta!=seguir_En_Nivel){
   5471 DD 75 F2      [19]  847 	ld	-14 (ix), l
   5474 7D            [ 4]  848 	ld	a, l
   5475 B7            [ 4]  849 	or	a, a
   5476 28 06         [12]  850 	jr	Z,00102$
                            851 ;src/gameObject/gameObject.c:156: return colisionPuerta;
   5478 DD 6E F2      [19]  852 	ld	l, -14 (ix)
   547B C3 6E 55      [10]  853 	jp	00120$
   547E                     854 00102$:
                            855 ;src/gameObject/gameObject.c:158: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);            
   547E DD 6E FA      [19]  856 	ld	l,-6 (ix)
   5481 DD 66 FB      [19]  857 	ld	h,-5 (ix)
   5484 E5            [11]  858 	push	hl
   5485 FD E1         [14]  859 	pop	iy
   5487 DD 56 FC      [19]  860 	ld	d, -4 (ix)
   548A DD 6E FD      [19]  861 	ld	l, -3 (ix)
   548D DD 72 FC      [19]  862 	ld	-4 (ix), d
   5490 DD 75 FD      [19]  863 	ld	-3 (ix), l
   5493 C5            [11]  864 	push	bc
   5494 D5            [11]  865 	push	de
   5495 C5            [11]  866 	push	bc
   5496 DD 7E F5      [19]  867 	ld	a, -11 (ix)
   5499 F5            [11]  868 	push	af
   549A 33            [ 6]  869 	inc	sp
   549B FD E5         [15]  870 	push	iy
   549D DD 6E FC      [19]  871 	ld	l,-4 (ix)
   54A0 DD 66 FD      [19]  872 	ld	h,-3 (ix)
   54A3 E5            [11]  873 	push	hl
   54A4 DD 6E FE      [19]  874 	ld	l,-2 (ix)
   54A7 DD 66 FF      [19]  875 	ld	h,-1 (ix)
   54AA E5            [11]  876 	push	hl
   54AB CD CA 59      [17]  877 	call	_comprobarPortales
   54AE FD 21 09 00   [14]  878 	ld	iy, #9
   54B2 FD 39         [15]  879 	add	iy, sp
   54B4 FD F9         [10]  880 	ld	sp, iy
   54B6 D1            [10]  881 	pop	de
   54B7 C1            [10]  882 	pop	bc
   54B8 55            [ 4]  883 	ld	d, l
                            884 ;src/gameObject/gameObject.c:159: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);            
   54B9 C5            [11]  885 	push	bc
   54BA D5            [11]  886 	push	de
   54BB DD 6E 07      [19]  887 	ld	l,7 (ix)
   54BE DD 66 08      [19]  888 	ld	h,8 (ix)
   54C1 E5            [11]  889 	push	hl
   54C2 DD 66 F1      [19]  890 	ld	h, -15 (ix)
   54C5 DD 6E EF      [19]  891 	ld	l, -17 (ix)
   54C8 E5            [11]  892 	push	hl
   54C9 CD 81 59      [17]  893 	call	_comprobarRocas
   54CC F1            [10]  894 	pop	af
   54CD F1            [10]  895 	pop	af
   54CE D1            [10]  896 	pop	de
   54CF C1            [10]  897 	pop	bc
   54D0 DD 75 F0      [19]  898 	ld	-16 (ix), l
                            899 ;src/gameObject/gameObject.c:160: if(colisionPortales==hay_Colision){
   54D3 15            [ 4]  900 	dec	d
   54D4 20 2C         [12]  901 	jr	NZ,00107$
                            902 ;src/gameObject/gameObject.c:161: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasEspejo);
   54D6 C5            [11]  903 	push	bc
   54D7 D5            [11]  904 	push	de
   54D8 DD 6E 09      [19]  905 	ld	l,9 (ix)
   54DB DD 66 0A      [19]  906 	ld	h,10 (ix)
   54DE E5            [11]  907 	push	hl
   54DF DD 66 F1      [19]  908 	ld	h, -15 (ix)
   54E2 DD 6E EF      [19]  909 	ld	l, -17 (ix)
   54E5 E5            [11]  910 	push	hl
   54E6 CD 81 59      [17]  911 	call	_comprobarRocas
   54E9 F1            [10]  912 	pop	af
   54EA F1            [10]  913 	pop	af
   54EB D1            [10]  914 	pop	de
   54EC C1            [10]  915 	pop	bc
                            916 ;src/gameObject/gameObject.c:162: if(ObjetoColisionado!=SinColision){
   54ED DD 75 F0      [19]  917 	ld	-16 (ix), l
   54F0 7D            [ 4]  918 	ld	a, l
   54F1 D6 32         [ 7]  919 	sub	a, #0x32
   54F3 28 04         [12]  920 	jr	Z,00104$
                            921 ;src/gameObject/gameObject.c:163: moverRoca=no_mover_roca;
   54F5 1E 01         [ 7]  922 	ld	e, #0x01
   54F7 18 09         [12]  923 	jr	00107$
   54F9                     924 00104$:
                            925 ;src/gameObject/gameObject.c:165: cambiarPosicion(posicion);
   54F9 C5            [11]  926 	push	bc
   54FA D5            [11]  927 	push	de
   54FB C5            [11]  928 	push	bc
   54FC CD BC 52      [17]  929 	call	_cambiarPosicion
   54FF F1            [10]  930 	pop	af
   5500 D1            [10]  931 	pop	de
   5501 C1            [10]  932 	pop	bc
   5502                     933 00107$:
                            934 ;src/gameObject/gameObject.c:168: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision){             
   5502 DD 7E F0      [19]  935 	ld	a, -16 (ix)
   5505 D6 32         [ 7]  936 	sub	a, #0x32
   5507 20 1B         [12]  937 	jr	NZ,00111$
   5509 DD 7E F2      [19]  938 	ld	a, -14 (ix)
   550C B7            [ 4]  939 	or	a, a
   550D 20 15         [12]  940 	jr	NZ,00111$
                            941 ;src/gameObject/gameObject.c:169: moverYdibujar(objeto,nextPosx,nextPosy);                             
   550F DD 66 F1      [19]  942 	ld	h, -15 (ix)
   5512 DD 6E EF      [19]  943 	ld	l, -17 (ix)
   5515 E5            [11]  944 	push	hl
   5516 DD 6E FE      [19]  945 	ld	l,-2 (ix)
   5519 DD 66 FF      [19]  946 	ld	h,-1 (ix)
   551C E5            [11]  947 	push	hl
   551D CD CA 52      [17]  948 	call	_moverYdibujar
   5520 F1            [10]  949 	pop	af
   5521 F1            [10]  950 	pop	af
   5522 18 36         [12]  951 	jr	00112$
   5524                     952 00111$:
                            953 ;src/gameObject/gameObject.c:172: if(moverRoca==mover_roca)          
   5524 7B            [ 4]  954 	ld	a, e
   5525 B7            [ 4]  955 	or	a, a
   5526 20 32         [12]  956 	jr	NZ,00112$
                            957 ;src/gameObject/gameObject.c:173: moverGameObject(&rocasCol[ObjetoColisionado],movimiento,rocasCol,rocasEspejo,posicion);                      
   5528 DD 5E F0      [19]  958 	ld	e,-16 (ix)
   552B 16 00         [ 7]  959 	ld	d,#0x00
   552D 6B            [ 4]  960 	ld	l, e
   552E 62            [ 4]  961 	ld	h, d
   552F 29            [11]  962 	add	hl, hl
   5530 19            [11]  963 	add	hl, de
   5531 29            [11]  964 	add	hl, hl
   5532 EB            [ 4]  965 	ex	de,hl
   5533 DD 7E 07      [19]  966 	ld	a, 7 (ix)
   5536 83            [ 4]  967 	add	a, e
   5537 5F            [ 4]  968 	ld	e, a
   5538 DD 7E 08      [19]  969 	ld	a, 8 (ix)
   553B 8A            [ 4]  970 	adc	a, d
   553C 57            [ 4]  971 	ld	d, a
   553D C5            [11]  972 	push	bc
   553E DD 6E 09      [19]  973 	ld	l,9 (ix)
   5541 DD 66 0A      [19]  974 	ld	h,10 (ix)
   5544 E5            [11]  975 	push	hl
   5545 DD 6E 07      [19]  976 	ld	l,7 (ix)
   5548 DD 66 08      [19]  977 	ld	h,8 (ix)
   554B E5            [11]  978 	push	hl
   554C DD 7E F5      [19]  979 	ld	a, -11 (ix)
   554F F5            [11]  980 	push	af
   5550 33            [ 6]  981 	inc	sp
   5551 D5            [11]  982 	push	de
   5552 CD DC 50      [17]  983 	call	_moverGameObject
   5555 21 09 00      [10]  984 	ld	hl, #9
   5558 39            [11]  985 	add	hl, sp
   5559 F9            [ 6]  986 	ld	sp, hl
   555A                     987 00112$:
                            988 ;src/gameObject/gameObject.c:175: objeto->cronoMovimiento=retardoMovimiento;
   555A DD 6E F7      [19]  989 	ld	l,-9 (ix)
   555D DD 66 F8      [19]  990 	ld	h,-8 (ix)
   5560 36 FF         [10]  991 	ld	(hl), #0xff
   5562 18 08         [12]  992 	jr	00118$
   5564                     993 00117$:
                            994 ;src/gameObject/gameObject.c:178: objeto->cronoMovimiento-=1;
   5564 0D            [ 4]  995 	dec	c
   5565 DD 6E F7      [19]  996 	ld	l,-9 (ix)
   5568 DD 66 F8      [19]  997 	ld	h,-8 (ix)
   556B 71            [ 7]  998 	ld	(hl), c
   556C                     999 00118$:
                           1000 ;src/gameObject/gameObject.c:180: return seguir_En_Nivel;
   556C 2E 00         [ 7] 1001 	ld	l, #0x00
   556E                    1002 00120$:
   556E DD F9         [10] 1003 	ld	sp, ix
   5570 DD E1         [14] 1004 	pop	ix
   5572 C9            [10] 1005 	ret
                           1006 ;src/gameObject/gameObject.c:182: u8 moverTipoRoca(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
                           1007 ;	---------------------------------
                           1008 ; Function moverTipoRoca
                           1009 ; ---------------------------------
   5573                    1010 _moverTipoRoca::
   5573 DD E5         [15] 1011 	push	ix
   5575 DD 21 00 00   [14] 1012 	ld	ix,#0
   5579 DD 39         [15] 1013 	add	ix,sp
   557B 21 F3 FF      [10] 1014 	ld	hl, #-13
   557E 39            [11] 1015 	add	hl, sp
   557F F9            [ 6] 1016 	ld	sp, hl
                           1017 ;src/gameObject/gameObject.c:184: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);
   5580 DD 7E 0B      [19] 1018 	ld	a, 11 (ix)
   5583 DD 77 FD      [19] 1019 	ld	-3 (ix), a
   5586 DD 7E 0C      [19] 1020 	ld	a, 12 (ix)
   5589 DD 77 FE      [19] 1021 	ld	-2 (ix), a
   558C DD 6E FD      [19] 1022 	ld	l,-3 (ix)
   558F DD 66 FE      [19] 1023 	ld	h,-2 (ix)
   5592 56            [ 7] 1024 	ld	d, (hl)
   5593 DD 4E 04      [19] 1025 	ld	c,4 (ix)
   5596 DD 46 05      [19] 1026 	ld	b,5 (ix)
   5599 21 02 00      [10] 1027 	ld	hl, #0x0002
   559C 09            [11] 1028 	add	hl,bc
   559D DD 75 FB      [19] 1029 	ld	-5 (ix), l
   55A0 DD 74 FC      [19] 1030 	ld	-4 (ix), h
   55A3 5E            [ 7] 1031 	ld	e, (hl)
   55A4 21 01 00      [10] 1032 	ld	hl, #0x0001
   55A7 09            [11] 1033 	add	hl,bc
   55A8 DD 75 F9      [19] 1034 	ld	-7 (ix), l
   55AB DD 74 FA      [19] 1035 	ld	-6 (ix), h
   55AE 7E            [ 7] 1036 	ld	a, (hl)
   55AF DD 77 FF      [19] 1037 	ld	-1 (ix), a
   55B2 C5            [11] 1038 	push	bc
   55B3 D5            [11] 1039 	push	de
   55B4 33            [ 6] 1040 	inc	sp
   55B5 53            [ 4] 1041 	ld	d, e
   55B6 DD 5E FF      [19] 1042 	ld	e, -1 (ix)
   55B9 D5            [11] 1043 	push	de
   55BA DD 7E 06      [19] 1044 	ld	a, 6 (ix)
   55BD F5            [11] 1045 	push	af
   55BE 33            [ 6] 1046 	inc	sp
   55BF CD 0C 5E      [17] 1047 	call	_calcularMaximosyMinimos
   55C2 F1            [10] 1048 	pop	af
   55C3 F1            [10] 1049 	pop	af
   55C4 5D            [ 4] 1050 	ld	e, l
   55C5 C1            [10] 1051 	pop	bc
                           1052 ;src/gameObject/gameObject.c:186: if(movimiento!=mover_SinMovimiento && objeto->movimiento != sin_Movimiento){                  
   55C6 7B            [ 4] 1053 	ld	a, e
   55C7 B7            [ 4] 1054 	or	a, a
   55C8 CA D1 57      [10] 1055 	jp	Z, 00123$
   55CB 21 04 00      [10] 1056 	ld	hl, #0x0004
   55CE 09            [11] 1057 	add	hl,bc
   55CF DD 75 F7      [19] 1058 	ld	-9 (ix), l
   55D2 DD 74 F8      [19] 1059 	ld	-8 (ix), h
   55D5 56            [ 7] 1060 	ld	d, (hl)
   55D6 7A            [ 4] 1061 	ld	a, d
   55D7 B7            [ 4] 1062 	or	a, a
   55D8 CA D1 57      [10] 1063 	jp	Z, 00123$
                           1064 ;src/gameObject/gameObject.c:187: u8 nextPosx=objeto->posx;
   55DB DD 6E F9      [19] 1065 	ld	l,-7 (ix)
   55DE DD 66 FA      [19] 1066 	ld	h,-6 (ix)
   55E1 7E            [ 7] 1067 	ld	a, (hl)
   55E2 DD 77 F4      [19] 1068 	ld	-12 (ix), a
                           1069 ;src/gameObject/gameObject.c:188: u8 nextPosy=objeto->posy;
   55E5 DD 6E FB      [19] 1070 	ld	l,-5 (ix)
   55E8 DD 66 FC      [19] 1071 	ld	h,-4 (ix)
   55EB 7E            [ 7] 1072 	ld	a, (hl)
   55EC DD 77 F3      [19] 1073 	ld	-13 (ix), a
                           1074 ;src/gameObject/gameObject.c:189: u8 numMovimientos=0;
   55EF DD 36 FF 00   [19] 1075 	ld	-1 (ix), #0x00
                           1076 ;src/gameObject/gameObject.c:193: if(objeto->movimiento==mover_1){
   55F3 7A            [ 4] 1077 	ld	a, d
   55F4 3D            [ 4] 1078 	dec	a
   55F5 20 2C         [12] 1079 	jr	NZ,00104$
                           1080 ;src/gameObject/gameObject.c:194: mover1casilla(&nextPosx,&nextPosy,movimiento);
   55F7 21 00 00      [10] 1081 	ld	hl, #0x0000
   55FA 39            [11] 1082 	add	hl, sp
   55FB DD 75 F5      [19] 1083 	ld	-11 (ix), l
   55FE DD 74 F6      [19] 1084 	ld	-10 (ix), h
   5601 FD 21 01 00   [14] 1085 	ld	iy,#0x0001
   5605 FD 39         [15] 1086 	add	iy,sp
   5607 C5            [11] 1087 	push	bc
   5608 D5            [11] 1088 	push	de
   5609 7B            [ 4] 1089 	ld	a, e
   560A F5            [11] 1090 	push	af
   560B 33            [ 6] 1091 	inc	sp
   560C DD 6E F5      [19] 1092 	ld	l,-11 (ix)
   560F DD 66 F6      [19] 1093 	ld	h,-10 (ix)
   5612 E5            [11] 1094 	push	hl
   5613 FD E5         [15] 1095 	push	iy
   5615 CD D8 57      [17] 1096 	call	_mover1casilla
   5618 F1            [10] 1097 	pop	af
   5619 F1            [10] 1098 	pop	af
   561A 33            [ 6] 1099 	inc	sp
   561B D1            [10] 1100 	pop	de
   561C C1            [10] 1101 	pop	bc
                           1102 ;src/gameObject/gameObject.c:195: numMovimientos=1;                 
   561D DD 36 FF 01   [19] 1103 	ld	-1 (ix), #0x01
   5621 18 44         [12] 1104 	jr	00105$
   5623                    1105 00104$:
                           1106 ;src/gameObject/gameObject.c:196: }else if(objeto->movimiento==mover_Linea){
   5623 7A            [ 4] 1107 	ld	a, d
   5624 D6 02         [ 7] 1108 	sub	a, #0x02
   5626 20 3F         [12] 1109 	jr	NZ,00105$
                           1110 ;src/gameObject/gameObject.c:197: numMovimientos=movimientoLineal(objeto,&nextPosx,&nextPosy,movimiento,rocasCol,*posicion);
   5628 DD 6E FD      [19] 1111 	ld	l,-3 (ix)
   562B DD 66 FE      [19] 1112 	ld	h,-2 (ix)
   562E 56            [ 7] 1113 	ld	d, (hl)
   562F 21 00 00      [10] 1114 	ld	hl, #0x0000
   5632 39            [11] 1115 	add	hl, sp
   5633 DD 75 F5      [19] 1116 	ld	-11 (ix), l
   5636 DD 74 F6      [19] 1117 	ld	-10 (ix), h
   5639 FD 21 01 00   [14] 1118 	ld	iy,#0x0001
   563D FD 39         [15] 1119 	add	iy,sp
   563F C5            [11] 1120 	push	bc
   5640 D5            [11] 1121 	push	de
   5641 D5            [11] 1122 	push	de
   5642 33            [ 6] 1123 	inc	sp
   5643 DD 6E 07      [19] 1124 	ld	l,7 (ix)
   5646 DD 66 08      [19] 1125 	ld	h,8 (ix)
   5649 E5            [11] 1126 	push	hl
   564A 7B            [ 4] 1127 	ld	a, e
   564B F5            [11] 1128 	push	af
   564C 33            [ 6] 1129 	inc	sp
   564D DD 6E F5      [19] 1130 	ld	l,-11 (ix)
   5650 DD 66 F6      [19] 1131 	ld	h,-10 (ix)
   5653 E5            [11] 1132 	push	hl
   5654 FD E5         [15] 1133 	push	iy
   5656 C5            [11] 1134 	push	bc
   5657 CD 1D 58      [17] 1135 	call	_movimientoLineal
   565A FD 21 0A 00   [14] 1136 	ld	iy, #10
   565E FD 39         [15] 1137 	add	iy, sp
   5660 FD F9         [10] 1138 	ld	sp, iy
   5662 D1            [10] 1139 	pop	de
   5663 C1            [10] 1140 	pop	bc
   5664 DD 75 FF      [19] 1141 	ld	-1 (ix), l
   5667                    1142 00105$:
                           1143 ;src/gameObject/gameObject.c:199: posicionObjeto=colisionesSiguientePosicion(objeto,objeto->posx,objeto->posy,movimiento,rocasCol,posicion);                                      
   5667 DD 6E FB      [19] 1144 	ld	l,-5 (ix)
   566A DD 66 FC      [19] 1145 	ld	h,-4 (ix)
   566D 7E            [ 7] 1146 	ld	a, (hl)
   566E DD 77 F5      [19] 1147 	ld	-11 (ix), a
   5671 DD 6E F9      [19] 1148 	ld	l,-7 (ix)
   5674 DD 66 FA      [19] 1149 	ld	h,-6 (ix)
   5677 56            [ 7] 1150 	ld	d, (hl)
   5678 C5            [11] 1151 	push	bc
   5679 D5            [11] 1152 	push	de
   567A DD 6E FD      [19] 1153 	ld	l,-3 (ix)
   567D DD 66 FE      [19] 1154 	ld	h,-2 (ix)
   5680 E5            [11] 1155 	push	hl
   5681 DD 6E 07      [19] 1156 	ld	l,7 (ix)
   5684 DD 66 08      [19] 1157 	ld	h,8 (ix)
   5687 E5            [11] 1158 	push	hl
   5688 7B            [ 4] 1159 	ld	a, e
   5689 F5            [11] 1160 	push	af
   568A 33            [ 6] 1161 	inc	sp
   568B DD 7E F5      [19] 1162 	ld	a, -11 (ix)
   568E F5            [11] 1163 	push	af
   568F 33            [ 6] 1164 	inc	sp
   5690 D5            [11] 1165 	push	de
   5691 33            [ 6] 1166 	inc	sp
   5692 C5            [11] 1167 	push	bc
   5693 CD C8 58      [17] 1168 	call	_colisionesSiguientePosicion
   5696 FD 21 09 00   [14] 1169 	ld	iy, #9
   569A FD 39         [15] 1170 	add	iy, sp
   569C FD F9         [10] 1171 	ld	sp, iy
   569E D1            [10] 1172 	pop	de
   569F C1            [10] 1173 	pop	bc
   56A0 7D            [ 4] 1174 	ld	a, l
                           1175 ;src/gameObject/gameObject.c:200: if(posicionObjeto==SinColision){
   56A1 FE 32         [ 7] 1176 	cp	a, #0x32
   56A3 C2 AF 57      [10] 1177 	jp	NZ,00120$
                           1178 ;src/gameObject/gameObject.c:201: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);             
   56A6 C5            [11] 1179 	push	bc
   56A7 D5            [11] 1180 	push	de
   56A8 DD 6E 0B      [19] 1181 	ld	l,11 (ix)
   56AB DD 66 0C      [19] 1182 	ld	h,12 (ix)
   56AE E5            [11] 1183 	push	hl
   56AF DD 6E 07      [19] 1184 	ld	l,7 (ix)
   56B2 DD 66 08      [19] 1185 	ld	h,8 (ix)
   56B5 E5            [11] 1186 	push	hl
   56B6 53            [ 4] 1187 	ld	d, e
   56B7 DD 5E F3      [19] 1188 	ld	e, -13 (ix)
   56BA D5            [11] 1189 	push	de
   56BB DD 7E F4      [19] 1190 	ld	a, -12 (ix)
   56BE F5            [11] 1191 	push	af
   56BF 33            [ 6] 1192 	inc	sp
   56C0 DD 6E 04      [19] 1193 	ld	l,4 (ix)
   56C3 DD 66 05      [19] 1194 	ld	h,5 (ix)
   56C6 E5            [11] 1195 	push	hl
   56C7 CD C8 58      [17] 1196 	call	_colisionesSiguientePosicion
   56CA 21 09 00      [10] 1197 	ld	hl, #9
   56CD 39            [11] 1198 	add	hl, sp
   56CE F9            [ 6] 1199 	ld	sp, hl
   56CF DD 66 F3      [19] 1200 	ld	h, -13 (ix)
   56D2 DD 6E F4      [19] 1201 	ld	l, -12 (ix)
   56D5 E5            [11] 1202 	push	hl
   56D6 DD 6E 04      [19] 1203 	ld	l,4 (ix)
   56D9 DD 66 05      [19] 1204 	ld	h,5 (ix)
   56DC E5            [11] 1205 	push	hl
   56DD CD CA 52      [17] 1206 	call	_moverYdibujar
   56E0 F1            [10] 1207 	pop	af
   56E1 F1            [10] 1208 	pop	af
   56E2 D1            [10] 1209 	pop	de
   56E3 C1            [10] 1210 	pop	bc
                           1211 ;src/gameObject/gameObject.c:203: moverElEspejo(objeto->num,movimiento,rocasEspejo,*posicion,numMovimientos);
   56E4 DD 6E FD      [19] 1212 	ld	l,-3 (ix)
   56E7 DD 66 FE      [19] 1213 	ld	h,-2 (ix)
   56EA 56            [ 7] 1214 	ld	d, (hl)
   56EB 0A            [ 7] 1215 	ld	a, (bc)
   56EC DD 77 F5      [19] 1216 	ld	-11 (ix), a
   56EF C5            [11] 1217 	push	bc
   56F0 D5            [11] 1218 	push	de
   56F1 DD 7E FF      [19] 1219 	ld	a, -1 (ix)
   56F4 F5            [11] 1220 	push	af
   56F5 33            [ 6] 1221 	inc	sp
   56F6 D5            [11] 1222 	push	de
   56F7 33            [ 6] 1223 	inc	sp
   56F8 DD 6E 09      [19] 1224 	ld	l,9 (ix)
   56FB DD 66 0A      [19] 1225 	ld	h,10 (ix)
   56FE E5            [11] 1226 	push	hl
   56FF 53            [ 4] 1227 	ld	d, e
   5700 DD 5E F5      [19] 1228 	ld	e, -11 (ix)
   5703 D5            [11] 1229 	push	de
   5704 CD 44 51      [17] 1230 	call	_moverElEspejo
   5707 21 06 00      [10] 1231 	ld	hl, #6
   570A 39            [11] 1232 	add	hl, sp
   570B F9            [ 6] 1233 	ld	sp, hl
   570C D1            [10] 1234 	pop	de
   570D C1            [10] 1235 	pop	bc
                           1236 ;src/gameObject/gameObject.c:204: if(objeto->movimiento==mover_1){
   570E DD 6E F7      [19] 1237 	ld	l,-9 (ix)
   5711 DD 66 F8      [19] 1238 	ld	h,-8 (ix)
   5714 7E            [ 7] 1239 	ld	a, (hl)
   5715 FE 01         [ 7] 1240 	cp	a, #0x01
   5717 20 4A         [12] 1241 	jr	NZ,00115$
                           1242 ;src/gameObject/gameObject.c:205: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,mover_SinMovimiento,rocasCol,posicion);
   5719 C5            [11] 1243 	push	bc
   571A DD 6E FD      [19] 1244 	ld	l,-3 (ix)
   571D DD 66 FE      [19] 1245 	ld	h,-2 (ix)
   5720 E5            [11] 1246 	push	hl
   5721 DD 6E 07      [19] 1247 	ld	l,7 (ix)
   5724 DD 66 08      [19] 1248 	ld	h,8 (ix)
   5727 E5            [11] 1249 	push	hl
   5728 AF            [ 4] 1250 	xor	a, a
   5729 F5            [11] 1251 	push	af
   572A 33            [ 6] 1252 	inc	sp
   572B DD 66 F3      [19] 1253 	ld	h, -13 (ix)
   572E DD 6E F4      [19] 1254 	ld	l, -12 (ix)
   5731 E5            [11] 1255 	push	hl
   5732 C5            [11] 1256 	push	bc
   5733 CD C8 58      [17] 1257 	call	_colisionesSiguientePosicion
   5736 FD 21 09 00   [14] 1258 	ld	iy, #9
   573A FD 39         [15] 1259 	add	iy, sp
   573C FD F9         [10] 1260 	ld	sp, iy
   573E C1            [10] 1261 	pop	bc
   573F 7D            [ 4] 1262 	ld	a, l
                           1263 ;src/gameObject/gameObject.c:206: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
   5740 FE 32         [ 7] 1264 	cp	a, #0x32
   5742 CA D1 57      [10] 1265 	jp	Z,00123$
   5745 FE 33         [ 7] 1266 	cp	a, #0x33
   5747 CA D1 57      [10] 1267 	jp	Z,00123$
                           1268 ;src/gameObject/gameObject.c:207: taparHole(objeto,&rocasCol[posicionObjeto]);
   574A 5F            [ 4] 1269 	ld	e,a
   574B 16 00         [ 7] 1270 	ld	d,#0x00
   574D 6B            [ 4] 1271 	ld	l, e
   574E 62            [ 4] 1272 	ld	h, d
   574F 29            [11] 1273 	add	hl, hl
   5750 19            [11] 1274 	add	hl, de
   5751 29            [11] 1275 	add	hl, hl
   5752 EB            [ 4] 1276 	ex	de,hl
   5753 DD 6E 07      [19] 1277 	ld	l,7 (ix)
   5756 DD 66 08      [19] 1278 	ld	h,8 (ix)
   5759 19            [11] 1279 	add	hl, de
   575A E5            [11] 1280 	push	hl
   575B C5            [11] 1281 	push	bc
   575C CD 05 53      [17] 1282 	call	_taparHole
   575F F1            [10] 1283 	pop	af
   5760 F1            [10] 1284 	pop	af
   5761 18 6E         [12] 1285 	jr	00123$
   5763                    1286 00115$:
                           1287 ;src/gameObject/gameObject.c:209: }else if(objeto->movimiento==mover_Linea){
   5763 D6 02         [ 7] 1288 	sub	a, #0x02
   5765 20 6A         [12] 1289 	jr	NZ,00123$
                           1290 ;src/gameObject/gameObject.c:210: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);
   5767 C5            [11] 1291 	push	bc
   5768 DD 6E FD      [19] 1292 	ld	l,-3 (ix)
   576B DD 66 FE      [19] 1293 	ld	h,-2 (ix)
   576E E5            [11] 1294 	push	hl
   576F DD 6E 07      [19] 1295 	ld	l,7 (ix)
   5772 DD 66 08      [19] 1296 	ld	h,8 (ix)
   5775 E5            [11] 1297 	push	hl
   5776 53            [ 4] 1298 	ld	d, e
   5777 DD 5E F3      [19] 1299 	ld	e, -13 (ix)
   577A D5            [11] 1300 	push	de
   577B DD 7E F4      [19] 1301 	ld	a, -12 (ix)
   577E F5            [11] 1302 	push	af
   577F 33            [ 6] 1303 	inc	sp
   5780 C5            [11] 1304 	push	bc
   5781 CD C8 58      [17] 1305 	call	_colisionesSiguientePosicion
   5784 FD 21 09 00   [14] 1306 	ld	iy, #9
   5788 FD 39         [15] 1307 	add	iy, sp
   578A FD F9         [10] 1308 	ld	sp, iy
   578C C1            [10] 1309 	pop	bc
   578D 7D            [ 4] 1310 	ld	a, l
                           1311 ;src/gameObject/gameObject.c:211: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
   578E FE 32         [ 7] 1312 	cp	a, #0x32
   5790 28 3F         [12] 1313 	jr	Z,00123$
   5792 FE 33         [ 7] 1314 	cp	a, #0x33
   5794 28 3B         [12] 1315 	jr	Z,00123$
                           1316 ;src/gameObject/gameObject.c:212: taparHole(objeto,&rocasCol[posicionObjeto]);
   5796 5F            [ 4] 1317 	ld	e,a
   5797 16 00         [ 7] 1318 	ld	d,#0x00
   5799 6B            [ 4] 1319 	ld	l, e
   579A 62            [ 4] 1320 	ld	h, d
   579B 29            [11] 1321 	add	hl, hl
   579C 19            [11] 1322 	add	hl, de
   579D 29            [11] 1323 	add	hl, hl
   579E EB            [ 4] 1324 	ex	de,hl
   579F DD 6E 07      [19] 1325 	ld	l,7 (ix)
   57A2 DD 66 08      [19] 1326 	ld	h,8 (ix)
   57A5 19            [11] 1327 	add	hl, de
   57A6 E5            [11] 1328 	push	hl
   57A7 C5            [11] 1329 	push	bc
   57A8 CD 05 53      [17] 1330 	call	_taparHole
   57AB F1            [10] 1331 	pop	af
   57AC F1            [10] 1332 	pop	af
   57AD 18 22         [12] 1333 	jr	00123$
   57AF                    1334 00120$:
                           1335 ;src/gameObject/gameObject.c:216: if(posicionObjeto!=ColisionNoRocas){
   57AF FE 33         [ 7] 1336 	cp	a, #0x33
   57B1 28 1E         [12] 1337 	jr	Z,00123$
                           1338 ;src/gameObject/gameObject.c:217: taparHole(objeto,&rocasCol[posicionObjeto]);
   57B3 4F            [ 4] 1339 	ld	c,a
   57B4 06 00         [ 7] 1340 	ld	b,#0x00
   57B6 69            [ 4] 1341 	ld	l, c
   57B7 60            [ 4] 1342 	ld	h, b
   57B8 29            [11] 1343 	add	hl, hl
   57B9 09            [11] 1344 	add	hl, bc
   57BA 29            [11] 1345 	add	hl, hl
   57BB 4D            [ 4] 1346 	ld	c, l
   57BC 44            [ 4] 1347 	ld	b, h
   57BD DD 6E 07      [19] 1348 	ld	l,7 (ix)
   57C0 DD 66 08      [19] 1349 	ld	h,8 (ix)
   57C3 09            [11] 1350 	add	hl, bc
   57C4 E5            [11] 1351 	push	hl
   57C5 DD 6E 04      [19] 1352 	ld	l,4 (ix)
   57C8 DD 66 05      [19] 1353 	ld	h,5 (ix)
   57CB E5            [11] 1354 	push	hl
   57CC CD 05 53      [17] 1355 	call	_taparHole
   57CF F1            [10] 1356 	pop	af
   57D0 F1            [10] 1357 	pop	af
   57D1                    1358 00123$:
                           1359 ;src/gameObject/gameObject.c:223: return seguir_En_Nivel;
   57D1 2E 00         [ 7] 1360 	ld	l, #0x00
   57D3 DD F9         [10] 1361 	ld	sp, ix
   57D5 DD E1         [14] 1362 	pop	ix
   57D7 C9            [10] 1363 	ret
                           1364 ;src/gameObject/gameObject.c:231: void mover1casilla(u8* posx, u8* posy,u8 movimiento){
                           1365 ;	---------------------------------
                           1366 ; Function mover1casilla
                           1367 ; ---------------------------------
   57D8                    1368 _mover1casilla::
   57D8 DD E5         [15] 1369 	push	ix
   57DA DD 21 00 00   [14] 1370 	ld	ix,#0
   57DE DD 39         [15] 1371 	add	ix,sp
                           1372 ;src/gameObject/gameObject.c:233: *posx-=1;
   57E0 DD 4E 04      [19] 1373 	ld	c,4 (ix)
   57E3 DD 46 05      [19] 1374 	ld	b,5 (ix)
                           1375 ;src/gameObject/gameObject.c:232: if(movimiento==mover_Izquierda){
   57E6 DD 7E 08      [19] 1376 	ld	a, 8 (ix)
   57E9 3D            [ 4] 1377 	dec	a
   57EA 20 06         [12] 1378 	jr	NZ,00110$
                           1379 ;src/gameObject/gameObject.c:233: *posx-=1;
   57EC 0A            [ 7] 1380 	ld	a, (bc)
   57ED C6 FF         [ 7] 1381 	add	a, #0xff
   57EF 02            [ 7] 1382 	ld	(bc), a
   57F0 18 28         [12] 1383 	jr	00112$
   57F2                    1384 00110$:
                           1385 ;src/gameObject/gameObject.c:235: *posy-=1;
   57F2 DD 6E 06      [19] 1386 	ld	l,6 (ix)
   57F5 DD 66 07      [19] 1387 	ld	h,7 (ix)
                           1388 ;src/gameObject/gameObject.c:234: }else if(movimiento==mover_Arriba){
   57F8 DD 7E 08      [19] 1389 	ld	a, 8 (ix)
   57FB D6 02         [ 7] 1390 	sub	a, #0x02
   57FD 20 05         [12] 1391 	jr	NZ,00107$
                           1392 ;src/gameObject/gameObject.c:235: *posy-=1;
   57FF 4E            [ 7] 1393 	ld	c, (hl)
   5800 0D            [ 4] 1394 	dec	c
   5801 71            [ 7] 1395 	ld	(hl), c
   5802 18 16         [12] 1396 	jr	00112$
   5804                    1397 00107$:
                           1398 ;src/gameObject/gameObject.c:236: }else if(movimiento==mover_Derecha){
   5804 DD 7E 08      [19] 1399 	ld	a, 8 (ix)
   5807 D6 03         [ 7] 1400 	sub	a, #0x03
   5809 20 05         [12] 1401 	jr	NZ,00104$
                           1402 ;src/gameObject/gameObject.c:237: *posx+=1;
   580B 0A            [ 7] 1403 	ld	a, (bc)
   580C 3C            [ 4] 1404 	inc	a
   580D 02            [ 7] 1405 	ld	(bc), a
   580E 18 0A         [12] 1406 	jr	00112$
   5810                    1407 00104$:
                           1408 ;src/gameObject/gameObject.c:238: }else if(movimiento==mover_Abajo){
   5810 DD 7E 08      [19] 1409 	ld	a, 8 (ix)
   5813 D6 04         [ 7] 1410 	sub	a, #0x04
   5815 20 03         [12] 1411 	jr	NZ,00112$
                           1412 ;src/gameObject/gameObject.c:239: *posy+=1;
   5817 4E            [ 7] 1413 	ld	c, (hl)
   5818 0C            [ 4] 1414 	inc	c
   5819 71            [ 7] 1415 	ld	(hl), c
   581A                    1416 00112$:
   581A DD E1         [14] 1417 	pop	ix
   581C C9            [10] 1418 	ret
                           1419 ;src/gameObject/gameObject.c:243: u8 movimientoLineal(TGameObject* objeto,u8* posx, u8* posy,u8 movimiento,TGameObject* objetosCol,u8 posicion){    
                           1420 ;	---------------------------------
                           1421 ; Function movimientoLineal
                           1422 ; ---------------------------------
   581D                    1423 _movimientoLineal::
   581D DD E5         [15] 1424 	push	ix
   581F DD 21 00 00   [14] 1425 	ld	ix,#0
   5823 DD 39         [15] 1426 	add	ix,sp
   5825 F5            [11] 1427 	push	af
   5826 F5            [11] 1428 	push	af
   5827 3B            [ 6] 1429 	dec	sp
                           1430 ;src/gameObject/gameObject.c:246: while (colisionesSiguientePosicion(objeto,*posx,*posy,movimiento,objetosCol,posicion)==SinColision && movimiento!=mover_SinMovimiento)
   5828 DD 7E 08      [19] 1431 	ld	a, 8 (ix)
   582B DD 77 FE      [19] 1432 	ld	-2 (ix), a
   582E DD 7E 09      [19] 1433 	ld	a, 9 (ix)
   5831 DD 77 FF      [19] 1434 	ld	-1 (ix), a
   5834 DD 4E 06      [19] 1435 	ld	c,6 (ix)
   5837 DD 46 07      [19] 1436 	ld	b,7 (ix)
   583A DD 36 FB 00   [19] 1437 	ld	-5 (ix), #0x00
   583E                    1438 00102$:
   583E DD 7E 0D      [19] 1439 	ld	a, 13 (ix)
   5841 DD 77 FC      [19] 1440 	ld	-4 (ix), a
   5844 DD 36 FD 00   [19] 1441 	ld	-3 (ix), #0x00
   5848 DD 6E FE      [19] 1442 	ld	l,-2 (ix)
   584B DD 66 FF      [19] 1443 	ld	h,-1 (ix)
   584E 5E            [ 7] 1444 	ld	e, (hl)
   584F 0A            [ 7] 1445 	ld	a, (bc)
   5850 57            [ 4] 1446 	ld	d, a
   5851 C5            [11] 1447 	push	bc
   5852 DD 6E FC      [19] 1448 	ld	l,-4 (ix)
   5855 DD 66 FD      [19] 1449 	ld	h,-3 (ix)
   5858 E5            [11] 1450 	push	hl
   5859 DD 6E 0B      [19] 1451 	ld	l,11 (ix)
   585C DD 66 0C      [19] 1452 	ld	h,12 (ix)
   585F E5            [11] 1453 	push	hl
   5860 DD 7E 0A      [19] 1454 	ld	a, 10 (ix)
   5863 F5            [11] 1455 	push	af
   5864 33            [ 6] 1456 	inc	sp
   5865 7B            [ 4] 1457 	ld	a, e
   5866 F5            [11] 1458 	push	af
   5867 33            [ 6] 1459 	inc	sp
   5868 D5            [11] 1460 	push	de
   5869 33            [ 6] 1461 	inc	sp
   586A DD 6E 04      [19] 1462 	ld	l,4 (ix)
   586D DD 66 05      [19] 1463 	ld	h,5 (ix)
   5870 E5            [11] 1464 	push	hl
   5871 CD C8 58      [17] 1465 	call	_colisionesSiguientePosicion
   5874 FD 21 09 00   [14] 1466 	ld	iy, #9
   5878 FD 39         [15] 1467 	add	iy, sp
   587A FD F9         [10] 1468 	ld	sp, iy
   587C C1            [10] 1469 	pop	bc
   587D 7D            [ 4] 1470 	ld	a, l
   587E D6 32         [ 7] 1471 	sub	a, #0x32
   5880 20 3E         [12] 1472 	jr	NZ,00104$
   5882 DD 7E 0A      [19] 1473 	ld	a, 10 (ix)
   5885 B7            [ 4] 1474 	or	a, a
   5886 28 38         [12] 1475 	jr	Z,00104$
                           1476 ;src/gameObject/gameObject.c:248: movimiento=calcularMaximosyMinimos(movimiento,*posx,*posy,posicion);       
   5888 DD 6E FE      [19] 1477 	ld	l,-2 (ix)
   588B DD 66 FF      [19] 1478 	ld	h,-1 (ix)
   588E 56            [ 7] 1479 	ld	d, (hl)
   588F 0A            [ 7] 1480 	ld	a, (bc)
   5890 5F            [ 4] 1481 	ld	e, a
   5891 C5            [11] 1482 	push	bc
   5892 DD 7E 0D      [19] 1483 	ld	a, 13 (ix)
   5895 F5            [11] 1484 	push	af
   5896 33            [ 6] 1485 	inc	sp
   5897 D5            [11] 1486 	push	de
   5898 33            [ 6] 1487 	inc	sp
   5899 53            [ 4] 1488 	ld	d, e
   589A DD 5E 0A      [19] 1489 	ld	e, 10 (ix)
   589D D5            [11] 1490 	push	de
   589E CD 0C 5E      [17] 1491 	call	_calcularMaximosyMinimos
   58A1 F1            [10] 1492 	pop	af
   58A2 F1            [10] 1493 	pop	af
   58A3 55            [ 4] 1494 	ld	d, l
   58A4 C1            [10] 1495 	pop	bc
   58A5 DD 72 0A      [19] 1496 	ld	10 (ix), d
                           1497 ;src/gameObject/gameObject.c:249: mover1casilla(posx,posy,movimiento);
   58A8 C5            [11] 1498 	push	bc
   58A9 D5            [11] 1499 	push	de
   58AA 33            [ 6] 1500 	inc	sp
   58AB DD 6E FE      [19] 1501 	ld	l,-2 (ix)
   58AE DD 66 FF      [19] 1502 	ld	h,-1 (ix)
   58B1 E5            [11] 1503 	push	hl
   58B2 C5            [11] 1504 	push	bc
   58B3 CD D8 57      [17] 1505 	call	_mover1casilla
   58B6 F1            [10] 1506 	pop	af
   58B7 F1            [10] 1507 	pop	af
   58B8 33            [ 6] 1508 	inc	sp
   58B9 C1            [10] 1509 	pop	bc
                           1510 ;src/gameObject/gameObject.c:250: contador++;                    
   58BA DD 34 FB      [23] 1511 	inc	-5 (ix)
   58BD C3 3E 58      [10] 1512 	jp	00102$
   58C0                    1513 00104$:
                           1514 ;src/gameObject/gameObject.c:254: return contador;             
   58C0 DD 6E FB      [19] 1515 	ld	l, -5 (ix)
   58C3 DD F9         [10] 1516 	ld	sp, ix
   58C5 DD E1         [14] 1517 	pop	ix
   58C7 C9            [10] 1518 	ret
                           1519 ;src/gameObject/gameObject.c:262: u8 colisionesSiguientePosicion(TGameObject* objeto,u8 posx,u8 posy,u8 movimiento, TGameObject* rocasCol,u8* posicion){
                           1520 ;	---------------------------------
                           1521 ; Function colisionesSiguientePosicion
                           1522 ; ---------------------------------
   58C8                    1523 _colisionesSiguientePosicion::
   58C8 DD E5         [15] 1524 	push	ix
   58CA DD 21 00 00   [14] 1525 	ld	ix,#0
   58CE DD 39         [15] 1526 	add	ix,sp
   58D0 21 F9 FF      [10] 1527 	ld	hl, #-7
   58D3 39            [11] 1528 	add	hl, sp
   58D4 F9            [ 6] 1529 	ld	sp, hl
                           1530 ;src/gameObject/gameObject.c:263: u8 nextPosx=posx;
   58D5 DD 7E 06      [19] 1531 	ld	a, 6 (ix)
   58D8 DD 77 FA      [19] 1532 	ld	-6 (ix), a
                           1533 ;src/gameObject/gameObject.c:264: u8 nextPosy=posy;
   58DB DD 7E 07      [19] 1534 	ld	a, 7 (ix)
   58DE DD 77 F9      [19] 1535 	ld	-7 (ix), a
                           1536 ;src/gameObject/gameObject.c:269: mover1casilla(&nextPosx,&nextPosy,movimiento);
   58E1 21 00 00      [10] 1537 	ld	hl, #0x0000
   58E4 39            [11] 1538 	add	hl, sp
   58E5 DD 75 FD      [19] 1539 	ld	-3 (ix), l
   58E8 DD 74 FE      [19] 1540 	ld	-2 (ix), h
   58EB EB            [ 4] 1541 	ex	de,hl
   58EC 21 01 00      [10] 1542 	ld	hl, #0x0001
   58EF 39            [11] 1543 	add	hl, sp
   58F0 DD 75 FB      [19] 1544 	ld	-5 (ix), l
   58F3 DD 74 FC      [19] 1545 	ld	-4 (ix), h
   58F6 4D            [ 4] 1546 	ld	c, l
   58F7 44            [ 4] 1547 	ld	b, h
   58F8 DD 7E 08      [19] 1548 	ld	a, 8 (ix)
   58FB F5            [11] 1549 	push	af
   58FC 33            [ 6] 1550 	inc	sp
   58FD D5            [11] 1551 	push	de
   58FE C5            [11] 1552 	push	bc
   58FF CD D8 57      [17] 1553 	call	_mover1casilla
   5902 F1            [10] 1554 	pop	af
   5903 F1            [10] 1555 	pop	af
   5904 33            [ 6] 1556 	inc	sp
                           1557 ;src/gameObject/gameObject.c:270: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);
   5905 DD 6E 09      [19] 1558 	ld	l,9 (ix)
   5908 DD 66 0A      [19] 1559 	ld	h,10 (ix)
   590B E5            [11] 1560 	push	hl
   590C DD 66 F9      [19] 1561 	ld	h, -7 (ix)
   590F DD 6E FA      [19] 1562 	ld	l, -6 (ix)
   5912 E5            [11] 1563 	push	hl
   5913 CD 81 59      [17] 1564 	call	_comprobarRocas
   5916 F1            [10] 1565 	pop	af
   5917 F1            [10] 1566 	pop	af
                           1567 ;src/gameObject/gameObject.c:271: if(ObjetoColisionado!=SinColision){
   5918 7D            [ 4] 1568 	ld	a, l
   5919 D6 32         [ 7] 1569 	sub	a, #0x32
   591B 20 04         [12] 1570 	jr	NZ,00125$
   591D 3E 01         [ 7] 1571 	ld	a,#0x01
   591F 18 01         [12] 1572 	jr	00126$
   5921                    1573 00125$:
   5921 AF            [ 4] 1574 	xor	a,a
   5922                    1575 00126$:
   5922 DD 77 FF      [19] 1576 	ld	-1 (ix), a
   5925 DD CB FF 46   [20] 1577 	bit	0, -1 (ix)
                           1578 ;src/gameObject/gameObject.c:272: return ObjetoColisionado;
   5929 28 51         [12] 1579 	jr	Z,00107$
                           1580 ;src/gameObject/gameObject.c:274: colisionPuerta=comprobarPuertas(nextPosx,nextPosy);                      
   592B DD 66 F9      [19] 1581 	ld	h, -7 (ix)
   592E DD 6E FA      [19] 1582 	ld	l, -6 (ix)
   5931 E5            [11] 1583 	push	hl
   5932 CD DB 5A      [17] 1584 	call	_comprobarPuertas
   5935 F1            [10] 1585 	pop	af
   5936 4D            [ 4] 1586 	ld	c, l
                           1587 ;src/gameObject/gameObject.c:275: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);                 
   5937 DD 5E FD      [19] 1588 	ld	e,-3 (ix)
   593A DD 56 FE      [19] 1589 	ld	d,-2 (ix)
   593D DD 6E FB      [19] 1590 	ld	l,-5 (ix)
   5940 DD 66 FC      [19] 1591 	ld	h,-4 (ix)
   5943 E5            [11] 1592 	push	hl
   5944 FD E1         [14] 1593 	pop	iy
   5946 C5            [11] 1594 	push	bc
   5947 DD 6E 0B      [19] 1595 	ld	l,11 (ix)
   594A DD 66 0C      [19] 1596 	ld	h,12 (ix)
   594D E5            [11] 1597 	push	hl
   594E DD 7E 08      [19] 1598 	ld	a, 8 (ix)
   5951 F5            [11] 1599 	push	af
   5952 33            [ 6] 1600 	inc	sp
   5953 D5            [11] 1601 	push	de
   5954 FD E5         [15] 1602 	push	iy
   5956 DD 6E 04      [19] 1603 	ld	l,4 (ix)
   5959 DD 66 05      [19] 1604 	ld	h,5 (ix)
   595C E5            [11] 1605 	push	hl
   595D CD CA 59      [17] 1606 	call	_comprobarPortales
   5960 FD 21 09 00   [14] 1607 	ld	iy, #9
   5964 FD 39         [15] 1608 	add	iy, sp
   5966 FD F9         [10] 1609 	ld	sp, iy
   5968 C1            [10] 1610 	pop	bc
                           1611 ;src/gameObject/gameObject.c:279: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision && colisionPortales==no_Hay_Colision){        
   5969 DD CB FF 46   [20] 1612 	bit	0, -1 (ix)
   596D 28 0B         [12] 1613 	jr	Z,00104$
   596F 79            [ 4] 1614 	ld	a, c
   5970 B7            [ 4] 1615 	or	a,a
   5971 20 07         [12] 1616 	jr	NZ,00104$
   5973 B5            [ 4] 1617 	or	a,l
   5974 20 04         [12] 1618 	jr	NZ,00104$
                           1619 ;src/gameObject/gameObject.c:280: return SinColision;
   5976 2E 32         [ 7] 1620 	ld	l, #0x32
   5978 18 02         [12] 1621 	jr	00107$
   597A                    1622 00104$:
                           1623 ;src/gameObject/gameObject.c:282: return ColisionNoRocas;
   597A 2E 33         [ 7] 1624 	ld	l, #0x33
   597C                    1625 00107$:
   597C DD F9         [10] 1626 	ld	sp, ix
   597E DD E1         [14] 1627 	pop	ix
   5980 C9            [10] 1628 	ret
                           1629 ;src/gameObject/gameObject.c:285: u8 comprobarRocas(u8 posx,u8 posy,TGameObject* rocas){
                           1630 ;	---------------------------------
                           1631 ; Function comprobarRocas
                           1632 ; ---------------------------------
   5981                    1633 _comprobarRocas::
   5981 DD E5         [15] 1634 	push	ix
   5983 DD 21 00 00   [14] 1635 	ld	ix,#0
   5987 DD 39         [15] 1636 	add	ix,sp
                           1637 ;src/gameObject/gameObject.c:286: u8 colision=SinColision;   
                           1638 ;src/gameObject/gameObject.c:287: for(u8 i=0;i<RocasMaximas;i++){
   5989 01 32 00      [10] 1639 	ld	bc,#0x0032
   598C                    1640 00107$:
   598C 78            [ 4] 1641 	ld	a, b
   598D D6 28         [ 7] 1642 	sub	a, #0x28
   598F 30 35         [12] 1643 	jr	NC,00105$
                           1644 ;src/gameObject/gameObject.c:288: if(rocas[i].posx!=0){
   5991 58            [ 4] 1645 	ld	e,b
   5992 16 00         [ 7] 1646 	ld	d,#0x00
   5994 6B            [ 4] 1647 	ld	l, e
   5995 62            [ 4] 1648 	ld	h, d
   5996 29            [11] 1649 	add	hl, hl
   5997 19            [11] 1650 	add	hl, de
   5998 29            [11] 1651 	add	hl, hl
   5999 EB            [ 4] 1652 	ex	de,hl
   599A DD 7E 06      [19] 1653 	ld	a, 6 (ix)
   599D 83            [ 4] 1654 	add	a, e
   599E 5F            [ 4] 1655 	ld	e, a
   599F DD 7E 07      [19] 1656 	ld	a, 7 (ix)
   59A2 8A            [ 4] 1657 	adc	a, d
   59A3 57            [ 4] 1658 	ld	d, a
   59A4 6B            [ 4] 1659 	ld	l, e
   59A5 62            [ 4] 1660 	ld	h, d
   59A6 23            [ 6] 1661 	inc	hl
   59A7 7E            [ 7] 1662 	ld	a, (hl)
   59A8 B7            [ 4] 1663 	or	a, a
   59A9 28 18         [12] 1664 	jr	Z,00108$
                           1665 ;src/gameObject/gameObject.c:289: if(comprobarColisiones1vs1(posx,posy,rocas[i].posx,rocas[i].posy)==hay_Colision){                          
   59AB EB            [ 4] 1666 	ex	de,hl
   59AC 23            [ 6] 1667 	inc	hl
   59AD 23            [ 6] 1668 	inc	hl
   59AE 56            [ 7] 1669 	ld	d, (hl)
   59AF C5            [11] 1670 	push	bc
   59B0 5F            [ 4] 1671 	ld	e, a
   59B1 D5            [11] 1672 	push	de
   59B2 DD 66 05      [19] 1673 	ld	h, 5 (ix)
   59B5 DD 6E 04      [19] 1674 	ld	l, 4 (ix)
   59B8 E5            [11] 1675 	push	hl
   59B9 CD A5 5E      [17] 1676 	call	_comprobarColisiones1vs1
   59BC F1            [10] 1677 	pop	af
   59BD F1            [10] 1678 	pop	af
   59BE C1            [10] 1679 	pop	bc
   59BF 2D            [ 4] 1680 	dec	l
   59C0 20 01         [12] 1681 	jr	NZ,00108$
                           1682 ;src/gameObject/gameObject.c:290: colision=i;
   59C2 48            [ 4] 1683 	ld	c, b
   59C3                    1684 00108$:
                           1685 ;src/gameObject/gameObject.c:287: for(u8 i=0;i<RocasMaximas;i++){
   59C3 04            [ 4] 1686 	inc	b
   59C4 18 C6         [12] 1687 	jr	00107$
   59C6                    1688 00105$:
                           1689 ;src/gameObject/gameObject.c:294: return colision;
   59C6 69            [ 4] 1690 	ld	l, c
   59C7 DD E1         [14] 1691 	pop	ix
   59C9 C9            [10] 1692 	ret
                           1693 ;src/gameObject/gameObject.c:297: u8 comprobarPortales(TGameObject* objeto,u8* posx,u8* posy,u8 movimiento,u8* posicion){    
                           1694 ;	---------------------------------
                           1695 ; Function comprobarPortales
                           1696 ; ---------------------------------
   59CA                    1697 _comprobarPortales::
   59CA DD E5         [15] 1698 	push	ix
   59CC DD 21 00 00   [14] 1699 	ld	ix,#0
   59D0 DD 39         [15] 1700 	add	ix,sp
   59D2 21 F5 FF      [10] 1701 	ld	hl, #-11
   59D5 39            [11] 1702 	add	hl, sp
   59D6 F9            [ 6] 1703 	ld	sp, hl
                           1704 ;src/gameObject/gameObject.c:298: if(*posx==P_portal[0].posx ){
   59D7 DD 4E 06      [19] 1705 	ld	c,6 (ix)
   59DA DD 46 07      [19] 1706 	ld	b,7 (ix)
   59DD 0A            [ 7] 1707 	ld	a, (bc)
   59DE DD 77 FB      [19] 1708 	ld	-5 (ix), a
   59E1 2A AA 61      [16] 1709 	ld	hl, (_P_portal)
   59E4 DD 75 F7      [19] 1710 	ld	-9 (ix), l
   59E7 DD 74 F8      [19] 1711 	ld	-8 (ix), h
   59EA D1            [10] 1712 	pop	de
   59EB E1            [10] 1713 	pop	hl
   59EC E5            [11] 1714 	push	hl
   59ED D5            [11] 1715 	push	de
   59EE 23            [ 6] 1716 	inc	hl
   59EF 7E            [ 7] 1717 	ld	a, (hl)
   59F0 DD 77 F9      [19] 1718 	ld	-7 (ix), a
                           1719 ;src/gameObject/gameObject.c:299: if(*posy==P_portal[0].posy ){
   59F3 DD 5E 08      [19] 1720 	ld	e,8 (ix)
   59F6 DD 56 09      [19] 1721 	ld	d,9 (ix)
                           1722 ;src/gameObject/gameObject.c:300: if(objeto->sprite==sprite_Player){                
   59F9 DD 7E 04      [19] 1723 	ld	a, 4 (ix)
   59FC DD 77 F5      [19] 1724 	ld	-11 (ix), a
   59FF DD 7E 05      [19] 1725 	ld	a, 5 (ix)
   5A02 DD 77 F6      [19] 1726 	ld	-10 (ix), a
                           1727 ;src/gameObject/gameObject.c:301: *posx=P_portal[1].posx;
   5A05 FD 21 AA 61   [14] 1728 	ld	iy, #_P_portal
   5A09 FD 7E 00      [19] 1729 	ld	a, 0 (iy)
   5A0C C6 06         [ 7] 1730 	add	a, #0x06
   5A0E DD 77 FC      [19] 1731 	ld	-4 (ix), a
   5A11 FD 7E 01      [19] 1732 	ld	a, 1 (iy)
   5A14 CE 00         [ 7] 1733 	adc	a, #0x00
   5A16 DD 77 FD      [19] 1734 	ld	-3 (ix), a
                           1735 ;src/gameObject/gameObject.c:300: if(objeto->sprite==sprite_Player){                
   5A19 DD 7E F5      [19] 1736 	ld	a, -11 (ix)
   5A1C C6 03         [ 7] 1737 	add	a, #0x03
   5A1E DD 77 F5      [19] 1738 	ld	-11 (ix), a
   5A21 DD 7E F6      [19] 1739 	ld	a, -10 (ix)
   5A24 CE 00         [ 7] 1740 	adc	a, #0x00
   5A26 DD 77 F6      [19] 1741 	ld	-10 (ix), a
                           1742 ;src/gameObject/gameObject.c:301: *posx=P_portal[1].posx;
   5A29 DD 7E FC      [19] 1743 	ld	a, -4 (ix)
   5A2C C6 01         [ 7] 1744 	add	a, #0x01
   5A2E DD 77 FE      [19] 1745 	ld	-2 (ix), a
   5A31 DD 7E FD      [19] 1746 	ld	a, -3 (ix)
   5A34 CE 00         [ 7] 1747 	adc	a, #0x00
   5A36 DD 77 FF      [19] 1748 	ld	-1 (ix), a
                           1749 ;src/gameObject/gameObject.c:298: if(*posx==P_portal[0].posx ){
   5A39 DD 7E FB      [19] 1750 	ld	a, -5 (ix)
   5A3C DD 96 F9      [19] 1751 	sub	a, -7 (ix)
   5A3F 20 47         [12] 1752 	jr	NZ,00106$
                           1753 ;src/gameObject/gameObject.c:299: if(*posy==P_portal[0].posy ){
   5A41 1A            [ 7] 1754 	ld	a, (de)
   5A42 DD 77 FA      [19] 1755 	ld	-6 (ix), a
   5A45 DD 6E F7      [19] 1756 	ld	l,-9 (ix)
   5A48 DD 66 F8      [19] 1757 	ld	h,-8 (ix)
   5A4B 23            [ 6] 1758 	inc	hl
   5A4C 23            [ 6] 1759 	inc	hl
   5A4D 7E            [ 7] 1760 	ld	a, (hl)
   5A4E DD 77 F7      [19] 1761 	ld	-9 (ix), a
   5A51 DD 7E FA      [19] 1762 	ld	a, -6 (ix)
   5A54 DD 96 F7      [19] 1763 	sub	a, -9 (ix)
   5A57 20 2F         [12] 1764 	jr	NZ,00106$
                           1765 ;src/gameObject/gameObject.c:300: if(objeto->sprite==sprite_Player){                
   5A59 E1            [10] 1766 	pop	hl
   5A5A E5            [11] 1767 	push	hl
   5A5B 6E            [ 7] 1768 	ld	l, (hl)
   5A5C 2D            [ 4] 1769 	dec	l
   5A5D 20 25         [12] 1770 	jr	NZ,00102$
                           1771 ;src/gameObject/gameObject.c:301: *posx=P_portal[1].posx;
   5A5F DD 6E FE      [19] 1772 	ld	l,-2 (ix)
   5A62 DD 66 FF      [19] 1773 	ld	h,-1 (ix)
   5A65 7E            [ 7] 1774 	ld	a, (hl)
   5A66 02            [ 7] 1775 	ld	(bc), a
                           1776 ;src/gameObject/gameObject.c:302: *posy=P_portal[1].posy;
   5A67 FD 21 06 00   [14] 1777 	ld	iy, #0x0006
   5A6B C5            [11] 1778 	push	bc
   5A6C ED 4B AA 61   [20] 1779 	ld	bc, (_P_portal)
   5A70 FD 09         [15] 1780 	add	iy, bc
   5A72 C1            [10] 1781 	pop	bc
   5A73 FD 7E 02      [19] 1782 	ld	a, 2 (iy)
   5A76 12            [ 7] 1783 	ld	(de), a
                           1784 ;src/gameObject/gameObject.c:303: mover1casilla(posx,posy,movimiento);                
   5A77 DD 7E 0A      [19] 1785 	ld	a, 10 (ix)
   5A7A F5            [11] 1786 	push	af
   5A7B 33            [ 6] 1787 	inc	sp
   5A7C D5            [11] 1788 	push	de
   5A7D C5            [11] 1789 	push	bc
   5A7E CD D8 57      [17] 1790 	call	_mover1casilla
   5A81 F1            [10] 1791 	pop	af
   5A82 F1            [10] 1792 	pop	af
   5A83 33            [ 6] 1793 	inc	sp
   5A84                    1794 00102$:
                           1795 ;src/gameObject/gameObject.c:305: return hay_Colision;               
   5A84 2E 01         [ 7] 1796 	ld	l, #0x01
   5A86 18 4E         [12] 1797 	jr	00113$
   5A88                    1798 00106$:
                           1799 ;src/gameObject/gameObject.c:308: if(*posx==P_portal[1].posx){
   5A88 DD 6E FE      [19] 1800 	ld	l,-2 (ix)
   5A8B DD 66 FF      [19] 1801 	ld	h,-1 (ix)
   5A8E 7E            [ 7] 1802 	ld	a, (hl)
   5A8F DD 77 FA      [19] 1803 	ld	-6 (ix), a
   5A92 DD 7E FB      [19] 1804 	ld	a, -5 (ix)
   5A95 DD 96 FA      [19] 1805 	sub	a, -6 (ix)
   5A98 20 3A         [12] 1806 	jr	NZ,00112$
                           1807 ;src/gameObject/gameObject.c:309: if(*posy==P_portal[1].posy){
   5A9A 1A            [ 7] 1808 	ld	a, (de)
   5A9B DD 77 FA      [19] 1809 	ld	-6 (ix), a
   5A9E DD 6E FC      [19] 1810 	ld	l,-4 (ix)
   5AA1 DD 66 FD      [19] 1811 	ld	h,-3 (ix)
   5AA4 23            [ 6] 1812 	inc	hl
   5AA5 23            [ 6] 1813 	inc	hl
   5AA6 7E            [ 7] 1814 	ld	a, (hl)
   5AA7 DD 77 FE      [19] 1815 	ld	-2 (ix), a
   5AAA DD 7E FA      [19] 1816 	ld	a, -6 (ix)
   5AAD DD 96 FE      [19] 1817 	sub	a, -2 (ix)
   5AB0 20 22         [12] 1818 	jr	NZ,00112$
                           1819 ;src/gameObject/gameObject.c:310: if(objeto->sprite==sprite_Player){
   5AB2 E1            [10] 1820 	pop	hl
   5AB3 E5            [11] 1821 	push	hl
   5AB4 6E            [ 7] 1822 	ld	l, (hl)
   5AB5 2D            [ 4] 1823 	dec	l
   5AB6 20 18         [12] 1824 	jr	NZ,00108$
                           1825 ;src/gameObject/gameObject.c:311: *posx=P_portal[0].posx;
   5AB8 DD 7E F9      [19] 1826 	ld	a, -7 (ix)
   5ABB 02            [ 7] 1827 	ld	(bc), a
                           1828 ;src/gameObject/gameObject.c:312: *posy=P_portal[0].posy;
   5ABC 2A AA 61      [16] 1829 	ld	hl, (_P_portal)
   5ABF 23            [ 6] 1830 	inc	hl
   5AC0 23            [ 6] 1831 	inc	hl
   5AC1 7E            [ 7] 1832 	ld	a, (hl)
   5AC2 12            [ 7] 1833 	ld	(de), a
                           1834 ;src/gameObject/gameObject.c:313: mover1casilla(posx,posy,movimiento);                
   5AC3 DD 7E 0A      [19] 1835 	ld	a, 10 (ix)
   5AC6 F5            [11] 1836 	push	af
   5AC7 33            [ 6] 1837 	inc	sp
   5AC8 D5            [11] 1838 	push	de
   5AC9 C5            [11] 1839 	push	bc
   5ACA CD D8 57      [17] 1840 	call	_mover1casilla
   5ACD F1            [10] 1841 	pop	af
   5ACE F1            [10] 1842 	pop	af
   5ACF 33            [ 6] 1843 	inc	sp
   5AD0                    1844 00108$:
                           1845 ;src/gameObject/gameObject.c:315: return hay_Colision;                   
   5AD0 2E 01         [ 7] 1846 	ld	l, #0x01
   5AD2 18 02         [12] 1847 	jr	00113$
   5AD4                    1848 00112$:
                           1849 ;src/gameObject/gameObject.c:318: return no_Hay_Colision;        
   5AD4 2E 00         [ 7] 1850 	ld	l, #0x00
   5AD6                    1851 00113$:
   5AD6 DD F9         [10] 1852 	ld	sp, ix
   5AD8 DD E1         [14] 1853 	pop	ix
   5ADA C9            [10] 1854 	ret
                           1855 ;src/gameObject/gameObject.c:320: u8 comprobarPuertas(u8 posx, u8 posy){
                           1856 ;	---------------------------------
                           1857 ; Function comprobarPuertas
                           1858 ; ---------------------------------
   5ADB                    1859 _comprobarPuertas::
   5ADB DD E5         [15] 1860 	push	ix
   5ADD DD 21 00 00   [14] 1861 	ld	ix,#0
   5AE1 DD 39         [15] 1862 	add	ix,sp
                           1863 ;src/gameObject/gameObject.c:321: for(u8 i=0;i<3;i++){
   5AE3 0E 00         [ 7] 1864 	ld	c, #0x00
   5AE5                    1865 00106$:
   5AE5 79            [ 4] 1866 	ld	a, c
   5AE6 D6 03         [ 7] 1867 	sub	a, #0x03
   5AE8 30 31         [12] 1868 	jr	NC,00104$
                           1869 ;src/gameObject/gameObject.c:322: if(posx==P_puertas[i].posx && posy==P_puertas[i].posy){
   5AEA 06 00         [ 7] 1870 	ld	b,#0x00
   5AEC 69            [ 4] 1871 	ld	l, c
   5AED 60            [ 4] 1872 	ld	h, b
   5AEE 29            [11] 1873 	add	hl, hl
   5AEF 09            [11] 1874 	add	hl, bc
   5AF0 29            [11] 1875 	add	hl, hl
   5AF1 45            [ 4] 1876 	ld	b, l
   5AF2 54            [ 4] 1877 	ld	d, h
   5AF3 FD 21 AC 61   [14] 1878 	ld	iy, #_P_puertas
   5AF7 FD 7E 00      [19] 1879 	ld	a, 0 (iy)
   5AFA 80            [ 4] 1880 	add	a, b
   5AFB 5F            [ 4] 1881 	ld	e, a
   5AFC FD 7E 01      [19] 1882 	ld	a, 1 (iy)
   5AFF 8A            [ 4] 1883 	adc	a, d
   5B00 57            [ 4] 1884 	ld	d, a
   5B01 6B            [ 4] 1885 	ld	l, e
   5B02 62            [ 4] 1886 	ld	h, d
   5B03 23            [ 6] 1887 	inc	hl
   5B04 DD 7E 04      [19] 1888 	ld	a,4 (ix)
   5B07 96            [ 7] 1889 	sub	a,(hl)
   5B08 20 0E         [12] 1890 	jr	NZ,00107$
   5B0A 6B            [ 4] 1891 	ld	l, e
   5B0B 62            [ 4] 1892 	ld	h, d
   5B0C 23            [ 6] 1893 	inc	hl
   5B0D 23            [ 6] 1894 	inc	hl
   5B0E DD 7E 05      [19] 1895 	ld	a,5 (ix)
   5B11 96            [ 7] 1896 	sub	a,(hl)
   5B12 20 04         [12] 1897 	jr	NZ,00107$
                           1898 ;src/gameObject/gameObject.c:323: return P_puertas[i].num;
   5B14 1A            [ 7] 1899 	ld	a, (de)
   5B15 6F            [ 4] 1900 	ld	l, a
   5B16 18 05         [12] 1901 	jr	00108$
   5B18                    1902 00107$:
                           1903 ;src/gameObject/gameObject.c:321: for(u8 i=0;i<3;i++){
   5B18 0C            [ 4] 1904 	inc	c
   5B19 18 CA         [12] 1905 	jr	00106$
   5B1B                    1906 00104$:
                           1907 ;src/gameObject/gameObject.c:326: return seguir_En_Nivel;
   5B1B 2E 00         [ 7] 1908 	ld	l, #0x00
   5B1D                    1909 00108$:
   5B1D DD E1         [14] 1910 	pop	ix
   5B1F C9            [10] 1911 	ret
                           1912 	.area _CODE
                           1913 	.area _INITIALIZER
                           1914 	.area _CABS (ABS)
