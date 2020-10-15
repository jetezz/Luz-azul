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
                             14 	.globl _cpct_waitVSYNC
                             15 	.globl _cpct_drawSprite
                             16 	.globl _cpct_drawSolidBox
                             17 	.globl _initGameobjest
                             18 	.globl _dibujarGameObject
                             19 	.globl _dibujarGameObjectCol
                             20 	.globl _dibujarGameObjectColSprite
                             21 	.globl _limpiarRastro
                             22 	.globl _moverGameObject
                             23 	.globl _moverElEspejo
                             24 	.globl _cambiarPosicion
                             25 	.globl _moverYdibujar
                             26 	.globl _taparHole
                             27 	.globl _moverTipoPlayer
                             28 	.globl _moverTipoRoca
                             29 	.globl _mover1casilla
                             30 	.globl _movimientoLineal
                             31 	.globl _colisionesSiguientePosicion
                             32 	.globl _comprobarRocas
                             33 	.globl _comprobarPortales
                             34 	.globl _comprobarPuertas
                             35 	.globl _comprobarColeccionables
                             36 ;--------------------------------------------------------
                             37 ; special function registers
                             38 ;--------------------------------------------------------
                             39 ;--------------------------------------------------------
                             40 ; ram data
                             41 ;--------------------------------------------------------
                             42 	.area _DATA
   76FB                      43 _P_portal:
   76FB                      44 	.ds 2
   76FD                      45 _P_puertas:
   76FD                      46 	.ds 2
   76FF                      47 _P_col:
   76FF                      48 	.ds 2
   7701                      49 _P_luz:
   7701                      50 	.ds 2
   7703                      51 _P_fam:
   7703                      52 	.ds 2
   7705                      53 _P_ams:
   7705                      54 	.ds 2
   7707                      55 _P_colList:
   7707                      56 	.ds 2
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
                             81 ;src/gameObject/gameObject.c:50: void initGameobjest(TGameObject* portales,TGameObject* puertas,TGameObjectCol* colec,u8* colLuz,u8* colFam,u8* colAms,u8* colList){
                             82 ;	---------------------------------
                             83 ; Function initGameobjest
                             84 ; ---------------------------------
   52A2                      85 _initGameobjest::
   52A2 DD E5         [15]   86 	push	ix
   52A4 DD 21 00 00   [14]   87 	ld	ix,#0
   52A8 DD 39         [15]   88 	add	ix,sp
                             89 ;src/gameObject/gameObject.c:51: P_portal=portales;
   52AA DD 6E 04      [19]   90 	ld	l,4 (ix)
   52AD DD 66 05      [19]   91 	ld	h,5 (ix)
   52B0 22 FB 76      [16]   92 	ld	(_P_portal), hl
                             93 ;src/gameObject/gameObject.c:52: P_puertas=puertas;
   52B3 DD 6E 06      [19]   94 	ld	l,6 (ix)
   52B6 DD 66 07      [19]   95 	ld	h,7 (ix)
   52B9 22 FD 76      [16]   96 	ld	(_P_puertas), hl
                             97 ;src/gameObject/gameObject.c:53: P_col=colec;
   52BC DD 6E 08      [19]   98 	ld	l,8 (ix)
   52BF DD 66 09      [19]   99 	ld	h,9 (ix)
   52C2 22 FF 76      [16]  100 	ld	(_P_col), hl
                            101 ;src/gameObject/gameObject.c:54: P_luz=colLuz;
   52C5 DD 6E 0A      [19]  102 	ld	l,10 (ix)
   52C8 DD 66 0B      [19]  103 	ld	h,11 (ix)
   52CB 22 01 77      [16]  104 	ld	(_P_luz), hl
                            105 ;src/gameObject/gameObject.c:55: P_fam=colFam;
   52CE DD 6E 0C      [19]  106 	ld	l,12 (ix)
   52D1 DD 66 0D      [19]  107 	ld	h,13 (ix)
   52D4 22 03 77      [16]  108 	ld	(_P_fam), hl
                            109 ;src/gameObject/gameObject.c:56: P_ams=colAms;
   52D7 DD 6E 0E      [19]  110 	ld	l,14 (ix)
   52DA DD 66 0F      [19]  111 	ld	h,15 (ix)
   52DD 22 05 77      [16]  112 	ld	(_P_ams), hl
                            113 ;src/gameObject/gameObject.c:57: P_colList=colList;   
   52E0 DD 6E 10      [19]  114 	ld	l,16 (ix)
   52E3 DD 66 11      [19]  115 	ld	h,17 (ix)
   52E6 22 07 77      [16]  116 	ld	(_P_colList), hl
   52E9 DD E1         [14]  117 	pop	ix
   52EB C9            [10]  118 	ret
                            119 ;src/gameObject/gameObject.c:60: void dibujarGameObject(TGameObject* objeto){
                            120 ;	---------------------------------
                            121 ; Function dibujarGameObject
                            122 ; ---------------------------------
   52EC                     123 _dibujarGameObject::
   52EC DD E5         [15]  124 	push	ix
   52EE DD 21 00 00   [14]  125 	ld	ix,#0
   52F2 DD 39         [15]  126 	add	ix,sp
                            127 ;src/gameObject/gameObject.c:61: if(objeto->posx!=0){
   52F4 DD 4E 04      [19]  128 	ld	c,4 (ix)
   52F7 DD 46 05      [19]  129 	ld	b,5 (ix)
   52FA 69            [ 4]  130 	ld	l, c
   52FB 60            [ 4]  131 	ld	h, b
   52FC 23            [ 6]  132 	inc	hl
   52FD 56            [ 7]  133 	ld	d, (hl)
   52FE 7A            [ 4]  134 	ld	a, d
   52FF B7            [ 4]  135 	or	a, a
   5300 CA C7 55      [10]  136 	jp	Z, 00180$
                            137 ;src/gameObject/gameObject.c:62: if(objeto->sprite==sprite_Player){
   5303 69            [ 4]  138 	ld	l, c
   5304 60            [ 4]  139 	ld	h, b
   5305 23            [ 6]  140 	inc	hl
   5306 23            [ 6]  141 	inc	hl
   5307 23            [ 6]  142 	inc	hl
   5308 5E            [ 7]  143 	ld	e, (hl)
                            144 ;src/gameObject/gameObject.c:63: cpct_drawSprite(Character_Principal_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   5309 69            [ 4]  145 	ld	l, c
   530A 60            [ 4]  146 	ld	h, b
   530B 23            [ 6]  147 	inc	hl
   530C 23            [ 6]  148 	inc	hl
                            149 ;src/gameObject/gameObject.c:62: if(objeto->sprite==sprite_Player){
   530D 7B            [ 4]  150 	ld	a, e
   530E 3D            [ 4]  151 	dec	a
   530F 20 18         [12]  152 	jr	NZ,00176$
                            153 ;src/gameObject/gameObject.c:63: cpct_drawSprite(Character_Principal_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   5311 46            [ 7]  154 	ld	b, (hl)
   5312 4A            [ 4]  155 	ld	c, d
   5313 C5            [11]  156 	push	bc
   5314 CD D9 71      [17]  157 	call	_calcularPosicionEnPantalla
   5317 F1            [10]  158 	pop	af
   5318 4D            [ 4]  159 	ld	c, l
   5319 44            [ 4]  160 	ld	b, h
   531A 21 04 10      [10]  161 	ld	hl, #0x1004
   531D E5            [11]  162 	push	hl
   531E C5            [11]  163 	push	bc
   531F 21 3B 52      [10]  164 	ld	hl, #_Character_Principal_0
   5322 E5            [11]  165 	push	hl
   5323 CD 09 74      [17]  166 	call	_cpct_drawSprite
   5326 C3 C7 55      [10]  167 	jp	00180$
   5329                     168 00176$:
                            169 ;src/gameObject/gameObject.c:64: }else if(objeto->sprite==sprite_Rock_G){
   5329 7B            [ 4]  170 	ld	a, e
   532A D6 02         [ 7]  171 	sub	a, #0x02
   532C 20 18         [12]  172 	jr	NZ,00173$
                            173 ;src/gameObject/gameObject.c:65: cpct_drawSprite(Block_Move1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   532E 46            [ 7]  174 	ld	b, (hl)
   532F 4A            [ 4]  175 	ld	c, d
   5330 C5            [11]  176 	push	bc
   5331 CD D9 71      [17]  177 	call	_calcularPosicionEnPantalla
   5334 F1            [10]  178 	pop	af
   5335 4D            [ 4]  179 	ld	c, l
   5336 44            [ 4]  180 	ld	b, h
   5337 21 04 10      [10]  181 	ld	hl, #0x1004
   533A E5            [11]  182 	push	hl
   533B C5            [11]  183 	push	bc
   533C 21 EA 51      [10]  184 	ld	hl, #_Block_Move1_G_0
   533F E5            [11]  185 	push	hl
   5340 CD 09 74      [17]  186 	call	_cpct_drawSprite
   5343 C3 C7 55      [10]  187 	jp	00180$
   5346                     188 00173$:
                            189 ;src/gameObject/gameObject.c:66: }else if(objeto->sprite==sprite_Rock_B){
   5346 7B            [ 4]  190 	ld	a, e
   5347 D6 03         [ 7]  191 	sub	a, #0x03
   5349 20 16         [12]  192 	jr	NZ,00170$
                            193 ;src/gameObject/gameObject.c:67: cpct_drawSprite(Block_Move1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   534B 46            [ 7]  194 	ld	b, (hl)
   534C 4A            [ 4]  195 	ld	c, d
   534D C5            [11]  196 	push	bc
   534E CD D9 71      [17]  197 	call	_calcularPosicionEnPantalla
   5351 F1            [10]  198 	pop	af
   5352 01 99 51      [10]  199 	ld	bc, #_Block_Move1_B_0+0
   5355 11 04 10      [10]  200 	ld	de, #0x1004
   5358 D5            [11]  201 	push	de
   5359 E5            [11]  202 	push	hl
   535A C5            [11]  203 	push	bc
   535B CD 09 74      [17]  204 	call	_cpct_drawSprite
   535E C3 C7 55      [10]  205 	jp	00180$
   5361                     206 00170$:
                            207 ;src/gameObject/gameObject.c:68: }else if(objeto->sprite==sprite_Rock_nomove_B){
   5361 7B            [ 4]  208 	ld	a, e
   5362 D6 04         [ 7]  209 	sub	a, #0x04
   5364 20 16         [12]  210 	jr	NZ,00167$
                            211 ;src/gameObject/gameObject.c:69: cpct_drawSprite(Block_Move0_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5366 46            [ 7]  212 	ld	b, (hl)
   5367 4A            [ 4]  213 	ld	c, d
   5368 C5            [11]  214 	push	bc
   5369 CD D9 71      [17]  215 	call	_calcularPosicionEnPantalla
   536C F1            [10]  216 	pop	af
   536D 01 48 51      [10]  217 	ld	bc, #_Block_Move0_B_0+0
   5370 11 04 10      [10]  218 	ld	de, #0x1004
   5373 D5            [11]  219 	push	de
   5374 E5            [11]  220 	push	hl
   5375 C5            [11]  221 	push	bc
   5376 CD 09 74      [17]  222 	call	_cpct_drawSprite
   5379 C3 C7 55      [10]  223 	jp	00180$
   537C                     224 00167$:
                            225 ;src/gameObject/gameObject.c:70: }else if(objeto->sprite==sprite_RockInmovil1_G){
   537C 7B            [ 4]  226 	ld	a, e
   537D D6 05         [ 7]  227 	sub	a, #0x05
   537F 20 16         [12]  228 	jr	NZ,00164$
                            229 ;src/gameObject/gameObject.c:71: cpct_drawSprite(Block_Static1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5381 46            [ 7]  230 	ld	b, (hl)
   5382 4A            [ 4]  231 	ld	c, d
   5383 C5            [11]  232 	push	bc
   5384 CD D9 71      [17]  233 	call	_calcularPosicionEnPantalla
   5387 F1            [10]  234 	pop	af
   5388 01 F7 50      [10]  235 	ld	bc, #_Block_Static1_G_0+0
   538B 11 04 10      [10]  236 	ld	de, #0x1004
   538E D5            [11]  237 	push	de
   538F E5            [11]  238 	push	hl
   5390 C5            [11]  239 	push	bc
   5391 CD 09 74      [17]  240 	call	_cpct_drawSprite
   5394 C3 C7 55      [10]  241 	jp	00180$
   5397                     242 00164$:
                            243 ;src/gameObject/gameObject.c:72: }else if(objeto->sprite==sprite_RockInmovil1_B){
   5397 7B            [ 4]  244 	ld	a, e
   5398 D6 06         [ 7]  245 	sub	a, #0x06
   539A 20 16         [12]  246 	jr	NZ,00161$
                            247 ;src/gameObject/gameObject.c:73: cpct_drawSprite(Block_Static1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   539C 46            [ 7]  248 	ld	b, (hl)
   539D 4A            [ 4]  249 	ld	c, d
   539E C5            [11]  250 	push	bc
   539F CD D9 71      [17]  251 	call	_calcularPosicionEnPantalla
   53A2 F1            [10]  252 	pop	af
   53A3 01 A6 50      [10]  253 	ld	bc, #_Block_Static1_B_0+0
   53A6 11 04 10      [10]  254 	ld	de, #0x1004
   53A9 D5            [11]  255 	push	de
   53AA E5            [11]  256 	push	hl
   53AB C5            [11]  257 	push	bc
   53AC CD 09 74      [17]  258 	call	_cpct_drawSprite
   53AF C3 C7 55      [10]  259 	jp	00180$
   53B2                     260 00161$:
                            261 ;src/gameObject/gameObject.c:74: }else if(objeto->sprite==sprite_RockInmovil2_G){
   53B2 7B            [ 4]  262 	ld	a, e
   53B3 D6 07         [ 7]  263 	sub	a, #0x07
   53B5 20 16         [12]  264 	jr	NZ,00158$
                            265 ;src/gameObject/gameObject.c:75: cpct_drawSprite(Block_Static2_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   53B7 46            [ 7]  266 	ld	b, (hl)
   53B8 4A            [ 4]  267 	ld	c, d
   53B9 C5            [11]  268 	push	bc
   53BA CD D9 71      [17]  269 	call	_calcularPosicionEnPantalla
   53BD F1            [10]  270 	pop	af
   53BE 01 55 50      [10]  271 	ld	bc, #_Block_Static2_G_0+0
   53C1 11 04 10      [10]  272 	ld	de, #0x1004
   53C4 D5            [11]  273 	push	de
   53C5 E5            [11]  274 	push	hl
   53C6 C5            [11]  275 	push	bc
   53C7 CD 09 74      [17]  276 	call	_cpct_drawSprite
   53CA C3 C7 55      [10]  277 	jp	00180$
   53CD                     278 00158$:
                            279 ;src/gameObject/gameObject.c:76: }else if(objeto->sprite==sprite_RockInmovil2_B){
   53CD 7B            [ 4]  280 	ld	a, e
   53CE D6 08         [ 7]  281 	sub	a, #0x08
   53D0 20 16         [12]  282 	jr	NZ,00155$
                            283 ;src/gameObject/gameObject.c:77: cpct_drawSprite(Block_Static2_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   53D2 46            [ 7]  284 	ld	b, (hl)
   53D3 4A            [ 4]  285 	ld	c, d
   53D4 C5            [11]  286 	push	bc
   53D5 CD D9 71      [17]  287 	call	_calcularPosicionEnPantalla
   53D8 F1            [10]  288 	pop	af
   53D9 01 04 50      [10]  289 	ld	bc, #_Block_Static2_B_0+0
   53DC 11 04 10      [10]  290 	ld	de, #0x1004
   53DF D5            [11]  291 	push	de
   53E0 E5            [11]  292 	push	hl
   53E1 C5            [11]  293 	push	bc
   53E2 CD 09 74      [17]  294 	call	_cpct_drawSprite
   53E5 C3 C7 55      [10]  295 	jp	00180$
   53E8                     296 00155$:
                            297 ;src/gameObject/gameObject.c:78: }else if(objeto->sprite==sprite_RockInmovil3_G){
   53E8 7B            [ 4]  298 	ld	a, e
   53E9 D6 09         [ 7]  299 	sub	a, #0x09
   53EB 20 16         [12]  300 	jr	NZ,00152$
                            301 ;src/gameObject/gameObject.c:79: cpct_drawSprite(Block_Static3_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   53ED 46            [ 7]  302 	ld	b, (hl)
   53EE 4A            [ 4]  303 	ld	c, d
   53EF C5            [11]  304 	push	bc
   53F0 CD D9 71      [17]  305 	call	_calcularPosicionEnPantalla
   53F3 F1            [10]  306 	pop	af
   53F4 01 B3 4F      [10]  307 	ld	bc, #_Block_Static3_G_0+0
   53F7 11 04 10      [10]  308 	ld	de, #0x1004
   53FA D5            [11]  309 	push	de
   53FB E5            [11]  310 	push	hl
   53FC C5            [11]  311 	push	bc
   53FD CD 09 74      [17]  312 	call	_cpct_drawSprite
   5400 C3 C7 55      [10]  313 	jp	00180$
   5403                     314 00152$:
                            315 ;src/gameObject/gameObject.c:80: }else if(objeto->sprite==sprite_RockInmovil3_B){
   5403 7B            [ 4]  316 	ld	a, e
   5404 D6 0A         [ 7]  317 	sub	a, #0x0a
   5406 20 16         [12]  318 	jr	NZ,00149$
                            319 ;src/gameObject/gameObject.c:81: cpct_drawSprite(Block_Static3_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5408 46            [ 7]  320 	ld	b, (hl)
   5409 4A            [ 4]  321 	ld	c, d
   540A C5            [11]  322 	push	bc
   540B CD D9 71      [17]  323 	call	_calcularPosicionEnPantalla
   540E F1            [10]  324 	pop	af
   540F 01 62 4F      [10]  325 	ld	bc, #_Block_Static3_B_0+0
   5412 11 04 10      [10]  326 	ld	de, #0x1004
   5415 D5            [11]  327 	push	de
   5416 E5            [11]  328 	push	hl
   5417 C5            [11]  329 	push	bc
   5418 CD 09 74      [17]  330 	call	_cpct_drawSprite
   541B C3 C7 55      [10]  331 	jp	00180$
   541E                     332 00149$:
                            333 ;src/gameObject/gameObject.c:82: }else if(objeto->sprite==sprite_RockInmovil4_G){
   541E 7B            [ 4]  334 	ld	a, e
   541F D6 0B         [ 7]  335 	sub	a, #0x0b
   5421 20 16         [12]  336 	jr	NZ,00146$
                            337 ;src/gameObject/gameObject.c:83: cpct_drawSprite(Block_Static4_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5423 46            [ 7]  338 	ld	b, (hl)
   5424 4A            [ 4]  339 	ld	c, d
   5425 C5            [11]  340 	push	bc
   5426 CD D9 71      [17]  341 	call	_calcularPosicionEnPantalla
   5429 F1            [10]  342 	pop	af
   542A 01 11 4F      [10]  343 	ld	bc, #_Block_Static4_G_0+0
   542D 11 04 10      [10]  344 	ld	de, #0x1004
   5430 D5            [11]  345 	push	de
   5431 E5            [11]  346 	push	hl
   5432 C5            [11]  347 	push	bc
   5433 CD 09 74      [17]  348 	call	_cpct_drawSprite
   5436 C3 C7 55      [10]  349 	jp	00180$
   5439                     350 00146$:
                            351 ;src/gameObject/gameObject.c:84: }else if(objeto->sprite==sprite_RockInmovil4_B){
   5439 7B            [ 4]  352 	ld	a, e
   543A D6 0C         [ 7]  353 	sub	a, #0x0c
   543C 20 16         [12]  354 	jr	NZ,00143$
                            355 ;src/gameObject/gameObject.c:85: cpct_drawSprite(Block_Static4_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   543E 46            [ 7]  356 	ld	b, (hl)
   543F 4A            [ 4]  357 	ld	c, d
   5440 C5            [11]  358 	push	bc
   5441 CD D9 71      [17]  359 	call	_calcularPosicionEnPantalla
   5444 F1            [10]  360 	pop	af
   5445 01 C0 4E      [10]  361 	ld	bc, #_Block_Static4_B_0+0
   5448 11 04 10      [10]  362 	ld	de, #0x1004
   544B D5            [11]  363 	push	de
   544C E5            [11]  364 	push	hl
   544D C5            [11]  365 	push	bc
   544E CD 09 74      [17]  366 	call	_cpct_drawSprite
   5451 C3 C7 55      [10]  367 	jp	00180$
   5454                     368 00143$:
                            369 ;src/gameObject/gameObject.c:86: }else if(objeto->sprite==sprite_RockLineal1_G){
   5454 7B            [ 4]  370 	ld	a, e
   5455 D6 0D         [ 7]  371 	sub	a, #0x0d
   5457 20 16         [12]  372 	jr	NZ,00140$
                            373 ;src/gameObject/gameObject.c:87: cpct_drawSprite(Block_Move2_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5459 46            [ 7]  374 	ld	b, (hl)
   545A 4A            [ 4]  375 	ld	c, d
   545B C5            [11]  376 	push	bc
   545C CD D9 71      [17]  377 	call	_calcularPosicionEnPantalla
   545F F1            [10]  378 	pop	af
   5460 01 6F 4E      [10]  379 	ld	bc, #_Block_Move2_G_0+0
   5463 11 04 10      [10]  380 	ld	de, #0x1004
   5466 D5            [11]  381 	push	de
   5467 E5            [11]  382 	push	hl
   5468 C5            [11]  383 	push	bc
   5469 CD 09 74      [17]  384 	call	_cpct_drawSprite
   546C C3 C7 55      [10]  385 	jp	00180$
   546F                     386 00140$:
                            387 ;src/gameObject/gameObject.c:88: }else if(objeto->sprite==sprite_RockLineal1_B){
   546F 7B            [ 4]  388 	ld	a, e
   5470 D6 0E         [ 7]  389 	sub	a, #0x0e
   5472 20 16         [12]  390 	jr	NZ,00137$
                            391 ;src/gameObject/gameObject.c:89: cpct_drawSprite(Block_Move2_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5474 46            [ 7]  392 	ld	b, (hl)
   5475 4A            [ 4]  393 	ld	c, d
   5476 C5            [11]  394 	push	bc
   5477 CD D9 71      [17]  395 	call	_calcularPosicionEnPantalla
   547A F1            [10]  396 	pop	af
   547B 01 1E 4E      [10]  397 	ld	bc, #_Block_Move2_B_0+0
   547E 11 04 10      [10]  398 	ld	de, #0x1004
   5481 D5            [11]  399 	push	de
   5482 E5            [11]  400 	push	hl
   5483 C5            [11]  401 	push	bc
   5484 CD 09 74      [17]  402 	call	_cpct_drawSprite
   5487 C3 C7 55      [10]  403 	jp	00180$
   548A                     404 00137$:
                            405 ;src/gameObject/gameObject.c:90: }else if(objeto->sprite==sprite_PortalMuro){
   548A 7B            [ 4]  406 	ld	a, e
   548B D6 0F         [ 7]  407 	sub	a, #0x0f
   548D 20 16         [12]  408 	jr	NZ,00134$
                            409 ;src/gameObject/gameObject.c:91: cpct_drawSprite(PortalWall_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   548F 46            [ 7]  410 	ld	b, (hl)
   5490 4A            [ 4]  411 	ld	c, d
   5491 C5            [11]  412 	push	bc
   5492 CD D9 71      [17]  413 	call	_calcularPosicionEnPantalla
   5495 F1            [10]  414 	pop	af
   5496 01 CD 4D      [10]  415 	ld	bc, #_PortalWall_0+0
   5499 11 04 10      [10]  416 	ld	de, #0x1004
   549C D5            [11]  417 	push	de
   549D E5            [11]  418 	push	hl
   549E C5            [11]  419 	push	bc
   549F CD 09 74      [17]  420 	call	_cpct_drawSprite
   54A2 C3 C7 55      [10]  421 	jp	00180$
   54A5                     422 00134$:
                            423 ;src/gameObject/gameObject.c:92: }else if(objeto->sprite==sprite_PuertaPortal_G){
   54A5 7B            [ 4]  424 	ld	a, e
   54A6 D6 10         [ 7]  425 	sub	a, #0x10
   54A8 20 16         [12]  426 	jr	NZ,00131$
                            427 ;src/gameObject/gameObject.c:93: cpct_drawSprite(PortalDoor_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   54AA 46            [ 7]  428 	ld	b, (hl)
   54AB 4A            [ 4]  429 	ld	c, d
   54AC C5            [11]  430 	push	bc
   54AD CD D9 71      [17]  431 	call	_calcularPosicionEnPantalla
   54B0 F1            [10]  432 	pop	af
   54B1 01 7C 4D      [10]  433 	ld	bc, #_PortalDoor_G_0+0
   54B4 11 04 10      [10]  434 	ld	de, #0x1004
   54B7 D5            [11]  435 	push	de
   54B8 E5            [11]  436 	push	hl
   54B9 C5            [11]  437 	push	bc
   54BA CD 09 74      [17]  438 	call	_cpct_drawSprite
   54BD C3 C7 55      [10]  439 	jp	00180$
   54C0                     440 00131$:
                            441 ;src/gameObject/gameObject.c:94: }else if(objeto->sprite==sprite_PuertaPortal_B){
   54C0 7B            [ 4]  442 	ld	a, e
   54C1 D6 11         [ 7]  443 	sub	a, #0x11
   54C3 20 16         [12]  444 	jr	NZ,00128$
                            445 ;src/gameObject/gameObject.c:95: cpct_drawSprite(PortalDoor_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   54C5 46            [ 7]  446 	ld	b, (hl)
   54C6 4A            [ 4]  447 	ld	c, d
   54C7 C5            [11]  448 	push	bc
   54C8 CD D9 71      [17]  449 	call	_calcularPosicionEnPantalla
   54CB F1            [10]  450 	pop	af
   54CC 01 2B 4D      [10]  451 	ld	bc, #_PortalDoor_B_0+0
   54CF 11 04 10      [10]  452 	ld	de, #0x1004
   54D2 D5            [11]  453 	push	de
   54D3 E5            [11]  454 	push	hl
   54D4 C5            [11]  455 	push	bc
   54D5 CD 09 74      [17]  456 	call	_cpct_drawSprite
   54D8 C3 C7 55      [10]  457 	jp	00180$
   54DB                     458 00128$:
                            459 ;src/gameObject/gameObject.c:96: }else if(objeto->sprite==sprite_Puerta_G){
   54DB 7B            [ 4]  460 	ld	a, e
   54DC D6 12         [ 7]  461 	sub	a, #0x12
   54DE 20 16         [12]  462 	jr	NZ,00125$
                            463 ;src/gameObject/gameObject.c:97: cpct_drawSprite(Door_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   54E0 46            [ 7]  464 	ld	b, (hl)
   54E1 4A            [ 4]  465 	ld	c, d
   54E2 C5            [11]  466 	push	bc
   54E3 CD D9 71      [17]  467 	call	_calcularPosicionEnPantalla
   54E6 F1            [10]  468 	pop	af
   54E7 01 DA 4C      [10]  469 	ld	bc, #_Door_G_0+0
   54EA 11 04 10      [10]  470 	ld	de, #0x1004
   54ED D5            [11]  471 	push	de
   54EE E5            [11]  472 	push	hl
   54EF C5            [11]  473 	push	bc
   54F0 CD 09 74      [17]  474 	call	_cpct_drawSprite
   54F3 C3 C7 55      [10]  475 	jp	00180$
   54F6                     476 00125$:
                            477 ;src/gameObject/gameObject.c:98: }else if(objeto->sprite==sprite_Puerta_B){
   54F6 7B            [ 4]  478 	ld	a, e
   54F7 D6 13         [ 7]  479 	sub	a, #0x13
   54F9 20 16         [12]  480 	jr	NZ,00122$
                            481 ;src/gameObject/gameObject.c:99: cpct_drawSprite(Door_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   54FB 46            [ 7]  482 	ld	b, (hl)
   54FC 4A            [ 4]  483 	ld	c, d
   54FD C5            [11]  484 	push	bc
   54FE CD D9 71      [17]  485 	call	_calcularPosicionEnPantalla
   5501 F1            [10]  486 	pop	af
   5502 01 89 4C      [10]  487 	ld	bc, #_Door_B_0+0
   5505 11 04 10      [10]  488 	ld	de, #0x1004
   5508 D5            [11]  489 	push	de
   5509 E5            [11]  490 	push	hl
   550A C5            [11]  491 	push	bc
   550B CD 09 74      [17]  492 	call	_cpct_drawSprite
   550E C3 C7 55      [10]  493 	jp	00180$
   5511                     494 00122$:
                            495 ;src/gameObject/gameObject.c:100: }else if(objeto->sprite==sprite_hole){
   5511 7B            [ 4]  496 	ld	a, e
   5512 D6 14         [ 7]  497 	sub	a, #0x14
   5514 20 16         [12]  498 	jr	NZ,00119$
                            499 ;src/gameObject/gameObject.c:101: cpct_drawSprite(Block_Hole, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5516 46            [ 7]  500 	ld	b, (hl)
   5517 4A            [ 4]  501 	ld	c, d
   5518 C5            [11]  502 	push	bc
   5519 CD D9 71      [17]  503 	call	_calcularPosicionEnPantalla
   551C F1            [10]  504 	pop	af
   551D 01 34 4C      [10]  505 	ld	bc, #_Block_Hole+0
   5520 11 04 10      [10]  506 	ld	de, #0x1004
   5523 D5            [11]  507 	push	de
   5524 E5            [11]  508 	push	hl
   5525 C5            [11]  509 	push	bc
   5526 CD 09 74      [17]  510 	call	_cpct_drawSprite
   5529 C3 C7 55      [10]  511 	jp	00180$
   552C                     512 00119$:
                            513 ;src/gameObject/gameObject.c:102: }else if(objeto->sprite==sprite_amstrad){
   552C 7B            [ 4]  514 	ld	a, e
   552D D6 1A         [ 7]  515 	sub	a, #0x1a
   552F 20 16         [12]  516 	jr	NZ,00116$
                            517 ;src/gameObject/gameObject.c:103: cpct_drawSprite(Amstrad_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5531 46            [ 7]  518 	ld	b, (hl)
   5532 4A            [ 4]  519 	ld	c, d
   5533 C5            [11]  520 	push	bc
   5534 CD D9 71      [17]  521 	call	_calcularPosicionEnPantalla
   5537 F1            [10]  522 	pop	af
   5538 01 62 4A      [10]  523 	ld	bc, #_Amstrad_0+0
   553B 11 04 10      [10]  524 	ld	de, #0x1004
   553E D5            [11]  525 	push	de
   553F E5            [11]  526 	push	hl
   5540 C5            [11]  527 	push	bc
   5541 CD 09 74      [17]  528 	call	_cpct_drawSprite
   5544 C3 C7 55      [10]  529 	jp	00180$
   5547                     530 00116$:
                            531 ;src/gameObject/gameObject.c:104: }else if(objeto->sprite==sprite_PrinceofPersia1_G){
   5547 7B            [ 4]  532 	ld	a, e
   5548 D6 1C         [ 7]  533 	sub	a, #0x1c
   554A 20 15         [12]  534 	jr	NZ,00113$
                            535 ;src/gameObject/gameObject.c:105: cpct_drawSprite(PrinceOfPersia_PJ_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   554C 46            [ 7]  536 	ld	b, (hl)
   554D 4A            [ 4]  537 	ld	c, d
   554E C5            [11]  538 	push	bc
   554F CD D9 71      [17]  539 	call	_calcularPosicionEnPantalla
   5552 F1            [10]  540 	pop	af
   5553 01 C0 49      [10]  541 	ld	bc, #_PrinceOfPersia_PJ_G_0+0
   5556 11 04 10      [10]  542 	ld	de, #0x1004
   5559 D5            [11]  543 	push	de
   555A E5            [11]  544 	push	hl
   555B C5            [11]  545 	push	bc
   555C CD 09 74      [17]  546 	call	_cpct_drawSprite
   555F 18 66         [12]  547 	jr	00180$
   5561                     548 00113$:
                            549 ;src/gameObject/gameObject.c:106: }else if(objeto->sprite==sprite_PrinceofPersia1_B){
   5561 7B            [ 4]  550 	ld	a, e
   5562 D6 1D         [ 7]  551 	sub	a, #0x1d
   5564 20 15         [12]  552 	jr	NZ,00110$
                            553 ;src/gameObject/gameObject.c:107: cpct_drawSprite(PrinceOfPersia_PJ_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5566 46            [ 7]  554 	ld	b, (hl)
   5567 4A            [ 4]  555 	ld	c, d
   5568 C5            [11]  556 	push	bc
   5569 CD D9 71      [17]  557 	call	_calcularPosicionEnPantalla
   556C F1            [10]  558 	pop	af
   556D 01 6F 49      [10]  559 	ld	bc, #_PrinceOfPersia_PJ_B_0+0
   5570 11 04 10      [10]  560 	ld	de, #0x1004
   5573 D5            [11]  561 	push	de
   5574 E5            [11]  562 	push	hl
   5575 C5            [11]  563 	push	bc
   5576 CD 09 74      [17]  564 	call	_cpct_drawSprite
   5579 18 4C         [12]  565 	jr	00180$
   557B                     566 00110$:
                            567 ;src/gameObject/gameObject.c:108: }else if(objeto->sprite==sprite_PrinceofPersia2_G){
   557B 7B            [ 4]  568 	ld	a, e
   557C D6 1E         [ 7]  569 	sub	a, #0x1e
   557E 20 15         [12]  570 	jr	NZ,00107$
                            571 ;src/gameObject/gameObject.c:109: cpct_drawSprite(PrinceOfPersia_ENE_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5580 46            [ 7]  572 	ld	b, (hl)
   5581 4A            [ 4]  573 	ld	c, d
   5582 C5            [11]  574 	push	bc
   5583 CD D9 71      [17]  575 	call	_calcularPosicionEnPantalla
   5586 F1            [10]  576 	pop	af
   5587 01 1E 49      [10]  577 	ld	bc, #_PrinceOfPersia_ENE_G_0+0
   558A 11 04 10      [10]  578 	ld	de, #0x1004
   558D D5            [11]  579 	push	de
   558E E5            [11]  580 	push	hl
   558F C5            [11]  581 	push	bc
   5590 CD 09 74      [17]  582 	call	_cpct_drawSprite
   5593 18 32         [12]  583 	jr	00180$
   5595                     584 00107$:
                            585 ;src/gameObject/gameObject.c:110: }else if(objeto->sprite==sprite_PrinceofPersia2_B){
   5595 7B            [ 4]  586 	ld	a, e
   5596 D6 1F         [ 7]  587 	sub	a, #0x1f
   5598 20 15         [12]  588 	jr	NZ,00104$
                            589 ;src/gameObject/gameObject.c:111: cpct_drawSprite(PrinceOfPersia_ENE_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   559A 46            [ 7]  590 	ld	b, (hl)
   559B 4A            [ 4]  591 	ld	c, d
   559C C5            [11]  592 	push	bc
   559D CD D9 71      [17]  593 	call	_calcularPosicionEnPantalla
   55A0 F1            [10]  594 	pop	af
   55A1 01 CD 48      [10]  595 	ld	bc, #_PrinceOfPersia_ENE_B_0+0
   55A4 11 04 10      [10]  596 	ld	de, #0x1004
   55A7 D5            [11]  597 	push	de
   55A8 E5            [11]  598 	push	hl
   55A9 C5            [11]  599 	push	bc
   55AA CD 09 74      [17]  600 	call	_cpct_drawSprite
   55AD 18 18         [12]  601 	jr	00180$
   55AF                     602 00104$:
                            603 ;src/gameObject/gameObject.c:112: }else if(objeto->sprite==sprite_PrinceofPersia3){
   55AF 7B            [ 4]  604 	ld	a, e
   55B0 D6 20         [ 7]  605 	sub	a, #0x20
   55B2 20 13         [12]  606 	jr	NZ,00180$
                            607 ;src/gameObject/gameObject.c:113: cpct_drawSprite(PrinceOfPersia_COVER_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   55B4 46            [ 7]  608 	ld	b, (hl)
   55B5 4A            [ 4]  609 	ld	c, d
   55B6 C5            [11]  610 	push	bc
   55B7 CD D9 71      [17]  611 	call	_calcularPosicionEnPantalla
   55BA F1            [10]  612 	pop	af
   55BB 01 7C 48      [10]  613 	ld	bc, #_PrinceOfPersia_COVER_0+0
   55BE 11 04 10      [10]  614 	ld	de, #0x1004
   55C1 D5            [11]  615 	push	de
   55C2 E5            [11]  616 	push	hl
   55C3 C5            [11]  617 	push	bc
   55C4 CD 09 74      [17]  618 	call	_cpct_drawSprite
   55C7                     619 00180$:
   55C7 DD E1         [14]  620 	pop	ix
   55C9 C9            [10]  621 	ret
                            622 ;src/gameObject/gameObject.c:118: void dibujarGameObjectCol(TGameObjectCol* objeto){
                            623 ;	---------------------------------
                            624 ; Function dibujarGameObjectCol
                            625 ; ---------------------------------
   55CA                     626 _dibujarGameObjectCol::
   55CA DD E5         [15]  627 	push	ix
   55CC DD 21 00 00   [14]  628 	ld	ix,#0
   55D0 DD 39         [15]  629 	add	ix,sp
                            630 ;src/gameObject/gameObject.c:119: if(objeto->posx!=0){
   55D2 DD 4E 04      [19]  631 	ld	c,4 (ix)
   55D5 DD 46 05      [19]  632 	ld	b,5 (ix)
   55D8 69            [ 4]  633 	ld	l, c
   55D9 60            [ 4]  634 	ld	h, b
   55DA 23            [ 6]  635 	inc	hl
   55DB 56            [ 7]  636 	ld	d, (hl)
   55DC 7A            [ 4]  637 	ld	a, d
   55DD B7            [ 4]  638 	or	a, a
   55DE CA 8A 56      [10]  639 	jp	Z, 00120$
                            640 ;src/gameObject/gameObject.c:120: if(objeto->sprite==sprite_luz){
   55E1 69            [ 4]  641 	ld	l, c
   55E2 60            [ 4]  642 	ld	h, b
   55E3 23            [ 6]  643 	inc	hl
   55E4 23            [ 6]  644 	inc	hl
   55E5 23            [ 6]  645 	inc	hl
   55E6 5E            [ 7]  646 	ld	e, (hl)
                            647 ;src/gameObject/gameObject.c:121: cpct_drawSprite(LuzAzul_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   55E7 69            [ 4]  648 	ld	l, c
   55E8 60            [ 4]  649 	ld	h, b
   55E9 23            [ 6]  650 	inc	hl
   55EA 23            [ 6]  651 	inc	hl
                            652 ;src/gameObject/gameObject.c:120: if(objeto->sprite==sprite_luz){
   55EB 7B            [ 4]  653 	ld	a, e
   55EC D6 15         [ 7]  654 	sub	a, #0x15
   55EE 20 18         [12]  655 	jr	NZ,00116$
                            656 ;src/gameObject/gameObject.c:121: cpct_drawSprite(LuzAzul_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   55F0 46            [ 7]  657 	ld	b, (hl)
   55F1 4A            [ 4]  658 	ld	c, d
   55F2 C5            [11]  659 	push	bc
   55F3 CD D9 71      [17]  660 	call	_calcularPosicionEnPantalla
   55F6 F1            [10]  661 	pop	af
   55F7 4D            [ 4]  662 	ld	c, l
   55F8 44            [ 4]  663 	ld	b, h
   55F9 21 04 10      [10]  664 	ld	hl, #0x1004
   55FC E5            [11]  665 	push	hl
   55FD C5            [11]  666 	push	bc
   55FE 21 E7 4B      [10]  667 	ld	hl, #_LuzAzul_0
   5601 E5            [11]  668 	push	hl
   5602 CD 09 74      [17]  669 	call	_cpct_drawSprite
   5605 C3 8A 56      [10]  670 	jp	00120$
   5608                     671 00116$:
                            672 ;src/gameObject/gameObject.c:122: }else if(objeto->sprite==sprite_familia1){
   5608 7B            [ 4]  673 	ld	a, e
   5609 D6 16         [ 7]  674 	sub	a, #0x16
   560B 20 17         [12]  675 	jr	NZ,00113$
                            676 ;src/gameObject/gameObject.c:123: cpct_drawSprite(Character_Brother_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   560D 46            [ 7]  677 	ld	b, (hl)
   560E 4A            [ 4]  678 	ld	c, d
   560F C5            [11]  679 	push	bc
   5610 CD D9 71      [17]  680 	call	_calcularPosicionEnPantalla
   5613 F1            [10]  681 	pop	af
   5614 4D            [ 4]  682 	ld	c, l
   5615 44            [ 4]  683 	ld	b, h
   5616 21 04 10      [10]  684 	ld	hl, #0x1004
   5619 E5            [11]  685 	push	hl
   561A C5            [11]  686 	push	bc
   561B 21 A6 4B      [10]  687 	ld	hl, #_Character_Brother_0
   561E E5            [11]  688 	push	hl
   561F CD 09 74      [17]  689 	call	_cpct_drawSprite
   5622 18 66         [12]  690 	jr	00120$
   5624                     691 00113$:
                            692 ;src/gameObject/gameObject.c:124: }else if(objeto->sprite==sprite_familia2){
   5624 7B            [ 4]  693 	ld	a, e
   5625 D6 17         [ 7]  694 	sub	a, #0x17
   5627 20 15         [12]  695 	jr	NZ,00110$
                            696 ;src/gameObject/gameObject.c:125: cpct_drawSprite(Character_Sister_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5629 46            [ 7]  697 	ld	b, (hl)
   562A 4A            [ 4]  698 	ld	c, d
   562B C5            [11]  699 	push	bc
   562C CD D9 71      [17]  700 	call	_calcularPosicionEnPantalla
   562F F1            [10]  701 	pop	af
   5630 01 55 4B      [10]  702 	ld	bc, #_Character_Sister_0+0
   5633 11 04 10      [10]  703 	ld	de, #0x1004
   5636 D5            [11]  704 	push	de
   5637 E5            [11]  705 	push	hl
   5638 C5            [11]  706 	push	bc
   5639 CD 09 74      [17]  707 	call	_cpct_drawSprite
   563C 18 4C         [12]  708 	jr	00120$
   563E                     709 00110$:
                            710 ;src/gameObject/gameObject.c:126: }else if(objeto->sprite==sprite_familia3){
   563E 7B            [ 4]  711 	ld	a, e
   563F D6 18         [ 7]  712 	sub	a, #0x18
   5641 20 15         [12]  713 	jr	NZ,00107$
                            714 ;src/gameObject/gameObject.c:127: cpct_drawSprite(Character_Mother_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5643 46            [ 7]  715 	ld	b, (hl)
   5644 4A            [ 4]  716 	ld	c, d
   5645 C5            [11]  717 	push	bc
   5646 CD D9 71      [17]  718 	call	_calcularPosicionEnPantalla
   5649 F1            [10]  719 	pop	af
   564A 01 04 4B      [10]  720 	ld	bc, #_Character_Mother_0+0
   564D 11 04 10      [10]  721 	ld	de, #0x1004
   5650 D5            [11]  722 	push	de
   5651 E5            [11]  723 	push	hl
   5652 C5            [11]  724 	push	bc
   5653 CD 09 74      [17]  725 	call	_cpct_drawSprite
   5656 18 32         [12]  726 	jr	00120$
   5658                     727 00107$:
                            728 ;src/gameObject/gameObject.c:128: }else if(objeto->sprite==sprite_familia4){
   5658 7B            [ 4]  729 	ld	a, e
   5659 D6 19         [ 7]  730 	sub	a, #0x19
   565B 20 15         [12]  731 	jr	NZ,00104$
                            732 ;src/gameObject/gameObject.c:129: cpct_drawSprite(Character_Father_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   565D 46            [ 7]  733 	ld	b, (hl)
   565E 4A            [ 4]  734 	ld	c, d
   565F C5            [11]  735 	push	bc
   5660 CD D9 71      [17]  736 	call	_calcularPosicionEnPantalla
   5663 F1            [10]  737 	pop	af
   5664 01 B3 4A      [10]  738 	ld	bc, #_Character_Father_0+0
   5667 11 04 10      [10]  739 	ld	de, #0x1004
   566A D5            [11]  740 	push	de
   566B E5            [11]  741 	push	hl
   566C C5            [11]  742 	push	bc
   566D CD 09 74      [17]  743 	call	_cpct_drawSprite
   5670 18 18         [12]  744 	jr	00120$
   5672                     745 00104$:
                            746 ;src/gameObject/gameObject.c:130: }else if(objeto->sprite==sprite_amstradTape){
   5672 7B            [ 4]  747 	ld	a, e
   5673 D6 1B         [ 7]  748 	sub	a, #0x1b
   5675 20 13         [12]  749 	jr	NZ,00120$
                            750 ;src/gameObject/gameObject.c:131: cpct_drawSprite(PrinceOfPersia_Tape_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5677 46            [ 7]  751 	ld	b, (hl)
   5678 4A            [ 4]  752 	ld	c, d
   5679 C5            [11]  753 	push	bc
   567A CD D9 71      [17]  754 	call	_calcularPosicionEnPantalla
   567D F1            [10]  755 	pop	af
   567E 01 11 4A      [10]  756 	ld	bc, #_PrinceOfPersia_Tape_0+0
   5681 11 04 10      [10]  757 	ld	de, #0x1004
   5684 D5            [11]  758 	push	de
   5685 E5            [11]  759 	push	hl
   5686 C5            [11]  760 	push	bc
   5687 CD 09 74      [17]  761 	call	_cpct_drawSprite
   568A                     762 00120$:
   568A DD E1         [14]  763 	pop	ix
   568C C9            [10]  764 	ret
                            765 ;src/gameObject/gameObject.c:135: void dibujarGameObjectColSprite(u8 sprite,u8 posx, u8 posy){
                            766 ;	---------------------------------
                            767 ; Function dibujarGameObjectColSprite
                            768 ; ---------------------------------
   568D                     769 _dibujarGameObjectColSprite::
   568D DD E5         [15]  770 	push	ix
   568F DD 21 00 00   [14]  771 	ld	ix,#0
   5693 DD 39         [15]  772 	add	ix,sp
                            773 ;src/gameObject/gameObject.c:137: cpct_drawSprite(LuzAzul_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);  
   5695 DD 6E 06      [19]  774 	ld	l, 6 (ix)
   5698 26 00         [ 7]  775 	ld	h, #0x00
   569A DD 5E 05      [19]  776 	ld	e, 5 (ix)
   569D 16 00         [ 7]  777 	ld	d, #0x00
   569F 29            [11]  778 	add	hl, hl
   56A0 29            [11]  779 	add	hl, hl
   56A1 29            [11]  780 	add	hl, hl
   56A2 29            [11]  781 	add	hl, hl
   56A3 4D            [ 4]  782 	ld	c, l
   56A4 44            [ 4]  783 	ld	b, h
   56A5 EB            [ 4]  784 	ex	de,hl
   56A6 29            [11]  785 	add	hl, hl
   56A7 29            [11]  786 	add	hl, hl
   56A8 59            [ 4]  787 	ld	e, c
   56A9 50            [ 4]  788 	ld	d, b
   56AA CB 2A         [ 8]  789 	sra	d
   56AC CB 1B         [ 8]  790 	rr	e
   56AE CB 2A         [ 8]  791 	sra	d
   56B0 CB 1B         [ 8]  792 	rr	e
   56B2 CB 2A         [ 8]  793 	sra	d
   56B4 CB 1B         [ 8]  794 	rr	e
   56B6 79            [ 4]  795 	ld	a, c
   56B7 E6 07         [ 7]  796 	and	a, #0x07
   56B9 4F            [ 4]  797 	ld	c, a
   56BA 23            [ 6]  798 	inc	hl
   56BB E5            [11]  799 	push	hl
   56BC FD E1         [14]  800 	pop	iy
   56BE 79            [ 4]  801 	ld	a, c
   56BF 07            [ 4]  802 	rlca
   56C0 07            [ 4]  803 	rlca
   56C1 07            [ 4]  804 	rlca
   56C2 E6 F8         [ 7]  805 	and	a, #0xf8
   56C4 47            [ 4]  806 	ld	b, a
   56C5 0E 00         [ 7]  807 	ld	c, #0x00
   56C7 6B            [ 4]  808 	ld	l, e
   56C8 62            [ 4]  809 	ld	h, d
   56C9 29            [11]  810 	add	hl, hl
   56CA 29            [11]  811 	add	hl, hl
   56CB 19            [11]  812 	add	hl, de
   56CC 29            [11]  813 	add	hl, hl
   56CD 29            [11]  814 	add	hl, hl
   56CE 29            [11]  815 	add	hl, hl
   56CF 29            [11]  816 	add	hl, hl
   56D0 11 00 C0      [10]  817 	ld	de, #0xc000
   56D3 19            [11]  818 	add	hl, de
   56D4 09            [11]  819 	add	hl,bc
   56D5 4D            [ 4]  820 	ld	c, l
   56D6 44            [ 4]  821 	ld	b, h
   56D7 FD 09         [15]  822 	add	iy, bc
   56D9 FD E5         [15]  823 	push	iy
   56DB C1            [10]  824 	pop	bc
                            825 ;src/gameObject/gameObject.c:136: if(sprite==sprite_luz){
   56DC DD 7E 04      [19]  826 	ld	a, 4 (ix)
   56DF D6 15         [ 7]  827 	sub	a, #0x15
   56E1 20 0E         [12]  828 	jr	NZ,00116$
                            829 ;src/gameObject/gameObject.c:137: cpct_drawSprite(LuzAzul_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);  
   56E3 21 04 10      [10]  830 	ld	hl, #0x1004
   56E6 E5            [11]  831 	push	hl
   56E7 C5            [11]  832 	push	bc
   56E8 21 E7 4B      [10]  833 	ld	hl, #_LuzAzul_0
   56EB E5            [11]  834 	push	hl
   56EC CD 09 74      [17]  835 	call	_cpct_drawSprite
   56EF 18 67         [12]  836 	jr	00118$
   56F1                     837 00116$:
                            838 ;src/gameObject/gameObject.c:138: }else if(sprite==sprite_familia1){
   56F1 DD 7E 04      [19]  839 	ld	a, 4 (ix)
   56F4 D6 16         [ 7]  840 	sub	a, #0x16
   56F6 20 0E         [12]  841 	jr	NZ,00113$
                            842 ;src/gameObject/gameObject.c:139: cpct_drawSprite(Character_Brother_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
   56F8 21 04 10      [10]  843 	ld	hl, #0x1004
   56FB E5            [11]  844 	push	hl
   56FC C5            [11]  845 	push	bc
   56FD 21 A6 4B      [10]  846 	ld	hl, #_Character_Brother_0
   5700 E5            [11]  847 	push	hl
   5701 CD 09 74      [17]  848 	call	_cpct_drawSprite
   5704 18 52         [12]  849 	jr	00118$
   5706                     850 00113$:
                            851 ;src/gameObject/gameObject.c:140: }else if(sprite==sprite_familia2){
   5706 DD 7E 04      [19]  852 	ld	a, 4 (ix)
   5709 D6 17         [ 7]  853 	sub	a, #0x17
   570B 20 0E         [12]  854 	jr	NZ,00110$
                            855 ;src/gameObject/gameObject.c:141: cpct_drawSprite(Character_Sister_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
   570D 21 04 10      [10]  856 	ld	hl, #0x1004
   5710 E5            [11]  857 	push	hl
   5711 C5            [11]  858 	push	bc
   5712 21 55 4B      [10]  859 	ld	hl, #_Character_Sister_0
   5715 E5            [11]  860 	push	hl
   5716 CD 09 74      [17]  861 	call	_cpct_drawSprite
   5719 18 3D         [12]  862 	jr	00118$
   571B                     863 00110$:
                            864 ;src/gameObject/gameObject.c:142: }else if(sprite==sprite_familia3){
   571B DD 7E 04      [19]  865 	ld	a, 4 (ix)
   571E D6 18         [ 7]  866 	sub	a, #0x18
   5720 20 0E         [12]  867 	jr	NZ,00107$
                            868 ;src/gameObject/gameObject.c:143: cpct_drawSprite(Character_Mother_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
   5722 21 04 10      [10]  869 	ld	hl, #0x1004
   5725 E5            [11]  870 	push	hl
   5726 C5            [11]  871 	push	bc
   5727 21 04 4B      [10]  872 	ld	hl, #_Character_Mother_0
   572A E5            [11]  873 	push	hl
   572B CD 09 74      [17]  874 	call	_cpct_drawSprite
   572E 18 28         [12]  875 	jr	00118$
   5730                     876 00107$:
                            877 ;src/gameObject/gameObject.c:144: }else if(sprite==sprite_familia4){
   5730 DD 7E 04      [19]  878 	ld	a, 4 (ix)
   5733 D6 19         [ 7]  879 	sub	a, #0x19
   5735 20 0E         [12]  880 	jr	NZ,00104$
                            881 ;src/gameObject/gameObject.c:145: cpct_drawSprite(Character_Father_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
   5737 21 04 10      [10]  882 	ld	hl, #0x1004
   573A E5            [11]  883 	push	hl
   573B C5            [11]  884 	push	bc
   573C 21 B3 4A      [10]  885 	ld	hl, #_Character_Father_0
   573F E5            [11]  886 	push	hl
   5740 CD 09 74      [17]  887 	call	_cpct_drawSprite
   5743 18 13         [12]  888 	jr	00118$
   5745                     889 00104$:
                            890 ;src/gameObject/gameObject.c:146: }else if(sprite==sprite_amstradTape){
   5745 DD 7E 04      [19]  891 	ld	a, 4 (ix)
   5748 D6 1B         [ 7]  892 	sub	a, #0x1b
   574A 20 0C         [12]  893 	jr	NZ,00118$
                            894 ;src/gameObject/gameObject.c:147: cpct_drawSprite(PrinceOfPersia_Tape_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
   574C 21 04 10      [10]  895 	ld	hl, #0x1004
   574F E5            [11]  896 	push	hl
   5750 C5            [11]  897 	push	bc
   5751 21 11 4A      [10]  898 	ld	hl, #_PrinceOfPersia_Tape_0
   5754 E5            [11]  899 	push	hl
   5755 CD 09 74      [17]  900 	call	_cpct_drawSprite
   5758                     901 00118$:
   5758 DD E1         [14]  902 	pop	ix
   575A C9            [10]  903 	ret
                            904 ;src/gameObject/gameObject.c:152: void limpiarRastro(u8 posx, u8 posy){
                            905 ;	---------------------------------
                            906 ; Function limpiarRastro
                            907 ; ---------------------------------
   575B                     908 _limpiarRastro::
                            909 ;src/gameObject/gameObject.c:153: cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
   575B 21 03 00      [10]  910 	ld	hl, #3+0
   575E 39            [11]  911 	add	hl, sp
   575F 7E            [ 7]  912 	ld	a, (hl)
   5760 F5            [11]  913 	push	af
   5761 33            [ 6]  914 	inc	sp
   5762 21 03 00      [10]  915 	ld	hl, #3+0
   5765 39            [11]  916 	add	hl, sp
   5766 7E            [ 7]  917 	ld	a, (hl)
   5767 F5            [11]  918 	push	af
   5768 33            [ 6]  919 	inc	sp
   5769 CD D9 71      [17]  920 	call	_calcularPosicionEnPantalla
   576C F1            [10]  921 	pop	af
   576D 01 04 10      [10]  922 	ld	bc, #0x1004
   5770 C5            [11]  923 	push	bc
   5771 01 00 00      [10]  924 	ld	bc, #0x0000
   5774 C5            [11]  925 	push	bc
   5775 E5            [11]  926 	push	hl
   5776 CD DC 75      [17]  927 	call	_cpct_drawSolidBox
   5779 C9            [10]  928 	ret
                            929 ;src/gameObject/gameObject.c:155: u8 moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
                            930 ;	---------------------------------
                            931 ; Function moverGameObject
                            932 ; ---------------------------------
   577A                     933 _moverGameObject::
   577A DD E5         [15]  934 	push	ix
   577C DD 21 00 00   [14]  935 	ld	ix,#0
   5780 DD 39         [15]  936 	add	ix,sp
                            937 ;src/gameObject/gameObject.c:156: if(objeto->sprite==sprite_Player){
   5782 DD 4E 04      [19]  938 	ld	c,4 (ix)
   5785 DD 46 05      [19]  939 	ld	b,5 (ix)
   5788 69            [ 4]  940 	ld	l, c
   5789 60            [ 4]  941 	ld	h, b
   578A 23            [ 6]  942 	inc	hl
   578B 23            [ 6]  943 	inc	hl
   578C 23            [ 6]  944 	inc	hl
   578D 5E            [ 7]  945 	ld	e, (hl)
   578E 1D            [ 4]  946 	dec	e
   578F 20 28         [12]  947 	jr	NZ,00102$
                            948 ;src/gameObject/gameObject.c:157: return moverTipoPlayer(objeto,movimiento,rocasCol,rocasEspejo,posicion);
   5791 DD 6E 0B      [19]  949 	ld	l,11 (ix)
   5794 DD 66 0C      [19]  950 	ld	h,12 (ix)
   5797 E5            [11]  951 	push	hl
   5798 DD 6E 09      [19]  952 	ld	l,9 (ix)
   579B DD 66 0A      [19]  953 	ld	h,10 (ix)
   579E E5            [11]  954 	push	hl
   579F DD 6E 07      [19]  955 	ld	l,7 (ix)
   57A2 DD 66 08      [19]  956 	ld	h,8 (ix)
   57A5 E5            [11]  957 	push	hl
   57A6 DD 7E 06      [19]  958 	ld	a, 6 (ix)
   57A9 F5            [11]  959 	push	af
   57AA 33            [ 6]  960 	inc	sp
   57AB C5            [11]  961 	push	bc
   57AC CD 1B 5A      [17]  962 	call	_moverTipoPlayer
   57AF FD 21 09 00   [14]  963 	ld	iy, #9
   57B3 FD 39         [15]  964 	add	iy, sp
   57B5 FD F9         [10]  965 	ld	sp, iy
   57B7 18 26         [12]  966 	jr	00104$
   57B9                     967 00102$:
                            968 ;src/gameObject/gameObject.c:159: return moverTipoRoca(objeto,movimiento,rocasCol,rocasEspejo,posicion);
   57B9 DD 6E 0B      [19]  969 	ld	l,11 (ix)
   57BC DD 66 0C      [19]  970 	ld	h,12 (ix)
   57BF E5            [11]  971 	push	hl
   57C0 DD 6E 09      [19]  972 	ld	l,9 (ix)
   57C3 DD 66 0A      [19]  973 	ld	h,10 (ix)
   57C6 E5            [11]  974 	push	hl
   57C7 DD 6E 07      [19]  975 	ld	l,7 (ix)
   57CA DD 66 08      [19]  976 	ld	h,8 (ix)
   57CD E5            [11]  977 	push	hl
   57CE DD 7E 06      [19]  978 	ld	a, 6 (ix)
   57D1 F5            [11]  979 	push	af
   57D2 33            [ 6]  980 	inc	sp
   57D3 C5            [11]  981 	push	bc
   57D4 CD 20 5C      [17]  982 	call	_moverTipoRoca
   57D7 FD 21 09 00   [14]  983 	ld	iy, #9
   57DB FD 39         [15]  984 	add	iy, sp
   57DD FD F9         [10]  985 	ld	sp, iy
   57DF                     986 00104$:
   57DF DD E1         [14]  987 	pop	ix
   57E1 C9            [10]  988 	ret
                            989 ;src/gameObject/gameObject.c:163: void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocasEspejo,u8 posicion,u8 numMovimientos){
                            990 ;	---------------------------------
                            991 ; Function moverElEspejo
                            992 ; ---------------------------------
   57E2                     993 _moverElEspejo::
   57E2 DD E5         [15]  994 	push	ix
   57E4 DD 21 00 00   [14]  995 	ld	ix,#0
   57E8 DD 39         [15]  996 	add	ix,sp
   57EA 21 F3 FF      [10]  997 	ld	hl, #-13
   57ED 39            [11]  998 	add	hl, sp
   57EE F9            [ 6]  999 	ld	sp, hl
                           1000 ;src/gameObject/gameObject.c:165: u8 nextMovimiento=movimiento;
   57EF DD 4E 05      [19] 1001 	ld	c, 5 (ix)
                           1002 ;src/gameObject/gameObject.c:170: if(movimiento==mover_Izquierda){
   57F2 79            [ 4] 1003 	ld	a, c
   57F3 3D            [ 4] 1004 	dec	a
   57F4 20 02         [12] 1005 	jr	NZ,00102$
                           1006 ;src/gameObject/gameObject.c:171: nextMovimiento=mover_Derecha;
   57F6 0E 03         [ 7] 1007 	ld	c, #0x03
   57F8                    1008 00102$:
                           1009 ;src/gameObject/gameObject.c:172: }if(movimiento==mover_Derecha){
   57F8 DD 7E 05      [19] 1010 	ld	a, 5 (ix)
   57FB D6 03         [ 7] 1011 	sub	a, #0x03
   57FD 20 02         [12] 1012 	jr	NZ,00104$
                           1013 ;src/gameObject/gameObject.c:173: nextMovimiento=mover_Izquierda;
   57FF 0E 01         [ 7] 1014 	ld	c, #0x01
   5801                    1015 00104$:
                           1016 ;src/gameObject/gameObject.c:176: if(posicion==posicion_Izquieda){
   5801 DD 7E 08      [19] 1017 	ld	a, 8 (ix)
   5804 B7            [ 4] 1018 	or	a, a
   5805 20 06         [12] 1019 	jr	NZ,00106$
                           1020 ;src/gameObject/gameObject.c:177: posicion=posicion_Derecha;
   5807 DD 36 08 01   [19] 1021 	ld	8 (ix), #0x01
   580B 18 04         [12] 1022 	jr	00145$
   580D                    1023 00106$:
                           1024 ;src/gameObject/gameObject.c:179: posicion=posicion_Izquieda;
   580D DD 36 08 00   [19] 1025 	ld	8 (ix), #0x00
                           1026 ;src/gameObject/gameObject.c:182: for(u8 i=0;i<RocasMaximas;i++){
   5811                    1027 00145$:
   5811 06 00         [ 7] 1028 	ld	b, #0x00
   5813                    1029 00128$:
   5813 78            [ 4] 1030 	ld	a, b
   5814 D6 28         [ 7] 1031 	sub	a, #0x28
   5816 D2 57 59      [10] 1032 	jp	NC, 00130$
                           1033 ;src/gameObject/gameObject.c:183: if(rocasEspejo[i].num==num){
   5819 58            [ 4] 1034 	ld	e,b
   581A 16 00         [ 7] 1035 	ld	d,#0x00
   581C 6B            [ 4] 1036 	ld	l, e
   581D 62            [ 4] 1037 	ld	h, d
   581E 29            [11] 1038 	add	hl, hl
   581F 19            [11] 1039 	add	hl, de
   5820 29            [11] 1040 	add	hl, hl
   5821 19            [11] 1041 	add	hl, de
   5822 EB            [ 4] 1042 	ex	de,hl
   5823 DD 7E 06      [19] 1043 	ld	a, 6 (ix)
   5826 83            [ 4] 1044 	add	a, e
   5827 5F            [ 4] 1045 	ld	e, a
   5828 DD 7E 07      [19] 1046 	ld	a, 7 (ix)
   582B 8A            [ 4] 1047 	adc	a, d
   582C 57            [ 4] 1048 	ld	d, a
   582D 1A            [ 7] 1049 	ld	a, (de)
   582E DD 77 FB      [19] 1050 	ld	-5 (ix), a
   5831 DD 7E 04      [19] 1051 	ld	a, 4 (ix)
   5834 DD 96 FB      [19] 1052 	sub	a, -5 (ix)
   5837 C2 53 59      [10] 1053 	jp	NZ,00129$
                           1054 ;src/gameObject/gameObject.c:184: objetoEspejo=&rocasEspejo[i];              
                           1055 ;src/gameObject/gameObject.c:186: nextPosx=objetoEspejo->posx;
   583A DD 73 F7      [19] 1056 	ld	-9 (ix), e
   583D DD 72 F8      [19] 1057 	ld	-8 (ix), d
   5840 13            [ 6] 1058 	inc	de
   5841 1A            [ 7] 1059 	ld	a, (de)
   5842 DD 77 FB      [19] 1060 	ld	-5 (ix), a
   5845 DD 77 F6      [19] 1061 	ld	-10 (ix), a
                           1062 ;src/gameObject/gameObject.c:187: nextPosy=objetoEspejo->posy;
   5848 DD 6E F7      [19] 1063 	ld	l,-9 (ix)
   584B DD 66 F8      [19] 1064 	ld	h,-8 (ix)
   584E 23            [ 6] 1065 	inc	hl
   584F 23            [ 6] 1066 	inc	hl
   5850 7E            [ 7] 1067 	ld	a, (hl)
   5851 DD 77 F5      [19] 1068 	ld	-11 (ix), a
                           1069 ;src/gameObject/gameObject.c:188: if(objetoEspejo->posx!=0){
   5854 DD 7E FB      [19] 1070 	ld	a, -5 (ix)
   5857 B7            [ 4] 1071 	or	a, a
   5858 CA 53 59      [10] 1072 	jp	Z, 00129$
                           1073 ;src/gameObject/gameObject.c:189: posicionObjeto=SinColision;
   585B DD 36 F4 32   [19] 1074 	ld	-12 (ix), #0x32
                           1075 ;src/gameObject/gameObject.c:190: for(u8 i=0;i<numMovimientos;i++){
   585F DD 75 F9      [19] 1076 	ld	-7 (ix), l
   5862 DD 74 FA      [19] 1077 	ld	-6 (ix), h
   5865 DD 73 FE      [19] 1078 	ld	-2 (ix), e
   5868 DD 72 FF      [19] 1079 	ld	-1 (ix), d
   586B DD 36 F3 00   [19] 1080 	ld	-13 (ix), #0x00
   586F                    1081 00125$:
   586F DD 7E F3      [19] 1082 	ld	a, -13 (ix)
   5872 DD 96 09      [19] 1083 	sub	a, 9 (ix)
   5875 D2 53 59      [10] 1084 	jp	NC, 00129$
                           1085 ;src/gameObject/gameObject.c:191: if(posicionObjeto==SinColision){
   5878 DD 7E F4      [19] 1086 	ld	a, -12 (ix)
   587B D6 32         [ 7] 1087 	sub	a, #0x32
   587D C2 4D 59      [10] 1088 	jp	NZ,00126$
                           1089 ;src/gameObject/gameObject.c:192: nextMovimiento=calcularMaximosyMinimos(nextMovimiento,objetoEspejo->posx,objetoEspejo->posy,posicion);            
   5880 DD 6E F9      [19] 1090 	ld	l,-7 (ix)
   5883 DD 66 FA      [19] 1091 	ld	h,-6 (ix)
   5886 5E            [ 7] 1092 	ld	e, (hl)
   5887 DD 6E FE      [19] 1093 	ld	l,-2 (ix)
   588A DD 66 FF      [19] 1094 	ld	h,-1 (ix)
   588D 56            [ 7] 1095 	ld	d, (hl)
   588E C5            [11] 1096 	push	bc
   588F DD 7E 08      [19] 1097 	ld	a, 8 (ix)
   5892 F5            [11] 1098 	push	af
   5893 33            [ 6] 1099 	inc	sp
   5894 7B            [ 4] 1100 	ld	a, e
   5895 F5            [11] 1101 	push	af
   5896 33            [ 6] 1102 	inc	sp
   5897 59            [ 4] 1103 	ld	e, c
   5898 D5            [11] 1104 	push	de
   5899 CD 1F 72      [17] 1105 	call	_calcularMaximosyMinimos
   589C F1            [10] 1106 	pop	af
   589D F1            [10] 1107 	pop	af
   589E C1            [10] 1108 	pop	bc
   589F 4D            [ 4] 1109 	ld	c, l
                           1110 ;src/gameObject/gameObject.c:193: if(nextMovimiento!=mover_SinMovimiento){
   58A0 79            [ 4] 1111 	ld	a, c
   58A1 B7            [ 4] 1112 	or	a, a
   58A2 CA 4D 59      [10] 1113 	jp	Z, 00126$
                           1114 ;src/gameObject/gameObject.c:194: posicionObjeto=colisionesSiguientePosicion(objetoEspejo,objetoEspejo->posx,objetoEspejo->posy,nextMovimiento,rocasEspejo,posicion);                                          
   58A5 DD 7E 08      [19] 1115 	ld	a, 8 (ix)
   58A8 DD 77 FC      [19] 1116 	ld	-4 (ix), a
   58AB DD 36 FD 00   [19] 1117 	ld	-3 (ix), #0x00
   58AF DD 6E F9      [19] 1118 	ld	l,-7 (ix)
   58B2 DD 66 FA      [19] 1119 	ld	h,-6 (ix)
   58B5 5E            [ 7] 1120 	ld	e, (hl)
   58B6 DD 6E FE      [19] 1121 	ld	l,-2 (ix)
   58B9 DD 66 FF      [19] 1122 	ld	h,-1 (ix)
   58BC 56            [ 7] 1123 	ld	d, (hl)
   58BD C5            [11] 1124 	push	bc
   58BE DD 6E FC      [19] 1125 	ld	l,-4 (ix)
   58C1 DD 66 FD      [19] 1126 	ld	h,-3 (ix)
   58C4 E5            [11] 1127 	push	hl
   58C5 DD 6E 06      [19] 1128 	ld	l,6 (ix)
   58C8 DD 66 07      [19] 1129 	ld	h,7 (ix)
   58CB E5            [11] 1130 	push	hl
   58CC 79            [ 4] 1131 	ld	a, c
   58CD F5            [11] 1132 	push	af
   58CE 33            [ 6] 1133 	inc	sp
   58CF 7B            [ 4] 1134 	ld	a, e
   58D0 F5            [11] 1135 	push	af
   58D1 33            [ 6] 1136 	inc	sp
   58D2 D5            [11] 1137 	push	de
   58D3 33            [ 6] 1138 	inc	sp
   58D4 DD 6E F7      [19] 1139 	ld	l,-9 (ix)
   58D7 DD 66 F8      [19] 1140 	ld	h,-8 (ix)
   58DA E5            [11] 1141 	push	hl
   58DB CD 78 5F      [17] 1142 	call	_colisionesSiguientePosicion
   58DE FD 21 09 00   [14] 1143 	ld	iy, #9
   58E2 FD 39         [15] 1144 	add	iy, sp
   58E4 FD F9         [10] 1145 	ld	sp, iy
   58E6 C1            [10] 1146 	pop	bc
                           1147 ;src/gameObject/gameObject.c:191: if(posicionObjeto==SinColision){
   58E7 DD 75 F4      [19] 1148 	ld	-12 (ix), l
   58EA 7D            [ 4] 1149 	ld	a, l
   58EB D6 32         [ 7] 1150 	sub	a, #0x32
   58ED 20 04         [12] 1151 	jr	NZ,00198$
   58EF 3E 01         [ 7] 1152 	ld	a,#0x01
   58F1 18 01         [12] 1153 	jr	00199$
   58F3                    1154 00198$:
   58F3 AF            [ 4] 1155 	xor	a,a
   58F4                    1156 00199$:
                           1157 ;src/gameObject/gameObject.c:195: if(posicionObjeto==SinColision){
   58F4 B7            [ 4] 1158 	or	a, a
   58F5 28 2A         [12] 1159 	jr	Z,00112$
                           1160 ;src/gameObject/gameObject.c:196: mover1casilla(&nextPosx,&nextPosy,nextMovimiento);                                                                                 
   58F7 21 02 00      [10] 1161 	ld	hl, #0x0002
   58FA 39            [11] 1162 	add	hl, sp
   58FB EB            [ 4] 1163 	ex	de,hl
   58FC 21 03 00      [10] 1164 	ld	hl, #0x0003
   58FF 39            [11] 1165 	add	hl, sp
   5900 C5            [11] 1166 	push	bc
   5901 79            [ 4] 1167 	ld	a, c
   5902 F5            [11] 1168 	push	af
   5903 33            [ 6] 1169 	inc	sp
   5904 D5            [11] 1170 	push	de
   5905 E5            [11] 1171 	push	hl
   5906 CD 88 5E      [17] 1172 	call	_mover1casilla
   5909 F1            [10] 1173 	pop	af
   590A 33            [ 6] 1174 	inc	sp
   590B DD 66 F5      [19] 1175 	ld	h, -11 (ix)
   590E DD 6E F6      [19] 1176 	ld	l, -10 (ix)
   5911 E3            [19] 1177 	ex	(sp),hl
   5912 DD 6E F7      [19] 1178 	ld	l,-9 (ix)
   5915 DD 66 F8      [19] 1179 	ld	h,-8 (ix)
   5918 E5            [11] 1180 	push	hl
   5919 CD 6A 59      [17] 1181 	call	_moverYdibujar
   591C F1            [10] 1182 	pop	af
   591D F1            [10] 1183 	pop	af
   591E C1            [10] 1184 	pop	bc
   591F 18 2C         [12] 1185 	jr	00126$
   5921                    1186 00112$:
                           1187 ;src/gameObject/gameObject.c:199: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
   5921 B7            [ 4] 1188 	or	a, a
   5922 20 29         [12] 1189 	jr	NZ,00126$
   5924 DD 7E F4      [19] 1190 	ld	a, -12 (ix)
   5927 D6 33         [ 7] 1191 	sub	a, #0x33
   5929 28 22         [12] 1192 	jr	Z,00126$
                           1193 ;src/gameObject/gameObject.c:200: taparHole(objetoEspejo,&rocasEspejo[posicionObjeto]);                                
   592B DD 5E F4      [19] 1194 	ld	e,-12 (ix)
   592E 16 00         [ 7] 1195 	ld	d,#0x00
   5930 6B            [ 4] 1196 	ld	l, e
   5931 62            [ 4] 1197 	ld	h, d
   5932 29            [11] 1198 	add	hl, hl
   5933 19            [11] 1199 	add	hl, de
   5934 29            [11] 1200 	add	hl, hl
   5935 19            [11] 1201 	add	hl, de
   5936 EB            [ 4] 1202 	ex	de,hl
   5937 DD 6E 06      [19] 1203 	ld	l,6 (ix)
   593A DD 66 07      [19] 1204 	ld	h,7 (ix)
   593D 19            [11] 1205 	add	hl, de
   593E C5            [11] 1206 	push	bc
   593F E5            [11] 1207 	push	hl
   5940 DD 6E F7      [19] 1208 	ld	l,-9 (ix)
   5943 DD 66 F8      [19] 1209 	ld	h,-8 (ix)
   5946 E5            [11] 1210 	push	hl
   5947 CD A5 59      [17] 1211 	call	_taparHole
   594A F1            [10] 1212 	pop	af
   594B F1            [10] 1213 	pop	af
   594C C1            [10] 1214 	pop	bc
   594D                    1215 00126$:
                           1216 ;src/gameObject/gameObject.c:190: for(u8 i=0;i<numMovimientos;i++){
   594D DD 34 F3      [23] 1217 	inc	-13 (ix)
   5950 C3 6F 58      [10] 1218 	jp	00125$
   5953                    1219 00129$:
                           1220 ;src/gameObject/gameObject.c:182: for(u8 i=0;i<RocasMaximas;i++){
   5953 04            [ 4] 1221 	inc	b
   5954 C3 13 58      [10] 1222 	jp	00128$
   5957                    1223 00130$:
   5957 DD F9         [10] 1224 	ld	sp, ix
   5959 DD E1         [14] 1225 	pop	ix
   595B C9            [10] 1226 	ret
                           1227 ;src/gameObject/gameObject.c:212: void cambiarPosicion(u8* posicion){    
                           1228 ;	---------------------------------
                           1229 ; Function cambiarPosicion
                           1230 ; ---------------------------------
   595C                    1231 _cambiarPosicion::
                           1232 ;src/gameObject/gameObject.c:213: if(*posicion==posicion_Izquieda){
   595C C1            [10] 1233 	pop	bc
   595D E1            [10] 1234 	pop	hl
   595E E5            [11] 1235 	push	hl
   595F C5            [11] 1236 	push	bc
   5960 7E            [ 7] 1237 	ld	a, (hl)
   5961 B7            [ 4] 1238 	or	a, a
   5962 20 03         [12] 1239 	jr	NZ,00102$
                           1240 ;src/gameObject/gameObject.c:214: *posicion=posicion_Derecha;        
   5964 36 01         [10] 1241 	ld	(hl), #0x01
   5966 C9            [10] 1242 	ret
   5967                    1243 00102$:
                           1244 ;src/gameObject/gameObject.c:216: *posicion=posicion_Izquieda;       
   5967 36 00         [10] 1245 	ld	(hl), #0x00
   5969 C9            [10] 1246 	ret
                           1247 ;src/gameObject/gameObject.c:221: void moverYdibujar(TGameObject* objeto,u8 posx,u8 posy){
                           1248 ;	---------------------------------
                           1249 ; Function moverYdibujar
                           1250 ; ---------------------------------
   596A                    1251 _moverYdibujar::
   596A DD E5         [15] 1252 	push	ix
   596C DD 21 00 00   [14] 1253 	ld	ix,#0
   5970 DD 39         [15] 1254 	add	ix,sp
   5972 F5            [11] 1255 	push	af
                           1256 ;src/gameObject/gameObject.c:222: limpiarRastro(objeto->posx,objeto->posy);    
   5973 DD 4E 04      [19] 1257 	ld	c,4 (ix)
   5976 DD 46 05      [19] 1258 	ld	b,5 (ix)
   5979 21 02 00      [10] 1259 	ld	hl, #0x0002
   597C 09            [11] 1260 	add	hl,bc
   597D E3            [19] 1261 	ex	(sp), hl
   597E E1            [10] 1262 	pop	hl
   597F E5            [11] 1263 	push	hl
   5980 5E            [ 7] 1264 	ld	e, (hl)
   5981 69            [ 4] 1265 	ld	l, c
   5982 60            [ 4] 1266 	ld	h, b
   5983 23            [ 6] 1267 	inc	hl
   5984 56            [ 7] 1268 	ld	d, (hl)
   5985 E5            [11] 1269 	push	hl
   5986 C5            [11] 1270 	push	bc
   5987 7B            [ 4] 1271 	ld	a, e
   5988 F5            [11] 1272 	push	af
   5989 33            [ 6] 1273 	inc	sp
   598A D5            [11] 1274 	push	de
   598B 33            [ 6] 1275 	inc	sp
   598C CD 5B 57      [17] 1276 	call	_limpiarRastro
   598F F1            [10] 1277 	pop	af
   5990 C1            [10] 1278 	pop	bc
   5991 E1            [10] 1279 	pop	hl
                           1280 ;src/gameObject/gameObject.c:223: objeto->posx=posx;
   5992 DD 7E 06      [19] 1281 	ld	a, 6 (ix)
   5995 77            [ 7] 1282 	ld	(hl), a
                           1283 ;src/gameObject/gameObject.c:224: objeto->posy=posy;
   5996 E1            [10] 1284 	pop	hl
   5997 E5            [11] 1285 	push	hl
   5998 DD 7E 07      [19] 1286 	ld	a, 7 (ix)
   599B 77            [ 7] 1287 	ld	(hl), a
                           1288 ;src/gameObject/gameObject.c:225: dibujarGameObject(objeto);
   599C C5            [11] 1289 	push	bc
   599D CD EC 52      [17] 1290 	call	_dibujarGameObject
   59A0 DD F9         [10] 1291 	ld	sp,ix
   59A2 DD E1         [14] 1292 	pop	ix
   59A4 C9            [10] 1293 	ret
                           1294 ;src/gameObject/gameObject.c:227: void taparHole(TGameObject* roca,TGameObject* hole){
                           1295 ;	---------------------------------
                           1296 ; Function taparHole
                           1297 ; ---------------------------------
   59A5                    1298 _taparHole::
   59A5 DD E5         [15] 1299 	push	ix
   59A7 DD 21 00 00   [14] 1300 	ld	ix,#0
   59AB DD 39         [15] 1301 	add	ix,sp
   59AD 21 FA FF      [10] 1302 	ld	hl, #-6
   59B0 39            [11] 1303 	add	hl, sp
   59B1 F9            [ 6] 1304 	ld	sp, hl
                           1305 ;src/gameObject/gameObject.c:228: if(hole->sprite==sprite_hole){
   59B2 DD 4E 06      [19] 1306 	ld	c,6 (ix)
   59B5 DD 46 07      [19] 1307 	ld	b,7 (ix)
   59B8 69            [ 4] 1308 	ld	l, c
   59B9 60            [ 4] 1309 	ld	h, b
   59BA 23            [ 6] 1310 	inc	hl
   59BB 23            [ 6] 1311 	inc	hl
   59BC 23            [ 6] 1312 	inc	hl
   59BD 7E            [ 7] 1313 	ld	a, (hl)
   59BE D6 14         [ 7] 1314 	sub	a, #0x14
   59C0 20 54         [12] 1315 	jr	NZ,00103$
                           1316 ;src/gameObject/gameObject.c:229: limpiarRastro(roca->posx,roca->posy);
   59C2 DD 5E 04      [19] 1317 	ld	e,4 (ix)
   59C5 DD 56 05      [19] 1318 	ld	d,5 (ix)
   59C8 21 02 00      [10] 1319 	ld	hl, #0x0002
   59CB 19            [11] 1320 	add	hl,de
   59CC E3            [19] 1321 	ex	(sp), hl
   59CD E1            [10] 1322 	pop	hl
   59CE E5            [11] 1323 	push	hl
   59CF 7E            [ 7] 1324 	ld	a, (hl)
   59D0 DD 77 FF      [19] 1325 	ld	-1 (ix), a
   59D3 13            [ 6] 1326 	inc	de
   59D4 DD 73 FD      [19] 1327 	ld	-3 (ix), e
   59D7 DD 72 FE      [19] 1328 	ld	-2 (ix), d
   59DA 6B            [ 4] 1329 	ld	l, e
   59DB 62            [ 4] 1330 	ld	h, d
   59DC 56            [ 7] 1331 	ld	d, (hl)
   59DD C5            [11] 1332 	push	bc
   59DE DD 7E FF      [19] 1333 	ld	a, -1 (ix)
   59E1 F5            [11] 1334 	push	af
   59E2 33            [ 6] 1335 	inc	sp
   59E3 D5            [11] 1336 	push	de
   59E4 33            [ 6] 1337 	inc	sp
   59E5 CD 5B 57      [17] 1338 	call	_limpiarRastro
   59E8 F1            [10] 1339 	pop	af
   59E9 C1            [10] 1340 	pop	bc
                           1341 ;src/gameObject/gameObject.c:230: limpiarRastro(hole->posx,hole->posy);
   59EA 59            [ 4] 1342 	ld	e, c
   59EB 50            [ 4] 1343 	ld	d, b
   59EC 13            [ 6] 1344 	inc	de
   59ED 13            [ 6] 1345 	inc	de
   59EE 1A            [ 7] 1346 	ld	a, (de)
   59EF DD 77 FF      [19] 1347 	ld	-1 (ix), a
   59F2 03            [ 6] 1348 	inc	bc
   59F3 0A            [ 7] 1349 	ld	a, (bc)
   59F4 DD 77 FC      [19] 1350 	ld	-4 (ix), a
   59F7 C5            [11] 1351 	push	bc
   59F8 D5            [11] 1352 	push	de
   59F9 DD 66 FF      [19] 1353 	ld	h, -1 (ix)
   59FC DD 6E FC      [19] 1354 	ld	l, -4 (ix)
   59FF E5            [11] 1355 	push	hl
   5A00 CD 5B 57      [17] 1356 	call	_limpiarRastro
   5A03 F1            [10] 1357 	pop	af
   5A04 D1            [10] 1358 	pop	de
   5A05 C1            [10] 1359 	pop	bc
                           1360 ;src/gameObject/gameObject.c:231: roca->posx=0;
   5A06 DD 6E FD      [19] 1361 	ld	l,-3 (ix)
   5A09 DD 66 FE      [19] 1362 	ld	h,-2 (ix)
   5A0C 36 00         [10] 1363 	ld	(hl), #0x00
                           1364 ;src/gameObject/gameObject.c:232: roca->posy=0;
   5A0E E1            [10] 1365 	pop	hl
   5A0F E5            [11] 1366 	push	hl
   5A10 36 00         [10] 1367 	ld	(hl), #0x00
                           1368 ;src/gameObject/gameObject.c:233: hole->posx=0;
   5A12 AF            [ 4] 1369 	xor	a, a
   5A13 02            [ 7] 1370 	ld	(bc), a
                           1371 ;src/gameObject/gameObject.c:234: hole->posy=0;
   5A14 AF            [ 4] 1372 	xor	a, a
   5A15 12            [ 7] 1373 	ld	(de), a
   5A16                    1374 00103$:
   5A16 DD F9         [10] 1375 	ld	sp, ix
   5A18 DD E1         [14] 1376 	pop	ix
   5A1A C9            [10] 1377 	ret
                           1378 ;src/gameObject/gameObject.c:244: u8 moverTipoPlayer(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
                           1379 ;	---------------------------------
                           1380 ; Function moverTipoPlayer
                           1381 ; ---------------------------------
   5A1B                    1382 _moverTipoPlayer::
   5A1B DD E5         [15] 1383 	push	ix
   5A1D DD 21 00 00   [14] 1384 	ld	ix,#0
   5A21 DD 39         [15] 1385 	add	ix,sp
   5A23 21 F0 FF      [10] 1386 	ld	hl, #-16
   5A26 39            [11] 1387 	add	hl, sp
   5A27 F9            [ 6] 1388 	ld	sp, hl
                           1389 ;src/gameObject/gameObject.c:245: if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){
   5A28 DD 7E 04      [19] 1390 	ld	a, 4 (ix)
   5A2B DD 77 FE      [19] 1391 	ld	-2 (ix), a
   5A2E DD 7E 05      [19] 1392 	ld	a, 5 (ix)
   5A31 DD 77 FF      [19] 1393 	ld	-1 (ix), a
   5A34 DD 7E FE      [19] 1394 	ld	a, -2 (ix)
   5A37 C6 05         [ 7] 1395 	add	a, #0x05
   5A39 DD 77 FC      [19] 1396 	ld	-4 (ix), a
   5A3C DD 7E FF      [19] 1397 	ld	a, -1 (ix)
   5A3F CE 00         [ 7] 1398 	adc	a, #0x00
   5A41 DD 77 FD      [19] 1399 	ld	-3 (ix), a
   5A44 DD 6E FC      [19] 1400 	ld	l,-4 (ix)
   5A47 DD 66 FD      [19] 1401 	ld	h,-3 (ix)
   5A4A 4E            [ 7] 1402 	ld	c, (hl)
   5A4B 79            [ 4] 1403 	ld	a, c
   5A4C B7            [ 4] 1404 	or	a, a
   5A4D 28 0E         [12] 1405 	jr	Z,00116$
   5A4F DD 6E FE      [19] 1406 	ld	l,-2 (ix)
   5A52 DD 66 FF      [19] 1407 	ld	h,-1 (ix)
   5A55 23            [ 6] 1408 	inc	hl
   5A56 23            [ 6] 1409 	inc	hl
   5A57 23            [ 6] 1410 	inc	hl
   5A58 46            [ 7] 1411 	ld	b, (hl)
   5A59 05            [ 4] 1412 	dec	b
   5A5A CA 11 5C      [10] 1413 	jp	Z,00117$
   5A5D                    1414 00116$:
                           1415 ;src/gameObject/gameObject.c:246: cpct_waitVSYNC();    
   5A5D CD B6 75      [17] 1416 	call	_cpct_waitVSYNC
                           1417 ;src/gameObject/gameObject.c:247: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);            
   5A60 DD 7E 0B      [19] 1418 	ld	a, 11 (ix)
   5A63 DD 77 FA      [19] 1419 	ld	-6 (ix), a
   5A66 DD 7E 0C      [19] 1420 	ld	a, 12 (ix)
   5A69 DD 77 FB      [19] 1421 	ld	-5 (ix), a
   5A6C DD 6E FA      [19] 1422 	ld	l,-6 (ix)
   5A6F DD 66 FB      [19] 1423 	ld	h,-5 (ix)
   5A72 7E            [ 7] 1424 	ld	a, (hl)
   5A73 DD 77 F9      [19] 1425 	ld	-7 (ix), a
   5A76 DD 4E FE      [19] 1426 	ld	c,-2 (ix)
   5A79 DD 46 FF      [19] 1427 	ld	b,-1 (ix)
   5A7C 03            [ 6] 1428 	inc	bc
   5A7D 03            [ 6] 1429 	inc	bc
   5A7E 0A            [ 7] 1430 	ld	a, (bc)
   5A7F DD 77 F8      [19] 1431 	ld	-8 (ix), a
   5A82 DD 5E FE      [19] 1432 	ld	e,-2 (ix)
   5A85 DD 56 FF      [19] 1433 	ld	d,-1 (ix)
   5A88 13            [ 6] 1434 	inc	de
   5A89 1A            [ 7] 1435 	ld	a, (de)
   5A8A DD 77 F7      [19] 1436 	ld	-9 (ix), a
   5A8D C5            [11] 1437 	push	bc
   5A8E D5            [11] 1438 	push	de
   5A8F DD 66 F9      [19] 1439 	ld	h, -7 (ix)
   5A92 DD 6E F8      [19] 1440 	ld	l, -8 (ix)
   5A95 E5            [11] 1441 	push	hl
   5A96 DD 66 F7      [19] 1442 	ld	h, -9 (ix)
   5A99 DD 6E 06      [19] 1443 	ld	l, 6 (ix)
   5A9C E5            [11] 1444 	push	hl
   5A9D CD 1F 72      [17] 1445 	call	_calcularMaximosyMinimos
   5AA0 F1            [10] 1446 	pop	af
   5AA1 F1            [10] 1447 	pop	af
   5AA2 DD 75 F7      [19] 1448 	ld	-9 (ix), l
   5AA5 D1            [10] 1449 	pop	de
   5AA6 C1            [10] 1450 	pop	bc
                           1451 ;src/gameObject/gameObject.c:248: if(movimiento!=mover_SinMovimiento){                  
   5AA7 DD 7E F7      [19] 1452 	ld	a, -9 (ix)
   5AAA B7            [ 4] 1453 	or	a, a
   5AAB CA 19 5C      [10] 1454 	jp	Z, 00118$
                           1455 ;src/gameObject/gameObject.c:249: u8 nextPosx=objeto->posx;
   5AAE 1A            [ 7] 1456 	ld	a, (de)
   5AAF DD 77 F1      [19] 1457 	ld	-15 (ix), a
                           1458 ;src/gameObject/gameObject.c:250: u8 nextPosy=objeto->posy;
   5AB2 0A            [ 7] 1459 	ld	a, (bc)
   5AB3 DD 77 F0      [19] 1460 	ld	-16 (ix), a
                           1461 ;src/gameObject/gameObject.c:253: u8 moverRoca=mover_roca;
   5AB6 DD 36 F2 00   [19] 1462 	ld	-14 (ix), #0x00
                           1463 ;src/gameObject/gameObject.c:257: mover1casilla(&nextPosx,&nextPosy,movimiento);            
   5ABA 21 00 00      [10] 1464 	ld	hl, #0x0000
   5ABD 39            [11] 1465 	add	hl, sp
   5ABE DD 75 F5      [19] 1466 	ld	-11 (ix), l
   5AC1 DD 74 F6      [19] 1467 	ld	-10 (ix), h
   5AC4 EB            [ 4] 1468 	ex	de,hl
   5AC5 21 01 00      [10] 1469 	ld	hl, #0x0001
   5AC8 39            [11] 1470 	add	hl, sp
   5AC9 4D            [ 4] 1471 	ld	c, l
   5ACA 44            [ 4] 1472 	ld	b, h
   5ACB C5            [11] 1473 	push	bc
   5ACC FD E1         [14] 1474 	pop	iy
   5ACE C5            [11] 1475 	push	bc
   5ACF DD 7E F7      [19] 1476 	ld	a, -9 (ix)
   5AD2 F5            [11] 1477 	push	af
   5AD3 33            [ 6] 1478 	inc	sp
   5AD4 D5            [11] 1479 	push	de
   5AD5 FD E5         [15] 1480 	push	iy
   5AD7 CD 88 5E      [17] 1481 	call	_mover1casilla
   5ADA F1            [10] 1482 	pop	af
   5ADB 33            [ 6] 1483 	inc	sp
   5ADC DD 66 F0      [19] 1484 	ld	h, -16 (ix)
   5ADF DD 6E F1      [19] 1485 	ld	l, -15 (ix)
   5AE2 E3            [19] 1486 	ex	(sp),hl
   5AE3 CD 8B 61      [17] 1487 	call	_comprobarPuertas
   5AE6 F1            [10] 1488 	pop	af
   5AE7 C1            [10] 1489 	pop	bc
                           1490 ;src/gameObject/gameObject.c:260: if(colisionPuerta!=seguir_En_Nivel){
   5AE8 DD 75 F4      [19] 1491 	ld	-12 (ix), l
   5AEB 7D            [ 4] 1492 	ld	a, l
   5AEC B7            [ 4] 1493 	or	a, a
   5AED 28 06         [12] 1494 	jr	Z,00102$
                           1495 ;src/gameObject/gameObject.c:261: return colisionPuerta;
   5AEF DD 6E F4      [19] 1496 	ld	l, -12 (ix)
   5AF2 C3 1B 5C      [10] 1497 	jp	00120$
   5AF5                    1498 00102$:
                           1499 ;src/gameObject/gameObject.c:263: comprobarColeccionables(nextPosx,nextPosy);            
   5AF5 C5            [11] 1500 	push	bc
   5AF6 DD 66 F0      [19] 1501 	ld	h, -16 (ix)
   5AF9 DD 6E F1      [19] 1502 	ld	l, -15 (ix)
   5AFC E5            [11] 1503 	push	hl
   5AFD CD D1 61      [17] 1504 	call	_comprobarColeccionables
   5B00 F1            [10] 1505 	pop	af
   5B01 C1            [10] 1506 	pop	bc
                           1507 ;src/gameObject/gameObject.c:264: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);            
   5B02 DD 5E F5      [19] 1508 	ld	e,-11 (ix)
   5B05 DD 56 F6      [19] 1509 	ld	d,-10 (ix)
   5B08 DD 6E FA      [19] 1510 	ld	l,-6 (ix)
   5B0B DD 66 FB      [19] 1511 	ld	h,-5 (ix)
   5B0E E5            [11] 1512 	push	hl
   5B0F DD 7E F7      [19] 1513 	ld	a, -9 (ix)
   5B12 F5            [11] 1514 	push	af
   5B13 33            [ 6] 1515 	inc	sp
   5B14 D5            [11] 1516 	push	de
   5B15 C5            [11] 1517 	push	bc
   5B16 DD 6E FE      [19] 1518 	ld	l,-2 (ix)
   5B19 DD 66 FF      [19] 1519 	ld	h,-1 (ix)
   5B1C E5            [11] 1520 	push	hl
   5B1D CD 7E 60      [17] 1521 	call	_comprobarPortales
   5B20 FD 21 09 00   [14] 1522 	ld	iy, #9
   5B24 FD 39         [15] 1523 	add	iy, sp
   5B26 FD F9         [10] 1524 	ld	sp, iy
   5B28 4D            [ 4] 1525 	ld	c, l
                           1526 ;src/gameObject/gameObject.c:265: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);            
   5B29 C5            [11] 1527 	push	bc
   5B2A DD 6E 07      [19] 1528 	ld	l,7 (ix)
   5B2D DD 66 08      [19] 1529 	ld	h,8 (ix)
   5B30 E5            [11] 1530 	push	hl
   5B31 DD 66 F0      [19] 1531 	ld	h, -16 (ix)
   5B34 DD 6E F1      [19] 1532 	ld	l, -15 (ix)
   5B37 E5            [11] 1533 	push	hl
   5B38 CD 34 60      [17] 1534 	call	_comprobarRocas
   5B3B F1            [10] 1535 	pop	af
   5B3C F1            [10] 1536 	pop	af
   5B3D C1            [10] 1537 	pop	bc
   5B3E DD 75 F3      [19] 1538 	ld	-13 (ix), l
                           1539 ;src/gameObject/gameObject.c:266: if(colisionPortales==hay_Colision){
   5B41 0D            [ 4] 1540 	dec	c
   5B42 20 2C         [12] 1541 	jr	NZ,00107$
                           1542 ;src/gameObject/gameObject.c:267: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasEspejo);
   5B44 DD 6E 09      [19] 1543 	ld	l,9 (ix)
   5B47 DD 66 0A      [19] 1544 	ld	h,10 (ix)
   5B4A E5            [11] 1545 	push	hl
   5B4B DD 66 F0      [19] 1546 	ld	h, -16 (ix)
   5B4E DD 6E F1      [19] 1547 	ld	l, -15 (ix)
   5B51 E5            [11] 1548 	push	hl
   5B52 CD 34 60      [17] 1549 	call	_comprobarRocas
   5B55 F1            [10] 1550 	pop	af
   5B56 F1            [10] 1551 	pop	af
                           1552 ;src/gameObject/gameObject.c:268: if(ObjetoColisionado!=SinColision){
   5B57 DD 75 F3      [19] 1553 	ld	-13 (ix), l
   5B5A 7D            [ 4] 1554 	ld	a, l
   5B5B D6 32         [ 7] 1555 	sub	a, #0x32
   5B5D 28 06         [12] 1556 	jr	Z,00104$
                           1557 ;src/gameObject/gameObject.c:269: moverRoca=no_mover_roca;
   5B5F DD 36 F2 01   [19] 1558 	ld	-14 (ix), #0x01
   5B63 18 0B         [12] 1559 	jr	00107$
   5B65                    1560 00104$:
                           1561 ;src/gameObject/gameObject.c:271: cambiarPosicion(posicion);
   5B65 DD 6E FA      [19] 1562 	ld	l,-6 (ix)
   5B68 DD 66 FB      [19] 1563 	ld	h,-5 (ix)
   5B6B E5            [11] 1564 	push	hl
   5B6C CD 5C 59      [17] 1565 	call	_cambiarPosicion
   5B6F F1            [10] 1566 	pop	af
   5B70                    1567 00107$:
                           1568 ;src/gameObject/gameObject.c:274: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision){             
   5B70 DD 7E F3      [19] 1569 	ld	a, -13 (ix)
   5B73 D6 32         [ 7] 1570 	sub	a, #0x32
   5B75 20 3E         [12] 1571 	jr	NZ,00111$
   5B77 DD 7E F4      [19] 1572 	ld	a, -12 (ix)
   5B7A B7            [ 4] 1573 	or	a, a
   5B7B 20 38         [12] 1574 	jr	NZ,00111$
                           1575 ;src/gameObject/gameObject.c:275: moverYdibujar(objeto,nextPosx,nextPosy);
   5B7D DD 66 F0      [19] 1576 	ld	h, -16 (ix)
   5B80 DD 6E F1      [19] 1577 	ld	l, -15 (ix)
   5B83 E5            [11] 1578 	push	hl
   5B84 DD 6E FE      [19] 1579 	ld	l,-2 (ix)
   5B87 DD 66 FF      [19] 1580 	ld	h,-1 (ix)
   5B8A E5            [11] 1581 	push	hl
   5B8B CD 6A 59      [17] 1582 	call	_moverYdibujar
   5B8E F1            [10] 1583 	pop	af
   5B8F F1            [10] 1584 	pop	af
                           1585 ;src/gameObject/gameObject.c:276: objeto->pasos++;                                              
   5B90 DD 7E FE      [19] 1586 	ld	a, -2 (ix)
   5B93 C6 06         [ 7] 1587 	add	a, #0x06
   5B95 DD 77 F5      [19] 1588 	ld	-11 (ix), a
   5B98 DD 7E FF      [19] 1589 	ld	a, -1 (ix)
   5B9B CE 00         [ 7] 1590 	adc	a, #0x00
   5B9D DD 77 F6      [19] 1591 	ld	-10 (ix), a
   5BA0 DD 6E F5      [19] 1592 	ld	l,-11 (ix)
   5BA3 DD 66 F6      [19] 1593 	ld	h,-10 (ix)
   5BA6 7E            [ 7] 1594 	ld	a, (hl)
   5BA7 DD 77 F8      [19] 1595 	ld	-8 (ix), a
   5BAA 4F            [ 4] 1596 	ld	c, a
   5BAB 0C            [ 4] 1597 	inc	c
   5BAC DD 6E F5      [19] 1598 	ld	l,-11 (ix)
   5BAF DD 66 F6      [19] 1599 	ld	h,-10 (ix)
   5BB2 71            [ 7] 1600 	ld	(hl), c
   5BB3 18 52         [12] 1601 	jr	00112$
   5BB5                    1602 00111$:
                           1603 ;src/gameObject/gameObject.c:278: if(moverRoca==mover_roca)          
   5BB5 DD 7E F2      [19] 1604 	ld	a, -14 (ix)
   5BB8 B7            [ 4] 1605 	or	a, a
   5BB9 20 4C         [12] 1606 	jr	NZ,00112$
                           1607 ;src/gameObject/gameObject.c:279: moverGameObject(&rocasCol[ObjetoColisionado],movimiento,rocasCol,rocasEspejo,posicion);                      
   5BBB DD 4E F3      [19] 1608 	ld	c,-13 (ix)
   5BBE 06 00         [ 7] 1609 	ld	b,#0x00
   5BC0 69            [ 4] 1610 	ld	l, c
   5BC1 60            [ 4] 1611 	ld	h, b
   5BC2 29            [11] 1612 	add	hl, hl
   5BC3 09            [11] 1613 	add	hl, bc
   5BC4 29            [11] 1614 	add	hl, hl
   5BC5 09            [11] 1615 	add	hl, bc
   5BC6 DD 75 F5      [19] 1616 	ld	-11 (ix), l
   5BC9 DD 74 F6      [19] 1617 	ld	-10 (ix), h
   5BCC DD 7E 07      [19] 1618 	ld	a, 7 (ix)
   5BCF DD 86 F5      [19] 1619 	add	a, -11 (ix)
   5BD2 DD 77 F5      [19] 1620 	ld	-11 (ix), a
   5BD5 DD 7E 08      [19] 1621 	ld	a, 8 (ix)
   5BD8 DD 8E F6      [19] 1622 	adc	a, -10 (ix)
   5BDB DD 77 F6      [19] 1623 	ld	-10 (ix), a
   5BDE DD 6E FA      [19] 1624 	ld	l,-6 (ix)
   5BE1 DD 66 FB      [19] 1625 	ld	h,-5 (ix)
   5BE4 E5            [11] 1626 	push	hl
   5BE5 DD 6E 09      [19] 1627 	ld	l,9 (ix)
   5BE8 DD 66 0A      [19] 1628 	ld	h,10 (ix)
   5BEB E5            [11] 1629 	push	hl
   5BEC DD 6E 07      [19] 1630 	ld	l,7 (ix)
   5BEF DD 66 08      [19] 1631 	ld	h,8 (ix)
   5BF2 E5            [11] 1632 	push	hl
   5BF3 DD 7E F7      [19] 1633 	ld	a, -9 (ix)
   5BF6 F5            [11] 1634 	push	af
   5BF7 33            [ 6] 1635 	inc	sp
   5BF8 DD 6E F5      [19] 1636 	ld	l,-11 (ix)
   5BFB DD 66 F6      [19] 1637 	ld	h,-10 (ix)
   5BFE E5            [11] 1638 	push	hl
   5BFF CD 7A 57      [17] 1639 	call	_moverGameObject
   5C02 21 09 00      [10] 1640 	ld	hl, #9
   5C05 39            [11] 1641 	add	hl, sp
   5C06 F9            [ 6] 1642 	ld	sp, hl
   5C07                    1643 00112$:
                           1644 ;src/gameObject/gameObject.c:281: objeto->cronoMovimiento=retardoMovimiento;
   5C07 DD 6E FC      [19] 1645 	ld	l,-4 (ix)
   5C0A DD 66 FD      [19] 1646 	ld	h,-3 (ix)
   5C0D 36 FF         [10] 1647 	ld	(hl), #0xff
   5C0F 18 08         [12] 1648 	jr	00118$
   5C11                    1649 00117$:
                           1650 ;src/gameObject/gameObject.c:284: objeto->cronoMovimiento-=1;
   5C11 0D            [ 4] 1651 	dec	c
   5C12 DD 6E FC      [19] 1652 	ld	l,-4 (ix)
   5C15 DD 66 FD      [19] 1653 	ld	h,-3 (ix)
   5C18 71            [ 7] 1654 	ld	(hl), c
   5C19                    1655 00118$:
                           1656 ;src/gameObject/gameObject.c:286: return seguir_En_Nivel;
   5C19 2E 00         [ 7] 1657 	ld	l, #0x00
   5C1B                    1658 00120$:
   5C1B DD F9         [10] 1659 	ld	sp, ix
   5C1D DD E1         [14] 1660 	pop	ix
   5C1F C9            [10] 1661 	ret
                           1662 ;src/gameObject/gameObject.c:288: u8 moverTipoRoca(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
                           1663 ;	---------------------------------
                           1664 ; Function moverTipoRoca
                           1665 ; ---------------------------------
   5C20                    1666 _moverTipoRoca::
   5C20 DD E5         [15] 1667 	push	ix
   5C22 DD 21 00 00   [14] 1668 	ld	ix,#0
   5C26 DD 39         [15] 1669 	add	ix,sp
   5C28 21 F3 FF      [10] 1670 	ld	hl, #-13
   5C2B 39            [11] 1671 	add	hl, sp
   5C2C F9            [ 6] 1672 	ld	sp, hl
                           1673 ;src/gameObject/gameObject.c:290: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);
   5C2D DD 7E 0B      [19] 1674 	ld	a, 11 (ix)
   5C30 DD 77 FA      [19] 1675 	ld	-6 (ix), a
   5C33 DD 7E 0C      [19] 1676 	ld	a, 12 (ix)
   5C36 DD 77 FB      [19] 1677 	ld	-5 (ix), a
   5C39 DD 6E FA      [19] 1678 	ld	l,-6 (ix)
   5C3C DD 66 FB      [19] 1679 	ld	h,-5 (ix)
   5C3F 56            [ 7] 1680 	ld	d, (hl)
   5C40 DD 4E 04      [19] 1681 	ld	c,4 (ix)
   5C43 DD 46 05      [19] 1682 	ld	b,5 (ix)
   5C46 21 02 00      [10] 1683 	ld	hl, #0x0002
   5C49 09            [11] 1684 	add	hl,bc
   5C4A DD 75 F8      [19] 1685 	ld	-8 (ix), l
   5C4D DD 74 F9      [19] 1686 	ld	-7 (ix), h
   5C50 5E            [ 7] 1687 	ld	e, (hl)
   5C51 21 01 00      [10] 1688 	ld	hl, #0x0001
   5C54 09            [11] 1689 	add	hl,bc
   5C55 DD 75 FE      [19] 1690 	ld	-2 (ix), l
   5C58 DD 74 FF      [19] 1691 	ld	-1 (ix), h
   5C5B 7E            [ 7] 1692 	ld	a, (hl)
   5C5C DD 77 F7      [19] 1693 	ld	-9 (ix), a
   5C5F C5            [11] 1694 	push	bc
   5C60 D5            [11] 1695 	push	de
   5C61 33            [ 6] 1696 	inc	sp
   5C62 53            [ 4] 1697 	ld	d, e
   5C63 DD 5E F7      [19] 1698 	ld	e, -9 (ix)
   5C66 D5            [11] 1699 	push	de
   5C67 DD 7E 06      [19] 1700 	ld	a, 6 (ix)
   5C6A F5            [11] 1701 	push	af
   5C6B 33            [ 6] 1702 	inc	sp
   5C6C CD 1F 72      [17] 1703 	call	_calcularMaximosyMinimos
   5C6F F1            [10] 1704 	pop	af
   5C70 F1            [10] 1705 	pop	af
   5C71 5D            [ 4] 1706 	ld	e, l
   5C72 C1            [10] 1707 	pop	bc
                           1708 ;src/gameObject/gameObject.c:292: if(movimiento!=mover_SinMovimiento && objeto->movimiento != sin_Movimiento){                  
   5C73 7B            [ 4] 1709 	ld	a, e
   5C74 B7            [ 4] 1710 	or	a, a
   5C75 CA 81 5E      [10] 1711 	jp	Z, 00123$
   5C78 21 04 00      [10] 1712 	ld	hl, #0x0004
   5C7B 09            [11] 1713 	add	hl,bc
   5C7C DD 75 F5      [19] 1714 	ld	-11 (ix), l
   5C7F DD 74 F6      [19] 1715 	ld	-10 (ix), h
   5C82 56            [ 7] 1716 	ld	d, (hl)
   5C83 7A            [ 4] 1717 	ld	a, d
   5C84 B7            [ 4] 1718 	or	a, a
   5C85 CA 81 5E      [10] 1719 	jp	Z, 00123$
                           1720 ;src/gameObject/gameObject.c:293: u8 nextPosx=objeto->posx;
   5C88 DD 6E FE      [19] 1721 	ld	l,-2 (ix)
   5C8B DD 66 FF      [19] 1722 	ld	h,-1 (ix)
   5C8E 7E            [ 7] 1723 	ld	a, (hl)
   5C8F DD 77 F4      [19] 1724 	ld	-12 (ix), a
                           1725 ;src/gameObject/gameObject.c:294: u8 nextPosy=objeto->posy;
   5C92 DD 6E F8      [19] 1726 	ld	l,-8 (ix)
   5C95 DD 66 F9      [19] 1727 	ld	h,-7 (ix)
   5C98 7E            [ 7] 1728 	ld	a, (hl)
   5C99 DD 77 F3      [19] 1729 	ld	-13 (ix), a
                           1730 ;src/gameObject/gameObject.c:295: u8 numMovimientos=0;
   5C9C DD 36 F7 00   [19] 1731 	ld	-9 (ix), #0x00
                           1732 ;src/gameObject/gameObject.c:299: if(objeto->movimiento==mover_1){
   5CA0 7A            [ 4] 1733 	ld	a, d
   5CA1 3D            [ 4] 1734 	dec	a
   5CA2 20 2C         [12] 1735 	jr	NZ,00104$
                           1736 ;src/gameObject/gameObject.c:300: mover1casilla(&nextPosx,&nextPosy,movimiento);
   5CA4 21 00 00      [10] 1737 	ld	hl, #0x0000
   5CA7 39            [11] 1738 	add	hl, sp
   5CA8 DD 75 FC      [19] 1739 	ld	-4 (ix), l
   5CAB DD 74 FD      [19] 1740 	ld	-3 (ix), h
   5CAE FD 21 01 00   [14] 1741 	ld	iy,#0x0001
   5CB2 FD 39         [15] 1742 	add	iy,sp
   5CB4 C5            [11] 1743 	push	bc
   5CB5 D5            [11] 1744 	push	de
   5CB6 7B            [ 4] 1745 	ld	a, e
   5CB7 F5            [11] 1746 	push	af
   5CB8 33            [ 6] 1747 	inc	sp
   5CB9 DD 6E FC      [19] 1748 	ld	l,-4 (ix)
   5CBC DD 66 FD      [19] 1749 	ld	h,-3 (ix)
   5CBF E5            [11] 1750 	push	hl
   5CC0 FD E5         [15] 1751 	push	iy
   5CC2 CD 88 5E      [17] 1752 	call	_mover1casilla
   5CC5 F1            [10] 1753 	pop	af
   5CC6 F1            [10] 1754 	pop	af
   5CC7 33            [ 6] 1755 	inc	sp
   5CC8 D1            [10] 1756 	pop	de
   5CC9 C1            [10] 1757 	pop	bc
                           1758 ;src/gameObject/gameObject.c:301: numMovimientos=1;                 
   5CCA DD 36 F7 01   [19] 1759 	ld	-9 (ix), #0x01
   5CCE 18 44         [12] 1760 	jr	00105$
   5CD0                    1761 00104$:
                           1762 ;src/gameObject/gameObject.c:302: }else if(objeto->movimiento==mover_Linea){
   5CD0 7A            [ 4] 1763 	ld	a, d
   5CD1 D6 02         [ 7] 1764 	sub	a, #0x02
   5CD3 20 3F         [12] 1765 	jr	NZ,00105$
                           1766 ;src/gameObject/gameObject.c:303: numMovimientos=movimientoLineal(objeto,&nextPosx,&nextPosy,movimiento,rocasCol,*posicion);
   5CD5 DD 6E FA      [19] 1767 	ld	l,-6 (ix)
   5CD8 DD 66 FB      [19] 1768 	ld	h,-5 (ix)
   5CDB 56            [ 7] 1769 	ld	d, (hl)
   5CDC 21 00 00      [10] 1770 	ld	hl, #0x0000
   5CDF 39            [11] 1771 	add	hl, sp
   5CE0 DD 75 FC      [19] 1772 	ld	-4 (ix), l
   5CE3 DD 74 FD      [19] 1773 	ld	-3 (ix), h
   5CE6 FD 21 01 00   [14] 1774 	ld	iy,#0x0001
   5CEA FD 39         [15] 1775 	add	iy,sp
   5CEC C5            [11] 1776 	push	bc
   5CED D5            [11] 1777 	push	de
   5CEE D5            [11] 1778 	push	de
   5CEF 33            [ 6] 1779 	inc	sp
   5CF0 DD 6E 07      [19] 1780 	ld	l,7 (ix)
   5CF3 DD 66 08      [19] 1781 	ld	h,8 (ix)
   5CF6 E5            [11] 1782 	push	hl
   5CF7 7B            [ 4] 1783 	ld	a, e
   5CF8 F5            [11] 1784 	push	af
   5CF9 33            [ 6] 1785 	inc	sp
   5CFA DD 6E FC      [19] 1786 	ld	l,-4 (ix)
   5CFD DD 66 FD      [19] 1787 	ld	h,-3 (ix)
   5D00 E5            [11] 1788 	push	hl
   5D01 FD E5         [15] 1789 	push	iy
   5D03 C5            [11] 1790 	push	bc
   5D04 CD CD 5E      [17] 1791 	call	_movimientoLineal
   5D07 FD 21 0A 00   [14] 1792 	ld	iy, #10
   5D0B FD 39         [15] 1793 	add	iy, sp
   5D0D FD F9         [10] 1794 	ld	sp, iy
   5D0F D1            [10] 1795 	pop	de
   5D10 C1            [10] 1796 	pop	bc
   5D11 DD 75 F7      [19] 1797 	ld	-9 (ix), l
   5D14                    1798 00105$:
                           1799 ;src/gameObject/gameObject.c:305: posicionObjeto=colisionesSiguientePosicion(objeto,objeto->posx,objeto->posy,movimiento,rocasCol,posicion);                                      
   5D14 DD 6E F8      [19] 1800 	ld	l,-8 (ix)
   5D17 DD 66 F9      [19] 1801 	ld	h,-7 (ix)
   5D1A 7E            [ 7] 1802 	ld	a, (hl)
   5D1B DD 77 FC      [19] 1803 	ld	-4 (ix), a
   5D1E DD 6E FE      [19] 1804 	ld	l,-2 (ix)
   5D21 DD 66 FF      [19] 1805 	ld	h,-1 (ix)
   5D24 56            [ 7] 1806 	ld	d, (hl)
   5D25 C5            [11] 1807 	push	bc
   5D26 D5            [11] 1808 	push	de
   5D27 DD 6E FA      [19] 1809 	ld	l,-6 (ix)
   5D2A DD 66 FB      [19] 1810 	ld	h,-5 (ix)
   5D2D E5            [11] 1811 	push	hl
   5D2E DD 6E 07      [19] 1812 	ld	l,7 (ix)
   5D31 DD 66 08      [19] 1813 	ld	h,8 (ix)
   5D34 E5            [11] 1814 	push	hl
   5D35 7B            [ 4] 1815 	ld	a, e
   5D36 F5            [11] 1816 	push	af
   5D37 33            [ 6] 1817 	inc	sp
   5D38 DD 7E FC      [19] 1818 	ld	a, -4 (ix)
   5D3B F5            [11] 1819 	push	af
   5D3C 33            [ 6] 1820 	inc	sp
   5D3D D5            [11] 1821 	push	de
   5D3E 33            [ 6] 1822 	inc	sp
   5D3F C5            [11] 1823 	push	bc
   5D40 CD 78 5F      [17] 1824 	call	_colisionesSiguientePosicion
   5D43 FD 21 09 00   [14] 1825 	ld	iy, #9
   5D47 FD 39         [15] 1826 	add	iy, sp
   5D49 FD F9         [10] 1827 	ld	sp, iy
   5D4B D1            [10] 1828 	pop	de
   5D4C C1            [10] 1829 	pop	bc
   5D4D 7D            [ 4] 1830 	ld	a, l
                           1831 ;src/gameObject/gameObject.c:306: if(posicionObjeto==SinColision){
   5D4E FE 32         [ 7] 1832 	cp	a, #0x32
   5D50 C2 5E 5E      [10] 1833 	jp	NZ,00120$
                           1834 ;src/gameObject/gameObject.c:307: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);             
   5D53 C5            [11] 1835 	push	bc
   5D54 D5            [11] 1836 	push	de
   5D55 DD 6E 0B      [19] 1837 	ld	l,11 (ix)
   5D58 DD 66 0C      [19] 1838 	ld	h,12 (ix)
   5D5B E5            [11] 1839 	push	hl
   5D5C DD 6E 07      [19] 1840 	ld	l,7 (ix)
   5D5F DD 66 08      [19] 1841 	ld	h,8 (ix)
   5D62 E5            [11] 1842 	push	hl
   5D63 53            [ 4] 1843 	ld	d, e
   5D64 DD 5E F3      [19] 1844 	ld	e, -13 (ix)
   5D67 D5            [11] 1845 	push	de
   5D68 DD 7E F4      [19] 1846 	ld	a, -12 (ix)
   5D6B F5            [11] 1847 	push	af
   5D6C 33            [ 6] 1848 	inc	sp
   5D6D DD 6E 04      [19] 1849 	ld	l,4 (ix)
   5D70 DD 66 05      [19] 1850 	ld	h,5 (ix)
   5D73 E5            [11] 1851 	push	hl
   5D74 CD 78 5F      [17] 1852 	call	_colisionesSiguientePosicion
   5D77 21 09 00      [10] 1853 	ld	hl, #9
   5D7A 39            [11] 1854 	add	hl, sp
   5D7B F9            [ 6] 1855 	ld	sp, hl
   5D7C DD 66 F3      [19] 1856 	ld	h, -13 (ix)
   5D7F DD 6E F4      [19] 1857 	ld	l, -12 (ix)
   5D82 E5            [11] 1858 	push	hl
   5D83 DD 6E 04      [19] 1859 	ld	l,4 (ix)
   5D86 DD 66 05      [19] 1860 	ld	h,5 (ix)
   5D89 E5            [11] 1861 	push	hl
   5D8A CD 6A 59      [17] 1862 	call	_moverYdibujar
   5D8D F1            [10] 1863 	pop	af
   5D8E F1            [10] 1864 	pop	af
   5D8F D1            [10] 1865 	pop	de
   5D90 C1            [10] 1866 	pop	bc
                           1867 ;src/gameObject/gameObject.c:309: moverElEspejo(objeto->num,movimiento,rocasEspejo,*posicion,numMovimientos);
   5D91 DD 6E FA      [19] 1868 	ld	l,-6 (ix)
   5D94 DD 66 FB      [19] 1869 	ld	h,-5 (ix)
   5D97 56            [ 7] 1870 	ld	d, (hl)
   5D98 0A            [ 7] 1871 	ld	a, (bc)
   5D99 DD 77 FC      [19] 1872 	ld	-4 (ix), a
   5D9C C5            [11] 1873 	push	bc
   5D9D D5            [11] 1874 	push	de
   5D9E DD 7E F7      [19] 1875 	ld	a, -9 (ix)
   5DA1 F5            [11] 1876 	push	af
   5DA2 33            [ 6] 1877 	inc	sp
   5DA3 D5            [11] 1878 	push	de
   5DA4 33            [ 6] 1879 	inc	sp
   5DA5 DD 6E 09      [19] 1880 	ld	l,9 (ix)
   5DA8 DD 66 0A      [19] 1881 	ld	h,10 (ix)
   5DAB E5            [11] 1882 	push	hl
   5DAC 53            [ 4] 1883 	ld	d, e
   5DAD DD 5E FC      [19] 1884 	ld	e, -4 (ix)
   5DB0 D5            [11] 1885 	push	de
   5DB1 CD E2 57      [17] 1886 	call	_moverElEspejo
   5DB4 21 06 00      [10] 1887 	ld	hl, #6
   5DB7 39            [11] 1888 	add	hl, sp
   5DB8 F9            [ 6] 1889 	ld	sp, hl
   5DB9 D1            [10] 1890 	pop	de
   5DBA C1            [10] 1891 	pop	bc
                           1892 ;src/gameObject/gameObject.c:310: if(objeto->movimiento==mover_1){
   5DBB DD 6E F5      [19] 1893 	ld	l,-11 (ix)
   5DBE DD 66 F6      [19] 1894 	ld	h,-10 (ix)
   5DC1 7E            [ 7] 1895 	ld	a, (hl)
   5DC2 FE 01         [ 7] 1896 	cp	a, #0x01
   5DC4 20 4B         [12] 1897 	jr	NZ,00115$
                           1898 ;src/gameObject/gameObject.c:311: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,mover_SinMovimiento,rocasCol,posicion);
   5DC6 C5            [11] 1899 	push	bc
   5DC7 DD 6E FA      [19] 1900 	ld	l,-6 (ix)
   5DCA DD 66 FB      [19] 1901 	ld	h,-5 (ix)
   5DCD E5            [11] 1902 	push	hl
   5DCE DD 6E 07      [19] 1903 	ld	l,7 (ix)
   5DD1 DD 66 08      [19] 1904 	ld	h,8 (ix)
   5DD4 E5            [11] 1905 	push	hl
   5DD5 AF            [ 4] 1906 	xor	a, a
   5DD6 F5            [11] 1907 	push	af
   5DD7 33            [ 6] 1908 	inc	sp
   5DD8 DD 66 F3      [19] 1909 	ld	h, -13 (ix)
   5DDB DD 6E F4      [19] 1910 	ld	l, -12 (ix)
   5DDE E5            [11] 1911 	push	hl
   5DDF C5            [11] 1912 	push	bc
   5DE0 CD 78 5F      [17] 1913 	call	_colisionesSiguientePosicion
   5DE3 FD 21 09 00   [14] 1914 	ld	iy, #9
   5DE7 FD 39         [15] 1915 	add	iy, sp
   5DE9 FD F9         [10] 1916 	ld	sp, iy
   5DEB C1            [10] 1917 	pop	bc
   5DEC 7D            [ 4] 1918 	ld	a, l
                           1919 ;src/gameObject/gameObject.c:312: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
   5DED FE 32         [ 7] 1920 	cp	a, #0x32
   5DEF CA 81 5E      [10] 1921 	jp	Z,00123$
   5DF2 FE 33         [ 7] 1922 	cp	a, #0x33
   5DF4 CA 81 5E      [10] 1923 	jp	Z,00123$
                           1924 ;src/gameObject/gameObject.c:313: taparHole(objeto,&rocasCol[posicionObjeto]);
   5DF7 5F            [ 4] 1925 	ld	e,a
   5DF8 16 00         [ 7] 1926 	ld	d,#0x00
   5DFA 6B            [ 4] 1927 	ld	l, e
   5DFB 62            [ 4] 1928 	ld	h, d
   5DFC 29            [11] 1929 	add	hl, hl
   5DFD 19            [11] 1930 	add	hl, de
   5DFE 29            [11] 1931 	add	hl, hl
   5DFF 19            [11] 1932 	add	hl, de
   5E00 EB            [ 4] 1933 	ex	de,hl
   5E01 DD 6E 07      [19] 1934 	ld	l,7 (ix)
   5E04 DD 66 08      [19] 1935 	ld	h,8 (ix)
   5E07 19            [11] 1936 	add	hl, de
   5E08 E5            [11] 1937 	push	hl
   5E09 C5            [11] 1938 	push	bc
   5E0A CD A5 59      [17] 1939 	call	_taparHole
   5E0D F1            [10] 1940 	pop	af
   5E0E F1            [10] 1941 	pop	af
   5E0F 18 70         [12] 1942 	jr	00123$
   5E11                    1943 00115$:
                           1944 ;src/gameObject/gameObject.c:315: }else if(objeto->movimiento==mover_Linea){
   5E11 D6 02         [ 7] 1945 	sub	a, #0x02
   5E13 20 6C         [12] 1946 	jr	NZ,00123$
                           1947 ;src/gameObject/gameObject.c:316: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);
   5E15 C5            [11] 1948 	push	bc
   5E16 DD 6E FA      [19] 1949 	ld	l,-6 (ix)
   5E19 DD 66 FB      [19] 1950 	ld	h,-5 (ix)
   5E1C E5            [11] 1951 	push	hl
   5E1D DD 6E 07      [19] 1952 	ld	l,7 (ix)
   5E20 DD 66 08      [19] 1953 	ld	h,8 (ix)
   5E23 E5            [11] 1954 	push	hl
   5E24 53            [ 4] 1955 	ld	d, e
   5E25 DD 5E F3      [19] 1956 	ld	e, -13 (ix)
   5E28 D5            [11] 1957 	push	de
   5E29 DD 7E F4      [19] 1958 	ld	a, -12 (ix)
   5E2C F5            [11] 1959 	push	af
   5E2D 33            [ 6] 1960 	inc	sp
   5E2E C5            [11] 1961 	push	bc
   5E2F CD 78 5F      [17] 1962 	call	_colisionesSiguientePosicion
   5E32 FD 21 09 00   [14] 1963 	ld	iy, #9
   5E36 FD 39         [15] 1964 	add	iy, sp
   5E38 FD F9         [10] 1965 	ld	sp, iy
   5E3A C1            [10] 1966 	pop	bc
   5E3B 7D            [ 4] 1967 	ld	a, l
                           1968 ;src/gameObject/gameObject.c:317: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
   5E3C FE 32         [ 7] 1969 	cp	a, #0x32
   5E3E 28 41         [12] 1970 	jr	Z,00123$
   5E40 FE 33         [ 7] 1971 	cp	a, #0x33
   5E42 28 3D         [12] 1972 	jr	Z,00123$
                           1973 ;src/gameObject/gameObject.c:318: taparHole(objeto,&rocasCol[posicionObjeto]);
   5E44 5F            [ 4] 1974 	ld	e,a
   5E45 16 00         [ 7] 1975 	ld	d,#0x00
   5E47 6B            [ 4] 1976 	ld	l, e
   5E48 62            [ 4] 1977 	ld	h, d
   5E49 29            [11] 1978 	add	hl, hl
   5E4A 19            [11] 1979 	add	hl, de
   5E4B 29            [11] 1980 	add	hl, hl
   5E4C 19            [11] 1981 	add	hl, de
   5E4D EB            [ 4] 1982 	ex	de,hl
   5E4E DD 6E 07      [19] 1983 	ld	l,7 (ix)
   5E51 DD 66 08      [19] 1984 	ld	h,8 (ix)
   5E54 19            [11] 1985 	add	hl, de
   5E55 E5            [11] 1986 	push	hl
   5E56 C5            [11] 1987 	push	bc
   5E57 CD A5 59      [17] 1988 	call	_taparHole
   5E5A F1            [10] 1989 	pop	af
   5E5B F1            [10] 1990 	pop	af
   5E5C 18 23         [12] 1991 	jr	00123$
   5E5E                    1992 00120$:
                           1993 ;src/gameObject/gameObject.c:322: if(posicionObjeto!=ColisionNoRocas){
   5E5E FE 33         [ 7] 1994 	cp	a, #0x33
   5E60 28 1F         [12] 1995 	jr	Z,00123$
                           1996 ;src/gameObject/gameObject.c:323: taparHole(objeto,&rocasCol[posicionObjeto]);
   5E62 4F            [ 4] 1997 	ld	c,a
   5E63 06 00         [ 7] 1998 	ld	b,#0x00
   5E65 69            [ 4] 1999 	ld	l, c
   5E66 60            [ 4] 2000 	ld	h, b
   5E67 29            [11] 2001 	add	hl, hl
   5E68 09            [11] 2002 	add	hl, bc
   5E69 29            [11] 2003 	add	hl, hl
   5E6A 09            [11] 2004 	add	hl, bc
   5E6B 4D            [ 4] 2005 	ld	c, l
   5E6C 44            [ 4] 2006 	ld	b, h
   5E6D DD 6E 07      [19] 2007 	ld	l,7 (ix)
   5E70 DD 66 08      [19] 2008 	ld	h,8 (ix)
   5E73 09            [11] 2009 	add	hl, bc
   5E74 E5            [11] 2010 	push	hl
   5E75 DD 6E 04      [19] 2011 	ld	l,4 (ix)
   5E78 DD 66 05      [19] 2012 	ld	h,5 (ix)
   5E7B E5            [11] 2013 	push	hl
   5E7C CD A5 59      [17] 2014 	call	_taparHole
   5E7F F1            [10] 2015 	pop	af
   5E80 F1            [10] 2016 	pop	af
   5E81                    2017 00123$:
                           2018 ;src/gameObject/gameObject.c:329: return seguir_En_Nivel;
   5E81 2E 00         [ 7] 2019 	ld	l, #0x00
   5E83 DD F9         [10] 2020 	ld	sp, ix
   5E85 DD E1         [14] 2021 	pop	ix
   5E87 C9            [10] 2022 	ret
                           2023 ;src/gameObject/gameObject.c:337: void mover1casilla(u8* posx, u8* posy,u8 movimiento){
                           2024 ;	---------------------------------
                           2025 ; Function mover1casilla
                           2026 ; ---------------------------------
   5E88                    2027 _mover1casilla::
   5E88 DD E5         [15] 2028 	push	ix
   5E8A DD 21 00 00   [14] 2029 	ld	ix,#0
   5E8E DD 39         [15] 2030 	add	ix,sp
                           2031 ;src/gameObject/gameObject.c:339: *posx-=1;
   5E90 DD 4E 04      [19] 2032 	ld	c,4 (ix)
   5E93 DD 46 05      [19] 2033 	ld	b,5 (ix)
                           2034 ;src/gameObject/gameObject.c:338: if(movimiento==mover_Izquierda){
   5E96 DD 7E 08      [19] 2035 	ld	a, 8 (ix)
   5E99 3D            [ 4] 2036 	dec	a
   5E9A 20 06         [12] 2037 	jr	NZ,00110$
                           2038 ;src/gameObject/gameObject.c:339: *posx-=1;
   5E9C 0A            [ 7] 2039 	ld	a, (bc)
   5E9D C6 FF         [ 7] 2040 	add	a, #0xff
   5E9F 02            [ 7] 2041 	ld	(bc), a
   5EA0 18 28         [12] 2042 	jr	00112$
   5EA2                    2043 00110$:
                           2044 ;src/gameObject/gameObject.c:341: *posy-=1;
   5EA2 DD 6E 06      [19] 2045 	ld	l,6 (ix)
   5EA5 DD 66 07      [19] 2046 	ld	h,7 (ix)
                           2047 ;src/gameObject/gameObject.c:340: }else if(movimiento==mover_Arriba){
   5EA8 DD 7E 08      [19] 2048 	ld	a, 8 (ix)
   5EAB D6 02         [ 7] 2049 	sub	a, #0x02
   5EAD 20 05         [12] 2050 	jr	NZ,00107$
                           2051 ;src/gameObject/gameObject.c:341: *posy-=1;
   5EAF 4E            [ 7] 2052 	ld	c, (hl)
   5EB0 0D            [ 4] 2053 	dec	c
   5EB1 71            [ 7] 2054 	ld	(hl), c
   5EB2 18 16         [12] 2055 	jr	00112$
   5EB4                    2056 00107$:
                           2057 ;src/gameObject/gameObject.c:342: }else if(movimiento==mover_Derecha){
   5EB4 DD 7E 08      [19] 2058 	ld	a, 8 (ix)
   5EB7 D6 03         [ 7] 2059 	sub	a, #0x03
   5EB9 20 05         [12] 2060 	jr	NZ,00104$
                           2061 ;src/gameObject/gameObject.c:343: *posx+=1;
   5EBB 0A            [ 7] 2062 	ld	a, (bc)
   5EBC 3C            [ 4] 2063 	inc	a
   5EBD 02            [ 7] 2064 	ld	(bc), a
   5EBE 18 0A         [12] 2065 	jr	00112$
   5EC0                    2066 00104$:
                           2067 ;src/gameObject/gameObject.c:344: }else if(movimiento==mover_Abajo){
   5EC0 DD 7E 08      [19] 2068 	ld	a, 8 (ix)
   5EC3 D6 04         [ 7] 2069 	sub	a, #0x04
   5EC5 20 03         [12] 2070 	jr	NZ,00112$
                           2071 ;src/gameObject/gameObject.c:345: *posy+=1;
   5EC7 4E            [ 7] 2072 	ld	c, (hl)
   5EC8 0C            [ 4] 2073 	inc	c
   5EC9 71            [ 7] 2074 	ld	(hl), c
   5ECA                    2075 00112$:
   5ECA DD E1         [14] 2076 	pop	ix
   5ECC C9            [10] 2077 	ret
                           2078 ;src/gameObject/gameObject.c:349: u8 movimientoLineal(TGameObject* objeto,u8* posx, u8* posy,u8 movimiento,TGameObject* objetosCol,u8 posicion){    
                           2079 ;	---------------------------------
                           2080 ; Function movimientoLineal
                           2081 ; ---------------------------------
   5ECD                    2082 _movimientoLineal::
   5ECD DD E5         [15] 2083 	push	ix
   5ECF DD 21 00 00   [14] 2084 	ld	ix,#0
   5ED3 DD 39         [15] 2085 	add	ix,sp
   5ED5 F5            [11] 2086 	push	af
   5ED6 F5            [11] 2087 	push	af
   5ED7 3B            [ 6] 2088 	dec	sp
                           2089 ;src/gameObject/gameObject.c:352: while (colisionesSiguientePosicion(objeto,*posx,*posy,movimiento,objetosCol,posicion)==SinColision && movimiento!=mover_SinMovimiento)
   5ED8 DD 7E 08      [19] 2090 	ld	a, 8 (ix)
   5EDB DD 77 FE      [19] 2091 	ld	-2 (ix), a
   5EDE DD 7E 09      [19] 2092 	ld	a, 9 (ix)
   5EE1 DD 77 FF      [19] 2093 	ld	-1 (ix), a
   5EE4 DD 4E 06      [19] 2094 	ld	c,6 (ix)
   5EE7 DD 46 07      [19] 2095 	ld	b,7 (ix)
   5EEA DD 36 FB 00   [19] 2096 	ld	-5 (ix), #0x00
   5EEE                    2097 00102$:
   5EEE DD 7E 0D      [19] 2098 	ld	a, 13 (ix)
   5EF1 DD 77 FC      [19] 2099 	ld	-4 (ix), a
   5EF4 DD 36 FD 00   [19] 2100 	ld	-3 (ix), #0x00
   5EF8 DD 6E FE      [19] 2101 	ld	l,-2 (ix)
   5EFB DD 66 FF      [19] 2102 	ld	h,-1 (ix)
   5EFE 5E            [ 7] 2103 	ld	e, (hl)
   5EFF 0A            [ 7] 2104 	ld	a, (bc)
   5F00 57            [ 4] 2105 	ld	d, a
   5F01 C5            [11] 2106 	push	bc
   5F02 DD 6E FC      [19] 2107 	ld	l,-4 (ix)
   5F05 DD 66 FD      [19] 2108 	ld	h,-3 (ix)
   5F08 E5            [11] 2109 	push	hl
   5F09 DD 6E 0B      [19] 2110 	ld	l,11 (ix)
   5F0C DD 66 0C      [19] 2111 	ld	h,12 (ix)
   5F0F E5            [11] 2112 	push	hl
   5F10 DD 7E 0A      [19] 2113 	ld	a, 10 (ix)
   5F13 F5            [11] 2114 	push	af
   5F14 33            [ 6] 2115 	inc	sp
   5F15 7B            [ 4] 2116 	ld	a, e
   5F16 F5            [11] 2117 	push	af
   5F17 33            [ 6] 2118 	inc	sp
   5F18 D5            [11] 2119 	push	de
   5F19 33            [ 6] 2120 	inc	sp
   5F1A DD 6E 04      [19] 2121 	ld	l,4 (ix)
   5F1D DD 66 05      [19] 2122 	ld	h,5 (ix)
   5F20 E5            [11] 2123 	push	hl
   5F21 CD 78 5F      [17] 2124 	call	_colisionesSiguientePosicion
   5F24 FD 21 09 00   [14] 2125 	ld	iy, #9
   5F28 FD 39         [15] 2126 	add	iy, sp
   5F2A FD F9         [10] 2127 	ld	sp, iy
   5F2C C1            [10] 2128 	pop	bc
   5F2D 7D            [ 4] 2129 	ld	a, l
   5F2E D6 32         [ 7] 2130 	sub	a, #0x32
   5F30 20 3E         [12] 2131 	jr	NZ,00104$
   5F32 DD 7E 0A      [19] 2132 	ld	a, 10 (ix)
   5F35 B7            [ 4] 2133 	or	a, a
   5F36 28 38         [12] 2134 	jr	Z,00104$
                           2135 ;src/gameObject/gameObject.c:354: movimiento=calcularMaximosyMinimos(movimiento,*posx,*posy,posicion);       
   5F38 DD 6E FE      [19] 2136 	ld	l,-2 (ix)
   5F3B DD 66 FF      [19] 2137 	ld	h,-1 (ix)
   5F3E 56            [ 7] 2138 	ld	d, (hl)
   5F3F 0A            [ 7] 2139 	ld	a, (bc)
   5F40 5F            [ 4] 2140 	ld	e, a
   5F41 C5            [11] 2141 	push	bc
   5F42 DD 7E 0D      [19] 2142 	ld	a, 13 (ix)
   5F45 F5            [11] 2143 	push	af
   5F46 33            [ 6] 2144 	inc	sp
   5F47 D5            [11] 2145 	push	de
   5F48 33            [ 6] 2146 	inc	sp
   5F49 53            [ 4] 2147 	ld	d, e
   5F4A DD 5E 0A      [19] 2148 	ld	e, 10 (ix)
   5F4D D5            [11] 2149 	push	de
   5F4E CD 1F 72      [17] 2150 	call	_calcularMaximosyMinimos
   5F51 F1            [10] 2151 	pop	af
   5F52 F1            [10] 2152 	pop	af
   5F53 55            [ 4] 2153 	ld	d, l
   5F54 C1            [10] 2154 	pop	bc
   5F55 DD 72 0A      [19] 2155 	ld	10 (ix), d
                           2156 ;src/gameObject/gameObject.c:355: mover1casilla(posx,posy,movimiento);
   5F58 C5            [11] 2157 	push	bc
   5F59 D5            [11] 2158 	push	de
   5F5A 33            [ 6] 2159 	inc	sp
   5F5B DD 6E FE      [19] 2160 	ld	l,-2 (ix)
   5F5E DD 66 FF      [19] 2161 	ld	h,-1 (ix)
   5F61 E5            [11] 2162 	push	hl
   5F62 C5            [11] 2163 	push	bc
   5F63 CD 88 5E      [17] 2164 	call	_mover1casilla
   5F66 F1            [10] 2165 	pop	af
   5F67 F1            [10] 2166 	pop	af
   5F68 33            [ 6] 2167 	inc	sp
   5F69 C1            [10] 2168 	pop	bc
                           2169 ;src/gameObject/gameObject.c:356: contador++;                    
   5F6A DD 34 FB      [23] 2170 	inc	-5 (ix)
   5F6D C3 EE 5E      [10] 2171 	jp	00102$
   5F70                    2172 00104$:
                           2173 ;src/gameObject/gameObject.c:360: return contador;             
   5F70 DD 6E FB      [19] 2174 	ld	l, -5 (ix)
   5F73 DD F9         [10] 2175 	ld	sp, ix
   5F75 DD E1         [14] 2176 	pop	ix
   5F77 C9            [10] 2177 	ret
                           2178 ;src/gameObject/gameObject.c:368: u8 colisionesSiguientePosicion(TGameObject* objeto,u8 posx,u8 posy,u8 movimiento, TGameObject* rocasCol,u8* posicion){
                           2179 ;	---------------------------------
                           2180 ; Function colisionesSiguientePosicion
                           2181 ; ---------------------------------
   5F78                    2182 _colisionesSiguientePosicion::
   5F78 DD E5         [15] 2183 	push	ix
   5F7A DD 21 00 00   [14] 2184 	ld	ix,#0
   5F7E DD 39         [15] 2185 	add	ix,sp
   5F80 21 F9 FF      [10] 2186 	ld	hl, #-7
   5F83 39            [11] 2187 	add	hl, sp
   5F84 F9            [ 6] 2188 	ld	sp, hl
                           2189 ;src/gameObject/gameObject.c:369: u8 nextPosx=posx;
   5F85 DD 7E 06      [19] 2190 	ld	a, 6 (ix)
   5F88 DD 77 FA      [19] 2191 	ld	-6 (ix), a
                           2192 ;src/gameObject/gameObject.c:370: u8 nextPosy=posy;
   5F8B DD 7E 07      [19] 2193 	ld	a, 7 (ix)
   5F8E DD 77 F9      [19] 2194 	ld	-7 (ix), a
                           2195 ;src/gameObject/gameObject.c:375: mover1casilla(&nextPosx,&nextPosy,movimiento);
   5F91 21 00 00      [10] 2196 	ld	hl, #0x0000
   5F94 39            [11] 2197 	add	hl, sp
   5F95 DD 75 FB      [19] 2198 	ld	-5 (ix), l
   5F98 DD 74 FC      [19] 2199 	ld	-4 (ix), h
   5F9B C1            [10] 2200 	pop	bc
   5F9C D1            [10] 2201 	pop	de
   5F9D D5            [11] 2202 	push	de
   5F9E C5            [11] 2203 	push	bc
   5F9F 21 01 00      [10] 2204 	ld	hl, #0x0001
   5FA2 39            [11] 2205 	add	hl, sp
   5FA3 DD 75 FE      [19] 2206 	ld	-2 (ix), l
   5FA6 DD 74 FF      [19] 2207 	ld	-1 (ix), h
   5FA9 4D            [ 4] 2208 	ld	c, l
   5FAA 44            [ 4] 2209 	ld	b, h
   5FAB DD 7E 08      [19] 2210 	ld	a, 8 (ix)
   5FAE F5            [11] 2211 	push	af
   5FAF 33            [ 6] 2212 	inc	sp
   5FB0 D5            [11] 2213 	push	de
   5FB1 C5            [11] 2214 	push	bc
   5FB2 CD 88 5E      [17] 2215 	call	_mover1casilla
   5FB5 F1            [10] 2216 	pop	af
   5FB6 F1            [10] 2217 	pop	af
   5FB7 33            [ 6] 2218 	inc	sp
                           2219 ;src/gameObject/gameObject.c:376: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);
   5FB8 DD 6E 09      [19] 2220 	ld	l,9 (ix)
   5FBB DD 66 0A      [19] 2221 	ld	h,10 (ix)
   5FBE E5            [11] 2222 	push	hl
   5FBF DD 66 F9      [19] 2223 	ld	h, -7 (ix)
   5FC2 DD 6E FA      [19] 2224 	ld	l, -6 (ix)
   5FC5 E5            [11] 2225 	push	hl
   5FC6 CD 34 60      [17] 2226 	call	_comprobarRocas
   5FC9 F1            [10] 2227 	pop	af
   5FCA F1            [10] 2228 	pop	af
                           2229 ;src/gameObject/gameObject.c:377: if(ObjetoColisionado!=SinColision){
   5FCB 7D            [ 4] 2230 	ld	a, l
   5FCC D6 32         [ 7] 2231 	sub	a, #0x32
   5FCE 20 04         [12] 2232 	jr	NZ,00125$
   5FD0 3E 01         [ 7] 2233 	ld	a,#0x01
   5FD2 18 01         [12] 2234 	jr	00126$
   5FD4                    2235 00125$:
   5FD4 AF            [ 4] 2236 	xor	a,a
   5FD5                    2237 00126$:
   5FD5 DD 77 FD      [19] 2238 	ld	-3 (ix), a
   5FD8 DD CB FD 46   [20] 2239 	bit	0, -3 (ix)
                           2240 ;src/gameObject/gameObject.c:378: return ObjetoColisionado;
   5FDC 28 51         [12] 2241 	jr	Z,00107$
                           2242 ;src/gameObject/gameObject.c:380: colisionPuerta=comprobarPuertas(nextPosx,nextPosy);                      
   5FDE DD 66 F9      [19] 2243 	ld	h, -7 (ix)
   5FE1 DD 6E FA      [19] 2244 	ld	l, -6 (ix)
   5FE4 E5            [11] 2245 	push	hl
   5FE5 CD 8B 61      [17] 2246 	call	_comprobarPuertas
   5FE8 F1            [10] 2247 	pop	af
   5FE9 4D            [ 4] 2248 	ld	c, l
                           2249 ;src/gameObject/gameObject.c:381: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);                 
   5FEA DD 5E FB      [19] 2250 	ld	e,-5 (ix)
   5FED DD 56 FC      [19] 2251 	ld	d,-4 (ix)
   5FF0 DD 6E FE      [19] 2252 	ld	l,-2 (ix)
   5FF3 DD 66 FF      [19] 2253 	ld	h,-1 (ix)
   5FF6 E5            [11] 2254 	push	hl
   5FF7 FD E1         [14] 2255 	pop	iy
   5FF9 C5            [11] 2256 	push	bc
   5FFA DD 6E 0B      [19] 2257 	ld	l,11 (ix)
   5FFD DD 66 0C      [19] 2258 	ld	h,12 (ix)
   6000 E5            [11] 2259 	push	hl
   6001 DD 7E 08      [19] 2260 	ld	a, 8 (ix)
   6004 F5            [11] 2261 	push	af
   6005 33            [ 6] 2262 	inc	sp
   6006 D5            [11] 2263 	push	de
   6007 FD E5         [15] 2264 	push	iy
   6009 DD 6E 04      [19] 2265 	ld	l,4 (ix)
   600C DD 66 05      [19] 2266 	ld	h,5 (ix)
   600F E5            [11] 2267 	push	hl
   6010 CD 7E 60      [17] 2268 	call	_comprobarPortales
   6013 FD 21 09 00   [14] 2269 	ld	iy, #9
   6017 FD 39         [15] 2270 	add	iy, sp
   6019 FD F9         [10] 2271 	ld	sp, iy
   601B C1            [10] 2272 	pop	bc
                           2273 ;src/gameObject/gameObject.c:385: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision && colisionPortales==no_Hay_Colision){        
   601C DD CB FD 46   [20] 2274 	bit	0, -3 (ix)
   6020 28 0B         [12] 2275 	jr	Z,00104$
   6022 79            [ 4] 2276 	ld	a, c
   6023 B7            [ 4] 2277 	or	a,a
   6024 20 07         [12] 2278 	jr	NZ,00104$
   6026 B5            [ 4] 2279 	or	a,l
   6027 20 04         [12] 2280 	jr	NZ,00104$
                           2281 ;src/gameObject/gameObject.c:386: return SinColision;
   6029 2E 32         [ 7] 2282 	ld	l, #0x32
   602B 18 02         [12] 2283 	jr	00107$
   602D                    2284 00104$:
                           2285 ;src/gameObject/gameObject.c:388: return ColisionNoRocas;
   602D 2E 33         [ 7] 2286 	ld	l, #0x33
   602F                    2287 00107$:
   602F DD F9         [10] 2288 	ld	sp, ix
   6031 DD E1         [14] 2289 	pop	ix
   6033 C9            [10] 2290 	ret
                           2291 ;src/gameObject/gameObject.c:391: u8 comprobarRocas(u8 posx,u8 posy,TGameObject* rocas){
                           2292 ;	---------------------------------
                           2293 ; Function comprobarRocas
                           2294 ; ---------------------------------
   6034                    2295 _comprobarRocas::
   6034 DD E5         [15] 2296 	push	ix
   6036 DD 21 00 00   [14] 2297 	ld	ix,#0
   603A DD 39         [15] 2298 	add	ix,sp
                           2299 ;src/gameObject/gameObject.c:392: u8 colision=SinColision;   
                           2300 ;src/gameObject/gameObject.c:393: for(u8 i=0;i<RocasMaximas;i++){
   603C 01 32 00      [10] 2301 	ld	bc,#0x0032
   603F                    2302 00107$:
   603F 78            [ 4] 2303 	ld	a, b
   6040 D6 28         [ 7] 2304 	sub	a, #0x28
   6042 30 36         [12] 2305 	jr	NC,00105$
                           2306 ;src/gameObject/gameObject.c:394: if(rocas[i].posx!=0){
   6044 58            [ 4] 2307 	ld	e,b
   6045 16 00         [ 7] 2308 	ld	d,#0x00
   6047 6B            [ 4] 2309 	ld	l, e
   6048 62            [ 4] 2310 	ld	h, d
   6049 29            [11] 2311 	add	hl, hl
   604A 19            [11] 2312 	add	hl, de
   604B 29            [11] 2313 	add	hl, hl
   604C 19            [11] 2314 	add	hl, de
   604D EB            [ 4] 2315 	ex	de,hl
   604E DD 7E 06      [19] 2316 	ld	a, 6 (ix)
   6051 83            [ 4] 2317 	add	a, e
   6052 5F            [ 4] 2318 	ld	e, a
   6053 DD 7E 07      [19] 2319 	ld	a, 7 (ix)
   6056 8A            [ 4] 2320 	adc	a, d
   6057 57            [ 4] 2321 	ld	d, a
   6058 6B            [ 4] 2322 	ld	l, e
   6059 62            [ 4] 2323 	ld	h, d
   605A 23            [ 6] 2324 	inc	hl
   605B 7E            [ 7] 2325 	ld	a, (hl)
   605C B7            [ 4] 2326 	or	a, a
   605D 28 18         [12] 2327 	jr	Z,00108$
                           2328 ;src/gameObject/gameObject.c:395: if(comprobarColisiones1vs1(posx,posy,rocas[i].posx,rocas[i].posy)==hay_Colision){                          
   605F EB            [ 4] 2329 	ex	de,hl
   6060 23            [ 6] 2330 	inc	hl
   6061 23            [ 6] 2331 	inc	hl
   6062 56            [ 7] 2332 	ld	d, (hl)
   6063 C5            [11] 2333 	push	bc
   6064 5F            [ 4] 2334 	ld	e, a
   6065 D5            [11] 2335 	push	de
   6066 DD 66 05      [19] 2336 	ld	h, 5 (ix)
   6069 DD 6E 04      [19] 2337 	ld	l, 4 (ix)
   606C E5            [11] 2338 	push	hl
   606D CD B8 72      [17] 2339 	call	_comprobarColisiones1vs1
   6070 F1            [10] 2340 	pop	af
   6071 F1            [10] 2341 	pop	af
   6072 C1            [10] 2342 	pop	bc
   6073 2D            [ 4] 2343 	dec	l
   6074 20 01         [12] 2344 	jr	NZ,00108$
                           2345 ;src/gameObject/gameObject.c:396: colision=i;
   6076 48            [ 4] 2346 	ld	c, b
   6077                    2347 00108$:
                           2348 ;src/gameObject/gameObject.c:393: for(u8 i=0;i<RocasMaximas;i++){
   6077 04            [ 4] 2349 	inc	b
   6078 18 C5         [12] 2350 	jr	00107$
   607A                    2351 00105$:
                           2352 ;src/gameObject/gameObject.c:400: return colision;
   607A 69            [ 4] 2353 	ld	l, c
   607B DD E1         [14] 2354 	pop	ix
   607D C9            [10] 2355 	ret
                           2356 ;src/gameObject/gameObject.c:403: u8 comprobarPortales(TGameObject* objeto,u8* posx,u8* posy,u8 movimiento,u8* posicion){    
                           2357 ;	---------------------------------
                           2358 ; Function comprobarPortales
                           2359 ; ---------------------------------
   607E                    2360 _comprobarPortales::
   607E DD E5         [15] 2361 	push	ix
   6080 DD 21 00 00   [14] 2362 	ld	ix,#0
   6084 DD 39         [15] 2363 	add	ix,sp
   6086 21 F5 FF      [10] 2364 	ld	hl, #-11
   6089 39            [11] 2365 	add	hl, sp
   608A F9            [ 6] 2366 	ld	sp, hl
                           2367 ;src/gameObject/gameObject.c:404: if(*posx==P_portal[0].posx ){
   608B DD 4E 06      [19] 2368 	ld	c,6 (ix)
   608E DD 46 07      [19] 2369 	ld	b,7 (ix)
   6091 0A            [ 7] 2370 	ld	a, (bc)
   6092 DD 77 FE      [19] 2371 	ld	-2 (ix), a
   6095 2A FB 76      [16] 2372 	ld	hl, (_P_portal)
   6098 DD 75 F9      [19] 2373 	ld	-7 (ix), l
   609B DD 74 FA      [19] 2374 	ld	-6 (ix), h
   609E 23            [ 6] 2375 	inc	hl
   609F 7E            [ 7] 2376 	ld	a, (hl)
   60A0 DD 77 FF      [19] 2377 	ld	-1 (ix), a
                           2378 ;src/gameObject/gameObject.c:405: if(*posy==P_portal[0].posy ){
   60A3 DD 5E 08      [19] 2379 	ld	e,8 (ix)
   60A6 DD 56 09      [19] 2380 	ld	d,9 (ix)
                           2381 ;src/gameObject/gameObject.c:406: if(objeto->sprite==sprite_Player){                
   60A9 DD 7E 04      [19] 2382 	ld	a, 4 (ix)
   60AC DD 77 FB      [19] 2383 	ld	-5 (ix), a
   60AF DD 7E 05      [19] 2384 	ld	a, 5 (ix)
   60B2 DD 77 FC      [19] 2385 	ld	-4 (ix), a
                           2386 ;src/gameObject/gameObject.c:407: *posx=P_portal[1].posx;
   60B5 FD 21 FB 76   [14] 2387 	ld	iy, #_P_portal
   60B9 FD 7E 00      [19] 2388 	ld	a, 0 (iy)
   60BC C6 07         [ 7] 2389 	add	a, #0x07
   60BE DD 77 F7      [19] 2390 	ld	-9 (ix), a
   60C1 FD 7E 01      [19] 2391 	ld	a, 1 (iy)
   60C4 CE 00         [ 7] 2392 	adc	a, #0x00
   60C6 DD 77 F8      [19] 2393 	ld	-8 (ix), a
                           2394 ;src/gameObject/gameObject.c:406: if(objeto->sprite==sprite_Player){                
   60C9 DD 7E FB      [19] 2395 	ld	a, -5 (ix)
   60CC C6 03         [ 7] 2396 	add	a, #0x03
   60CE DD 77 FB      [19] 2397 	ld	-5 (ix), a
   60D1 DD 7E FC      [19] 2398 	ld	a, -4 (ix)
   60D4 CE 00         [ 7] 2399 	adc	a, #0x00
   60D6 DD 77 FC      [19] 2400 	ld	-4 (ix), a
                           2401 ;src/gameObject/gameObject.c:407: *posx=P_portal[1].posx;
   60D9 DD 7E F7      [19] 2402 	ld	a, -9 (ix)
   60DC C6 01         [ 7] 2403 	add	a, #0x01
   60DE DD 77 F5      [19] 2404 	ld	-11 (ix), a
   60E1 DD 7E F8      [19] 2405 	ld	a, -8 (ix)
   60E4 CE 00         [ 7] 2406 	adc	a, #0x00
   60E6 DD 77 F6      [19] 2407 	ld	-10 (ix), a
                           2408 ;src/gameObject/gameObject.c:404: if(*posx==P_portal[0].posx ){
   60E9 DD 7E FE      [19] 2409 	ld	a, -2 (ix)
   60EC DD 96 FF      [19] 2410 	sub	a, -1 (ix)
   60EF 20 47         [12] 2411 	jr	NZ,00106$
                           2412 ;src/gameObject/gameObject.c:405: if(*posy==P_portal[0].posy ){
   60F1 1A            [ 7] 2413 	ld	a, (de)
   60F2 DD 77 FD      [19] 2414 	ld	-3 (ix), a
   60F5 DD 6E F9      [19] 2415 	ld	l,-7 (ix)
   60F8 DD 66 FA      [19] 2416 	ld	h,-6 (ix)
   60FB 23            [ 6] 2417 	inc	hl
   60FC 23            [ 6] 2418 	inc	hl
   60FD 7E            [ 7] 2419 	ld	a, (hl)
   60FE DD 77 F9      [19] 2420 	ld	-7 (ix), a
   6101 DD 7E FD      [19] 2421 	ld	a, -3 (ix)
   6104 DD 96 F9      [19] 2422 	sub	a, -7 (ix)
   6107 20 2F         [12] 2423 	jr	NZ,00106$
                           2424 ;src/gameObject/gameObject.c:406: if(objeto->sprite==sprite_Player){                
   6109 DD 6E FB      [19] 2425 	ld	l,-5 (ix)
   610C DD 66 FC      [19] 2426 	ld	h,-4 (ix)
   610F 6E            [ 7] 2427 	ld	l, (hl)
   6110 2D            [ 4] 2428 	dec	l
   6111 20 21         [12] 2429 	jr	NZ,00102$
                           2430 ;src/gameObject/gameObject.c:407: *posx=P_portal[1].posx;
   6113 E1            [10] 2431 	pop	hl
   6114 E5            [11] 2432 	push	hl
   6115 7E            [ 7] 2433 	ld	a, (hl)
   6116 02            [ 7] 2434 	ld	(bc), a
                           2435 ;src/gameObject/gameObject.c:408: *posy=P_portal[1].posy;
   6117 FD 21 07 00   [14] 2436 	ld	iy, #0x0007
   611B C5            [11] 2437 	push	bc
   611C ED 4B FB 76   [20] 2438 	ld	bc, (_P_portal)
   6120 FD 09         [15] 2439 	add	iy, bc
   6122 C1            [10] 2440 	pop	bc
   6123 FD 7E 02      [19] 2441 	ld	a, 2 (iy)
   6126 12            [ 7] 2442 	ld	(de), a
                           2443 ;src/gameObject/gameObject.c:409: mover1casilla(posx,posy,movimiento);                
   6127 DD 7E 0A      [19] 2444 	ld	a, 10 (ix)
   612A F5            [11] 2445 	push	af
   612B 33            [ 6] 2446 	inc	sp
   612C D5            [11] 2447 	push	de
   612D C5            [11] 2448 	push	bc
   612E CD 88 5E      [17] 2449 	call	_mover1casilla
   6131 F1            [10] 2450 	pop	af
   6132 F1            [10] 2451 	pop	af
   6133 33            [ 6] 2452 	inc	sp
   6134                    2453 00102$:
                           2454 ;src/gameObject/gameObject.c:411: return hay_Colision;               
   6134 2E 01         [ 7] 2455 	ld	l, #0x01
   6136 18 4E         [12] 2456 	jr	00113$
   6138                    2457 00106$:
                           2458 ;src/gameObject/gameObject.c:414: if(*posx==P_portal[1].posx){
   6138 E1            [10] 2459 	pop	hl
   6139 E5            [11] 2460 	push	hl
   613A 7E            [ 7] 2461 	ld	a, (hl)
   613B DD 77 FD      [19] 2462 	ld	-3 (ix), a
   613E DD 7E FE      [19] 2463 	ld	a, -2 (ix)
   6141 DD 96 FD      [19] 2464 	sub	a, -3 (ix)
   6144 20 3E         [12] 2465 	jr	NZ,00112$
                           2466 ;src/gameObject/gameObject.c:415: if(*posy==P_portal[1].posy){
   6146 1A            [ 7] 2467 	ld	a, (de)
   6147 DD 77 FD      [19] 2468 	ld	-3 (ix), a
   614A DD 6E F7      [19] 2469 	ld	l,-9 (ix)
   614D DD 66 F8      [19] 2470 	ld	h,-8 (ix)
   6150 23            [ 6] 2471 	inc	hl
   6151 23            [ 6] 2472 	inc	hl
   6152 7E            [ 7] 2473 	ld	a, (hl)
   6153 DD 77 F5      [19] 2474 	ld	-11 (ix), a
   6156 DD 7E FD      [19] 2475 	ld	a, -3 (ix)
   6159 DD 96 F5      [19] 2476 	sub	a, -11 (ix)
   615C 20 26         [12] 2477 	jr	NZ,00112$
                           2478 ;src/gameObject/gameObject.c:416: if(objeto->sprite==sprite_Player){
   615E DD 6E FB      [19] 2479 	ld	l,-5 (ix)
   6161 DD 66 FC      [19] 2480 	ld	h,-4 (ix)
   6164 6E            [ 7] 2481 	ld	l, (hl)
   6165 2D            [ 4] 2482 	dec	l
   6166 20 18         [12] 2483 	jr	NZ,00108$
                           2484 ;src/gameObject/gameObject.c:417: *posx=P_portal[0].posx;
   6168 DD 7E FF      [19] 2485 	ld	a, -1 (ix)
   616B 02            [ 7] 2486 	ld	(bc), a
                           2487 ;src/gameObject/gameObject.c:418: *posy=P_portal[0].posy;
   616C 2A FB 76      [16] 2488 	ld	hl, (_P_portal)
   616F 23            [ 6] 2489 	inc	hl
   6170 23            [ 6] 2490 	inc	hl
   6171 7E            [ 7] 2491 	ld	a, (hl)
   6172 12            [ 7] 2492 	ld	(de), a
                           2493 ;src/gameObject/gameObject.c:419: mover1casilla(posx,posy,movimiento);                
   6173 DD 7E 0A      [19] 2494 	ld	a, 10 (ix)
   6176 F5            [11] 2495 	push	af
   6177 33            [ 6] 2496 	inc	sp
   6178 D5            [11] 2497 	push	de
   6179 C5            [11] 2498 	push	bc
   617A CD 88 5E      [17] 2499 	call	_mover1casilla
   617D F1            [10] 2500 	pop	af
   617E F1            [10] 2501 	pop	af
   617F 33            [ 6] 2502 	inc	sp
   6180                    2503 00108$:
                           2504 ;src/gameObject/gameObject.c:421: return hay_Colision;                   
   6180 2E 01         [ 7] 2505 	ld	l, #0x01
   6182 18 02         [12] 2506 	jr	00113$
   6184                    2507 00112$:
                           2508 ;src/gameObject/gameObject.c:424: return no_Hay_Colision;        
   6184 2E 00         [ 7] 2509 	ld	l, #0x00
   6186                    2510 00113$:
   6186 DD F9         [10] 2511 	ld	sp, ix
   6188 DD E1         [14] 2512 	pop	ix
   618A C9            [10] 2513 	ret
                           2514 ;src/gameObject/gameObject.c:426: u8 comprobarPuertas(u8 posx, u8 posy){
                           2515 ;	---------------------------------
                           2516 ; Function comprobarPuertas
                           2517 ; ---------------------------------
   618B                    2518 _comprobarPuertas::
   618B DD E5         [15] 2519 	push	ix
   618D DD 21 00 00   [14] 2520 	ld	ix,#0
   6191 DD 39         [15] 2521 	add	ix,sp
                           2522 ;src/gameObject/gameObject.c:427: for(u8 i=0;i<PuertasMaximas;i++){
   6193 0E 00         [ 7] 2523 	ld	c, #0x00
   6195                    2524 00106$:
   6195 79            [ 4] 2525 	ld	a, c
   6196 D6 03         [ 7] 2526 	sub	a, #0x03
   6198 30 32         [12] 2527 	jr	NC,00104$
                           2528 ;src/gameObject/gameObject.c:428: if(posx==P_puertas[i].posx && posy==P_puertas[i].posy){
   619A 06 00         [ 7] 2529 	ld	b,#0x00
   619C 69            [ 4] 2530 	ld	l, c
   619D 60            [ 4] 2531 	ld	h, b
   619E 29            [11] 2532 	add	hl, hl
   619F 09            [11] 2533 	add	hl, bc
   61A0 29            [11] 2534 	add	hl, hl
   61A1 09            [11] 2535 	add	hl, bc
   61A2 45            [ 4] 2536 	ld	b, l
   61A3 54            [ 4] 2537 	ld	d, h
   61A4 FD 21 FD 76   [14] 2538 	ld	iy, #_P_puertas
   61A8 FD 7E 00      [19] 2539 	ld	a, 0 (iy)
   61AB 80            [ 4] 2540 	add	a, b
   61AC 5F            [ 4] 2541 	ld	e, a
   61AD FD 7E 01      [19] 2542 	ld	a, 1 (iy)
   61B0 8A            [ 4] 2543 	adc	a, d
   61B1 57            [ 4] 2544 	ld	d, a
   61B2 6B            [ 4] 2545 	ld	l, e
   61B3 62            [ 4] 2546 	ld	h, d
   61B4 23            [ 6] 2547 	inc	hl
   61B5 DD 7E 04      [19] 2548 	ld	a,4 (ix)
   61B8 96            [ 7] 2549 	sub	a,(hl)
   61B9 20 0E         [12] 2550 	jr	NZ,00107$
   61BB 6B            [ 4] 2551 	ld	l, e
   61BC 62            [ 4] 2552 	ld	h, d
   61BD 23            [ 6] 2553 	inc	hl
   61BE 23            [ 6] 2554 	inc	hl
   61BF DD 7E 05      [19] 2555 	ld	a,5 (ix)
   61C2 96            [ 7] 2556 	sub	a,(hl)
   61C3 20 04         [12] 2557 	jr	NZ,00107$
                           2558 ;src/gameObject/gameObject.c:429: return P_puertas[i].num;
   61C5 1A            [ 7] 2559 	ld	a, (de)
   61C6 6F            [ 4] 2560 	ld	l, a
   61C7 18 05         [12] 2561 	jr	00108$
   61C9                    2562 00107$:
                           2563 ;src/gameObject/gameObject.c:427: for(u8 i=0;i<PuertasMaximas;i++){
   61C9 0C            [ 4] 2564 	inc	c
   61CA 18 C9         [12] 2565 	jr	00106$
   61CC                    2566 00104$:
                           2567 ;src/gameObject/gameObject.c:432: return seguir_En_Nivel;
   61CC 2E 00         [ 7] 2568 	ld	l, #0x00
   61CE                    2569 00108$:
   61CE DD E1         [14] 2570 	pop	ix
   61D0 C9            [10] 2571 	ret
                           2572 ;src/gameObject/gameObject.c:434: void comprobarColeccionables(u8 posx, u8 posy){
                           2573 ;	---------------------------------
                           2574 ; Function comprobarColeccionables
                           2575 ; ---------------------------------
   61D1                    2576 _comprobarColeccionables::
   61D1 DD E5         [15] 2577 	push	ix
   61D3 DD 21 00 00   [14] 2578 	ld	ix,#0
   61D7 DD 39         [15] 2579 	add	ix,sp
   61D9 F5            [11] 2580 	push	af
                           2581 ;src/gameObject/gameObject.c:435: for(u8 i=0;i<ColeccionablesMaximos;i++){
   61DA 0E 00         [ 7] 2582 	ld	c, #0x00
   61DC                    2583 00112$:
   61DC 79            [ 4] 2584 	ld	a, c
   61DD D6 03         [ 7] 2585 	sub	a, #0x03
   61DF 30 73         [12] 2586 	jr	NC,00114$
                           2587 ;src/gameObject/gameObject.c:436: if(posx==P_col[i].posx && posy==P_col[i].posy){
   61E1 69            [ 4] 2588 	ld	l, c
   61E2 26 00         [ 7] 2589 	ld	h, #0x00
   61E4 29            [11] 2590 	add	hl, hl
   61E5 29            [11] 2591 	add	hl, hl
   61E6 EB            [ 4] 2592 	ex	de,hl
   61E7 FD 21 FF 76   [14] 2593 	ld	iy, #_P_col
   61EB FD 7E 00      [19] 2594 	ld	a, 0 (iy)
   61EE 83            [ 4] 2595 	add	a, e
   61EF DD 77 FE      [19] 2596 	ld	-2 (ix), a
   61F2 FD 7E 01      [19] 2597 	ld	a, 1 (iy)
   61F5 8A            [ 4] 2598 	adc	a, d
   61F6 DD 77 FF      [19] 2599 	ld	-1 (ix), a
   61F9 E1            [10] 2600 	pop	hl
   61FA E5            [11] 2601 	push	hl
   61FB 23            [ 6] 2602 	inc	hl
   61FC DD 7E 04      [19] 2603 	ld	a,4 (ix)
   61FF 96            [ 7] 2604 	sub	a,(hl)
   6200 20 4F         [12] 2605 	jr	NZ,00113$
   6202 E1            [10] 2606 	pop	hl
   6203 E5            [11] 2607 	push	hl
   6204 23            [ 6] 2608 	inc	hl
   6205 23            [ 6] 2609 	inc	hl
   6206 DD 7E 05      [19] 2610 	ld	a,5 (ix)
   6209 96            [ 7] 2611 	sub	a,(hl)
   620A 20 45         [12] 2612 	jr	NZ,00113$
                           2613 ;src/gameObject/gameObject.c:437: P_colList[P_col[i].num]=coleccionable_NOACTIVO;
   620C E1            [10] 2614 	pop	hl
   620D E5            [11] 2615 	push	hl
   620E 46            [ 7] 2616 	ld	b, (hl)
   620F FD 2A 07 77   [20] 2617 	ld	iy, (_P_colList)
   6213 C5            [11] 2618 	push	bc
   6214 48            [ 4] 2619 	ld	c,b
   6215 06 00         [ 7] 2620 	ld	b,#0x00
   6217 FD 09         [15] 2621 	add	iy, bc
   6219 C1            [10] 2622 	pop	bc
   621A FD 36 00 01   [19] 2623 	ld	0 (iy), #0x01
                           2624 ;src/gameObject/gameObject.c:438: if(P_col[i].sprite==sprite_luz){
   621E FD 2A FF 76   [20] 2625 	ld	iy, (_P_col)
   6222 FD 19         [15] 2626 	add	iy, de
   6224 FD 7E 03      [19] 2627 	ld	a, 3 (iy)
   6227 FE 15         [ 7] 2628 	cp	a, #0x15
   6229 20 08         [12] 2629 	jr	NZ,00105$
                           2630 ;src/gameObject/gameObject.c:439: *P_luz=*P_luz+1;                                                             
   622B 2A 01 77      [16] 2631 	ld	hl, (_P_luz)
   622E 46            [ 7] 2632 	ld	b, (hl)
   622F 04            [ 4] 2633 	inc	b
   6230 70            [ 7] 2634 	ld	(hl), b
   6231 18 12         [12] 2635 	jr	00106$
   6233                    2636 00105$:
                           2637 ;src/gameObject/gameObject.c:440: }else if(P_col[i].sprite==sprite_amstradTape){                
   6233 D6 1B         [ 7] 2638 	sub	a, #0x1b
   6235 20 08         [12] 2639 	jr	NZ,00102$
                           2640 ;src/gameObject/gameObject.c:441: *P_ams=*P_ams+1;
   6237 2A 05 77      [16] 2641 	ld	hl, (_P_ams)
   623A 46            [ 7] 2642 	ld	b, (hl)
   623B 04            [ 4] 2643 	inc	b
   623C 70            [ 7] 2644 	ld	(hl), b
   623D 18 06         [12] 2645 	jr	00106$
   623F                    2646 00102$:
                           2647 ;src/gameObject/gameObject.c:443: *P_fam=*P_fam+1;
   623F 2A 03 77      [16] 2648 	ld	hl, (_P_fam)
   6242 46            [ 7] 2649 	ld	b, (hl)
   6243 04            [ 4] 2650 	inc	b
   6244 70            [ 7] 2651 	ld	(hl), b
   6245                    2652 00106$:
                           2653 ;src/gameObject/gameObject.c:445: P_col[i].posx=0; 
   6245 FD 2A FF 76   [20] 2654 	ld	iy, (_P_col)
   6249 FD 19         [15] 2655 	add	iy, de
   624B FD 23         [10] 2656 	inc	iy
   624D FD 36 00 00   [19] 2657 	ld	0 (iy), #0x00
   6251                    2658 00113$:
                           2659 ;src/gameObject/gameObject.c:435: for(u8 i=0;i<ColeccionablesMaximos;i++){
   6251 0C            [ 4] 2660 	inc	c
   6252 18 88         [12] 2661 	jr	00112$
   6254                    2662 00114$:
   6254 DD F9         [10] 2663 	ld	sp, ix
   6256 DD E1         [14] 2664 	pop	ix
   6258 C9            [10] 2665 	ret
                           2666 	.area _CODE
                           2667 	.area _INITIALIZER
                           2668 	.area _CABS (ABS)
