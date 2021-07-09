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
                             14 	.globl _cpct_akp_SFXPlay
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
                             36 	.globl _comprobarEnemigos
                             37 ;--------------------------------------------------------
                             38 ; special function registers
                             39 ;--------------------------------------------------------
                             40 ;--------------------------------------------------------
                             41 ; ram data
                             42 ;--------------------------------------------------------
                             43 	.area _DATA
   AB15                      44 _P_portal:
   AB15                      45 	.ds 2
   AB17                      46 _P_puertas:
   AB17                      47 	.ds 2
   AB19                      48 _P_col:
   AB19                      49 	.ds 2
   AB1B                      50 _P_luz:
   AB1B                      51 	.ds 2
   AB1D                      52 _P_fam:
   AB1D                      53 	.ds 2
   AB1F                      54 _P_ams:
   AB1F                      55 	.ds 2
   AB21                      56 _P_colList:
   AB21                      57 	.ds 2
   AB23                      58 _creadorDeEnemigos:
   AB23                      59 	.ds 100
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
                             84 ;src/gameObject/gameObject.c:72: void initGameobjest(TGameObject* portales,TGameObject* puertas,TGameObjectCol* colec,u8* colLuz,u8* colFam,u8* colAms,u8* colList){
                             85 ;	---------------------------------
                             86 ; Function initGameobjest
                             87 ; ---------------------------------
   590D                      88 _initGameobjest::
   590D DD E5         [15]   89 	push	ix
   590F DD 21 00 00   [14]   90 	ld	ix,#0
   5913 DD 39         [15]   91 	add	ix,sp
                             92 ;src/gameObject/gameObject.c:73: P_portal=portales;
   5915 DD 6E 04      [19]   93 	ld	l,4 (ix)
   5918 DD 66 05      [19]   94 	ld	h,5 (ix)
   591B 22 15 AB      [16]   95 	ld	(_P_portal), hl
                             96 ;src/gameObject/gameObject.c:74: P_puertas=puertas;
   591E DD 6E 06      [19]   97 	ld	l,6 (ix)
   5921 DD 66 07      [19]   98 	ld	h,7 (ix)
   5924 22 17 AB      [16]   99 	ld	(_P_puertas), hl
                            100 ;src/gameObject/gameObject.c:75: P_col=colec;
   5927 DD 6E 08      [19]  101 	ld	l,8 (ix)
   592A DD 66 09      [19]  102 	ld	h,9 (ix)
   592D 22 19 AB      [16]  103 	ld	(_P_col), hl
                            104 ;src/gameObject/gameObject.c:76: P_luz=colLuz;
   5930 DD 6E 0A      [19]  105 	ld	l,10 (ix)
   5933 DD 66 0B      [19]  106 	ld	h,11 (ix)
   5936 22 1B AB      [16]  107 	ld	(_P_luz), hl
                            108 ;src/gameObject/gameObject.c:77: P_fam=colFam;
   5939 DD 6E 0C      [19]  109 	ld	l,12 (ix)
   593C DD 66 0D      [19]  110 	ld	h,13 (ix)
   593F 22 1D AB      [16]  111 	ld	(_P_fam), hl
                            112 ;src/gameObject/gameObject.c:78: P_ams=colAms;
   5942 DD 6E 0E      [19]  113 	ld	l,14 (ix)
   5945 DD 66 0F      [19]  114 	ld	h,15 (ix)
   5948 22 1F AB      [16]  115 	ld	(_P_ams), hl
                            116 ;src/gameObject/gameObject.c:79: P_colList=colList;   
   594B DD 6E 10      [19]  117 	ld	l,16 (ix)
   594E DD 66 11      [19]  118 	ld	h,17 (ix)
   5951 22 21 AB      [16]  119 	ld	(_P_colList), hl
   5954 DD E1         [14]  120 	pop	ix
   5956 C9            [10]  121 	ret
                            122 ;src/gameObject/gameObject.c:82: void dibujarGameObject(TGameObject* objeto){
                            123 ;	---------------------------------
                            124 ; Function dibujarGameObject
                            125 ; ---------------------------------
   5957                     126 _dibujarGameObject::
   5957 DD E5         [15]  127 	push	ix
   5959 DD 21 00 00   [14]  128 	ld	ix,#0
   595D DD 39         [15]  129 	add	ix,sp
                            130 ;src/gameObject/gameObject.c:83: if(objeto->posx!=0){
   595F DD 4E 04      [19]  131 	ld	c,4 (ix)
   5962 DD 46 05      [19]  132 	ld	b,5 (ix)
   5965 69            [ 4]  133 	ld	l, c
   5966 60            [ 4]  134 	ld	h, b
   5967 23            [ 6]  135 	inc	hl
   5968 56            [ 7]  136 	ld	d, (hl)
   5969 7A            [ 4]  137 	ld	a, d
   596A B7            [ 4]  138 	or	a, a
   596B CA 33 5E      [10]  139 	jp	Z, 00237$
                            140 ;src/gameObject/gameObject.c:84: if(objeto->sprite==sprite_Player){
   596E 69            [ 4]  141 	ld	l, c
   596F 60            [ 4]  142 	ld	h, b
   5970 23            [ 6]  143 	inc	hl
   5971 23            [ 6]  144 	inc	hl
   5972 23            [ 6]  145 	inc	hl
   5973 5E            [ 7]  146 	ld	e, (hl)
                            147 ;src/gameObject/gameObject.c:85: cpct_drawSprite(Character_Principal_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   5974 69            [ 4]  148 	ld	l, c
   5975 60            [ 4]  149 	ld	h, b
   5976 23            [ 6]  150 	inc	hl
   5977 23            [ 6]  151 	inc	hl
                            152 ;src/gameObject/gameObject.c:84: if(objeto->sprite==sprite_Player){
   5978 7B            [ 4]  153 	ld	a, e
   5979 3D            [ 4]  154 	dec	a
   597A 20 18         [12]  155 	jr	NZ,00233$
                            156 ;src/gameObject/gameObject.c:85: cpct_drawSprite(Character_Principal_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   597C 46            [ 7]  157 	ld	b, (hl)
   597D 4A            [ 4]  158 	ld	c, d
   597E C5            [11]  159 	push	bc
   597F CD BE 9D      [17]  160 	call	_calcularPosicionEnPantalla
   5982 F1            [10]  161 	pop	af
   5983 4D            [ 4]  162 	ld	c, l
   5984 44            [ 4]  163 	ld	b, h
   5985 21 04 10      [10]  164 	ld	hl, #0x1004
   5988 E5            [11]  165 	push	hl
   5989 C5            [11]  166 	push	bc
   598A 21 A6 58      [10]  167 	ld	hl, #_Character_Principal_0
   598D E5            [11]  168 	push	hl
   598E CD 17 A8      [17]  169 	call	_cpct_drawSprite
   5991 C3 33 5E      [10]  170 	jp	00237$
   5994                     171 00233$:
                            172 ;src/gameObject/gameObject.c:86: }else if(objeto->sprite==sprite_Rock_G){
   5994 7B            [ 4]  173 	ld	a, e
   5995 D6 02         [ 7]  174 	sub	a, #0x02
   5997 20 18         [12]  175 	jr	NZ,00230$
                            176 ;src/gameObject/gameObject.c:87: cpct_drawSprite(Block_Move1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5999 46            [ 7]  177 	ld	b, (hl)
   599A 4A            [ 4]  178 	ld	c, d
   599B C5            [11]  179 	push	bc
   599C CD BE 9D      [17]  180 	call	_calcularPosicionEnPantalla
   599F F1            [10]  181 	pop	af
   59A0 4D            [ 4]  182 	ld	c, l
   59A1 44            [ 4]  183 	ld	b, h
   59A2 21 04 10      [10]  184 	ld	hl, #0x1004
   59A5 E5            [11]  185 	push	hl
   59A6 C5            [11]  186 	push	bc
   59A7 21 53 58      [10]  187 	ld	hl, #_Block_Move1_G_0
   59AA E5            [11]  188 	push	hl
   59AB CD 17 A8      [17]  189 	call	_cpct_drawSprite
   59AE C3 33 5E      [10]  190 	jp	00237$
   59B1                     191 00230$:
                            192 ;src/gameObject/gameObject.c:88: }else if(objeto->sprite==sprite_Rock_B){
   59B1 7B            [ 4]  193 	ld	a, e
   59B2 D6 03         [ 7]  194 	sub	a, #0x03
   59B4 20 16         [12]  195 	jr	NZ,00227$
                            196 ;src/gameObject/gameObject.c:89: cpct_drawSprite(Block_Move1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   59B6 46            [ 7]  197 	ld	b, (hl)
   59B7 4A            [ 4]  198 	ld	c, d
   59B8 C5            [11]  199 	push	bc
   59B9 CD BE 9D      [17]  200 	call	_calcularPosicionEnPantalla
   59BC F1            [10]  201 	pop	af
   59BD 01 00 58      [10]  202 	ld	bc, #_Block_Move1_B_0+0
   59C0 11 04 10      [10]  203 	ld	de, #0x1004
   59C3 D5            [11]  204 	push	de
   59C4 E5            [11]  205 	push	hl
   59C5 C5            [11]  206 	push	bc
   59C6 CD 17 A8      [17]  207 	call	_cpct_drawSprite
   59C9 C3 33 5E      [10]  208 	jp	00237$
   59CC                     209 00227$:
                            210 ;src/gameObject/gameObject.c:90: }else if(objeto->sprite==sprite_Rock_nomove_B){
   59CC 7B            [ 4]  211 	ld	a, e
   59CD D6 04         [ 7]  212 	sub	a, #0x04
   59CF 20 16         [12]  213 	jr	NZ,00224$
                            214 ;src/gameObject/gameObject.c:91: cpct_drawSprite(Block_Move0_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   59D1 46            [ 7]  215 	ld	b, (hl)
   59D2 4A            [ 4]  216 	ld	c, d
   59D3 C5            [11]  217 	push	bc
   59D4 CD BE 9D      [17]  218 	call	_calcularPosicionEnPantalla
   59D7 F1            [10]  219 	pop	af
   59D8 01 AD 57      [10]  220 	ld	bc, #_Block_Move0_B_0+0
   59DB 11 04 10      [10]  221 	ld	de, #0x1004
   59DE D5            [11]  222 	push	de
   59DF E5            [11]  223 	push	hl
   59E0 C5            [11]  224 	push	bc
   59E1 CD 17 A8      [17]  225 	call	_cpct_drawSprite
   59E4 C3 33 5E      [10]  226 	jp	00237$
   59E7                     227 00224$:
                            228 ;src/gameObject/gameObject.c:92: }else if(objeto->sprite==sprite_RockInmovil1_G){
   59E7 7B            [ 4]  229 	ld	a, e
   59E8 D6 07         [ 7]  230 	sub	a, #0x07
   59EA 20 16         [12]  231 	jr	NZ,00221$
                            232 ;src/gameObject/gameObject.c:93: cpct_drawSprite(Block_Static1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   59EC 46            [ 7]  233 	ld	b, (hl)
   59ED 4A            [ 4]  234 	ld	c, d
   59EE C5            [11]  235 	push	bc
   59EF CD BE 9D      [17]  236 	call	_calcularPosicionEnPantalla
   59F2 F1            [10]  237 	pop	af
   59F3 01 5A 57      [10]  238 	ld	bc, #_Block_Static1_G_0+0
   59F6 11 04 10      [10]  239 	ld	de, #0x1004
   59F9 D5            [11]  240 	push	de
   59FA E5            [11]  241 	push	hl
   59FB C5            [11]  242 	push	bc
   59FC CD 17 A8      [17]  243 	call	_cpct_drawSprite
   59FF C3 33 5E      [10]  244 	jp	00237$
   5A02                     245 00221$:
                            246 ;src/gameObject/gameObject.c:94: }else if(objeto->sprite==sprite_RockInmovil1_B){
   5A02 7B            [ 4]  247 	ld	a, e
   5A03 D6 08         [ 7]  248 	sub	a, #0x08
   5A05 20 16         [12]  249 	jr	NZ,00218$
                            250 ;src/gameObject/gameObject.c:95: cpct_drawSprite(Block_Static1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5A07 46            [ 7]  251 	ld	b, (hl)
   5A08 4A            [ 4]  252 	ld	c, d
   5A09 C5            [11]  253 	push	bc
   5A0A CD BE 9D      [17]  254 	call	_calcularPosicionEnPantalla
   5A0D F1            [10]  255 	pop	af
   5A0E 01 07 57      [10]  256 	ld	bc, #_Block_Static1_B_0+0
   5A11 11 04 10      [10]  257 	ld	de, #0x1004
   5A14 D5            [11]  258 	push	de
   5A15 E5            [11]  259 	push	hl
   5A16 C5            [11]  260 	push	bc
   5A17 CD 17 A8      [17]  261 	call	_cpct_drawSprite
   5A1A C3 33 5E      [10]  262 	jp	00237$
   5A1D                     263 00218$:
                            264 ;src/gameObject/gameObject.c:96: }else if(objeto->sprite==sprite_RockInmovil2_G){
   5A1D 7B            [ 4]  265 	ld	a, e
   5A1E D6 09         [ 7]  266 	sub	a, #0x09
   5A20 20 16         [12]  267 	jr	NZ,00215$
                            268 ;src/gameObject/gameObject.c:97: cpct_drawSprite(Block_Static2_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5A22 46            [ 7]  269 	ld	b, (hl)
   5A23 4A            [ 4]  270 	ld	c, d
   5A24 C5            [11]  271 	push	bc
   5A25 CD BE 9D      [17]  272 	call	_calcularPosicionEnPantalla
   5A28 F1            [10]  273 	pop	af
   5A29 01 B4 56      [10]  274 	ld	bc, #_Block_Static2_G_0+0
   5A2C 11 04 10      [10]  275 	ld	de, #0x1004
   5A2F D5            [11]  276 	push	de
   5A30 E5            [11]  277 	push	hl
   5A31 C5            [11]  278 	push	bc
   5A32 CD 17 A8      [17]  279 	call	_cpct_drawSprite
   5A35 C3 33 5E      [10]  280 	jp	00237$
   5A38                     281 00215$:
                            282 ;src/gameObject/gameObject.c:98: }else if(objeto->sprite==sprite_RockInmovil2_B){
   5A38 7B            [ 4]  283 	ld	a, e
   5A39 D6 0A         [ 7]  284 	sub	a, #0x0a
   5A3B 20 16         [12]  285 	jr	NZ,00212$
                            286 ;src/gameObject/gameObject.c:99: cpct_drawSprite(Block_Static2_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5A3D 46            [ 7]  287 	ld	b, (hl)
   5A3E 4A            [ 4]  288 	ld	c, d
   5A3F C5            [11]  289 	push	bc
   5A40 CD BE 9D      [17]  290 	call	_calcularPosicionEnPantalla
   5A43 F1            [10]  291 	pop	af
   5A44 01 61 56      [10]  292 	ld	bc, #_Block_Static2_B_0+0
   5A47 11 04 10      [10]  293 	ld	de, #0x1004
   5A4A D5            [11]  294 	push	de
   5A4B E5            [11]  295 	push	hl
   5A4C C5            [11]  296 	push	bc
   5A4D CD 17 A8      [17]  297 	call	_cpct_drawSprite
   5A50 C3 33 5E      [10]  298 	jp	00237$
   5A53                     299 00212$:
                            300 ;src/gameObject/gameObject.c:100: }else if(objeto->sprite==sprite_RockInmovil3_G){
   5A53 7B            [ 4]  301 	ld	a, e
   5A54 D6 0B         [ 7]  302 	sub	a, #0x0b
   5A56 20 16         [12]  303 	jr	NZ,00209$
                            304 ;src/gameObject/gameObject.c:101: cpct_drawSprite(Block_Static3_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5A58 46            [ 7]  305 	ld	b, (hl)
   5A59 4A            [ 4]  306 	ld	c, d
   5A5A C5            [11]  307 	push	bc
   5A5B CD BE 9D      [17]  308 	call	_calcularPosicionEnPantalla
   5A5E F1            [10]  309 	pop	af
   5A5F 01 0E 56      [10]  310 	ld	bc, #_Block_Static3_G_0+0
   5A62 11 04 10      [10]  311 	ld	de, #0x1004
   5A65 D5            [11]  312 	push	de
   5A66 E5            [11]  313 	push	hl
   5A67 C5            [11]  314 	push	bc
   5A68 CD 17 A8      [17]  315 	call	_cpct_drawSprite
   5A6B C3 33 5E      [10]  316 	jp	00237$
   5A6E                     317 00209$:
                            318 ;src/gameObject/gameObject.c:102: }else if(objeto->sprite==sprite_RockInmovil3_B){
   5A6E 7B            [ 4]  319 	ld	a, e
   5A6F D6 0C         [ 7]  320 	sub	a, #0x0c
   5A71 20 16         [12]  321 	jr	NZ,00206$
                            322 ;src/gameObject/gameObject.c:103: cpct_drawSprite(Block_Static3_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5A73 46            [ 7]  323 	ld	b, (hl)
   5A74 4A            [ 4]  324 	ld	c, d
   5A75 C5            [11]  325 	push	bc
   5A76 CD BE 9D      [17]  326 	call	_calcularPosicionEnPantalla
   5A79 F1            [10]  327 	pop	af
   5A7A 01 BB 55      [10]  328 	ld	bc, #_Block_Static3_B_0+0
   5A7D 11 04 10      [10]  329 	ld	de, #0x1004
   5A80 D5            [11]  330 	push	de
   5A81 E5            [11]  331 	push	hl
   5A82 C5            [11]  332 	push	bc
   5A83 CD 17 A8      [17]  333 	call	_cpct_drawSprite
   5A86 C3 33 5E      [10]  334 	jp	00237$
   5A89                     335 00206$:
                            336 ;src/gameObject/gameObject.c:104: }else if(objeto->sprite==sprite_RockInmovil4_G){
   5A89 7B            [ 4]  337 	ld	a, e
   5A8A D6 0D         [ 7]  338 	sub	a, #0x0d
   5A8C 20 16         [12]  339 	jr	NZ,00203$
                            340 ;src/gameObject/gameObject.c:105: cpct_drawSprite(Block_Static4_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5A8E 46            [ 7]  341 	ld	b, (hl)
   5A8F 4A            [ 4]  342 	ld	c, d
   5A90 C5            [11]  343 	push	bc
   5A91 CD BE 9D      [17]  344 	call	_calcularPosicionEnPantalla
   5A94 F1            [10]  345 	pop	af
   5A95 01 68 55      [10]  346 	ld	bc, #_Block_Static4_G_0+0
   5A98 11 04 10      [10]  347 	ld	de, #0x1004
   5A9B D5            [11]  348 	push	de
   5A9C E5            [11]  349 	push	hl
   5A9D C5            [11]  350 	push	bc
   5A9E CD 17 A8      [17]  351 	call	_cpct_drawSprite
   5AA1 C3 33 5E      [10]  352 	jp	00237$
   5AA4                     353 00203$:
                            354 ;src/gameObject/gameObject.c:106: }else if(objeto->sprite==sprite_RockInmovil4_B){
   5AA4 7B            [ 4]  355 	ld	a, e
   5AA5 D6 0E         [ 7]  356 	sub	a, #0x0e
   5AA7 20 16         [12]  357 	jr	NZ,00200$
                            358 ;src/gameObject/gameObject.c:107: cpct_drawSprite(Block_Static4_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5AA9 46            [ 7]  359 	ld	b, (hl)
   5AAA 4A            [ 4]  360 	ld	c, d
   5AAB C5            [11]  361 	push	bc
   5AAC CD BE 9D      [17]  362 	call	_calcularPosicionEnPantalla
   5AAF F1            [10]  363 	pop	af
   5AB0 01 15 55      [10]  364 	ld	bc, #_Block_Static4_B_0+0
   5AB3 11 04 10      [10]  365 	ld	de, #0x1004
   5AB6 D5            [11]  366 	push	de
   5AB7 E5            [11]  367 	push	hl
   5AB8 C5            [11]  368 	push	bc
   5AB9 CD 17 A8      [17]  369 	call	_cpct_drawSprite
   5ABC C3 33 5E      [10]  370 	jp	00237$
   5ABF                     371 00200$:
                            372 ;src/gameObject/gameObject.c:108: }else if(objeto->sprite==sprite_RockInmovil5_G){
   5ABF 7B            [ 4]  373 	ld	a, e
   5AC0 D6 0F         [ 7]  374 	sub	a, #0x0f
   5AC2 20 16         [12]  375 	jr	NZ,00197$
                            376 ;src/gameObject/gameObject.c:109: cpct_drawSprite(Block_Static5_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5AC4 46            [ 7]  377 	ld	b, (hl)
   5AC5 4A            [ 4]  378 	ld	c, d
   5AC6 C5            [11]  379 	push	bc
   5AC7 CD BE 9D      [17]  380 	call	_calcularPosicionEnPantalla
   5ACA F1            [10]  381 	pop	af
   5ACB 01 C2 54      [10]  382 	ld	bc, #_Block_Static5_G_0+0
   5ACE 11 04 10      [10]  383 	ld	de, #0x1004
   5AD1 D5            [11]  384 	push	de
   5AD2 E5            [11]  385 	push	hl
   5AD3 C5            [11]  386 	push	bc
   5AD4 CD 17 A8      [17]  387 	call	_cpct_drawSprite
   5AD7 C3 33 5E      [10]  388 	jp	00237$
   5ADA                     389 00197$:
                            390 ;src/gameObject/gameObject.c:110: }else if(objeto->sprite==sprite_RockInmovil5_B){
   5ADA 7B            [ 4]  391 	ld	a, e
   5ADB D6 10         [ 7]  392 	sub	a, #0x10
   5ADD 20 16         [12]  393 	jr	NZ,00194$
                            394 ;src/gameObject/gameObject.c:111: cpct_drawSprite(Block_Static5_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5ADF 46            [ 7]  395 	ld	b, (hl)
   5AE0 4A            [ 4]  396 	ld	c, d
   5AE1 C5            [11]  397 	push	bc
   5AE2 CD BE 9D      [17]  398 	call	_calcularPosicionEnPantalla
   5AE5 F1            [10]  399 	pop	af
   5AE6 01 6F 54      [10]  400 	ld	bc, #_Block_Static5_B_0+0
   5AE9 11 04 10      [10]  401 	ld	de, #0x1004
   5AEC D5            [11]  402 	push	de
   5AED E5            [11]  403 	push	hl
   5AEE C5            [11]  404 	push	bc
   5AEF CD 17 A8      [17]  405 	call	_cpct_drawSprite
   5AF2 C3 33 5E      [10]  406 	jp	00237$
   5AF5                     407 00194$:
                            408 ;src/gameObject/gameObject.c:112: }else if(objeto->sprite==sprite_RockInmovil6_G){
   5AF5 7B            [ 4]  409 	ld	a, e
   5AF6 D6 11         [ 7]  410 	sub	a, #0x11
   5AF8 20 16         [12]  411 	jr	NZ,00191$
                            412 ;src/gameObject/gameObject.c:113: cpct_drawSprite(Block_Static6_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5AFA 46            [ 7]  413 	ld	b, (hl)
   5AFB 4A            [ 4]  414 	ld	c, d
   5AFC C5            [11]  415 	push	bc
   5AFD CD BE 9D      [17]  416 	call	_calcularPosicionEnPantalla
   5B00 F1            [10]  417 	pop	af
   5B01 01 1C 54      [10]  418 	ld	bc, #_Block_Static6_G_0+0
   5B04 11 04 10      [10]  419 	ld	de, #0x1004
   5B07 D5            [11]  420 	push	de
   5B08 E5            [11]  421 	push	hl
   5B09 C5            [11]  422 	push	bc
   5B0A CD 17 A8      [17]  423 	call	_cpct_drawSprite
   5B0D C3 33 5E      [10]  424 	jp	00237$
   5B10                     425 00191$:
                            426 ;src/gameObject/gameObject.c:114: }else if(objeto->sprite==sprite_RockInmovil7_G){
   5B10 7B            [ 4]  427 	ld	a, e
   5B11 D6 13         [ 7]  428 	sub	a, #0x13
   5B13 20 16         [12]  429 	jr	NZ,00188$
                            430 ;src/gameObject/gameObject.c:115: cpct_drawSprite(Block_Static7_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5B15 46            [ 7]  431 	ld	b, (hl)
   5B16 4A            [ 4]  432 	ld	c, d
   5B17 C5            [11]  433 	push	bc
   5B18 CD BE 9D      [17]  434 	call	_calcularPosicionEnPantalla
   5B1B F1            [10]  435 	pop	af
   5B1C 01 76 53      [10]  436 	ld	bc, #_Block_Static7_G_0+0
   5B1F 11 04 10      [10]  437 	ld	de, #0x1004
   5B22 D5            [11]  438 	push	de
   5B23 E5            [11]  439 	push	hl
   5B24 C5            [11]  440 	push	bc
   5B25 CD 17 A8      [17]  441 	call	_cpct_drawSprite
   5B28 C3 33 5E      [10]  442 	jp	00237$
   5B2B                     443 00188$:
                            444 ;src/gameObject/gameObject.c:116: }else if(objeto->sprite==sprite_RockInmovil7_B){
   5B2B 7B            [ 4]  445 	ld	a, e
   5B2C D6 14         [ 7]  446 	sub	a, #0x14
   5B2E 20 16         [12]  447 	jr	NZ,00185$
                            448 ;src/gameObject/gameObject.c:117: cpct_drawSprite(Block_Static7_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5B30 46            [ 7]  449 	ld	b, (hl)
   5B31 4A            [ 4]  450 	ld	c, d
   5B32 C5            [11]  451 	push	bc
   5B33 CD BE 9D      [17]  452 	call	_calcularPosicionEnPantalla
   5B36 F1            [10]  453 	pop	af
   5B37 01 23 53      [10]  454 	ld	bc, #_Block_Static7_B_0+0
   5B3A 11 04 10      [10]  455 	ld	de, #0x1004
   5B3D D5            [11]  456 	push	de
   5B3E E5            [11]  457 	push	hl
   5B3F C5            [11]  458 	push	bc
   5B40 CD 17 A8      [17]  459 	call	_cpct_drawSprite
   5B43 C3 33 5E      [10]  460 	jp	00237$
   5B46                     461 00185$:
                            462 ;src/gameObject/gameObject.c:118: }else if(objeto->sprite==sprite_RockInmovil8_G){
   5B46 7B            [ 4]  463 	ld	a, e
   5B47 D6 15         [ 7]  464 	sub	a, #0x15
   5B49 20 16         [12]  465 	jr	NZ,00182$
                            466 ;src/gameObject/gameObject.c:119: cpct_drawSprite(Block_Static8_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5B4B 46            [ 7]  467 	ld	b, (hl)
   5B4C 4A            [ 4]  468 	ld	c, d
   5B4D C5            [11]  469 	push	bc
   5B4E CD BE 9D      [17]  470 	call	_calcularPosicionEnPantalla
   5B51 F1            [10]  471 	pop	af
   5B52 01 D0 52      [10]  472 	ld	bc, #_Block_Static8_G_0+0
   5B55 11 04 10      [10]  473 	ld	de, #0x1004
   5B58 D5            [11]  474 	push	de
   5B59 E5            [11]  475 	push	hl
   5B5A C5            [11]  476 	push	bc
   5B5B CD 17 A8      [17]  477 	call	_cpct_drawSprite
   5B5E C3 33 5E      [10]  478 	jp	00237$
   5B61                     479 00182$:
                            480 ;src/gameObject/gameObject.c:120: }else if(objeto->sprite==sprite_RockInmovil8_B){
   5B61 7B            [ 4]  481 	ld	a, e
   5B62 D6 16         [ 7]  482 	sub	a, #0x16
   5B64 20 16         [12]  483 	jr	NZ,00179$
                            484 ;src/gameObject/gameObject.c:121: cpct_drawSprite(Block_Static8_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5B66 46            [ 7]  485 	ld	b, (hl)
   5B67 4A            [ 4]  486 	ld	c, d
   5B68 C5            [11]  487 	push	bc
   5B69 CD BE 9D      [17]  488 	call	_calcularPosicionEnPantalla
   5B6C F1            [10]  489 	pop	af
   5B6D 01 7D 52      [10]  490 	ld	bc, #_Block_Static8_B_0+0
   5B70 11 04 10      [10]  491 	ld	de, #0x1004
   5B73 D5            [11]  492 	push	de
   5B74 E5            [11]  493 	push	hl
   5B75 C5            [11]  494 	push	bc
   5B76 CD 17 A8      [17]  495 	call	_cpct_drawSprite
   5B79 C3 33 5E      [10]  496 	jp	00237$
   5B7C                     497 00179$:
                            498 ;src/gameObject/gameObject.c:122: }else if(objeto->sprite==sprite_RockInmovil9_G){
   5B7C 7B            [ 4]  499 	ld	a, e
   5B7D D6 17         [ 7]  500 	sub	a, #0x17
   5B7F 20 16         [12]  501 	jr	NZ,00176$
                            502 ;src/gameObject/gameObject.c:123: cpct_drawSprite(Block_Static9_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5B81 46            [ 7]  503 	ld	b, (hl)
   5B82 4A            [ 4]  504 	ld	c, d
   5B83 C5            [11]  505 	push	bc
   5B84 CD BE 9D      [17]  506 	call	_calcularPosicionEnPantalla
   5B87 F1            [10]  507 	pop	af
   5B88 01 2A 52      [10]  508 	ld	bc, #_Block_Static9_G_0+0
   5B8B 11 04 10      [10]  509 	ld	de, #0x1004
   5B8E D5            [11]  510 	push	de
   5B8F E5            [11]  511 	push	hl
   5B90 C5            [11]  512 	push	bc
   5B91 CD 17 A8      [17]  513 	call	_cpct_drawSprite
   5B94 C3 33 5E      [10]  514 	jp	00237$
   5B97                     515 00176$:
                            516 ;src/gameObject/gameObject.c:124: }else if(objeto->sprite==sprite_RockInmovil9_B){
   5B97 7B            [ 4]  517 	ld	a, e
   5B98 D6 18         [ 7]  518 	sub	a, #0x18
   5B9A 20 16         [12]  519 	jr	NZ,00173$
                            520 ;src/gameObject/gameObject.c:125: cpct_drawSprite(Block_Static9_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5B9C 46            [ 7]  521 	ld	b, (hl)
   5B9D 4A            [ 4]  522 	ld	c, d
   5B9E C5            [11]  523 	push	bc
   5B9F CD BE 9D      [17]  524 	call	_calcularPosicionEnPantalla
   5BA2 F1            [10]  525 	pop	af
   5BA3 01 D7 51      [10]  526 	ld	bc, #_Block_Static9_B_0+0
   5BA6 11 04 10      [10]  527 	ld	de, #0x1004
   5BA9 D5            [11]  528 	push	de
   5BAA E5            [11]  529 	push	hl
   5BAB C5            [11]  530 	push	bc
   5BAC CD 17 A8      [17]  531 	call	_cpct_drawSprite
   5BAF C3 33 5E      [10]  532 	jp	00237$
   5BB2                     533 00173$:
                            534 ;src/gameObject/gameObject.c:126: }else if(objeto->sprite==sprite_RockLineal1_G){
   5BB2 7B            [ 4]  535 	ld	a, e
   5BB3 D6 05         [ 7]  536 	sub	a, #0x05
   5BB5 20 16         [12]  537 	jr	NZ,00170$
                            538 ;src/gameObject/gameObject.c:127: cpct_drawSprite(Block_Move2_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5BB7 46            [ 7]  539 	ld	b, (hl)
   5BB8 4A            [ 4]  540 	ld	c, d
   5BB9 C5            [11]  541 	push	bc
   5BBA CD BE 9D      [17]  542 	call	_calcularPosicionEnPantalla
   5BBD F1            [10]  543 	pop	af
   5BBE 01 84 51      [10]  544 	ld	bc, #_Block_Move2_G_0+0
   5BC1 11 04 10      [10]  545 	ld	de, #0x1004
   5BC4 D5            [11]  546 	push	de
   5BC5 E5            [11]  547 	push	hl
   5BC6 C5            [11]  548 	push	bc
   5BC7 CD 17 A8      [17]  549 	call	_cpct_drawSprite
   5BCA C3 33 5E      [10]  550 	jp	00237$
   5BCD                     551 00170$:
                            552 ;src/gameObject/gameObject.c:128: }else if(objeto->sprite==sprite_RockLineal1_B){
   5BCD 7B            [ 4]  553 	ld	a, e
   5BCE D6 06         [ 7]  554 	sub	a, #0x06
   5BD0 20 16         [12]  555 	jr	NZ,00167$
                            556 ;src/gameObject/gameObject.c:129: cpct_drawSprite(Block_Move2_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5BD2 46            [ 7]  557 	ld	b, (hl)
   5BD3 4A            [ 4]  558 	ld	c, d
   5BD4 C5            [11]  559 	push	bc
   5BD5 CD BE 9D      [17]  560 	call	_calcularPosicionEnPantalla
   5BD8 F1            [10]  561 	pop	af
   5BD9 01 31 51      [10]  562 	ld	bc, #_Block_Move2_B_0+0
   5BDC 11 04 10      [10]  563 	ld	de, #0x1004
   5BDF D5            [11]  564 	push	de
   5BE0 E5            [11]  565 	push	hl
   5BE1 C5            [11]  566 	push	bc
   5BE2 CD 17 A8      [17]  567 	call	_cpct_drawSprite
   5BE5 C3 33 5E      [10]  568 	jp	00237$
   5BE8                     569 00167$:
                            570 ;src/gameObject/gameObject.c:130: }else if(objeto->sprite==sprite_PortalMuro){
   5BE8 7B            [ 4]  571 	ld	a, e
   5BE9 D6 19         [ 7]  572 	sub	a, #0x19
   5BEB 20 16         [12]  573 	jr	NZ,00164$
                            574 ;src/gameObject/gameObject.c:131: cpct_drawSprite(PortalWall_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5BED 46            [ 7]  575 	ld	b, (hl)
   5BEE 4A            [ 4]  576 	ld	c, d
   5BEF C5            [11]  577 	push	bc
   5BF0 CD BE 9D      [17]  578 	call	_calcularPosicionEnPantalla
   5BF3 F1            [10]  579 	pop	af
   5BF4 01 DE 50      [10]  580 	ld	bc, #_PortalWall_0+0
   5BF7 11 04 10      [10]  581 	ld	de, #0x1004
   5BFA D5            [11]  582 	push	de
   5BFB E5            [11]  583 	push	hl
   5BFC C5            [11]  584 	push	bc
   5BFD CD 17 A8      [17]  585 	call	_cpct_drawSprite
   5C00 C3 33 5E      [10]  586 	jp	00237$
   5C03                     587 00164$:
                            588 ;src/gameObject/gameObject.c:132: }else if(objeto->sprite==sprite_PuertaPortal_G){
   5C03 7B            [ 4]  589 	ld	a, e
   5C04 D6 1A         [ 7]  590 	sub	a, #0x1a
   5C06 20 16         [12]  591 	jr	NZ,00161$
                            592 ;src/gameObject/gameObject.c:133: cpct_drawSprite(PortalDoor_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5C08 46            [ 7]  593 	ld	b, (hl)
   5C09 4A            [ 4]  594 	ld	c, d
   5C0A C5            [11]  595 	push	bc
   5C0B CD BE 9D      [17]  596 	call	_calcularPosicionEnPantalla
   5C0E F1            [10]  597 	pop	af
   5C0F 01 8B 50      [10]  598 	ld	bc, #_PortalDoor_G_0+0
   5C12 11 04 10      [10]  599 	ld	de, #0x1004
   5C15 D5            [11]  600 	push	de
   5C16 E5            [11]  601 	push	hl
   5C17 C5            [11]  602 	push	bc
   5C18 CD 17 A8      [17]  603 	call	_cpct_drawSprite
   5C1B C3 33 5E      [10]  604 	jp	00237$
   5C1E                     605 00161$:
                            606 ;src/gameObject/gameObject.c:134: }else if(objeto->sprite==sprite_Muro_Solid1){
   5C1E 7B            [ 4]  607 	ld	a, e
   5C1F D6 1D         [ 7]  608 	sub	a, #0x1d
   5C21 20 16         [12]  609 	jr	NZ,00158$
                            610 ;src/gameObject/gameObject.c:135: cpct_drawSprite(Wall_Solid1_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5C23 46            [ 7]  611 	ld	b, (hl)
   5C24 4A            [ 4]  612 	ld	c, d
   5C25 C5            [11]  613 	push	bc
   5C26 CD BE 9D      [17]  614 	call	_calcularPosicionEnPantalla
   5C29 F1            [10]  615 	pop	af
   5C2A 01 92 4F      [10]  616 	ld	bc, #_Wall_Solid1_0+0
   5C2D 11 04 10      [10]  617 	ld	de, #0x1004
   5C30 D5            [11]  618 	push	de
   5C31 E5            [11]  619 	push	hl
   5C32 C5            [11]  620 	push	bc
   5C33 CD 17 A8      [17]  621 	call	_cpct_drawSprite
   5C36 C3 33 5E      [10]  622 	jp	00237$
   5C39                     623 00158$:
                            624 ;src/gameObject/gameObject.c:136: }else if(objeto->sprite==sprite_Muro_Polvo1){
   5C39 7B            [ 4]  625 	ld	a, e
   5C3A D6 1C         [ 7]  626 	sub	a, #0x1c
   5C3C 20 16         [12]  627 	jr	NZ,00155$
                            628 ;src/gameObject/gameObject.c:137: cpct_drawSprite(Wall_Dust_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5C3E 46            [ 7]  629 	ld	b, (hl)
   5C3F 4A            [ 4]  630 	ld	c, d
   5C40 C5            [11]  631 	push	bc
   5C41 CD BE 9D      [17]  632 	call	_calcularPosicionEnPantalla
   5C44 F1            [10]  633 	pop	af
   5C45 01 E5 4F      [10]  634 	ld	bc, #_Wall_Dust_B_0+0
   5C48 11 04 10      [10]  635 	ld	de, #0x1004
   5C4B D5            [11]  636 	push	de
   5C4C E5            [11]  637 	push	hl
   5C4D C5            [11]  638 	push	bc
   5C4E CD 17 A8      [17]  639 	call	_cpct_drawSprite
   5C51 C3 33 5E      [10]  640 	jp	00237$
   5C54                     641 00155$:
                            642 ;src/gameObject/gameObject.c:138: }else if(objeto->sprite==sprite_PuertaPortal_B){
   5C54 7B            [ 4]  643 	ld	a, e
   5C55 D6 1B         [ 7]  644 	sub	a, #0x1b
   5C57 20 16         [12]  645 	jr	NZ,00152$
                            646 ;src/gameObject/gameObject.c:139: cpct_drawSprite(PortalDoor_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5C59 46            [ 7]  647 	ld	b, (hl)
   5C5A 4A            [ 4]  648 	ld	c, d
   5C5B C5            [11]  649 	push	bc
   5C5C CD BE 9D      [17]  650 	call	_calcularPosicionEnPantalla
   5C5F F1            [10]  651 	pop	af
   5C60 01 38 50      [10]  652 	ld	bc, #_PortalDoor_B_0+0
   5C63 11 04 10      [10]  653 	ld	de, #0x1004
   5C66 D5            [11]  654 	push	de
   5C67 E5            [11]  655 	push	hl
   5C68 C5            [11]  656 	push	bc
   5C69 CD 17 A8      [17]  657 	call	_cpct_drawSprite
   5C6C C3 33 5E      [10]  658 	jp	00237$
   5C6F                     659 00152$:
                            660 ;src/gameObject/gameObject.c:140: }else if(objeto->sprite==sprite_Puerta_G){
   5C6F 7B            [ 4]  661 	ld	a, e
   5C70 D6 1E         [ 7]  662 	sub	a, #0x1e
   5C72 20 16         [12]  663 	jr	NZ,00149$
                            664 ;src/gameObject/gameObject.c:141: cpct_drawSprite(Door_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5C74 46            [ 7]  665 	ld	b, (hl)
   5C75 4A            [ 4]  666 	ld	c, d
   5C76 C5            [11]  667 	push	bc
   5C77 CD BE 9D      [17]  668 	call	_calcularPosicionEnPantalla
   5C7A F1            [10]  669 	pop	af
   5C7B 01 3F 4F      [10]  670 	ld	bc, #_Door_G_0+0
   5C7E 11 04 10      [10]  671 	ld	de, #0x1004
   5C81 D5            [11]  672 	push	de
   5C82 E5            [11]  673 	push	hl
   5C83 C5            [11]  674 	push	bc
   5C84 CD 17 A8      [17]  675 	call	_cpct_drawSprite
   5C87 C3 33 5E      [10]  676 	jp	00237$
   5C8A                     677 00149$:
                            678 ;src/gameObject/gameObject.c:142: }else if(objeto->sprite==sprite_Puerta_B){
   5C8A 7B            [ 4]  679 	ld	a, e
   5C8B D6 1F         [ 7]  680 	sub	a, #0x1f
   5C8D 20 16         [12]  681 	jr	NZ,00146$
                            682 ;src/gameObject/gameObject.c:143: cpct_drawSprite(Door_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5C8F 46            [ 7]  683 	ld	b, (hl)
   5C90 4A            [ 4]  684 	ld	c, d
   5C91 C5            [11]  685 	push	bc
   5C92 CD BE 9D      [17]  686 	call	_calcularPosicionEnPantalla
   5C95 F1            [10]  687 	pop	af
   5C96 01 EC 4E      [10]  688 	ld	bc, #_Door_B_0+0
   5C99 11 04 10      [10]  689 	ld	de, #0x1004
   5C9C D5            [11]  690 	push	de
   5C9D E5            [11]  691 	push	hl
   5C9E C5            [11]  692 	push	bc
   5C9F CD 17 A8      [17]  693 	call	_cpct_drawSprite
   5CA2 C3 33 5E      [10]  694 	jp	00237$
   5CA5                     695 00146$:
                            696 ;src/gameObject/gameObject.c:144: }else if(objeto->sprite==sprite_StairUp1_G){
   5CA5 7B            [ 4]  697 	ld	a, e
   5CA6 D6 20         [ 7]  698 	sub	a, #0x20
   5CA8 20 16         [12]  699 	jr	NZ,00143$
                            700 ;src/gameObject/gameObject.c:145: cpct_drawSprite(StairUp1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5CAA 46            [ 7]  701 	ld	b, (hl)
   5CAB 4A            [ 4]  702 	ld	c, d
   5CAC C5            [11]  703 	push	bc
   5CAD CD BE 9D      [17]  704 	call	_calcularPosicionEnPantalla
   5CB0 F1            [10]  705 	pop	af
   5CB1 01 99 4E      [10]  706 	ld	bc, #_StairUp1_G_0+0
   5CB4 11 04 10      [10]  707 	ld	de, #0x1004
   5CB7 D5            [11]  708 	push	de
   5CB8 E5            [11]  709 	push	hl
   5CB9 C5            [11]  710 	push	bc
   5CBA CD 17 A8      [17]  711 	call	_cpct_drawSprite
   5CBD C3 33 5E      [10]  712 	jp	00237$
   5CC0                     713 00143$:
                            714 ;src/gameObject/gameObject.c:146: }else if(objeto->sprite==sprite_StairUp1_B){
   5CC0 7B            [ 4]  715 	ld	a, e
   5CC1 D6 21         [ 7]  716 	sub	a, #0x21
   5CC3 20 16         [12]  717 	jr	NZ,00140$
                            718 ;src/gameObject/gameObject.c:147: cpct_drawSprite(StairUp1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5CC5 46            [ 7]  719 	ld	b, (hl)
   5CC6 4A            [ 4]  720 	ld	c, d
   5CC7 C5            [11]  721 	push	bc
   5CC8 CD BE 9D      [17]  722 	call	_calcularPosicionEnPantalla
   5CCB F1            [10]  723 	pop	af
   5CCC 01 46 4E      [10]  724 	ld	bc, #_StairUp1_B_0+0
   5CCF 11 04 10      [10]  725 	ld	de, #0x1004
   5CD2 D5            [11]  726 	push	de
   5CD3 E5            [11]  727 	push	hl
   5CD4 C5            [11]  728 	push	bc
   5CD5 CD 17 A8      [17]  729 	call	_cpct_drawSprite
   5CD8 C3 33 5E      [10]  730 	jp	00237$
   5CDB                     731 00140$:
                            732 ;src/gameObject/gameObject.c:148: }else if(objeto->sprite==sprite_StairDown1_G){
   5CDB 7B            [ 4]  733 	ld	a, e
   5CDC D6 22         [ 7]  734 	sub	a, #0x22
   5CDE 20 16         [12]  735 	jr	NZ,00137$
                            736 ;src/gameObject/gameObject.c:149: cpct_drawSprite(StairDown1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5CE0 46            [ 7]  737 	ld	b, (hl)
   5CE1 4A            [ 4]  738 	ld	c, d
   5CE2 C5            [11]  739 	push	bc
   5CE3 CD BE 9D      [17]  740 	call	_calcularPosicionEnPantalla
   5CE6 F1            [10]  741 	pop	af
   5CE7 01 F3 4D      [10]  742 	ld	bc, #_StairDown1_G_0+0
   5CEA 11 04 10      [10]  743 	ld	de, #0x1004
   5CED D5            [11]  744 	push	de
   5CEE E5            [11]  745 	push	hl
   5CEF C5            [11]  746 	push	bc
   5CF0 CD 17 A8      [17]  747 	call	_cpct_drawSprite
   5CF3 C3 33 5E      [10]  748 	jp	00237$
   5CF6                     749 00137$:
                            750 ;src/gameObject/gameObject.c:150: }else if(objeto->sprite==sprite_StairDown1_B){
   5CF6 7B            [ 4]  751 	ld	a, e
   5CF7 D6 23         [ 7]  752 	sub	a, #0x23
   5CF9 20 16         [12]  753 	jr	NZ,00134$
                            754 ;src/gameObject/gameObject.c:151: cpct_drawSprite(StairDown1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5CFB 46            [ 7]  755 	ld	b, (hl)
   5CFC 4A            [ 4]  756 	ld	c, d
   5CFD C5            [11]  757 	push	bc
   5CFE CD BE 9D      [17]  758 	call	_calcularPosicionEnPantalla
   5D01 F1            [10]  759 	pop	af
   5D02 01 A0 4D      [10]  760 	ld	bc, #_StairDown1_B_0+0
   5D05 11 04 10      [10]  761 	ld	de, #0x1004
   5D08 D5            [11]  762 	push	de
   5D09 E5            [11]  763 	push	hl
   5D0A C5            [11]  764 	push	bc
   5D0B CD 17 A8      [17]  765 	call	_cpct_drawSprite
   5D0E C3 33 5E      [10]  766 	jp	00237$
   5D11                     767 00134$:
                            768 ;src/gameObject/gameObject.c:152: }else if(objeto->sprite==sprite_hole){
   5D11 7B            [ 4]  769 	ld	a, e
   5D12 D6 24         [ 7]  770 	sub	a, #0x24
   5D14 20 16         [12]  771 	jr	NZ,00131$
                            772 ;src/gameObject/gameObject.c:153: cpct_drawSprite(Block_Hole_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5D16 46            [ 7]  773 	ld	b, (hl)
   5D17 4A            [ 4]  774 	ld	c, d
   5D18 C5            [11]  775 	push	bc
   5D19 CD BE 9D      [17]  776 	call	_calcularPosicionEnPantalla
   5D1C F1            [10]  777 	pop	af
   5D1D 01 4D 4D      [10]  778 	ld	bc, #_Block_Hole_0+0
   5D20 11 04 10      [10]  779 	ld	de, #0x1004
   5D23 D5            [11]  780 	push	de
   5D24 E5            [11]  781 	push	hl
   5D25 C5            [11]  782 	push	bc
   5D26 CD 17 A8      [17]  783 	call	_cpct_drawSprite
   5D29 C3 33 5E      [10]  784 	jp	00237$
   5D2C                     785 00131$:
                            786 ;src/gameObject/gameObject.c:154: }else if(objeto->sprite==sprite_amstrad){
   5D2C 7B            [ 4]  787 	ld	a, e
   5D2D D6 2E         [ 7]  788 	sub	a, #0x2e
   5D2F 20 16         [12]  789 	jr	NZ,00128$
                            790 ;src/gameObject/gameObject.c:155: cpct_drawSprite(Amstrad_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5D31 46            [ 7]  791 	ld	b, (hl)
   5D32 4A            [ 4]  792 	ld	c, d
   5D33 C5            [11]  793 	push	bc
   5D34 CD BE 9D      [17]  794 	call	_calcularPosicionEnPantalla
   5D37 F1            [10]  795 	pop	af
   5D38 01 72 4A      [10]  796 	ld	bc, #_Amstrad_0+0
   5D3B 11 04 10      [10]  797 	ld	de, #0x1004
   5D3E D5            [11]  798 	push	de
   5D3F E5            [11]  799 	push	hl
   5D40 C5            [11]  800 	push	bc
   5D41 CD 17 A8      [17]  801 	call	_cpct_drawSprite
   5D44 C3 33 5E      [10]  802 	jp	00237$
   5D47                     803 00128$:
                            804 ;src/gameObject/gameObject.c:156: }else if(objeto->sprite==sprite_PrinceofPersia1_G){
   5D47 7B            [ 4]  805 	ld	a, e
   5D48 D6 30         [ 7]  806 	sub	a, #0x30
   5D4A 20 16         [12]  807 	jr	NZ,00125$
                            808 ;src/gameObject/gameObject.c:157: cpct_drawSprite(PrinceOfPersia_PJ_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5D4C 46            [ 7]  809 	ld	b, (hl)
   5D4D 4A            [ 4]  810 	ld	c, d
   5D4E C5            [11]  811 	push	bc
   5D4F CD BE 9D      [17]  812 	call	_calcularPosicionEnPantalla
   5D52 F1            [10]  813 	pop	af
   5D53 01 CC 49      [10]  814 	ld	bc, #_PrinceOfPersia_PJ_G_0+0
   5D56 11 04 10      [10]  815 	ld	de, #0x1004
   5D59 D5            [11]  816 	push	de
   5D5A E5            [11]  817 	push	hl
   5D5B C5            [11]  818 	push	bc
   5D5C CD 17 A8      [17]  819 	call	_cpct_drawSprite
   5D5F C3 33 5E      [10]  820 	jp	00237$
   5D62                     821 00125$:
                            822 ;src/gameObject/gameObject.c:158: }else if(objeto->sprite==sprite_PrinceofPersia1_B){
   5D62 7B            [ 4]  823 	ld	a, e
   5D63 D6 31         [ 7]  824 	sub	a, #0x31
   5D65 20 16         [12]  825 	jr	NZ,00122$
                            826 ;src/gameObject/gameObject.c:159: cpct_drawSprite(PrinceOfPersia_PJ_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5D67 46            [ 7]  827 	ld	b, (hl)
   5D68 4A            [ 4]  828 	ld	c, d
   5D69 C5            [11]  829 	push	bc
   5D6A CD BE 9D      [17]  830 	call	_calcularPosicionEnPantalla
   5D6D F1            [10]  831 	pop	af
   5D6E 01 79 49      [10]  832 	ld	bc, #_PrinceOfPersia_PJ_B_0+0
   5D71 11 04 10      [10]  833 	ld	de, #0x1004
   5D74 D5            [11]  834 	push	de
   5D75 E5            [11]  835 	push	hl
   5D76 C5            [11]  836 	push	bc
   5D77 CD 17 A8      [17]  837 	call	_cpct_drawSprite
   5D7A C3 33 5E      [10]  838 	jp	00237$
   5D7D                     839 00122$:
                            840 ;src/gameObject/gameObject.c:160: }else if(objeto->sprite==sprite_PrinceofPersia2_G){
   5D7D 7B            [ 4]  841 	ld	a, e
   5D7E D6 32         [ 7]  842 	sub	a, #0x32
   5D80 20 16         [12]  843 	jr	NZ,00119$
                            844 ;src/gameObject/gameObject.c:161: cpct_drawSprite(PrinceOfPersia_ENE_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5D82 46            [ 7]  845 	ld	b, (hl)
   5D83 4A            [ 4]  846 	ld	c, d
   5D84 C5            [11]  847 	push	bc
   5D85 CD BE 9D      [17]  848 	call	_calcularPosicionEnPantalla
   5D88 F1            [10]  849 	pop	af
   5D89 01 26 49      [10]  850 	ld	bc, #_PrinceOfPersia_ENE_G_0+0
   5D8C 11 04 10      [10]  851 	ld	de, #0x1004
   5D8F D5            [11]  852 	push	de
   5D90 E5            [11]  853 	push	hl
   5D91 C5            [11]  854 	push	bc
   5D92 CD 17 A8      [17]  855 	call	_cpct_drawSprite
   5D95 C3 33 5E      [10]  856 	jp	00237$
   5D98                     857 00119$:
                            858 ;src/gameObject/gameObject.c:162: }else if(objeto->sprite==sprite_PrinceofPersia2_B){
   5D98 7B            [ 4]  859 	ld	a, e
   5D99 D6 33         [ 7]  860 	sub	a, #0x33
   5D9B 20 16         [12]  861 	jr	NZ,00116$
                            862 ;src/gameObject/gameObject.c:163: cpct_drawSprite(PrinceOfPersia_ENE_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5D9D 46            [ 7]  863 	ld	b, (hl)
   5D9E 4A            [ 4]  864 	ld	c, d
   5D9F C5            [11]  865 	push	bc
   5DA0 CD BE 9D      [17]  866 	call	_calcularPosicionEnPantalla
   5DA3 F1            [10]  867 	pop	af
   5DA4 01 D3 48      [10]  868 	ld	bc, #_PrinceOfPersia_ENE_B_0+0
   5DA7 11 04 10      [10]  869 	ld	de, #0x1004
   5DAA D5            [11]  870 	push	de
   5DAB E5            [11]  871 	push	hl
   5DAC C5            [11]  872 	push	bc
   5DAD CD 17 A8      [17]  873 	call	_cpct_drawSprite
   5DB0 C3 33 5E      [10]  874 	jp	00237$
   5DB3                     875 00116$:
                            876 ;src/gameObject/gameObject.c:164: }else if(objeto->sprite==sprite_PrinceofPersia3){
   5DB3 7B            [ 4]  877 	ld	a, e
   5DB4 D6 34         [ 7]  878 	sub	a, #0x34
   5DB6 20 15         [12]  879 	jr	NZ,00113$
                            880 ;src/gameObject/gameObject.c:165: cpct_drawSprite(PrinceOfPersia_COVER_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5DB8 46            [ 7]  881 	ld	b, (hl)
   5DB9 4A            [ 4]  882 	ld	c, d
   5DBA C5            [11]  883 	push	bc
   5DBB CD BE 9D      [17]  884 	call	_calcularPosicionEnPantalla
   5DBE F1            [10]  885 	pop	af
   5DBF 01 80 48      [10]  886 	ld	bc, #_PrinceOfPersia_COVER_0+0
   5DC2 11 04 10      [10]  887 	ld	de, #0x1004
   5DC5 D5            [11]  888 	push	de
   5DC6 E5            [11]  889 	push	hl
   5DC7 C5            [11]  890 	push	bc
   5DC8 CD 17 A8      [17]  891 	call	_cpct_drawSprite
   5DCB 18 66         [12]  892 	jr	00237$
   5DCD                     893 00113$:
                            894 ;src/gameObject/gameObject.c:166: }else if(objeto->sprite==sprite_enemigo1){
   5DCD 7B            [ 4]  895 	ld	a, e
   5DCE D6 2A         [ 7]  896 	sub	a, #0x2a
   5DD0 20 15         [12]  897 	jr	NZ,00110$
                            898 ;src/gameObject/gameObject.c:167: cpct_drawSprite(Enemy_01_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5DD2 46            [ 7]  899 	ld	b, (hl)
   5DD3 4A            [ 4]  900 	ld	c, d
   5DD4 C5            [11]  901 	push	bc
   5DD5 CD BE 9D      [17]  902 	call	_calcularPosicionEnPantalla
   5DD8 F1            [10]  903 	pop	af
   5DD9 01 6B 4B      [10]  904 	ld	bc, #_Enemy_01_0+0
   5DDC 11 04 10      [10]  905 	ld	de, #0x1004
   5DDF D5            [11]  906 	push	de
   5DE0 E5            [11]  907 	push	hl
   5DE1 C5            [11]  908 	push	bc
   5DE2 CD 17 A8      [17]  909 	call	_cpct_drawSprite
   5DE5 18 4C         [12]  910 	jr	00237$
   5DE7                     911 00110$:
                            912 ;src/gameObject/gameObject.c:168: }else if(objeto->sprite==sprite_zul1_1){
   5DE7 7B            [ 4]  913 	ld	a, e
   5DE8 D6 2C         [ 7]  914 	sub	a, #0x2c
   5DEA 20 15         [12]  915 	jr	NZ,00107$
                            916 ;src/gameObject/gameObject.c:169: cpct_drawSprite(zul1_1_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5DEC 46            [ 7]  917 	ld	b, (hl)
   5DED 4A            [ 4]  918 	ld	c, d
   5DEE C5            [11]  919 	push	bc
   5DEF CD BE 9D      [17]  920 	call	_calcularPosicionEnPantalla
   5DF2 F1            [10]  921 	pop	af
   5DF3 01 18 4B      [10]  922 	ld	bc, #_zul1_1_0+0
   5DF6 11 04 10      [10]  923 	ld	de, #0x1004
   5DF9 D5            [11]  924 	push	de
   5DFA E5            [11]  925 	push	hl
   5DFB C5            [11]  926 	push	bc
   5DFC CD 17 A8      [17]  927 	call	_cpct_drawSprite
   5DFF 18 32         [12]  928 	jr	00237$
   5E01                     929 00107$:
                            930 ;src/gameObject/gameObject.c:170: }else if(objeto->sprite==sprite_zul1_2){
   5E01 7B            [ 4]  931 	ld	a, e
   5E02 D6 2D         [ 7]  932 	sub	a, #0x2d
   5E04 20 15         [12]  933 	jr	NZ,00104$
                            934 ;src/gameObject/gameObject.c:171: cpct_drawSprite(zul1_2_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5E06 46            [ 7]  935 	ld	b, (hl)
   5E07 4A            [ 4]  936 	ld	c, d
   5E08 C5            [11]  937 	push	bc
   5E09 CD BE 9D      [17]  938 	call	_calcularPosicionEnPantalla
   5E0C F1            [10]  939 	pop	af
   5E0D 01 C5 4A      [10]  940 	ld	bc, #_zul1_2_0+0
   5E10 11 04 10      [10]  941 	ld	de, #0x1004
   5E13 D5            [11]  942 	push	de
   5E14 E5            [11]  943 	push	hl
   5E15 C5            [11]  944 	push	bc
   5E16 CD 17 A8      [17]  945 	call	_cpct_drawSprite
   5E19 18 18         [12]  946 	jr	00237$
   5E1B                     947 00104$:
                            948 ;src/gameObject/gameObject.c:172: }else if(objeto->sprite==sprite_RockInmovil6_B){
   5E1B 7B            [ 4]  949 	ld	a, e
   5E1C D6 12         [ 7]  950 	sub	a, #0x12
   5E1E 20 13         [12]  951 	jr	NZ,00237$
                            952 ;src/gameObject/gameObject.c:173: cpct_drawSprite(Block_Static6_BB_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5E20 46            [ 7]  953 	ld	b, (hl)
   5E21 4A            [ 4]  954 	ld	c, d
   5E22 C5            [11]  955 	push	bc
   5E23 CD BE 9D      [17]  956 	call	_calcularPosicionEnPantalla
   5E26 F1            [10]  957 	pop	af
   5E27 01 C9 53      [10]  958 	ld	bc, #_Block_Static6_BB_0+0
   5E2A 11 04 10      [10]  959 	ld	de, #0x1004
   5E2D D5            [11]  960 	push	de
   5E2E E5            [11]  961 	push	hl
   5E2F C5            [11]  962 	push	bc
   5E30 CD 17 A8      [17]  963 	call	_cpct_drawSprite
   5E33                     964 00237$:
   5E33 DD E1         [14]  965 	pop	ix
   5E35 C9            [10]  966 	ret
                            967 ;src/gameObject/gameObject.c:178: void dibujarGameObjectCol(TGameObjectCol* objeto){
                            968 ;	---------------------------------
                            969 ; Function dibujarGameObjectCol
                            970 ; ---------------------------------
   5E36                     971 _dibujarGameObjectCol::
   5E36 DD E5         [15]  972 	push	ix
   5E38 DD 21 00 00   [14]  973 	ld	ix,#0
   5E3C DD 39         [15]  974 	add	ix,sp
                            975 ;src/gameObject/gameObject.c:179: if(objeto->posx!=0){
   5E3E DD 4E 04      [19]  976 	ld	c,4 (ix)
   5E41 DD 46 05      [19]  977 	ld	b,5 (ix)
   5E44 69            [ 4]  978 	ld	l, c
   5E45 60            [ 4]  979 	ld	h, b
   5E46 23            [ 6]  980 	inc	hl
   5E47 56            [ 7]  981 	ld	d, (hl)
   5E48 7A            [ 4]  982 	ld	a, d
   5E49 B7            [ 4]  983 	or	a, a
   5E4A CA F6 5E      [10]  984 	jp	Z, 00120$
                            985 ;src/gameObject/gameObject.c:180: if(objeto->sprite==sprite_luz){
   5E4D 69            [ 4]  986 	ld	l, c
   5E4E 60            [ 4]  987 	ld	h, b
   5E4F 23            [ 6]  988 	inc	hl
   5E50 23            [ 6]  989 	inc	hl
   5E51 23            [ 6]  990 	inc	hl
   5E52 5E            [ 7]  991 	ld	e, (hl)
                            992 ;src/gameObject/gameObject.c:181: cpct_drawSprite(LuzAzul_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   5E53 69            [ 4]  993 	ld	l, c
   5E54 60            [ 4]  994 	ld	h, b
   5E55 23            [ 6]  995 	inc	hl
   5E56 23            [ 6]  996 	inc	hl
                            997 ;src/gameObject/gameObject.c:180: if(objeto->sprite==sprite_luz){
   5E57 7B            [ 4]  998 	ld	a, e
   5E58 D6 25         [ 7]  999 	sub	a, #0x25
   5E5A 20 18         [12] 1000 	jr	NZ,00116$
                           1001 ;src/gameObject/gameObject.c:181: cpct_drawSprite(LuzAzul_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   5E5C 46            [ 7] 1002 	ld	b, (hl)
   5E5D 4A            [ 4] 1003 	ld	c, d
   5E5E C5            [11] 1004 	push	bc
   5E5F CD BE 9D      [17] 1005 	call	_calcularPosicionEnPantalla
   5E62 F1            [10] 1006 	pop	af
   5E63 4D            [ 4] 1007 	ld	c, l
   5E64 44            [ 4] 1008 	ld	b, h
   5E65 21 04 10      [10] 1009 	ld	hl, #0x1004
   5E68 E5            [11] 1010 	push	hl
   5E69 C5            [11] 1011 	push	bc
   5E6A 21 FA 4C      [10] 1012 	ld	hl, #_LuzAzul_0
   5E6D E5            [11] 1013 	push	hl
   5E6E CD 17 A8      [17] 1014 	call	_cpct_drawSprite
   5E71 C3 F6 5E      [10] 1015 	jp	00120$
   5E74                    1016 00116$:
                           1017 ;src/gameObject/gameObject.c:182: }else if(objeto->sprite==sprite_familia1){
   5E74 7B            [ 4] 1018 	ld	a, e
   5E75 D6 26         [ 7] 1019 	sub	a, #0x26
   5E77 20 17         [12] 1020 	jr	NZ,00113$
                           1021 ;src/gameObject/gameObject.c:183: cpct_drawSprite(Character_Brother_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5E79 46            [ 7] 1022 	ld	b, (hl)
   5E7A 4A            [ 4] 1023 	ld	c, d
   5E7B C5            [11] 1024 	push	bc
   5E7C CD BE 9D      [17] 1025 	call	_calcularPosicionEnPantalla
   5E7F F1            [10] 1026 	pop	af
   5E80 4D            [ 4] 1027 	ld	c, l
   5E81 44            [ 4] 1028 	ld	b, h
   5E82 21 04 10      [10] 1029 	ld	hl, #0x1004
   5E85 E5            [11] 1030 	push	hl
   5E86 C5            [11] 1031 	push	bc
   5E87 21 B7 4C      [10] 1032 	ld	hl, #_Character_Brother_0
   5E8A E5            [11] 1033 	push	hl
   5E8B CD 17 A8      [17] 1034 	call	_cpct_drawSprite
   5E8E 18 66         [12] 1035 	jr	00120$
   5E90                    1036 00113$:
                           1037 ;src/gameObject/gameObject.c:184: }else if(objeto->sprite==sprite_familia2){
   5E90 7B            [ 4] 1038 	ld	a, e
   5E91 D6 27         [ 7] 1039 	sub	a, #0x27
   5E93 20 15         [12] 1040 	jr	NZ,00110$
                           1041 ;src/gameObject/gameObject.c:185: cpct_drawSprite(Character_Sister_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5E95 46            [ 7] 1042 	ld	b, (hl)
   5E96 4A            [ 4] 1043 	ld	c, d
   5E97 C5            [11] 1044 	push	bc
   5E98 CD BE 9D      [17] 1045 	call	_calcularPosicionEnPantalla
   5E9B F1            [10] 1046 	pop	af
   5E9C 01 64 4C      [10] 1047 	ld	bc, #_Character_Sister_0+0
   5E9F 11 04 10      [10] 1048 	ld	de, #0x1004
   5EA2 D5            [11] 1049 	push	de
   5EA3 E5            [11] 1050 	push	hl
   5EA4 C5            [11] 1051 	push	bc
   5EA5 CD 17 A8      [17] 1052 	call	_cpct_drawSprite
   5EA8 18 4C         [12] 1053 	jr	00120$
   5EAA                    1054 00110$:
                           1055 ;src/gameObject/gameObject.c:186: }else if(objeto->sprite==sprite_familia3){
   5EAA 7B            [ 4] 1056 	ld	a, e
   5EAB D6 28         [ 7] 1057 	sub	a, #0x28
   5EAD 20 15         [12] 1058 	jr	NZ,00107$
                           1059 ;src/gameObject/gameObject.c:187: cpct_drawSprite(Character_Mother_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5EAF 46            [ 7] 1060 	ld	b, (hl)
   5EB0 4A            [ 4] 1061 	ld	c, d
   5EB1 C5            [11] 1062 	push	bc
   5EB2 CD BE 9D      [17] 1063 	call	_calcularPosicionEnPantalla
   5EB5 F1            [10] 1064 	pop	af
   5EB6 01 11 4C      [10] 1065 	ld	bc, #_Character_Mother_0+0
   5EB9 11 04 10      [10] 1066 	ld	de, #0x1004
   5EBC D5            [11] 1067 	push	de
   5EBD E5            [11] 1068 	push	hl
   5EBE C5            [11] 1069 	push	bc
   5EBF CD 17 A8      [17] 1070 	call	_cpct_drawSprite
   5EC2 18 32         [12] 1071 	jr	00120$
   5EC4                    1072 00107$:
                           1073 ;src/gameObject/gameObject.c:188: }else if(objeto->sprite==sprite_familia4){
   5EC4 7B            [ 4] 1074 	ld	a, e
   5EC5 D6 29         [ 7] 1075 	sub	a, #0x29
   5EC7 20 15         [12] 1076 	jr	NZ,00104$
                           1077 ;src/gameObject/gameObject.c:189: cpct_drawSprite(Character_Father_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5EC9 46            [ 7] 1078 	ld	b, (hl)
   5ECA 4A            [ 4] 1079 	ld	c, d
   5ECB C5            [11] 1080 	push	bc
   5ECC CD BE 9D      [17] 1081 	call	_calcularPosicionEnPantalla
   5ECF F1            [10] 1082 	pop	af
   5ED0 01 BE 4B      [10] 1083 	ld	bc, #_Character_Father_0+0
   5ED3 11 04 10      [10] 1084 	ld	de, #0x1004
   5ED6 D5            [11] 1085 	push	de
   5ED7 E5            [11] 1086 	push	hl
   5ED8 C5            [11] 1087 	push	bc
   5ED9 CD 17 A8      [17] 1088 	call	_cpct_drawSprite
   5EDC 18 18         [12] 1089 	jr	00120$
   5EDE                    1090 00104$:
                           1091 ;src/gameObject/gameObject.c:190: }else if(objeto->sprite==sprite_amstradTape){
   5EDE 7B            [ 4] 1092 	ld	a, e
   5EDF D6 2F         [ 7] 1093 	sub	a, #0x2f
   5EE1 20 13         [12] 1094 	jr	NZ,00120$
                           1095 ;src/gameObject/gameObject.c:191: cpct_drawSprite(PrinceOfPersia_Tape_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   5EE3 46            [ 7] 1096 	ld	b, (hl)
   5EE4 4A            [ 4] 1097 	ld	c, d
   5EE5 C5            [11] 1098 	push	bc
   5EE6 CD BE 9D      [17] 1099 	call	_calcularPosicionEnPantalla
   5EE9 F1            [10] 1100 	pop	af
   5EEA 01 1F 4A      [10] 1101 	ld	bc, #_PrinceOfPersia_Tape_0+0
   5EED 11 04 10      [10] 1102 	ld	de, #0x1004
   5EF0 D5            [11] 1103 	push	de
   5EF1 E5            [11] 1104 	push	hl
   5EF2 C5            [11] 1105 	push	bc
   5EF3 CD 17 A8      [17] 1106 	call	_cpct_drawSprite
   5EF6                    1107 00120$:
   5EF6 DD E1         [14] 1108 	pop	ix
   5EF8 C9            [10] 1109 	ret
                           1110 ;src/gameObject/gameObject.c:195: void dibujarGameObjectColSprite(u8 sprite,u8 posx, u8 posy){
                           1111 ;	---------------------------------
                           1112 ; Function dibujarGameObjectColSprite
                           1113 ; ---------------------------------
   5EF9                    1114 _dibujarGameObjectColSprite::
   5EF9 DD E5         [15] 1115 	push	ix
   5EFB DD 21 00 00   [14] 1116 	ld	ix,#0
   5EFF DD 39         [15] 1117 	add	ix,sp
                           1118 ;src/gameObject/gameObject.c:197: cpct_drawSprite(LuzAzul_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);  
   5F01 DD 6E 06      [19] 1119 	ld	l, 6 (ix)
   5F04 26 00         [ 7] 1120 	ld	h, #0x00
   5F06 DD 5E 05      [19] 1121 	ld	e, 5 (ix)
   5F09 16 00         [ 7] 1122 	ld	d, #0x00
   5F0B 29            [11] 1123 	add	hl, hl
   5F0C 29            [11] 1124 	add	hl, hl
   5F0D 29            [11] 1125 	add	hl, hl
   5F0E 29            [11] 1126 	add	hl, hl
   5F0F 4D            [ 4] 1127 	ld	c, l
   5F10 44            [ 4] 1128 	ld	b, h
   5F11 EB            [ 4] 1129 	ex	de,hl
   5F12 29            [11] 1130 	add	hl, hl
   5F13 29            [11] 1131 	add	hl, hl
   5F14 59            [ 4] 1132 	ld	e, c
   5F15 50            [ 4] 1133 	ld	d, b
   5F16 CB 2A         [ 8] 1134 	sra	d
   5F18 CB 1B         [ 8] 1135 	rr	e
   5F1A CB 2A         [ 8] 1136 	sra	d
   5F1C CB 1B         [ 8] 1137 	rr	e
   5F1E CB 2A         [ 8] 1138 	sra	d
   5F20 CB 1B         [ 8] 1139 	rr	e
   5F22 79            [ 4] 1140 	ld	a, c
   5F23 E6 07         [ 7] 1141 	and	a, #0x07
   5F25 4F            [ 4] 1142 	ld	c, a
   5F26 23            [ 6] 1143 	inc	hl
   5F27 E5            [11] 1144 	push	hl
   5F28 FD E1         [14] 1145 	pop	iy
   5F2A 79            [ 4] 1146 	ld	a, c
   5F2B 07            [ 4] 1147 	rlca
   5F2C 07            [ 4] 1148 	rlca
   5F2D 07            [ 4] 1149 	rlca
   5F2E E6 F8         [ 7] 1150 	and	a, #0xf8
   5F30 47            [ 4] 1151 	ld	b, a
   5F31 0E 00         [ 7] 1152 	ld	c, #0x00
   5F33 6B            [ 4] 1153 	ld	l, e
   5F34 62            [ 4] 1154 	ld	h, d
   5F35 29            [11] 1155 	add	hl, hl
   5F36 29            [11] 1156 	add	hl, hl
   5F37 19            [11] 1157 	add	hl, de
   5F38 29            [11] 1158 	add	hl, hl
   5F39 29            [11] 1159 	add	hl, hl
   5F3A 29            [11] 1160 	add	hl, hl
   5F3B 29            [11] 1161 	add	hl, hl
   5F3C 11 00 C0      [10] 1162 	ld	de, #0xc000
   5F3F 19            [11] 1163 	add	hl, de
   5F40 09            [11] 1164 	add	hl,bc
   5F41 4D            [ 4] 1165 	ld	c, l
   5F42 44            [ 4] 1166 	ld	b, h
   5F43 FD 09         [15] 1167 	add	iy, bc
   5F45 FD E5         [15] 1168 	push	iy
   5F47 C1            [10] 1169 	pop	bc
                           1170 ;src/gameObject/gameObject.c:196: if(sprite==sprite_luz){
   5F48 DD 7E 04      [19] 1171 	ld	a, 4 (ix)
   5F4B D6 25         [ 7] 1172 	sub	a, #0x25
   5F4D 20 0E         [12] 1173 	jr	NZ,00116$
                           1174 ;src/gameObject/gameObject.c:197: cpct_drawSprite(LuzAzul_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);  
   5F4F 21 04 10      [10] 1175 	ld	hl, #0x1004
   5F52 E5            [11] 1176 	push	hl
   5F53 C5            [11] 1177 	push	bc
   5F54 21 FA 4C      [10] 1178 	ld	hl, #_LuzAzul_0
   5F57 E5            [11] 1179 	push	hl
   5F58 CD 17 A8      [17] 1180 	call	_cpct_drawSprite
   5F5B 18 67         [12] 1181 	jr	00118$
   5F5D                    1182 00116$:
                           1183 ;src/gameObject/gameObject.c:198: }else if(sprite==sprite_familia1){
   5F5D DD 7E 04      [19] 1184 	ld	a, 4 (ix)
   5F60 D6 26         [ 7] 1185 	sub	a, #0x26
   5F62 20 0E         [12] 1186 	jr	NZ,00113$
                           1187 ;src/gameObject/gameObject.c:199: cpct_drawSprite(Character_Brother_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
   5F64 21 04 10      [10] 1188 	ld	hl, #0x1004
   5F67 E5            [11] 1189 	push	hl
   5F68 C5            [11] 1190 	push	bc
   5F69 21 B7 4C      [10] 1191 	ld	hl, #_Character_Brother_0
   5F6C E5            [11] 1192 	push	hl
   5F6D CD 17 A8      [17] 1193 	call	_cpct_drawSprite
   5F70 18 52         [12] 1194 	jr	00118$
   5F72                    1195 00113$:
                           1196 ;src/gameObject/gameObject.c:200: }else if(sprite==sprite_familia2){
   5F72 DD 7E 04      [19] 1197 	ld	a, 4 (ix)
   5F75 D6 27         [ 7] 1198 	sub	a, #0x27
   5F77 20 0E         [12] 1199 	jr	NZ,00110$
                           1200 ;src/gameObject/gameObject.c:201: cpct_drawSprite(Character_Sister_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
   5F79 21 04 10      [10] 1201 	ld	hl, #0x1004
   5F7C E5            [11] 1202 	push	hl
   5F7D C5            [11] 1203 	push	bc
   5F7E 21 64 4C      [10] 1204 	ld	hl, #_Character_Sister_0
   5F81 E5            [11] 1205 	push	hl
   5F82 CD 17 A8      [17] 1206 	call	_cpct_drawSprite
   5F85 18 3D         [12] 1207 	jr	00118$
   5F87                    1208 00110$:
                           1209 ;src/gameObject/gameObject.c:202: }else if(sprite==sprite_familia3){
   5F87 DD 7E 04      [19] 1210 	ld	a, 4 (ix)
   5F8A D6 28         [ 7] 1211 	sub	a, #0x28
   5F8C 20 0E         [12] 1212 	jr	NZ,00107$
                           1213 ;src/gameObject/gameObject.c:203: cpct_drawSprite(Character_Mother_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
   5F8E 21 04 10      [10] 1214 	ld	hl, #0x1004
   5F91 E5            [11] 1215 	push	hl
   5F92 C5            [11] 1216 	push	bc
   5F93 21 11 4C      [10] 1217 	ld	hl, #_Character_Mother_0
   5F96 E5            [11] 1218 	push	hl
   5F97 CD 17 A8      [17] 1219 	call	_cpct_drawSprite
   5F9A 18 28         [12] 1220 	jr	00118$
   5F9C                    1221 00107$:
                           1222 ;src/gameObject/gameObject.c:204: }else if(sprite==sprite_familia4){
   5F9C DD 7E 04      [19] 1223 	ld	a, 4 (ix)
   5F9F D6 29         [ 7] 1224 	sub	a, #0x29
   5FA1 20 0E         [12] 1225 	jr	NZ,00104$
                           1226 ;src/gameObject/gameObject.c:205: cpct_drawSprite(Character_Father_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
   5FA3 21 04 10      [10] 1227 	ld	hl, #0x1004
   5FA6 E5            [11] 1228 	push	hl
   5FA7 C5            [11] 1229 	push	bc
   5FA8 21 BE 4B      [10] 1230 	ld	hl, #_Character_Father_0
   5FAB E5            [11] 1231 	push	hl
   5FAC CD 17 A8      [17] 1232 	call	_cpct_drawSprite
   5FAF 18 13         [12] 1233 	jr	00118$
   5FB1                    1234 00104$:
                           1235 ;src/gameObject/gameObject.c:206: }else if(sprite==sprite_amstradTape){        
   5FB1 DD 7E 04      [19] 1236 	ld	a, 4 (ix)
   5FB4 D6 2F         [ 7] 1237 	sub	a, #0x2f
   5FB6 20 0C         [12] 1238 	jr	NZ,00118$
                           1239 ;src/gameObject/gameObject.c:207: cpct_drawSprite(PrinceOfPersia_Tape_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
   5FB8 21 04 10      [10] 1240 	ld	hl, #0x1004
   5FBB E5            [11] 1241 	push	hl
   5FBC C5            [11] 1242 	push	bc
   5FBD 21 1F 4A      [10] 1243 	ld	hl, #_PrinceOfPersia_Tape_0
   5FC0 E5            [11] 1244 	push	hl
   5FC1 CD 17 A8      [17] 1245 	call	_cpct_drawSprite
   5FC4                    1246 00118$:
   5FC4 DD E1         [14] 1247 	pop	ix
   5FC6 C9            [10] 1248 	ret
                           1249 ;src/gameObject/gameObject.c:212: void limpiarRastro(u8 posx, u8 posy){
                           1250 ;	---------------------------------
                           1251 ; Function limpiarRastro
                           1252 ; ---------------------------------
   5FC7                    1253 _limpiarRastro::
                           1254 ;src/gameObject/gameObject.c:213: cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
   5FC7 21 03 00      [10] 1255 	ld	hl, #3+0
   5FCA 39            [11] 1256 	add	hl, sp
   5FCB 7E            [ 7] 1257 	ld	a, (hl)
   5FCC F5            [11] 1258 	push	af
   5FCD 33            [ 6] 1259 	inc	sp
   5FCE 21 03 00      [10] 1260 	ld	hl, #3+0
   5FD1 39            [11] 1261 	add	hl, sp
   5FD2 7E            [ 7] 1262 	ld	a, (hl)
   5FD3 F5            [11] 1263 	push	af
   5FD4 33            [ 6] 1264 	inc	sp
   5FD5 CD BE 9D      [17] 1265 	call	_calcularPosicionEnPantalla
   5FD8 F1            [10] 1266 	pop	af
   5FD9 01 04 10      [10] 1267 	ld	bc, #0x1004
   5FDC C5            [11] 1268 	push	bc
   5FDD 01 00 00      [10] 1269 	ld	bc, #0x0000
   5FE0 C5            [11] 1270 	push	bc
   5FE1 E5            [11] 1271 	push	hl
   5FE2 CD F6 A9      [17] 1272 	call	_cpct_drawSolidBox
   5FE5 C9            [10] 1273 	ret
                           1274 ;src/gameObject/gameObject.c:215: u8 moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
                           1275 ;	---------------------------------
                           1276 ; Function moverGameObject
                           1277 ; ---------------------------------
   5FE6                    1278 _moverGameObject::
   5FE6 DD E5         [15] 1279 	push	ix
   5FE8 DD 21 00 00   [14] 1280 	ld	ix,#0
   5FEC DD 39         [15] 1281 	add	ix,sp
                           1282 ;src/gameObject/gameObject.c:216: if(objeto->sprite==sprite_Player){
   5FEE DD 4E 04      [19] 1283 	ld	c,4 (ix)
   5FF1 DD 46 05      [19] 1284 	ld	b,5 (ix)
   5FF4 69            [ 4] 1285 	ld	l, c
   5FF5 60            [ 4] 1286 	ld	h, b
   5FF6 23            [ 6] 1287 	inc	hl
   5FF7 23            [ 6] 1288 	inc	hl
   5FF8 23            [ 6] 1289 	inc	hl
   5FF9 5E            [ 7] 1290 	ld	e, (hl)
   5FFA 1D            [ 4] 1291 	dec	e
   5FFB 20 28         [12] 1292 	jr	NZ,00102$
                           1293 ;src/gameObject/gameObject.c:217: return moverTipoPlayer(objeto,movimiento,rocasCol,rocasEspejo,posicion);
   5FFD DD 6E 0B      [19] 1294 	ld	l,11 (ix)
   6000 DD 66 0C      [19] 1295 	ld	h,12 (ix)
   6003 E5            [11] 1296 	push	hl
   6004 DD 6E 09      [19] 1297 	ld	l,9 (ix)
   6007 DD 66 0A      [19] 1298 	ld	h,10 (ix)
   600A E5            [11] 1299 	push	hl
   600B DD 6E 07      [19] 1300 	ld	l,7 (ix)
   600E DD 66 08      [19] 1301 	ld	h,8 (ix)
   6011 E5            [11] 1302 	push	hl
   6012 DD 7E 06      [19] 1303 	ld	a, 6 (ix)
   6015 F5            [11] 1304 	push	af
   6016 33            [ 6] 1305 	inc	sp
   6017 C5            [11] 1306 	push	bc
   6018 CD 87 62      [17] 1307 	call	_moverTipoPlayer
   601B FD 21 09 00   [14] 1308 	ld	iy, #9
   601F FD 39         [15] 1309 	add	iy, sp
   6021 FD F9         [10] 1310 	ld	sp, iy
   6023 18 26         [12] 1311 	jr	00104$
   6025                    1312 00102$:
                           1313 ;src/gameObject/gameObject.c:219: return moverTipoRoca(objeto,movimiento,rocasCol,rocasEspejo,posicion);
   6025 DD 6E 0B      [19] 1314 	ld	l,11 (ix)
   6028 DD 66 0C      [19] 1315 	ld	h,12 (ix)
   602B E5            [11] 1316 	push	hl
   602C DD 6E 09      [19] 1317 	ld	l,9 (ix)
   602F DD 66 0A      [19] 1318 	ld	h,10 (ix)
   6032 E5            [11] 1319 	push	hl
   6033 DD 6E 07      [19] 1320 	ld	l,7 (ix)
   6036 DD 66 08      [19] 1321 	ld	h,8 (ix)
   6039 E5            [11] 1322 	push	hl
   603A DD 7E 06      [19] 1323 	ld	a, 6 (ix)
   603D F5            [11] 1324 	push	af
   603E 33            [ 6] 1325 	inc	sp
   603F C5            [11] 1326 	push	bc
   6040 CD D2 64      [17] 1327 	call	_moverTipoRoca
   6043 FD 21 09 00   [14] 1328 	ld	iy, #9
   6047 FD 39         [15] 1329 	add	iy, sp
   6049 FD F9         [10] 1330 	ld	sp, iy
   604B                    1331 00104$:
   604B DD E1         [14] 1332 	pop	ix
   604D C9            [10] 1333 	ret
                           1334 ;src/gameObject/gameObject.c:223: void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocasEspejo,u8 posicion,u8 numMovimientos){
                           1335 ;	---------------------------------
                           1336 ; Function moverElEspejo
                           1337 ; ---------------------------------
   604E                    1338 _moverElEspejo::
   604E DD E5         [15] 1339 	push	ix
   6050 DD 21 00 00   [14] 1340 	ld	ix,#0
   6054 DD 39         [15] 1341 	add	ix,sp
   6056 21 F3 FF      [10] 1342 	ld	hl, #-13
   6059 39            [11] 1343 	add	hl, sp
   605A F9            [ 6] 1344 	ld	sp, hl
                           1345 ;src/gameObject/gameObject.c:225: u8 nextMovimiento=movimiento;
   605B DD 4E 05      [19] 1346 	ld	c, 5 (ix)
                           1347 ;src/gameObject/gameObject.c:230: if(movimiento==mover_Izquierda){
   605E 79            [ 4] 1348 	ld	a, c
   605F 3D            [ 4] 1349 	dec	a
   6060 20 02         [12] 1350 	jr	NZ,00102$
                           1351 ;src/gameObject/gameObject.c:231: nextMovimiento=mover_Derecha;
   6062 0E 03         [ 7] 1352 	ld	c, #0x03
   6064                    1353 00102$:
                           1354 ;src/gameObject/gameObject.c:232: }if(movimiento==mover_Derecha){
   6064 DD 7E 05      [19] 1355 	ld	a, 5 (ix)
   6067 D6 03         [ 7] 1356 	sub	a, #0x03
   6069 20 02         [12] 1357 	jr	NZ,00104$
                           1358 ;src/gameObject/gameObject.c:233: nextMovimiento=mover_Izquierda;
   606B 0E 01         [ 7] 1359 	ld	c, #0x01
   606D                    1360 00104$:
                           1361 ;src/gameObject/gameObject.c:236: if(posicion==posicion_Izquieda){
   606D DD 7E 08      [19] 1362 	ld	a, 8 (ix)
   6070 B7            [ 4] 1363 	or	a, a
   6071 20 06         [12] 1364 	jr	NZ,00106$
                           1365 ;src/gameObject/gameObject.c:237: posicion=posicion_Derecha;
   6073 DD 36 08 01   [19] 1366 	ld	8 (ix), #0x01
   6077 18 04         [12] 1367 	jr	00145$
   6079                    1368 00106$:
                           1369 ;src/gameObject/gameObject.c:239: posicion=posicion_Izquieda;
   6079 DD 36 08 00   [19] 1370 	ld	8 (ix), #0x00
                           1371 ;src/gameObject/gameObject.c:242: for(u8 i=0;i<RocasMaximas;i++){
   607D                    1372 00145$:
   607D 06 00         [ 7] 1373 	ld	b, #0x00
   607F                    1374 00128$:
   607F 78            [ 4] 1375 	ld	a, b
   6080 D6 28         [ 7] 1376 	sub	a, #0x28
   6082 D2 C3 61      [10] 1377 	jp	NC, 00130$
                           1378 ;src/gameObject/gameObject.c:243: if(rocasEspejo[i].num==num){
   6085 58            [ 4] 1379 	ld	e,b
   6086 16 00         [ 7] 1380 	ld	d,#0x00
   6088 6B            [ 4] 1381 	ld	l, e
   6089 62            [ 4] 1382 	ld	h, d
   608A 29            [11] 1383 	add	hl, hl
   608B 19            [11] 1384 	add	hl, de
   608C 29            [11] 1385 	add	hl, hl
   608D 19            [11] 1386 	add	hl, de
   608E EB            [ 4] 1387 	ex	de,hl
   608F DD 7E 06      [19] 1388 	ld	a, 6 (ix)
   6092 83            [ 4] 1389 	add	a, e
   6093 5F            [ 4] 1390 	ld	e, a
   6094 DD 7E 07      [19] 1391 	ld	a, 7 (ix)
   6097 8A            [ 4] 1392 	adc	a, d
   6098 57            [ 4] 1393 	ld	d, a
   6099 1A            [ 7] 1394 	ld	a, (de)
   609A DD 77 FB      [19] 1395 	ld	-5 (ix), a
   609D DD 7E 04      [19] 1396 	ld	a, 4 (ix)
   60A0 DD 96 FB      [19] 1397 	sub	a, -5 (ix)
   60A3 C2 BF 61      [10] 1398 	jp	NZ,00129$
                           1399 ;src/gameObject/gameObject.c:244: objetoEspejo=&rocasEspejo[i];              
                           1400 ;src/gameObject/gameObject.c:246: nextPosx=objetoEspejo->posx;
   60A6 DD 73 F7      [19] 1401 	ld	-9 (ix), e
   60A9 DD 72 F8      [19] 1402 	ld	-8 (ix), d
   60AC 13            [ 6] 1403 	inc	de
   60AD 1A            [ 7] 1404 	ld	a, (de)
   60AE DD 77 FB      [19] 1405 	ld	-5 (ix), a
   60B1 DD 77 F6      [19] 1406 	ld	-10 (ix), a
                           1407 ;src/gameObject/gameObject.c:247: nextPosy=objetoEspejo->posy;
   60B4 DD 6E F7      [19] 1408 	ld	l,-9 (ix)
   60B7 DD 66 F8      [19] 1409 	ld	h,-8 (ix)
   60BA 23            [ 6] 1410 	inc	hl
   60BB 23            [ 6] 1411 	inc	hl
   60BC 7E            [ 7] 1412 	ld	a, (hl)
   60BD DD 77 F5      [19] 1413 	ld	-11 (ix), a
                           1414 ;src/gameObject/gameObject.c:248: if(objetoEspejo->posx!=0){
   60C0 DD 7E FB      [19] 1415 	ld	a, -5 (ix)
   60C3 B7            [ 4] 1416 	or	a, a
   60C4 CA BF 61      [10] 1417 	jp	Z, 00129$
                           1418 ;src/gameObject/gameObject.c:249: posicionObjeto=SinColision;
   60C7 DD 36 F4 32   [19] 1419 	ld	-12 (ix), #0x32
                           1420 ;src/gameObject/gameObject.c:250: for(u8 i=0;i<numMovimientos;i++){
   60CB DD 75 FC      [19] 1421 	ld	-4 (ix), l
   60CE DD 74 FD      [19] 1422 	ld	-3 (ix), h
   60D1 DD 73 F9      [19] 1423 	ld	-7 (ix), e
   60D4 DD 72 FA      [19] 1424 	ld	-6 (ix), d
   60D7 DD 36 F3 00   [19] 1425 	ld	-13 (ix), #0x00
   60DB                    1426 00125$:
   60DB DD 7E F3      [19] 1427 	ld	a, -13 (ix)
   60DE DD 96 09      [19] 1428 	sub	a, 9 (ix)
   60E1 D2 BF 61      [10] 1429 	jp	NC, 00129$
                           1430 ;src/gameObject/gameObject.c:251: if(posicionObjeto==SinColision){
   60E4 DD 7E F4      [19] 1431 	ld	a, -12 (ix)
   60E7 D6 32         [ 7] 1432 	sub	a, #0x32
   60E9 C2 B9 61      [10] 1433 	jp	NZ,00126$
                           1434 ;src/gameObject/gameObject.c:252: nextMovimiento=calcularMaximosyMinimos(nextMovimiento,objetoEspejo->posx,objetoEspejo->posy,posicion);            
   60EC DD 6E FC      [19] 1435 	ld	l,-4 (ix)
   60EF DD 66 FD      [19] 1436 	ld	h,-3 (ix)
   60F2 5E            [ 7] 1437 	ld	e, (hl)
   60F3 DD 6E F9      [19] 1438 	ld	l,-7 (ix)
   60F6 DD 66 FA      [19] 1439 	ld	h,-6 (ix)
   60F9 56            [ 7] 1440 	ld	d, (hl)
   60FA C5            [11] 1441 	push	bc
   60FB DD 7E 08      [19] 1442 	ld	a, 8 (ix)
   60FE F5            [11] 1443 	push	af
   60FF 33            [ 6] 1444 	inc	sp
   6100 7B            [ 4] 1445 	ld	a, e
   6101 F5            [11] 1446 	push	af
   6102 33            [ 6] 1447 	inc	sp
   6103 59            [ 4] 1448 	ld	e, c
   6104 D5            [11] 1449 	push	de
   6105 CD 04 9E      [17] 1450 	call	_calcularMaximosyMinimos
   6108 F1            [10] 1451 	pop	af
   6109 F1            [10] 1452 	pop	af
   610A C1            [10] 1453 	pop	bc
   610B 4D            [ 4] 1454 	ld	c, l
                           1455 ;src/gameObject/gameObject.c:253: if(nextMovimiento!=mover_SinMovimiento){
   610C 79            [ 4] 1456 	ld	a, c
   610D B7            [ 4] 1457 	or	a, a
   610E CA B9 61      [10] 1458 	jp	Z, 00126$
                           1459 ;src/gameObject/gameObject.c:254: posicionObjeto=colisionesSiguientePosicion(objetoEspejo,objetoEspejo->posx,objetoEspejo->posy,nextMovimiento,rocasEspejo,posicion);                                          
   6111 DD 7E 08      [19] 1460 	ld	a, 8 (ix)
   6114 DD 77 FE      [19] 1461 	ld	-2 (ix), a
   6117 DD 36 FF 00   [19] 1462 	ld	-1 (ix), #0x00
   611B DD 6E FC      [19] 1463 	ld	l,-4 (ix)
   611E DD 66 FD      [19] 1464 	ld	h,-3 (ix)
   6121 5E            [ 7] 1465 	ld	e, (hl)
   6122 DD 6E F9      [19] 1466 	ld	l,-7 (ix)
   6125 DD 66 FA      [19] 1467 	ld	h,-6 (ix)
   6128 56            [ 7] 1468 	ld	d, (hl)
   6129 C5            [11] 1469 	push	bc
   612A DD 6E FE      [19] 1470 	ld	l,-2 (ix)
   612D DD 66 FF      [19] 1471 	ld	h,-1 (ix)
   6130 E5            [11] 1472 	push	hl
   6131 DD 6E 06      [19] 1473 	ld	l,6 (ix)
   6134 DD 66 07      [19] 1474 	ld	h,7 (ix)
   6137 E5            [11] 1475 	push	hl
   6138 79            [ 4] 1476 	ld	a, c
   6139 F5            [11] 1477 	push	af
   613A 33            [ 6] 1478 	inc	sp
   613B 7B            [ 4] 1479 	ld	a, e
   613C F5            [11] 1480 	push	af
   613D 33            [ 6] 1481 	inc	sp
   613E D5            [11] 1482 	push	de
   613F 33            [ 6] 1483 	inc	sp
   6140 DD 6E F7      [19] 1484 	ld	l,-9 (ix)
   6143 DD 66 F8      [19] 1485 	ld	h,-8 (ix)
   6146 E5            [11] 1486 	push	hl
   6147 CD 2A 68      [17] 1487 	call	_colisionesSiguientePosicion
   614A FD 21 09 00   [14] 1488 	ld	iy, #9
   614E FD 39         [15] 1489 	add	iy, sp
   6150 FD F9         [10] 1490 	ld	sp, iy
   6152 C1            [10] 1491 	pop	bc
                           1492 ;src/gameObject/gameObject.c:251: if(posicionObjeto==SinColision){
   6153 DD 75 F4      [19] 1493 	ld	-12 (ix), l
   6156 7D            [ 4] 1494 	ld	a, l
   6157 D6 32         [ 7] 1495 	sub	a, #0x32
   6159 20 04         [12] 1496 	jr	NZ,00198$
   615B 3E 01         [ 7] 1497 	ld	a,#0x01
   615D 18 01         [12] 1498 	jr	00199$
   615F                    1499 00198$:
   615F AF            [ 4] 1500 	xor	a,a
   6160                    1501 00199$:
                           1502 ;src/gameObject/gameObject.c:255: if(posicionObjeto==SinColision){
   6160 B7            [ 4] 1503 	or	a, a
   6161 28 2A         [12] 1504 	jr	Z,00112$
                           1505 ;src/gameObject/gameObject.c:256: mover1casilla(&nextPosx,&nextPosy,nextMovimiento);                                                                                 
   6163 21 02 00      [10] 1506 	ld	hl, #0x0002
   6166 39            [11] 1507 	add	hl, sp
   6167 EB            [ 4] 1508 	ex	de,hl
   6168 21 03 00      [10] 1509 	ld	hl, #0x0003
   616B 39            [11] 1510 	add	hl, sp
   616C C5            [11] 1511 	push	bc
   616D 79            [ 4] 1512 	ld	a, c
   616E F5            [11] 1513 	push	af
   616F 33            [ 6] 1514 	inc	sp
   6170 D5            [11] 1515 	push	de
   6171 E5            [11] 1516 	push	hl
   6172 CD 3A 67      [17] 1517 	call	_mover1casilla
   6175 F1            [10] 1518 	pop	af
   6176 33            [ 6] 1519 	inc	sp
   6177 DD 66 F5      [19] 1520 	ld	h, -11 (ix)
   617A DD 6E F6      [19] 1521 	ld	l, -10 (ix)
   617D E3            [19] 1522 	ex	(sp),hl
   617E DD 6E F7      [19] 1523 	ld	l,-9 (ix)
   6181 DD 66 F8      [19] 1524 	ld	h,-8 (ix)
   6184 E5            [11] 1525 	push	hl
   6185 CD D6 61      [17] 1526 	call	_moverYdibujar
   6188 F1            [10] 1527 	pop	af
   6189 F1            [10] 1528 	pop	af
   618A C1            [10] 1529 	pop	bc
   618B 18 2C         [12] 1530 	jr	00126$
   618D                    1531 00112$:
                           1532 ;src/gameObject/gameObject.c:259: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
   618D B7            [ 4] 1533 	or	a, a
   618E 20 29         [12] 1534 	jr	NZ,00126$
   6190 DD 7E F4      [19] 1535 	ld	a, -12 (ix)
   6193 D6 33         [ 7] 1536 	sub	a, #0x33
   6195 28 22         [12] 1537 	jr	Z,00126$
                           1538 ;src/gameObject/gameObject.c:260: taparHole(objetoEspejo,&rocasEspejo[posicionObjeto]);                                
   6197 DD 5E F4      [19] 1539 	ld	e,-12 (ix)
   619A 16 00         [ 7] 1540 	ld	d,#0x00
   619C 6B            [ 4] 1541 	ld	l, e
   619D 62            [ 4] 1542 	ld	h, d
   619E 29            [11] 1543 	add	hl, hl
   619F 19            [11] 1544 	add	hl, de
   61A0 29            [11] 1545 	add	hl, hl
   61A1 19            [11] 1546 	add	hl, de
   61A2 EB            [ 4] 1547 	ex	de,hl
   61A3 DD 6E 06      [19] 1548 	ld	l,6 (ix)
   61A6 DD 66 07      [19] 1549 	ld	h,7 (ix)
   61A9 19            [11] 1550 	add	hl, de
   61AA C5            [11] 1551 	push	bc
   61AB E5            [11] 1552 	push	hl
   61AC DD 6E F7      [19] 1553 	ld	l,-9 (ix)
   61AF DD 66 F8      [19] 1554 	ld	h,-8 (ix)
   61B2 E5            [11] 1555 	push	hl
   61B3 CD 11 62      [17] 1556 	call	_taparHole
   61B6 F1            [10] 1557 	pop	af
   61B7 F1            [10] 1558 	pop	af
   61B8 C1            [10] 1559 	pop	bc
   61B9                    1560 00126$:
                           1561 ;src/gameObject/gameObject.c:250: for(u8 i=0;i<numMovimientos;i++){
   61B9 DD 34 F3      [23] 1562 	inc	-13 (ix)
   61BC C3 DB 60      [10] 1563 	jp	00125$
   61BF                    1564 00129$:
                           1565 ;src/gameObject/gameObject.c:242: for(u8 i=0;i<RocasMaximas;i++){
   61BF 04            [ 4] 1566 	inc	b
   61C0 C3 7F 60      [10] 1567 	jp	00128$
   61C3                    1568 00130$:
   61C3 DD F9         [10] 1569 	ld	sp, ix
   61C5 DD E1         [14] 1570 	pop	ix
   61C7 C9            [10] 1571 	ret
                           1572 ;src/gameObject/gameObject.c:272: void cambiarPosicion(u8* posicion){    
                           1573 ;	---------------------------------
                           1574 ; Function cambiarPosicion
                           1575 ; ---------------------------------
   61C8                    1576 _cambiarPosicion::
                           1577 ;src/gameObject/gameObject.c:273: if(*posicion==posicion_Izquieda){
   61C8 C1            [10] 1578 	pop	bc
   61C9 E1            [10] 1579 	pop	hl
   61CA E5            [11] 1580 	push	hl
   61CB C5            [11] 1581 	push	bc
   61CC 7E            [ 7] 1582 	ld	a, (hl)
   61CD B7            [ 4] 1583 	or	a, a
   61CE 20 03         [12] 1584 	jr	NZ,00102$
                           1585 ;src/gameObject/gameObject.c:274: *posicion=posicion_Derecha;        
   61D0 36 01         [10] 1586 	ld	(hl), #0x01
   61D2 C9            [10] 1587 	ret
   61D3                    1588 00102$:
                           1589 ;src/gameObject/gameObject.c:276: *posicion=posicion_Izquieda;       
   61D3 36 00         [10] 1590 	ld	(hl), #0x00
   61D5 C9            [10] 1591 	ret
                           1592 ;src/gameObject/gameObject.c:281: void moverYdibujar(TGameObject* objeto,u8 posx,u8 posy){
                           1593 ;	---------------------------------
                           1594 ; Function moverYdibujar
                           1595 ; ---------------------------------
   61D6                    1596 _moverYdibujar::
   61D6 DD E5         [15] 1597 	push	ix
   61D8 DD 21 00 00   [14] 1598 	ld	ix,#0
   61DC DD 39         [15] 1599 	add	ix,sp
   61DE F5            [11] 1600 	push	af
                           1601 ;src/gameObject/gameObject.c:282: limpiarRastro(objeto->posx,objeto->posy);    
   61DF DD 4E 04      [19] 1602 	ld	c,4 (ix)
   61E2 DD 46 05      [19] 1603 	ld	b,5 (ix)
   61E5 21 02 00      [10] 1604 	ld	hl, #0x0002
   61E8 09            [11] 1605 	add	hl,bc
   61E9 E3            [19] 1606 	ex	(sp), hl
   61EA E1            [10] 1607 	pop	hl
   61EB E5            [11] 1608 	push	hl
   61EC 5E            [ 7] 1609 	ld	e, (hl)
   61ED 69            [ 4] 1610 	ld	l, c
   61EE 60            [ 4] 1611 	ld	h, b
   61EF 23            [ 6] 1612 	inc	hl
   61F0 56            [ 7] 1613 	ld	d, (hl)
   61F1 E5            [11] 1614 	push	hl
   61F2 C5            [11] 1615 	push	bc
   61F3 7B            [ 4] 1616 	ld	a, e
   61F4 F5            [11] 1617 	push	af
   61F5 33            [ 6] 1618 	inc	sp
   61F6 D5            [11] 1619 	push	de
   61F7 33            [ 6] 1620 	inc	sp
   61F8 CD C7 5F      [17] 1621 	call	_limpiarRastro
   61FB F1            [10] 1622 	pop	af
   61FC C1            [10] 1623 	pop	bc
   61FD E1            [10] 1624 	pop	hl
                           1625 ;src/gameObject/gameObject.c:283: objeto->posx=posx;
   61FE DD 7E 06      [19] 1626 	ld	a, 6 (ix)
   6201 77            [ 7] 1627 	ld	(hl), a
                           1628 ;src/gameObject/gameObject.c:284: objeto->posy=posy;
   6202 E1            [10] 1629 	pop	hl
   6203 E5            [11] 1630 	push	hl
   6204 DD 7E 07      [19] 1631 	ld	a, 7 (ix)
   6207 77            [ 7] 1632 	ld	(hl), a
                           1633 ;src/gameObject/gameObject.c:285: dibujarGameObject(objeto);
   6208 C5            [11] 1634 	push	bc
   6209 CD 57 59      [17] 1635 	call	_dibujarGameObject
   620C DD F9         [10] 1636 	ld	sp,ix
   620E DD E1         [14] 1637 	pop	ix
   6210 C9            [10] 1638 	ret
                           1639 ;src/gameObject/gameObject.c:287: void taparHole(TGameObject* roca,TGameObject* hole){
                           1640 ;	---------------------------------
                           1641 ; Function taparHole
                           1642 ; ---------------------------------
   6211                    1643 _taparHole::
   6211 DD E5         [15] 1644 	push	ix
   6213 DD 21 00 00   [14] 1645 	ld	ix,#0
   6217 DD 39         [15] 1646 	add	ix,sp
   6219 21 FA FF      [10] 1647 	ld	hl, #-6
   621C 39            [11] 1648 	add	hl, sp
   621D F9            [ 6] 1649 	ld	sp, hl
                           1650 ;src/gameObject/gameObject.c:288: if(hole->sprite==sprite_hole){
   621E DD 4E 06      [19] 1651 	ld	c,6 (ix)
   6221 DD 46 07      [19] 1652 	ld	b,7 (ix)
   6224 69            [ 4] 1653 	ld	l, c
   6225 60            [ 4] 1654 	ld	h, b
   6226 23            [ 6] 1655 	inc	hl
   6227 23            [ 6] 1656 	inc	hl
   6228 23            [ 6] 1657 	inc	hl
   6229 7E            [ 7] 1658 	ld	a, (hl)
   622A D6 24         [ 7] 1659 	sub	a, #0x24
   622C 20 54         [12] 1660 	jr	NZ,00103$
                           1661 ;src/gameObject/gameObject.c:289: limpiarRastro(roca->posx,roca->posy);
   622E DD 5E 04      [19] 1662 	ld	e,4 (ix)
   6231 DD 56 05      [19] 1663 	ld	d,5 (ix)
   6234 21 02 00      [10] 1664 	ld	hl, #0x0002
   6237 19            [11] 1665 	add	hl,de
   6238 E3            [19] 1666 	ex	(sp), hl
   6239 E1            [10] 1667 	pop	hl
   623A E5            [11] 1668 	push	hl
   623B 7E            [ 7] 1669 	ld	a, (hl)
   623C DD 77 FE      [19] 1670 	ld	-2 (ix), a
   623F 13            [ 6] 1671 	inc	de
   6240 DD 73 FC      [19] 1672 	ld	-4 (ix), e
   6243 DD 72 FD      [19] 1673 	ld	-3 (ix), d
   6246 6B            [ 4] 1674 	ld	l, e
   6247 62            [ 4] 1675 	ld	h, d
   6248 56            [ 7] 1676 	ld	d, (hl)
   6249 C5            [11] 1677 	push	bc
   624A DD 7E FE      [19] 1678 	ld	a, -2 (ix)
   624D F5            [11] 1679 	push	af
   624E 33            [ 6] 1680 	inc	sp
   624F D5            [11] 1681 	push	de
   6250 33            [ 6] 1682 	inc	sp
   6251 CD C7 5F      [17] 1683 	call	_limpiarRastro
   6254 F1            [10] 1684 	pop	af
   6255 C1            [10] 1685 	pop	bc
                           1686 ;src/gameObject/gameObject.c:290: limpiarRastro(hole->posx,hole->posy);
   6256 59            [ 4] 1687 	ld	e, c
   6257 50            [ 4] 1688 	ld	d, b
   6258 13            [ 6] 1689 	inc	de
   6259 13            [ 6] 1690 	inc	de
   625A 1A            [ 7] 1691 	ld	a, (de)
   625B DD 77 FE      [19] 1692 	ld	-2 (ix), a
   625E 03            [ 6] 1693 	inc	bc
   625F 0A            [ 7] 1694 	ld	a, (bc)
   6260 DD 77 FF      [19] 1695 	ld	-1 (ix), a
   6263 C5            [11] 1696 	push	bc
   6264 D5            [11] 1697 	push	de
   6265 DD 66 FE      [19] 1698 	ld	h, -2 (ix)
   6268 DD 6E FF      [19] 1699 	ld	l, -1 (ix)
   626B E5            [11] 1700 	push	hl
   626C CD C7 5F      [17] 1701 	call	_limpiarRastro
   626F F1            [10] 1702 	pop	af
   6270 D1            [10] 1703 	pop	de
   6271 C1            [10] 1704 	pop	bc
                           1705 ;src/gameObject/gameObject.c:291: roca->posx=0;
   6272 DD 6E FC      [19] 1706 	ld	l,-4 (ix)
   6275 DD 66 FD      [19] 1707 	ld	h,-3 (ix)
   6278 36 00         [10] 1708 	ld	(hl), #0x00
                           1709 ;src/gameObject/gameObject.c:292: roca->posy=0;
   627A E1            [10] 1710 	pop	hl
   627B E5            [11] 1711 	push	hl
   627C 36 00         [10] 1712 	ld	(hl), #0x00
                           1713 ;src/gameObject/gameObject.c:293: hole->posx=0;
   627E AF            [ 4] 1714 	xor	a, a
   627F 02            [ 7] 1715 	ld	(bc), a
                           1716 ;src/gameObject/gameObject.c:294: hole->posy=0;
   6280 AF            [ 4] 1717 	xor	a, a
   6281 12            [ 7] 1718 	ld	(de), a
   6282                    1719 00103$:
   6282 DD F9         [10] 1720 	ld	sp, ix
   6284 DD E1         [14] 1721 	pop	ix
   6286 C9            [10] 1722 	ret
                           1723 ;src/gameObject/gameObject.c:304: u8 moverTipoPlayer(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
                           1724 ;	---------------------------------
                           1725 ; Function moverTipoPlayer
                           1726 ; ---------------------------------
   6287                    1727 _moverTipoPlayer::
   6287 DD E5         [15] 1728 	push	ix
   6289 DD 21 00 00   [14] 1729 	ld	ix,#0
   628D DD 39         [15] 1730 	add	ix,sp
   628F 21 F1 FF      [10] 1731 	ld	hl, #-15
   6292 39            [11] 1732 	add	hl, sp
   6293 F9            [ 6] 1733 	ld	sp, hl
                           1734 ;src/gameObject/gameObject.c:305: if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){           
   6294 DD 7E 04      [19] 1735 	ld	a, 4 (ix)
   6297 DD 77 FA      [19] 1736 	ld	-6 (ix), a
   629A DD 7E 05      [19] 1737 	ld	a, 5 (ix)
   629D DD 77 FB      [19] 1738 	ld	-5 (ix), a
   62A0 DD 7E FA      [19] 1739 	ld	a, -6 (ix)
   62A3 C6 05         [ 7] 1740 	add	a, #0x05
   62A5 DD 77 FD      [19] 1741 	ld	-3 (ix), a
   62A8 DD 7E FB      [19] 1742 	ld	a, -5 (ix)
   62AB CE 00         [ 7] 1743 	adc	a, #0x00
   62AD DD 77 FE      [19] 1744 	ld	-2 (ix), a
   62B0 DD 6E FD      [19] 1745 	ld	l,-3 (ix)
   62B3 DD 66 FE      [19] 1746 	ld	h,-2 (ix)
   62B6 4E            [ 7] 1747 	ld	c, (hl)
   62B7 79            [ 4] 1748 	ld	a, c
   62B8 B7            [ 4] 1749 	or	a, a
   62B9 28 0E         [12] 1750 	jr	Z,00117$
   62BB DD 6E FA      [19] 1751 	ld	l,-6 (ix)
   62BE DD 66 FB      [19] 1752 	ld	h,-5 (ix)
   62C1 23            [ 6] 1753 	inc	hl
   62C2 23            [ 6] 1754 	inc	hl
   62C3 23            [ 6] 1755 	inc	hl
   62C4 46            [ 7] 1756 	ld	b, (hl)
   62C5 05            [ 4] 1757 	dec	b
   62C6 CA C3 64      [10] 1758 	jp	Z,00118$
   62C9                    1759 00117$:
                           1760 ;src/gameObject/gameObject.c:306: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);            
   62C9 DD 4E 0B      [19] 1761 	ld	c,11 (ix)
   62CC DD 46 0C      [19] 1762 	ld	b,12 (ix)
   62CF 0A            [ 7] 1763 	ld	a, (bc)
   62D0 DD 77 FF      [19] 1764 	ld	-1 (ix), a
   62D3 DD 7E FA      [19] 1765 	ld	a, -6 (ix)
   62D6 C6 02         [ 7] 1766 	add	a, #0x02
   62D8 DD 77 F8      [19] 1767 	ld	-8 (ix), a
   62DB DD 7E FB      [19] 1768 	ld	a, -5 (ix)
   62DE CE 00         [ 7] 1769 	adc	a, #0x00
   62E0 DD 77 F9      [19] 1770 	ld	-7 (ix), a
   62E3 DD 6E F8      [19] 1771 	ld	l,-8 (ix)
   62E6 DD 66 F9      [19] 1772 	ld	h,-7 (ix)
   62E9 7E            [ 7] 1773 	ld	a, (hl)
   62EA DD 77 FC      [19] 1774 	ld	-4 (ix), a
   62ED DD 5E FA      [19] 1775 	ld	e,-6 (ix)
   62F0 DD 56 FB      [19] 1776 	ld	d,-5 (ix)
   62F3 13            [ 6] 1777 	inc	de
   62F4 1A            [ 7] 1778 	ld	a, (de)
   62F5 DD 77 F5      [19] 1779 	ld	-11 (ix), a
   62F8 C5            [11] 1780 	push	bc
   62F9 D5            [11] 1781 	push	de
   62FA DD 66 FF      [19] 1782 	ld	h, -1 (ix)
   62FD DD 6E FC      [19] 1783 	ld	l, -4 (ix)
   6300 E5            [11] 1784 	push	hl
   6301 DD 66 F5      [19] 1785 	ld	h, -11 (ix)
   6304 DD 6E 06      [19] 1786 	ld	l, 6 (ix)
   6307 E5            [11] 1787 	push	hl
   6308 CD 04 9E      [17] 1788 	call	_calcularMaximosyMinimos
   630B F1            [10] 1789 	pop	af
   630C F1            [10] 1790 	pop	af
   630D DD 75 F5      [19] 1791 	ld	-11 (ix), l
   6310 D1            [10] 1792 	pop	de
   6311 C1            [10] 1793 	pop	bc
                           1794 ;src/gameObject/gameObject.c:307: if(movimiento!=mover_SinMovimiento){                  
   6312 DD 7E F5      [19] 1795 	ld	a, -11 (ix)
   6315 B7            [ 4] 1796 	or	a, a
   6316 CA CB 64      [10] 1797 	jp	Z, 00119$
                           1798 ;src/gameObject/gameObject.c:308: u8 nextPosx=objeto->posx;
   6319 1A            [ 7] 1799 	ld	a, (de)
   631A DD 77 F2      [19] 1800 	ld	-14 (ix), a
                           1801 ;src/gameObject/gameObject.c:309: u8 nextPosy=objeto->posy;
   631D DD 6E F8      [19] 1802 	ld	l,-8 (ix)
   6320 DD 66 F9      [19] 1803 	ld	h,-7 (ix)
   6323 7E            [ 7] 1804 	ld	a, (hl)
   6324 DD 77 F1      [19] 1805 	ld	-15 (ix), a
                           1806 ;src/gameObject/gameObject.c:312: u8 moverRoca=mover_roca;
   6327 DD 36 F4 00   [19] 1807 	ld	-12 (ix), #0x00
                           1808 ;src/gameObject/gameObject.c:317: mover1casilla(&nextPosx,&nextPosy,movimiento);            
   632B 21 00 00      [10] 1809 	ld	hl, #0x0000
   632E 39            [11] 1810 	add	hl, sp
   632F DD 75 F8      [19] 1811 	ld	-8 (ix), l
   6332 DD 74 F9      [19] 1812 	ld	-7 (ix), h
   6335 EB            [ 4] 1813 	ex	de,hl
   6336 21 01 00      [10] 1814 	ld	hl, #0x0001
   6339 39            [11] 1815 	add	hl, sp
   633A DD 75 F6      [19] 1816 	ld	-10 (ix), l
   633D DD 74 F7      [19] 1817 	ld	-9 (ix), h
   6340 E5            [11] 1818 	push	hl
   6341 DD 6E F6      [19] 1819 	ld	l, -10 (ix)
   6344 DD 66 F7      [19] 1820 	ld	h, -9 (ix)
   6347 E5            [11] 1821 	push	hl
   6348 FD E1         [14] 1822 	pop	iy
   634A E1            [10] 1823 	pop	hl
   634B C5            [11] 1824 	push	bc
   634C DD 7E F5      [19] 1825 	ld	a, -11 (ix)
   634F F5            [11] 1826 	push	af
   6350 33            [ 6] 1827 	inc	sp
   6351 D5            [11] 1828 	push	de
   6352 FD E5         [15] 1829 	push	iy
   6354 CD 3A 67      [17] 1830 	call	_mover1casilla
   6357 F1            [10] 1831 	pop	af
   6358 33            [ 6] 1832 	inc	sp
   6359 DD 66 F1      [19] 1833 	ld	h, -15 (ix)
   635C DD 6E F2      [19] 1834 	ld	l, -14 (ix)
   635F E3            [19] 1835 	ex	(sp),hl
   6360 CD 72 6A      [17] 1836 	call	_comprobarPuertas
   6363 F1            [10] 1837 	pop	af
   6364 5D            [ 4] 1838 	ld	e, l
   6365 C1            [10] 1839 	pop	bc
                           1840 ;src/gameObject/gameObject.c:320: if(colisionPuerta!=seguir_En_Nivel){
   6366 7B            [ 4] 1841 	ld	a, e
   6367 B7            [ 4] 1842 	or	a, a
   6368 28 04         [12] 1843 	jr	Z,00102$
                           1844 ;src/gameObject/gameObject.c:321: return colisionPuerta;
   636A 6B            [ 4] 1845 	ld	l, e
   636B C3 CD 64      [10] 1846 	jp	00121$
   636E                    1847 00102$:
                           1848 ;src/gameObject/gameObject.c:323: comprobarColeccionables(nextPosx,nextPosy,sprite_Player);            
   636E C5            [11] 1849 	push	bc
   636F D5            [11] 1850 	push	de
   6370 3E 01         [ 7] 1851 	ld	a, #0x01
   6372 F5            [11] 1852 	push	af
   6373 33            [ 6] 1853 	inc	sp
   6374 DD 66 F1      [19] 1854 	ld	h, -15 (ix)
   6377 DD 6E F2      [19] 1855 	ld	l, -14 (ix)
   637A E5            [11] 1856 	push	hl
   637B CD B8 6A      [17] 1857 	call	_comprobarColeccionables
   637E F1            [10] 1858 	pop	af
   637F 33            [ 6] 1859 	inc	sp
   6380 D1            [10] 1860 	pop	de
   6381 C1            [10] 1861 	pop	bc
                           1862 ;src/gameObject/gameObject.c:324: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);            
   6382 DD 6E F8      [19] 1863 	ld	l,-8 (ix)
   6385 DD 66 F9      [19] 1864 	ld	h,-7 (ix)
   6388 E5            [11] 1865 	push	hl
   6389 FD E1         [14] 1866 	pop	iy
   638B DD 56 F6      [19] 1867 	ld	d, -10 (ix)
   638E DD 6E F7      [19] 1868 	ld	l, -9 (ix)
   6391 DD 72 F6      [19] 1869 	ld	-10 (ix), d
   6394 DD 75 F7      [19] 1870 	ld	-9 (ix), l
   6397 C5            [11] 1871 	push	bc
   6398 D5            [11] 1872 	push	de
   6399 C5            [11] 1873 	push	bc
   639A DD 7E F5      [19] 1874 	ld	a, -11 (ix)
   639D F5            [11] 1875 	push	af
   639E 33            [ 6] 1876 	inc	sp
   639F FD E5         [15] 1877 	push	iy
   63A1 DD 6E F6      [19] 1878 	ld	l,-10 (ix)
   63A4 DD 66 F7      [19] 1879 	ld	h,-9 (ix)
   63A7 E5            [11] 1880 	push	hl
   63A8 DD 6E FA      [19] 1881 	ld	l,-6 (ix)
   63AB DD 66 FB      [19] 1882 	ld	h,-5 (ix)
   63AE E5            [11] 1883 	push	hl
   63AF CD 64 69      [17] 1884 	call	_comprobarPortales
   63B2 FD 21 09 00   [14] 1885 	ld	iy, #9
   63B6 FD 39         [15] 1886 	add	iy, sp
   63B8 FD F9         [10] 1887 	ld	sp, iy
   63BA D1            [10] 1888 	pop	de
   63BB C1            [10] 1889 	pop	bc
   63BC 55            [ 4] 1890 	ld	d, l
                           1891 ;src/gameObject/gameObject.c:325: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);            
   63BD C5            [11] 1892 	push	bc
   63BE D5            [11] 1893 	push	de
   63BF DD 6E 07      [19] 1894 	ld	l,7 (ix)
   63C2 DD 66 08      [19] 1895 	ld	h,8 (ix)
   63C5 E5            [11] 1896 	push	hl
   63C6 DD 66 F1      [19] 1897 	ld	h, -15 (ix)
   63C9 DD 6E F2      [19] 1898 	ld	l, -14 (ix)
   63CC E5            [11] 1899 	push	hl
   63CD CD 1A 69      [17] 1900 	call	_comprobarRocas
   63D0 F1            [10] 1901 	pop	af
   63D1 F1            [10] 1902 	pop	af
   63D2 D1            [10] 1903 	pop	de
   63D3 C1            [10] 1904 	pop	bc
   63D4 DD 75 F3      [19] 1905 	ld	-13 (ix), l
                           1906 ;src/gameObject/gameObject.c:326: if(colisionPortales==hay_Colision){
   63D7 15            [ 4] 1907 	dec	d
   63D8 20 2E         [12] 1908 	jr	NZ,00107$
                           1909 ;src/gameObject/gameObject.c:327: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasEspejo);
   63DA C5            [11] 1910 	push	bc
   63DB D5            [11] 1911 	push	de
   63DC DD 6E 09      [19] 1912 	ld	l,9 (ix)
   63DF DD 66 0A      [19] 1913 	ld	h,10 (ix)
   63E2 E5            [11] 1914 	push	hl
   63E3 DD 66 F1      [19] 1915 	ld	h, -15 (ix)
   63E6 DD 6E F2      [19] 1916 	ld	l, -14 (ix)
   63E9 E5            [11] 1917 	push	hl
   63EA CD 1A 69      [17] 1918 	call	_comprobarRocas
   63ED F1            [10] 1919 	pop	af
   63EE F1            [10] 1920 	pop	af
   63EF D1            [10] 1921 	pop	de
   63F0 C1            [10] 1922 	pop	bc
                           1923 ;src/gameObject/gameObject.c:328: if(ObjetoColisionado!=SinColision){
   63F1 DD 75 F3      [19] 1924 	ld	-13 (ix), l
   63F4 7D            [ 4] 1925 	ld	a, l
   63F5 D6 32         [ 7] 1926 	sub	a, #0x32
   63F7 28 06         [12] 1927 	jr	Z,00104$
                           1928 ;src/gameObject/gameObject.c:329: moverRoca=no_mover_roca;
   63F9 DD 36 F4 01   [19] 1929 	ld	-12 (ix), #0x01
   63FD 18 09         [12] 1930 	jr	00107$
   63FF                    1931 00104$:
                           1932 ;src/gameObject/gameObject.c:331: cambiarPosicion(posicion);                                   
   63FF C5            [11] 1933 	push	bc
   6400 D5            [11] 1934 	push	de
   6401 C5            [11] 1935 	push	bc
   6402 CD C8 61      [17] 1936 	call	_cambiarPosicion
   6405 F1            [10] 1937 	pop	af
   6406 D1            [10] 1938 	pop	de
   6407 C1            [10] 1939 	pop	bc
   6408                    1940 00107$:
                           1941 ;src/gameObject/gameObject.c:334: colisionEnemigo=comprobarEnemigos(nextPosx,nextPosy,*posicion);
   6408 0A            [ 7] 1942 	ld	a, (bc)
   6409 47            [ 4] 1943 	ld	b, a
   640A D5            [11] 1944 	push	de
   640B C5            [11] 1945 	push	bc
   640C 33            [ 6] 1946 	inc	sp
   640D DD 66 F1      [19] 1947 	ld	h, -15 (ix)
   6410 DD 6E F2      [19] 1948 	ld	l, -14 (ix)
   6413 E5            [11] 1949 	push	hl
   6414 CD 5F 6B      [17] 1950 	call	_comprobarEnemigos
   6417 F1            [10] 1951 	pop	af
   6418 33            [ 6] 1952 	inc	sp
   6419 D1            [10] 1953 	pop	de
                           1954 ;src/gameObject/gameObject.c:335: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision && colisionEnemigo==no_Hay_Colision){             
   641A DD 7E F3      [19] 1955 	ld	a, -13 (ix)
   641D D6 32         [ 7] 1956 	sub	a,#0x32
   641F 20 58         [12] 1957 	jr	NZ,00111$
   6421 B3            [ 4] 1958 	or	a,e
   6422 20 55         [12] 1959 	jr	NZ,00111$
   6424 B5            [ 4] 1960 	or	a,l
   6425 20 52         [12] 1961 	jr	NZ,00111$
                           1962 ;src/gameObject/gameObject.c:336: moverYdibujar(objeto,nextPosx,nextPosy);
   6427 DD 66 F1      [19] 1963 	ld	h, -15 (ix)
   642A DD 6E F2      [19] 1964 	ld	l, -14 (ix)
   642D E5            [11] 1965 	push	hl
   642E DD 6E 04      [19] 1966 	ld	l,4 (ix)
   6431 DD 66 05      [19] 1967 	ld	h,5 (ix)
   6434 E5            [11] 1968 	push	hl
   6435 CD D6 61      [17] 1969 	call	_moverYdibujar
   6438 F1            [10] 1970 	pop	af
   6439 F1            [10] 1971 	pop	af
                           1972 ;src/gameObject/gameObject.c:337: objeto->pasos++;                           
   643A DD 7E FA      [19] 1973 	ld	a, -6 (ix)
   643D C6 06         [ 7] 1974 	add	a, #0x06
   643F 4F            [ 4] 1975 	ld	c, a
   6440 DD 7E FB      [19] 1976 	ld	a, -5 (ix)
   6443 CE 00         [ 7] 1977 	adc	a, #0x00
   6445 47            [ 4] 1978 	ld	b, a
   6446 0A            [ 7] 1979 	ld	a, (bc)
   6447 3C            [ 4] 1980 	inc	a
   6448 02            [ 7] 1981 	ld	(bc), a
                           1982 ;src/gameObject/gameObject.c:338: cpct_akp_SFXPlay(1,15,80,0,0,AY_CHANNEL_A);
   6449 3E 01         [ 7] 1983 	ld	a, #0x01
   644B F5            [11] 1984 	push	af
   644C 33            [ 6] 1985 	inc	sp
   644D 21 00 00      [10] 1986 	ld	hl, #0x0000
   6450 E5            [11] 1987 	push	hl
   6451 2E 50         [ 7] 1988 	ld	l, #0x50
   6453 E5            [11] 1989 	push	hl
   6454 21 01 0F      [10] 1990 	ld	hl, #0x0f01
   6457 E5            [11] 1991 	push	hl
   6458 CD FC A6      [17] 1992 	call	_cpct_akp_SFXPlay
   645B 21 07 00      [10] 1993 	ld	hl, #7
   645E 39            [11] 1994 	add	hl, sp
   645F F9            [ 6] 1995 	ld	sp, hl
                           1996 ;src/gameObject/gameObject.c:339: cpct_akp_SFXPlay(1,15,50,0,0,AY_CHANNEL_A);                                                 
   6460 3E 01         [ 7] 1997 	ld	a, #0x01
   6462 F5            [11] 1998 	push	af
   6463 33            [ 6] 1999 	inc	sp
   6464 21 00 00      [10] 2000 	ld	hl, #0x0000
   6467 E5            [11] 2001 	push	hl
   6468 2E 32         [ 7] 2002 	ld	l, #0x32
   646A E5            [11] 2003 	push	hl
   646B 21 01 0F      [10] 2004 	ld	hl, #0x0f01
   646E E5            [11] 2005 	push	hl
   646F CD FC A6      [17] 2006 	call	_cpct_akp_SFXPlay
   6472 21 07 00      [10] 2007 	ld	hl, #7
   6475 39            [11] 2008 	add	hl, sp
   6476 F9            [ 6] 2009 	ld	sp, hl
   6477 18 40         [12] 2010 	jr	00112$
   6479                    2011 00111$:
                           2012 ;src/gameObject/gameObject.c:342: if(moverRoca==mover_roca)          
   6479 DD 7E F4      [19] 2013 	ld	a, -12 (ix)
   647C B7            [ 4] 2014 	or	a, a
   647D 20 3A         [12] 2015 	jr	NZ,00112$
                           2016 ;src/gameObject/gameObject.c:343: moverGameObject(&rocasCol[ObjetoColisionado],movimiento,rocasCol,rocasEspejo,posicion);                      
   647F DD 4E F3      [19] 2017 	ld	c,-13 (ix)
   6482 06 00         [ 7] 2018 	ld	b,#0x00
   6484 69            [ 4] 2019 	ld	l, c
   6485 60            [ 4] 2020 	ld	h, b
   6486 29            [11] 2021 	add	hl, hl
   6487 09            [11] 2022 	add	hl, bc
   6488 29            [11] 2023 	add	hl, hl
   6489 09            [11] 2024 	add	hl, bc
   648A 4D            [ 4] 2025 	ld	c, l
   648B 44            [ 4] 2026 	ld	b, h
   648C DD 7E 07      [19] 2027 	ld	a, 7 (ix)
   648F 81            [ 4] 2028 	add	a, c
   6490 4F            [ 4] 2029 	ld	c, a
   6491 DD 7E 08      [19] 2030 	ld	a, 8 (ix)
   6494 88            [ 4] 2031 	adc	a, b
   6495 47            [ 4] 2032 	ld	b, a
   6496 DD 6E 0B      [19] 2033 	ld	l,11 (ix)
   6499 DD 66 0C      [19] 2034 	ld	h,12 (ix)
   649C E5            [11] 2035 	push	hl
   649D DD 6E 09      [19] 2036 	ld	l,9 (ix)
   64A0 DD 66 0A      [19] 2037 	ld	h,10 (ix)
   64A3 E5            [11] 2038 	push	hl
   64A4 DD 6E 07      [19] 2039 	ld	l,7 (ix)
   64A7 DD 66 08      [19] 2040 	ld	h,8 (ix)
   64AA E5            [11] 2041 	push	hl
   64AB DD 7E F5      [19] 2042 	ld	a, -11 (ix)
   64AE F5            [11] 2043 	push	af
   64AF 33            [ 6] 2044 	inc	sp
   64B0 C5            [11] 2045 	push	bc
   64B1 CD E6 5F      [17] 2046 	call	_moverGameObject
   64B4 21 09 00      [10] 2047 	ld	hl, #9
   64B7 39            [11] 2048 	add	hl, sp
   64B8 F9            [ 6] 2049 	ld	sp, hl
   64B9                    2050 00112$:
                           2051 ;src/gameObject/gameObject.c:345: objeto->cronoMovimiento=retardoMovimiento;
   64B9 DD 6E FD      [19] 2052 	ld	l,-3 (ix)
   64BC DD 66 FE      [19] 2053 	ld	h,-2 (ix)
   64BF 36 05         [10] 2054 	ld	(hl), #0x05
   64C1 18 08         [12] 2055 	jr	00119$
   64C3                    2056 00118$:
                           2057 ;src/gameObject/gameObject.c:348: objeto->cronoMovimiento-=1;
   64C3 0D            [ 4] 2058 	dec	c
   64C4 DD 6E FD      [19] 2059 	ld	l,-3 (ix)
   64C7 DD 66 FE      [19] 2060 	ld	h,-2 (ix)
   64CA 71            [ 7] 2061 	ld	(hl), c
   64CB                    2062 00119$:
                           2063 ;src/gameObject/gameObject.c:350: return seguir_En_Nivel;
   64CB 2E 00         [ 7] 2064 	ld	l, #0x00
   64CD                    2065 00121$:
   64CD DD F9         [10] 2066 	ld	sp, ix
   64CF DD E1         [14] 2067 	pop	ix
   64D1 C9            [10] 2068 	ret
                           2069 ;src/gameObject/gameObject.c:352: u8 moverTipoRoca(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
                           2070 ;	---------------------------------
                           2071 ; Function moverTipoRoca
                           2072 ; ---------------------------------
   64D2                    2073 _moverTipoRoca::
   64D2 DD E5         [15] 2074 	push	ix
   64D4 DD 21 00 00   [14] 2075 	ld	ix,#0
   64D8 DD 39         [15] 2076 	add	ix,sp
   64DA 21 F3 FF      [10] 2077 	ld	hl, #-13
   64DD 39            [11] 2078 	add	hl, sp
   64DE F9            [ 6] 2079 	ld	sp, hl
                           2080 ;src/gameObject/gameObject.c:354: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);
   64DF DD 7E 0B      [19] 2081 	ld	a, 11 (ix)
   64E2 DD 77 FC      [19] 2082 	ld	-4 (ix), a
   64E5 DD 7E 0C      [19] 2083 	ld	a, 12 (ix)
   64E8 DD 77 FD      [19] 2084 	ld	-3 (ix), a
   64EB DD 6E FC      [19] 2085 	ld	l,-4 (ix)
   64EE DD 66 FD      [19] 2086 	ld	h,-3 (ix)
   64F1 56            [ 7] 2087 	ld	d, (hl)
   64F2 DD 4E 04      [19] 2088 	ld	c,4 (ix)
   64F5 DD 46 05      [19] 2089 	ld	b,5 (ix)
   64F8 21 02 00      [10] 2090 	ld	hl, #0x0002
   64FB 09            [11] 2091 	add	hl,bc
   64FC DD 75 FA      [19] 2092 	ld	-6 (ix), l
   64FF DD 74 FB      [19] 2093 	ld	-5 (ix), h
   6502 5E            [ 7] 2094 	ld	e, (hl)
   6503 21 01 00      [10] 2095 	ld	hl, #0x0001
   6506 09            [11] 2096 	add	hl,bc
   6507 DD 75 F8      [19] 2097 	ld	-8 (ix), l
   650A DD 74 F9      [19] 2098 	ld	-7 (ix), h
   650D 7E            [ 7] 2099 	ld	a, (hl)
   650E DD 77 F7      [19] 2100 	ld	-9 (ix), a
   6511 C5            [11] 2101 	push	bc
   6512 D5            [11] 2102 	push	de
   6513 33            [ 6] 2103 	inc	sp
   6514 53            [ 4] 2104 	ld	d, e
   6515 DD 5E F7      [19] 2105 	ld	e, -9 (ix)
   6518 D5            [11] 2106 	push	de
   6519 DD 7E 06      [19] 2107 	ld	a, 6 (ix)
   651C F5            [11] 2108 	push	af
   651D 33            [ 6] 2109 	inc	sp
   651E CD 04 9E      [17] 2110 	call	_calcularMaximosyMinimos
   6521 F1            [10] 2111 	pop	af
   6522 F1            [10] 2112 	pop	af
   6523 5D            [ 4] 2113 	ld	e, l
   6524 C1            [10] 2114 	pop	bc
                           2115 ;src/gameObject/gameObject.c:356: if(movimiento!=mover_SinMovimiento && objeto->movimiento != sin_Movimiento){                  
   6525 7B            [ 4] 2116 	ld	a, e
   6526 B7            [ 4] 2117 	or	a, a
   6527 CA 33 67      [10] 2118 	jp	Z, 00123$
   652A 21 04 00      [10] 2119 	ld	hl, #0x0004
   652D 09            [11] 2120 	add	hl,bc
   652E DD 75 FE      [19] 2121 	ld	-2 (ix), l
   6531 DD 74 FF      [19] 2122 	ld	-1 (ix), h
   6534 56            [ 7] 2123 	ld	d, (hl)
   6535 7A            [ 4] 2124 	ld	a, d
   6536 B7            [ 4] 2125 	or	a, a
   6537 CA 33 67      [10] 2126 	jp	Z, 00123$
                           2127 ;src/gameObject/gameObject.c:357: u8 nextPosx=objeto->posx;
   653A DD 6E F8      [19] 2128 	ld	l,-8 (ix)
   653D DD 66 F9      [19] 2129 	ld	h,-7 (ix)
   6540 7E            [ 7] 2130 	ld	a, (hl)
   6541 DD 77 F4      [19] 2131 	ld	-12 (ix), a
                           2132 ;src/gameObject/gameObject.c:358: u8 nextPosy=objeto->posy;
   6544 DD 6E FA      [19] 2133 	ld	l,-6 (ix)
   6547 DD 66 FB      [19] 2134 	ld	h,-5 (ix)
   654A 7E            [ 7] 2135 	ld	a, (hl)
   654B DD 77 F3      [19] 2136 	ld	-13 (ix), a
                           2137 ;src/gameObject/gameObject.c:359: u8 numMovimientos=0;
   654E DD 36 F7 00   [19] 2138 	ld	-9 (ix), #0x00
                           2139 ;src/gameObject/gameObject.c:363: if(objeto->movimiento==mover_1){
   6552 7A            [ 4] 2140 	ld	a, d
   6553 3D            [ 4] 2141 	dec	a
   6554 20 2C         [12] 2142 	jr	NZ,00104$
                           2143 ;src/gameObject/gameObject.c:364: mover1casilla(&nextPosx,&nextPosy,movimiento);
   6556 21 00 00      [10] 2144 	ld	hl, #0x0000
   6559 39            [11] 2145 	add	hl, sp
   655A DD 75 F5      [19] 2146 	ld	-11 (ix), l
   655D DD 74 F6      [19] 2147 	ld	-10 (ix), h
   6560 FD 21 01 00   [14] 2148 	ld	iy,#0x0001
   6564 FD 39         [15] 2149 	add	iy,sp
   6566 C5            [11] 2150 	push	bc
   6567 D5            [11] 2151 	push	de
   6568 7B            [ 4] 2152 	ld	a, e
   6569 F5            [11] 2153 	push	af
   656A 33            [ 6] 2154 	inc	sp
   656B DD 6E F5      [19] 2155 	ld	l,-11 (ix)
   656E DD 66 F6      [19] 2156 	ld	h,-10 (ix)
   6571 E5            [11] 2157 	push	hl
   6572 FD E5         [15] 2158 	push	iy
   6574 CD 3A 67      [17] 2159 	call	_mover1casilla
   6577 F1            [10] 2160 	pop	af
   6578 F1            [10] 2161 	pop	af
   6579 33            [ 6] 2162 	inc	sp
   657A D1            [10] 2163 	pop	de
   657B C1            [10] 2164 	pop	bc
                           2165 ;src/gameObject/gameObject.c:365: numMovimientos=1;                 
   657C DD 36 F7 01   [19] 2166 	ld	-9 (ix), #0x01
   6580 18 44         [12] 2167 	jr	00105$
   6582                    2168 00104$:
                           2169 ;src/gameObject/gameObject.c:366: }else if(objeto->movimiento==mover_Linea){
   6582 7A            [ 4] 2170 	ld	a, d
   6583 D6 02         [ 7] 2171 	sub	a, #0x02
   6585 20 3F         [12] 2172 	jr	NZ,00105$
                           2173 ;src/gameObject/gameObject.c:367: numMovimientos=movimientoLineal(objeto,&nextPosx,&nextPosy,movimiento,rocasCol,*posicion);
   6587 DD 6E FC      [19] 2174 	ld	l,-4 (ix)
   658A DD 66 FD      [19] 2175 	ld	h,-3 (ix)
   658D 56            [ 7] 2176 	ld	d, (hl)
   658E 21 00 00      [10] 2177 	ld	hl, #0x0000
   6591 39            [11] 2178 	add	hl, sp
   6592 DD 75 F5      [19] 2179 	ld	-11 (ix), l
   6595 DD 74 F6      [19] 2180 	ld	-10 (ix), h
   6598 FD 21 01 00   [14] 2181 	ld	iy,#0x0001
   659C FD 39         [15] 2182 	add	iy,sp
   659E C5            [11] 2183 	push	bc
   659F D5            [11] 2184 	push	de
   65A0 D5            [11] 2185 	push	de
   65A1 33            [ 6] 2186 	inc	sp
   65A2 DD 6E 07      [19] 2187 	ld	l,7 (ix)
   65A5 DD 66 08      [19] 2188 	ld	h,8 (ix)
   65A8 E5            [11] 2189 	push	hl
   65A9 7B            [ 4] 2190 	ld	a, e
   65AA F5            [11] 2191 	push	af
   65AB 33            [ 6] 2192 	inc	sp
   65AC DD 6E F5      [19] 2193 	ld	l,-11 (ix)
   65AF DD 66 F6      [19] 2194 	ld	h,-10 (ix)
   65B2 E5            [11] 2195 	push	hl
   65B3 FD E5         [15] 2196 	push	iy
   65B5 C5            [11] 2197 	push	bc
   65B6 CD 7F 67      [17] 2198 	call	_movimientoLineal
   65B9 FD 21 0A 00   [14] 2199 	ld	iy, #10
   65BD FD 39         [15] 2200 	add	iy, sp
   65BF FD F9         [10] 2201 	ld	sp, iy
   65C1 D1            [10] 2202 	pop	de
   65C2 C1            [10] 2203 	pop	bc
   65C3 DD 75 F7      [19] 2204 	ld	-9 (ix), l
   65C6                    2205 00105$:
                           2206 ;src/gameObject/gameObject.c:369: posicionObjeto=colisionesSiguientePosicion(objeto,objeto->posx,objeto->posy,movimiento,rocasCol,posicion);                                      
   65C6 DD 6E FA      [19] 2207 	ld	l,-6 (ix)
   65C9 DD 66 FB      [19] 2208 	ld	h,-5 (ix)
   65CC 7E            [ 7] 2209 	ld	a, (hl)
   65CD DD 77 F5      [19] 2210 	ld	-11 (ix), a
   65D0 DD 6E F8      [19] 2211 	ld	l,-8 (ix)
   65D3 DD 66 F9      [19] 2212 	ld	h,-7 (ix)
   65D6 56            [ 7] 2213 	ld	d, (hl)
   65D7 C5            [11] 2214 	push	bc
   65D8 D5            [11] 2215 	push	de
   65D9 DD 6E FC      [19] 2216 	ld	l,-4 (ix)
   65DC DD 66 FD      [19] 2217 	ld	h,-3 (ix)
   65DF E5            [11] 2218 	push	hl
   65E0 DD 6E 07      [19] 2219 	ld	l,7 (ix)
   65E3 DD 66 08      [19] 2220 	ld	h,8 (ix)
   65E6 E5            [11] 2221 	push	hl
   65E7 7B            [ 4] 2222 	ld	a, e
   65E8 F5            [11] 2223 	push	af
   65E9 33            [ 6] 2224 	inc	sp
   65EA DD 7E F5      [19] 2225 	ld	a, -11 (ix)
   65ED F5            [11] 2226 	push	af
   65EE 33            [ 6] 2227 	inc	sp
   65EF D5            [11] 2228 	push	de
   65F0 33            [ 6] 2229 	inc	sp
   65F1 C5            [11] 2230 	push	bc
   65F2 CD 2A 68      [17] 2231 	call	_colisionesSiguientePosicion
   65F5 FD 21 09 00   [14] 2232 	ld	iy, #9
   65F9 FD 39         [15] 2233 	add	iy, sp
   65FB FD F9         [10] 2234 	ld	sp, iy
   65FD D1            [10] 2235 	pop	de
   65FE C1            [10] 2236 	pop	bc
   65FF 7D            [ 4] 2237 	ld	a, l
                           2238 ;src/gameObject/gameObject.c:370: if(posicionObjeto==SinColision){
   6600 FE 32         [ 7] 2239 	cp	a, #0x32
   6602 C2 10 67      [10] 2240 	jp	NZ,00120$
                           2241 ;src/gameObject/gameObject.c:371: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);             
   6605 C5            [11] 2242 	push	bc
   6606 D5            [11] 2243 	push	de
   6607 DD 6E 0B      [19] 2244 	ld	l,11 (ix)
   660A DD 66 0C      [19] 2245 	ld	h,12 (ix)
   660D E5            [11] 2246 	push	hl
   660E DD 6E 07      [19] 2247 	ld	l,7 (ix)
   6611 DD 66 08      [19] 2248 	ld	h,8 (ix)
   6614 E5            [11] 2249 	push	hl
   6615 53            [ 4] 2250 	ld	d, e
   6616 DD 5E F3      [19] 2251 	ld	e, -13 (ix)
   6619 D5            [11] 2252 	push	de
   661A DD 7E F4      [19] 2253 	ld	a, -12 (ix)
   661D F5            [11] 2254 	push	af
   661E 33            [ 6] 2255 	inc	sp
   661F DD 6E 04      [19] 2256 	ld	l,4 (ix)
   6622 DD 66 05      [19] 2257 	ld	h,5 (ix)
   6625 E5            [11] 2258 	push	hl
   6626 CD 2A 68      [17] 2259 	call	_colisionesSiguientePosicion
   6629 21 09 00      [10] 2260 	ld	hl, #9
   662C 39            [11] 2261 	add	hl, sp
   662D F9            [ 6] 2262 	ld	sp, hl
   662E DD 66 F3      [19] 2263 	ld	h, -13 (ix)
   6631 DD 6E F4      [19] 2264 	ld	l, -12 (ix)
   6634 E5            [11] 2265 	push	hl
   6635 DD 6E 04      [19] 2266 	ld	l,4 (ix)
   6638 DD 66 05      [19] 2267 	ld	h,5 (ix)
   663B E5            [11] 2268 	push	hl
   663C CD D6 61      [17] 2269 	call	_moverYdibujar
   663F F1            [10] 2270 	pop	af
   6640 F1            [10] 2271 	pop	af
   6641 D1            [10] 2272 	pop	de
   6642 C1            [10] 2273 	pop	bc
                           2274 ;src/gameObject/gameObject.c:373: moverElEspejo(objeto->num,movimiento,rocasEspejo,*posicion,numMovimientos);
   6643 DD 6E FC      [19] 2275 	ld	l,-4 (ix)
   6646 DD 66 FD      [19] 2276 	ld	h,-3 (ix)
   6649 56            [ 7] 2277 	ld	d, (hl)
   664A 0A            [ 7] 2278 	ld	a, (bc)
   664B DD 77 F5      [19] 2279 	ld	-11 (ix), a
   664E C5            [11] 2280 	push	bc
   664F D5            [11] 2281 	push	de
   6650 DD 7E F7      [19] 2282 	ld	a, -9 (ix)
   6653 F5            [11] 2283 	push	af
   6654 33            [ 6] 2284 	inc	sp
   6655 D5            [11] 2285 	push	de
   6656 33            [ 6] 2286 	inc	sp
   6657 DD 6E 09      [19] 2287 	ld	l,9 (ix)
   665A DD 66 0A      [19] 2288 	ld	h,10 (ix)
   665D E5            [11] 2289 	push	hl
   665E 53            [ 4] 2290 	ld	d, e
   665F DD 5E F5      [19] 2291 	ld	e, -11 (ix)
   6662 D5            [11] 2292 	push	de
   6663 CD 4E 60      [17] 2293 	call	_moverElEspejo
   6666 21 06 00      [10] 2294 	ld	hl, #6
   6669 39            [11] 2295 	add	hl, sp
   666A F9            [ 6] 2296 	ld	sp, hl
   666B D1            [10] 2297 	pop	de
   666C C1            [10] 2298 	pop	bc
                           2299 ;src/gameObject/gameObject.c:374: if(objeto->movimiento==mover_1){
   666D DD 6E FE      [19] 2300 	ld	l,-2 (ix)
   6670 DD 66 FF      [19] 2301 	ld	h,-1 (ix)
   6673 7E            [ 7] 2302 	ld	a, (hl)
   6674 FE 01         [ 7] 2303 	cp	a, #0x01
   6676 20 4B         [12] 2304 	jr	NZ,00115$
                           2305 ;src/gameObject/gameObject.c:375: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,mover_SinMovimiento,rocasCol,posicion);
   6678 C5            [11] 2306 	push	bc
   6679 DD 6E FC      [19] 2307 	ld	l,-4 (ix)
   667C DD 66 FD      [19] 2308 	ld	h,-3 (ix)
   667F E5            [11] 2309 	push	hl
   6680 DD 6E 07      [19] 2310 	ld	l,7 (ix)
   6683 DD 66 08      [19] 2311 	ld	h,8 (ix)
   6686 E5            [11] 2312 	push	hl
   6687 AF            [ 4] 2313 	xor	a, a
   6688 F5            [11] 2314 	push	af
   6689 33            [ 6] 2315 	inc	sp
   668A DD 66 F3      [19] 2316 	ld	h, -13 (ix)
   668D DD 6E F4      [19] 2317 	ld	l, -12 (ix)
   6690 E5            [11] 2318 	push	hl
   6691 C5            [11] 2319 	push	bc
   6692 CD 2A 68      [17] 2320 	call	_colisionesSiguientePosicion
   6695 FD 21 09 00   [14] 2321 	ld	iy, #9
   6699 FD 39         [15] 2322 	add	iy, sp
   669B FD F9         [10] 2323 	ld	sp, iy
   669D C1            [10] 2324 	pop	bc
   669E 7D            [ 4] 2325 	ld	a, l
                           2326 ;src/gameObject/gameObject.c:376: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
   669F FE 32         [ 7] 2327 	cp	a, #0x32
   66A1 CA 33 67      [10] 2328 	jp	Z,00123$
   66A4 FE 33         [ 7] 2329 	cp	a, #0x33
   66A6 CA 33 67      [10] 2330 	jp	Z,00123$
                           2331 ;src/gameObject/gameObject.c:377: taparHole(objeto,&rocasCol[posicionObjeto]);
   66A9 5F            [ 4] 2332 	ld	e,a
   66AA 16 00         [ 7] 2333 	ld	d,#0x00
   66AC 6B            [ 4] 2334 	ld	l, e
   66AD 62            [ 4] 2335 	ld	h, d
   66AE 29            [11] 2336 	add	hl, hl
   66AF 19            [11] 2337 	add	hl, de
   66B0 29            [11] 2338 	add	hl, hl
   66B1 19            [11] 2339 	add	hl, de
   66B2 EB            [ 4] 2340 	ex	de,hl
   66B3 DD 6E 07      [19] 2341 	ld	l,7 (ix)
   66B6 DD 66 08      [19] 2342 	ld	h,8 (ix)
   66B9 19            [11] 2343 	add	hl, de
   66BA E5            [11] 2344 	push	hl
   66BB C5            [11] 2345 	push	bc
   66BC CD 11 62      [17] 2346 	call	_taparHole
   66BF F1            [10] 2347 	pop	af
   66C0 F1            [10] 2348 	pop	af
   66C1 18 70         [12] 2349 	jr	00123$
   66C3                    2350 00115$:
                           2351 ;src/gameObject/gameObject.c:379: }else if(objeto->movimiento==mover_Linea){
   66C3 D6 02         [ 7] 2352 	sub	a, #0x02
   66C5 20 6C         [12] 2353 	jr	NZ,00123$
                           2354 ;src/gameObject/gameObject.c:380: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);
   66C7 C5            [11] 2355 	push	bc
   66C8 DD 6E FC      [19] 2356 	ld	l,-4 (ix)
   66CB DD 66 FD      [19] 2357 	ld	h,-3 (ix)
   66CE E5            [11] 2358 	push	hl
   66CF DD 6E 07      [19] 2359 	ld	l,7 (ix)
   66D2 DD 66 08      [19] 2360 	ld	h,8 (ix)
   66D5 E5            [11] 2361 	push	hl
   66D6 53            [ 4] 2362 	ld	d, e
   66D7 DD 5E F3      [19] 2363 	ld	e, -13 (ix)
   66DA D5            [11] 2364 	push	de
   66DB DD 7E F4      [19] 2365 	ld	a, -12 (ix)
   66DE F5            [11] 2366 	push	af
   66DF 33            [ 6] 2367 	inc	sp
   66E0 C5            [11] 2368 	push	bc
   66E1 CD 2A 68      [17] 2369 	call	_colisionesSiguientePosicion
   66E4 FD 21 09 00   [14] 2370 	ld	iy, #9
   66E8 FD 39         [15] 2371 	add	iy, sp
   66EA FD F9         [10] 2372 	ld	sp, iy
   66EC C1            [10] 2373 	pop	bc
   66ED 7D            [ 4] 2374 	ld	a, l
                           2375 ;src/gameObject/gameObject.c:381: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
   66EE FE 32         [ 7] 2376 	cp	a, #0x32
   66F0 28 41         [12] 2377 	jr	Z,00123$
   66F2 FE 33         [ 7] 2378 	cp	a, #0x33
   66F4 28 3D         [12] 2379 	jr	Z,00123$
                           2380 ;src/gameObject/gameObject.c:382: taparHole(objeto,&rocasCol[posicionObjeto]);
   66F6 5F            [ 4] 2381 	ld	e,a
   66F7 16 00         [ 7] 2382 	ld	d,#0x00
   66F9 6B            [ 4] 2383 	ld	l, e
   66FA 62            [ 4] 2384 	ld	h, d
   66FB 29            [11] 2385 	add	hl, hl
   66FC 19            [11] 2386 	add	hl, de
   66FD 29            [11] 2387 	add	hl, hl
   66FE 19            [11] 2388 	add	hl, de
   66FF EB            [ 4] 2389 	ex	de,hl
   6700 DD 6E 07      [19] 2390 	ld	l,7 (ix)
   6703 DD 66 08      [19] 2391 	ld	h,8 (ix)
   6706 19            [11] 2392 	add	hl, de
   6707 E5            [11] 2393 	push	hl
   6708 C5            [11] 2394 	push	bc
   6709 CD 11 62      [17] 2395 	call	_taparHole
   670C F1            [10] 2396 	pop	af
   670D F1            [10] 2397 	pop	af
   670E 18 23         [12] 2398 	jr	00123$
   6710                    2399 00120$:
                           2400 ;src/gameObject/gameObject.c:386: if(posicionObjeto!=ColisionNoRocas){
   6710 FE 33         [ 7] 2401 	cp	a, #0x33
   6712 28 1F         [12] 2402 	jr	Z,00123$
                           2403 ;src/gameObject/gameObject.c:387: taparHole(objeto,&rocasCol[posicionObjeto]);
   6714 4F            [ 4] 2404 	ld	c,a
   6715 06 00         [ 7] 2405 	ld	b,#0x00
   6717 69            [ 4] 2406 	ld	l, c
   6718 60            [ 4] 2407 	ld	h, b
   6719 29            [11] 2408 	add	hl, hl
   671A 09            [11] 2409 	add	hl, bc
   671B 29            [11] 2410 	add	hl, hl
   671C 09            [11] 2411 	add	hl, bc
   671D 4D            [ 4] 2412 	ld	c, l
   671E 44            [ 4] 2413 	ld	b, h
   671F DD 6E 07      [19] 2414 	ld	l,7 (ix)
   6722 DD 66 08      [19] 2415 	ld	h,8 (ix)
   6725 09            [11] 2416 	add	hl, bc
   6726 E5            [11] 2417 	push	hl
   6727 DD 6E 04      [19] 2418 	ld	l,4 (ix)
   672A DD 66 05      [19] 2419 	ld	h,5 (ix)
   672D E5            [11] 2420 	push	hl
   672E CD 11 62      [17] 2421 	call	_taparHole
   6731 F1            [10] 2422 	pop	af
   6732 F1            [10] 2423 	pop	af
   6733                    2424 00123$:
                           2425 ;src/gameObject/gameObject.c:393: return seguir_En_Nivel;
   6733 2E 00         [ 7] 2426 	ld	l, #0x00
   6735 DD F9         [10] 2427 	ld	sp, ix
   6737 DD E1         [14] 2428 	pop	ix
   6739 C9            [10] 2429 	ret
                           2430 ;src/gameObject/gameObject.c:401: void mover1casilla(u8* posx, u8* posy,u8 movimiento){
                           2431 ;	---------------------------------
                           2432 ; Function mover1casilla
                           2433 ; ---------------------------------
   673A                    2434 _mover1casilla::
   673A DD E5         [15] 2435 	push	ix
   673C DD 21 00 00   [14] 2436 	ld	ix,#0
   6740 DD 39         [15] 2437 	add	ix,sp
                           2438 ;src/gameObject/gameObject.c:403: *posx-=1;
   6742 DD 4E 04      [19] 2439 	ld	c,4 (ix)
   6745 DD 46 05      [19] 2440 	ld	b,5 (ix)
                           2441 ;src/gameObject/gameObject.c:402: if(movimiento==mover_Izquierda){
   6748 DD 7E 08      [19] 2442 	ld	a, 8 (ix)
   674B 3D            [ 4] 2443 	dec	a
   674C 20 06         [12] 2444 	jr	NZ,00110$
                           2445 ;src/gameObject/gameObject.c:403: *posx-=1;
   674E 0A            [ 7] 2446 	ld	a, (bc)
   674F C6 FF         [ 7] 2447 	add	a, #0xff
   6751 02            [ 7] 2448 	ld	(bc), a
   6752 18 28         [12] 2449 	jr	00112$
   6754                    2450 00110$:
                           2451 ;src/gameObject/gameObject.c:405: *posy-=1;
   6754 DD 6E 06      [19] 2452 	ld	l,6 (ix)
   6757 DD 66 07      [19] 2453 	ld	h,7 (ix)
                           2454 ;src/gameObject/gameObject.c:404: }else if(movimiento==mover_Arriba){
   675A DD 7E 08      [19] 2455 	ld	a, 8 (ix)
   675D D6 02         [ 7] 2456 	sub	a, #0x02
   675F 20 05         [12] 2457 	jr	NZ,00107$
                           2458 ;src/gameObject/gameObject.c:405: *posy-=1;
   6761 4E            [ 7] 2459 	ld	c, (hl)
   6762 0D            [ 4] 2460 	dec	c
   6763 71            [ 7] 2461 	ld	(hl), c
   6764 18 16         [12] 2462 	jr	00112$
   6766                    2463 00107$:
                           2464 ;src/gameObject/gameObject.c:406: }else if(movimiento==mover_Derecha){
   6766 DD 7E 08      [19] 2465 	ld	a, 8 (ix)
   6769 D6 03         [ 7] 2466 	sub	a, #0x03
   676B 20 05         [12] 2467 	jr	NZ,00104$
                           2468 ;src/gameObject/gameObject.c:407: *posx+=1;
   676D 0A            [ 7] 2469 	ld	a, (bc)
   676E 3C            [ 4] 2470 	inc	a
   676F 02            [ 7] 2471 	ld	(bc), a
   6770 18 0A         [12] 2472 	jr	00112$
   6772                    2473 00104$:
                           2474 ;src/gameObject/gameObject.c:408: }else if(movimiento==mover_Abajo){
   6772 DD 7E 08      [19] 2475 	ld	a, 8 (ix)
   6775 D6 04         [ 7] 2476 	sub	a, #0x04
   6777 20 03         [12] 2477 	jr	NZ,00112$
                           2478 ;src/gameObject/gameObject.c:409: *posy+=1;
   6779 4E            [ 7] 2479 	ld	c, (hl)
   677A 0C            [ 4] 2480 	inc	c
   677B 71            [ 7] 2481 	ld	(hl), c
   677C                    2482 00112$:
   677C DD E1         [14] 2483 	pop	ix
   677E C9            [10] 2484 	ret
                           2485 ;src/gameObject/gameObject.c:413: u8 movimientoLineal(TGameObject* objeto,u8* posx, u8* posy,u8 movimiento,TGameObject* objetosCol,u8 posicion){    
                           2486 ;	---------------------------------
                           2487 ; Function movimientoLineal
                           2488 ; ---------------------------------
   677F                    2489 _movimientoLineal::
   677F DD E5         [15] 2490 	push	ix
   6781 DD 21 00 00   [14] 2491 	ld	ix,#0
   6785 DD 39         [15] 2492 	add	ix,sp
   6787 F5            [11] 2493 	push	af
   6788 F5            [11] 2494 	push	af
   6789 3B            [ 6] 2495 	dec	sp
                           2496 ;src/gameObject/gameObject.c:416: while (colisionesSiguientePosicion(objeto,*posx,*posy,movimiento,objetosCol,posicion)==SinColision && movimiento!=mover_SinMovimiento)
   678A DD 7E 08      [19] 2497 	ld	a, 8 (ix)
   678D DD 77 FE      [19] 2498 	ld	-2 (ix), a
   6790 DD 7E 09      [19] 2499 	ld	a, 9 (ix)
   6793 DD 77 FF      [19] 2500 	ld	-1 (ix), a
   6796 DD 4E 06      [19] 2501 	ld	c,6 (ix)
   6799 DD 46 07      [19] 2502 	ld	b,7 (ix)
   679C DD 36 FB 00   [19] 2503 	ld	-5 (ix), #0x00
   67A0                    2504 00102$:
   67A0 DD 7E 0D      [19] 2505 	ld	a, 13 (ix)
   67A3 DD 77 FC      [19] 2506 	ld	-4 (ix), a
   67A6 DD 36 FD 00   [19] 2507 	ld	-3 (ix), #0x00
   67AA DD 6E FE      [19] 2508 	ld	l,-2 (ix)
   67AD DD 66 FF      [19] 2509 	ld	h,-1 (ix)
   67B0 5E            [ 7] 2510 	ld	e, (hl)
   67B1 0A            [ 7] 2511 	ld	a, (bc)
   67B2 57            [ 4] 2512 	ld	d, a
   67B3 C5            [11] 2513 	push	bc
   67B4 DD 6E FC      [19] 2514 	ld	l,-4 (ix)
   67B7 DD 66 FD      [19] 2515 	ld	h,-3 (ix)
   67BA E5            [11] 2516 	push	hl
   67BB DD 6E 0B      [19] 2517 	ld	l,11 (ix)
   67BE DD 66 0C      [19] 2518 	ld	h,12 (ix)
   67C1 E5            [11] 2519 	push	hl
   67C2 DD 7E 0A      [19] 2520 	ld	a, 10 (ix)
   67C5 F5            [11] 2521 	push	af
   67C6 33            [ 6] 2522 	inc	sp
   67C7 7B            [ 4] 2523 	ld	a, e
   67C8 F5            [11] 2524 	push	af
   67C9 33            [ 6] 2525 	inc	sp
   67CA D5            [11] 2526 	push	de
   67CB 33            [ 6] 2527 	inc	sp
   67CC DD 6E 04      [19] 2528 	ld	l,4 (ix)
   67CF DD 66 05      [19] 2529 	ld	h,5 (ix)
   67D2 E5            [11] 2530 	push	hl
   67D3 CD 2A 68      [17] 2531 	call	_colisionesSiguientePosicion
   67D6 FD 21 09 00   [14] 2532 	ld	iy, #9
   67DA FD 39         [15] 2533 	add	iy, sp
   67DC FD F9         [10] 2534 	ld	sp, iy
   67DE C1            [10] 2535 	pop	bc
   67DF 7D            [ 4] 2536 	ld	a, l
   67E0 D6 32         [ 7] 2537 	sub	a, #0x32
   67E2 20 3E         [12] 2538 	jr	NZ,00104$
   67E4 DD 7E 0A      [19] 2539 	ld	a, 10 (ix)
   67E7 B7            [ 4] 2540 	or	a, a
   67E8 28 38         [12] 2541 	jr	Z,00104$
                           2542 ;src/gameObject/gameObject.c:418: movimiento=calcularMaximosyMinimos(movimiento,*posx,*posy,posicion);       
   67EA DD 6E FE      [19] 2543 	ld	l,-2 (ix)
   67ED DD 66 FF      [19] 2544 	ld	h,-1 (ix)
   67F0 56            [ 7] 2545 	ld	d, (hl)
   67F1 0A            [ 7] 2546 	ld	a, (bc)
   67F2 5F            [ 4] 2547 	ld	e, a
   67F3 C5            [11] 2548 	push	bc
   67F4 DD 7E 0D      [19] 2549 	ld	a, 13 (ix)
   67F7 F5            [11] 2550 	push	af
   67F8 33            [ 6] 2551 	inc	sp
   67F9 D5            [11] 2552 	push	de
   67FA 33            [ 6] 2553 	inc	sp
   67FB 53            [ 4] 2554 	ld	d, e
   67FC DD 5E 0A      [19] 2555 	ld	e, 10 (ix)
   67FF D5            [11] 2556 	push	de
   6800 CD 04 9E      [17] 2557 	call	_calcularMaximosyMinimos
   6803 F1            [10] 2558 	pop	af
   6804 F1            [10] 2559 	pop	af
   6805 55            [ 4] 2560 	ld	d, l
   6806 C1            [10] 2561 	pop	bc
   6807 DD 72 0A      [19] 2562 	ld	10 (ix), d
                           2563 ;src/gameObject/gameObject.c:419: mover1casilla(posx,posy,movimiento);
   680A C5            [11] 2564 	push	bc
   680B D5            [11] 2565 	push	de
   680C 33            [ 6] 2566 	inc	sp
   680D DD 6E FE      [19] 2567 	ld	l,-2 (ix)
   6810 DD 66 FF      [19] 2568 	ld	h,-1 (ix)
   6813 E5            [11] 2569 	push	hl
   6814 C5            [11] 2570 	push	bc
   6815 CD 3A 67      [17] 2571 	call	_mover1casilla
   6818 F1            [10] 2572 	pop	af
   6819 F1            [10] 2573 	pop	af
   681A 33            [ 6] 2574 	inc	sp
   681B C1            [10] 2575 	pop	bc
                           2576 ;src/gameObject/gameObject.c:420: contador++;                    
   681C DD 34 FB      [23] 2577 	inc	-5 (ix)
   681F C3 A0 67      [10] 2578 	jp	00102$
   6822                    2579 00104$:
                           2580 ;src/gameObject/gameObject.c:424: return contador;             
   6822 DD 6E FB      [19] 2581 	ld	l, -5 (ix)
   6825 DD F9         [10] 2582 	ld	sp, ix
   6827 DD E1         [14] 2583 	pop	ix
   6829 C9            [10] 2584 	ret
                           2585 ;src/gameObject/gameObject.c:432: u8 colisionesSiguientePosicion(TGameObject* objeto,u8 posx,u8 posy,u8 movimiento, TGameObject* rocasCol,u8* posicion){
                           2586 ;	---------------------------------
                           2587 ; Function colisionesSiguientePosicion
                           2588 ; ---------------------------------
   682A                    2589 _colisionesSiguientePosicion::
   682A DD E5         [15] 2590 	push	ix
   682C DD 21 00 00   [14] 2591 	ld	ix,#0
   6830 DD 39         [15] 2592 	add	ix,sp
   6832 21 F8 FF      [10] 2593 	ld	hl, #-8
   6835 39            [11] 2594 	add	hl, sp
   6836 F9            [ 6] 2595 	ld	sp, hl
                           2596 ;src/gameObject/gameObject.c:433: u8 nextPosx=posx;
   6837 DD 7E 06      [19] 2597 	ld	a, 6 (ix)
   683A DD 77 FA      [19] 2598 	ld	-6 (ix), a
                           2599 ;src/gameObject/gameObject.c:434: u8 nextPosy=posy;
   683D DD 7E 07      [19] 2600 	ld	a, 7 (ix)
   6840 DD 77 F8      [19] 2601 	ld	-8 (ix), a
                           2602 ;src/gameObject/gameObject.c:441: mover1casilla(&nextPosx,&nextPosy,movimiento);
   6843 21 00 00      [10] 2603 	ld	hl, #0x0000
   6846 39            [11] 2604 	add	hl, sp
   6847 DD 75 FB      [19] 2605 	ld	-5 (ix), l
   684A DD 74 FC      [19] 2606 	ld	-4 (ix), h
   684D EB            [ 4] 2607 	ex	de,hl
   684E 21 02 00      [10] 2608 	ld	hl, #0x0002
   6851 39            [11] 2609 	add	hl, sp
   6852 DD 75 FD      [19] 2610 	ld	-3 (ix), l
   6855 DD 74 FE      [19] 2611 	ld	-2 (ix), h
   6858 4D            [ 4] 2612 	ld	c, l
   6859 44            [ 4] 2613 	ld	b, h
   685A DD 7E 08      [19] 2614 	ld	a, 8 (ix)
   685D F5            [11] 2615 	push	af
   685E 33            [ 6] 2616 	inc	sp
   685F D5            [11] 2617 	push	de
   6860 C5            [11] 2618 	push	bc
   6861 CD 3A 67      [17] 2619 	call	_mover1casilla
   6864 F1            [10] 2620 	pop	af
   6865 F1            [10] 2621 	pop	af
   6866 33            [ 6] 2622 	inc	sp
                           2623 ;src/gameObject/gameObject.c:442: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);
   6867 DD 6E 09      [19] 2624 	ld	l,9 (ix)
   686A DD 66 0A      [19] 2625 	ld	h,10 (ix)
   686D E5            [11] 2626 	push	hl
   686E DD 66 F8      [19] 2627 	ld	h, -8 (ix)
   6871 DD 6E FA      [19] 2628 	ld	l, -6 (ix)
   6874 E5            [11] 2629 	push	hl
   6875 CD 1A 69      [17] 2630 	call	_comprobarRocas
   6878 F1            [10] 2631 	pop	af
   6879 F1            [10] 2632 	pop	af
                           2633 ;src/gameObject/gameObject.c:443: if(ObjetoColisionado!=SinColision){
   687A 7D            [ 4] 2634 	ld	a, l
   687B D6 32         [ 7] 2635 	sub	a, #0x32
   687D 20 04         [12] 2636 	jr	NZ,00135$
   687F 3E 01         [ 7] 2637 	ld	a,#0x01
   6881 18 01         [12] 2638 	jr	00136$
   6883                    2639 00135$:
   6883 AF            [ 4] 2640 	xor	a,a
   6884                    2641 00136$:
   6884 DD 77 FF      [19] 2642 	ld	-1 (ix), a
   6887 DD CB FF 46   [20] 2643 	bit	0, -1 (ix)
                           2644 ;src/gameObject/gameObject.c:444: return ObjetoColisionado;
   688B CA 15 69      [10] 2645 	jp	Z,00109$
                           2646 ;src/gameObject/gameObject.c:446: colisionPuerta=comprobarPuertas(nextPosx,nextPosy);                      
   688E DD 66 F8      [19] 2647 	ld	h, -8 (ix)
   6891 DD 6E FA      [19] 2648 	ld	l, -6 (ix)
   6894 E5            [11] 2649 	push	hl
   6895 CD 72 6A      [17] 2650 	call	_comprobarPuertas
   6898 F1            [10] 2651 	pop	af
   6899 5D            [ 4] 2652 	ld	e, l
                           2653 ;src/gameObject/gameObject.c:447: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);                 
   689A DD 4E FB      [19] 2654 	ld	c,-5 (ix)
   689D DD 46 FC      [19] 2655 	ld	b,-4 (ix)
   68A0 DD 6E FD      [19] 2656 	ld	l,-3 (ix)
   68A3 DD 66 FE      [19] 2657 	ld	h,-2 (ix)
   68A6 E5            [11] 2658 	push	hl
   68A7 FD E1         [14] 2659 	pop	iy
   68A9 D5            [11] 2660 	push	de
   68AA DD 6E 0B      [19] 2661 	ld	l,11 (ix)
   68AD DD 66 0C      [19] 2662 	ld	h,12 (ix)
   68B0 E5            [11] 2663 	push	hl
   68B1 DD 7E 08      [19] 2664 	ld	a, 8 (ix)
   68B4 F5            [11] 2665 	push	af
   68B5 33            [ 6] 2666 	inc	sp
   68B6 C5            [11] 2667 	push	bc
   68B7 FD E5         [15] 2668 	push	iy
   68B9 DD 6E 04      [19] 2669 	ld	l,4 (ix)
   68BC DD 66 05      [19] 2670 	ld	h,5 (ix)
   68BF E5            [11] 2671 	push	hl
   68C0 CD 64 69      [17] 2672 	call	_comprobarPortales
   68C3 FD 21 09 00   [14] 2673 	ld	iy, #9
   68C7 FD 39         [15] 2674 	add	iy, sp
   68C9 FD F9         [10] 2675 	ld	sp, iy
                           2676 ;src/gameObject/gameObject.c:448: colisionColeccionable=comprobarColeccionables(nextPosx,nextPosy,sprite_Rock_B);
   68CB DD 75 F9      [19] 2677 	ld	-7 (ix), l
   68CE 3E 03         [ 7] 2678 	ld	a, #0x03
   68D0 F5            [11] 2679 	push	af
   68D1 33            [ 6] 2680 	inc	sp
   68D2 DD 66 F8      [19] 2681 	ld	h, -8 (ix)
   68D5 DD 6E FA      [19] 2682 	ld	l, -6 (ix)
   68D8 E5            [11] 2683 	push	hl
   68D9 CD B8 6A      [17] 2684 	call	_comprobarColeccionables
   68DC F1            [10] 2685 	pop	af
   68DD 33            [ 6] 2686 	inc	sp
   68DE 4D            [ 4] 2687 	ld	c, l
   68DF D1            [10] 2688 	pop	de
                           2689 ;src/gameObject/gameObject.c:449: colisionEnemigos=comprobarEnemigos(nextPosx,nextPosy,*posicion);
   68E0 DD 6E 0B      [19] 2690 	ld	l,11 (ix)
   68E3 DD 66 0C      [19] 2691 	ld	h,12 (ix)
   68E6 46            [ 7] 2692 	ld	b, (hl)
   68E7 C5            [11] 2693 	push	bc
   68E8 D5            [11] 2694 	push	de
   68E9 C5            [11] 2695 	push	bc
   68EA 33            [ 6] 2696 	inc	sp
   68EB DD 66 F8      [19] 2697 	ld	h, -8 (ix)
   68EE DD 6E FA      [19] 2698 	ld	l, -6 (ix)
   68F1 E5            [11] 2699 	push	hl
   68F2 CD 5F 6B      [17] 2700 	call	_comprobarEnemigos
   68F5 F1            [10] 2701 	pop	af
   68F6 33            [ 6] 2702 	inc	sp
   68F7 D1            [10] 2703 	pop	de
   68F8 C1            [10] 2704 	pop	bc
                           2705 ;src/gameObject/gameObject.c:452: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision && colisionPortales==no_Hay_Colision && colisionColeccionable==no_Hay_Colision && colisionEnemigos==no_Hay_Colision){        
   68F9 DD CB FF 46   [20] 2706 	bit	0, -1 (ix)
   68FD 28 14         [12] 2707 	jr	Z,00104$
   68FF 7B            [ 4] 2708 	ld	a, e
   6900 B7            [ 4] 2709 	or	a, a
   6901 20 10         [12] 2710 	jr	NZ,00104$
   6903 DD 7E F9      [19] 2711 	ld	a, -7 (ix)
   6906 B7            [ 4] 2712 	or	a,a
   6907 20 0A         [12] 2713 	jr	NZ,00104$
   6909 B1            [ 4] 2714 	or	a,c
   690A 20 07         [12] 2715 	jr	NZ,00104$
   690C B5            [ 4] 2716 	or	a,l
   690D 20 04         [12] 2717 	jr	NZ,00104$
                           2718 ;src/gameObject/gameObject.c:453: return SinColision;
   690F 2E 32         [ 7] 2719 	ld	l, #0x32
   6911 18 02         [12] 2720 	jr	00109$
   6913                    2721 00104$:
                           2722 ;src/gameObject/gameObject.c:455: return ColisionNoRocas;
   6913 2E 33         [ 7] 2723 	ld	l, #0x33
   6915                    2724 00109$:
   6915 DD F9         [10] 2725 	ld	sp, ix
   6917 DD E1         [14] 2726 	pop	ix
   6919 C9            [10] 2727 	ret
                           2728 ;src/gameObject/gameObject.c:458: u8 comprobarRocas(u8 posx,u8 posy,TGameObject* rocas){
                           2729 ;	---------------------------------
                           2730 ; Function comprobarRocas
                           2731 ; ---------------------------------
   691A                    2732 _comprobarRocas::
   691A DD E5         [15] 2733 	push	ix
   691C DD 21 00 00   [14] 2734 	ld	ix,#0
   6920 DD 39         [15] 2735 	add	ix,sp
                           2736 ;src/gameObject/gameObject.c:459: u8 colision=SinColision;   
                           2737 ;src/gameObject/gameObject.c:460: for(u8 i=0;i<RocasMaximas;i++){
   6922 01 32 00      [10] 2738 	ld	bc,#0x0032
   6925                    2739 00107$:
   6925 78            [ 4] 2740 	ld	a, b
   6926 D6 28         [ 7] 2741 	sub	a, #0x28
   6928 30 36         [12] 2742 	jr	NC,00105$
                           2743 ;src/gameObject/gameObject.c:461: if(rocas[i].posx!=0){
   692A 58            [ 4] 2744 	ld	e,b
   692B 16 00         [ 7] 2745 	ld	d,#0x00
   692D 6B            [ 4] 2746 	ld	l, e
   692E 62            [ 4] 2747 	ld	h, d
   692F 29            [11] 2748 	add	hl, hl
   6930 19            [11] 2749 	add	hl, de
   6931 29            [11] 2750 	add	hl, hl
   6932 19            [11] 2751 	add	hl, de
   6933 EB            [ 4] 2752 	ex	de,hl
   6934 DD 7E 06      [19] 2753 	ld	a, 6 (ix)
   6937 83            [ 4] 2754 	add	a, e
   6938 5F            [ 4] 2755 	ld	e, a
   6939 DD 7E 07      [19] 2756 	ld	a, 7 (ix)
   693C 8A            [ 4] 2757 	adc	a, d
   693D 57            [ 4] 2758 	ld	d, a
   693E 6B            [ 4] 2759 	ld	l, e
   693F 62            [ 4] 2760 	ld	h, d
   6940 23            [ 6] 2761 	inc	hl
   6941 7E            [ 7] 2762 	ld	a, (hl)
   6942 B7            [ 4] 2763 	or	a, a
   6943 28 18         [12] 2764 	jr	Z,00108$
                           2765 ;src/gameObject/gameObject.c:462: if(comprobarColisiones1vs1(posx,posy,rocas[i].posx,rocas[i].posy)==hay_Colision){                          
   6945 EB            [ 4] 2766 	ex	de,hl
   6946 23            [ 6] 2767 	inc	hl
   6947 23            [ 6] 2768 	inc	hl
   6948 56            [ 7] 2769 	ld	d, (hl)
   6949 C5            [11] 2770 	push	bc
   694A 5F            [ 4] 2771 	ld	e, a
   694B D5            [11] 2772 	push	de
   694C DD 66 05      [19] 2773 	ld	h, 5 (ix)
   694F DD 6E 04      [19] 2774 	ld	l, 4 (ix)
   6952 E5            [11] 2775 	push	hl
   6953 CD 9D 9E      [17] 2776 	call	_comprobarColisiones1vs1
   6956 F1            [10] 2777 	pop	af
   6957 F1            [10] 2778 	pop	af
   6958 C1            [10] 2779 	pop	bc
   6959 2D            [ 4] 2780 	dec	l
   695A 20 01         [12] 2781 	jr	NZ,00108$
                           2782 ;src/gameObject/gameObject.c:463: colision=i;
   695C 48            [ 4] 2783 	ld	c, b
   695D                    2784 00108$:
                           2785 ;src/gameObject/gameObject.c:460: for(u8 i=0;i<RocasMaximas;i++){
   695D 04            [ 4] 2786 	inc	b
   695E 18 C5         [12] 2787 	jr	00107$
   6960                    2788 00105$:
                           2789 ;src/gameObject/gameObject.c:467: return colision;
   6960 69            [ 4] 2790 	ld	l, c
   6961 DD E1         [14] 2791 	pop	ix
   6963 C9            [10] 2792 	ret
                           2793 ;src/gameObject/gameObject.c:470: u8 comprobarPortales(TGameObject* objeto,u8* posx,u8* posy,u8 movimiento,u8* posicion){    
                           2794 ;	---------------------------------
                           2795 ; Function comprobarPortales
                           2796 ; ---------------------------------
   6964                    2797 _comprobarPortales::
   6964 DD E5         [15] 2798 	push	ix
   6966 DD 21 00 00   [14] 2799 	ld	ix,#0
   696A DD 39         [15] 2800 	add	ix,sp
   696C 21 F5 FF      [10] 2801 	ld	hl, #-11
   696F 39            [11] 2802 	add	hl, sp
   6970 F9            [ 6] 2803 	ld	sp, hl
                           2804 ;src/gameObject/gameObject.c:471: if(*posx==P_portal[0].posx ){
   6971 DD 4E 06      [19] 2805 	ld	c,6 (ix)
   6974 DD 46 07      [19] 2806 	ld	b,7 (ix)
   6977 0A            [ 7] 2807 	ld	a, (bc)
   6978 DD 77 FA      [19] 2808 	ld	-6 (ix), a
   697B 2A 15 AB      [16] 2809 	ld	hl, (_P_portal)
   697E E3            [19] 2810 	ex	(sp), hl
   697F E1            [10] 2811 	pop	hl
   6980 E5            [11] 2812 	push	hl
   6981 23            [ 6] 2813 	inc	hl
   6982 7E            [ 7] 2814 	ld	a, (hl)
   6983 DD 77 F9      [19] 2815 	ld	-7 (ix), a
                           2816 ;src/gameObject/gameObject.c:472: if(*posy==P_portal[0].posy ){
   6986 DD 5E 08      [19] 2817 	ld	e,8 (ix)
   6989 DD 56 09      [19] 2818 	ld	d,9 (ix)
                           2819 ;src/gameObject/gameObject.c:473: if(objeto->sprite==sprite_Player){                
   698C DD 7E 04      [19] 2820 	ld	a, 4 (ix)
   698F DD 77 F7      [19] 2821 	ld	-9 (ix), a
   6992 DD 7E 05      [19] 2822 	ld	a, 5 (ix)
   6995 DD 77 F8      [19] 2823 	ld	-8 (ix), a
                           2824 ;src/gameObject/gameObject.c:474: *posx=P_portal[1].posx;
   6998 FD 21 15 AB   [14] 2825 	ld	iy, #_P_portal
   699C FD 7E 00      [19] 2826 	ld	a, 0 (iy)
   699F C6 07         [ 7] 2827 	add	a, #0x07
   69A1 DD 77 FC      [19] 2828 	ld	-4 (ix), a
   69A4 FD 7E 01      [19] 2829 	ld	a, 1 (iy)
   69A7 CE 00         [ 7] 2830 	adc	a, #0x00
   69A9 DD 77 FD      [19] 2831 	ld	-3 (ix), a
                           2832 ;src/gameObject/gameObject.c:473: if(objeto->sprite==sprite_Player){                
   69AC DD 7E F7      [19] 2833 	ld	a, -9 (ix)
   69AF C6 03         [ 7] 2834 	add	a, #0x03
   69B1 DD 77 F7      [19] 2835 	ld	-9 (ix), a
   69B4 DD 7E F8      [19] 2836 	ld	a, -8 (ix)
   69B7 CE 00         [ 7] 2837 	adc	a, #0x00
   69B9 DD 77 F8      [19] 2838 	ld	-8 (ix), a
                           2839 ;src/gameObject/gameObject.c:474: *posx=P_portal[1].posx;
   69BC DD 7E FC      [19] 2840 	ld	a, -4 (ix)
   69BF C6 01         [ 7] 2841 	add	a, #0x01
   69C1 DD 77 FE      [19] 2842 	ld	-2 (ix), a
   69C4 DD 7E FD      [19] 2843 	ld	a, -3 (ix)
   69C7 CE 00         [ 7] 2844 	adc	a, #0x00
   69C9 DD 77 FF      [19] 2845 	ld	-1 (ix), a
                           2846 ;src/gameObject/gameObject.c:471: if(*posx==P_portal[0].posx ){
   69CC DD 7E FA      [19] 2847 	ld	a, -6 (ix)
   69CF DD 96 F9      [19] 2848 	sub	a, -7 (ix)
   69D2 20 47         [12] 2849 	jr	NZ,00106$
                           2850 ;src/gameObject/gameObject.c:472: if(*posy==P_portal[0].posy ){
   69D4 1A            [ 7] 2851 	ld	a, (de)
   69D5 DD 77 FB      [19] 2852 	ld	-5 (ix), a
   69D8 E1            [10] 2853 	pop	hl
   69D9 E5            [11] 2854 	push	hl
   69DA 23            [ 6] 2855 	inc	hl
   69DB 23            [ 6] 2856 	inc	hl
   69DC 7E            [ 7] 2857 	ld	a, (hl)
   69DD DD 77 F5      [19] 2858 	ld	-11 (ix), a
   69E0 DD 7E FB      [19] 2859 	ld	a, -5 (ix)
   69E3 DD 96 F5      [19] 2860 	sub	a, -11 (ix)
   69E6 20 33         [12] 2861 	jr	NZ,00106$
                           2862 ;src/gameObject/gameObject.c:473: if(objeto->sprite==sprite_Player){                
   69E8 DD 6E F7      [19] 2863 	ld	l,-9 (ix)
   69EB DD 66 F8      [19] 2864 	ld	h,-8 (ix)
   69EE 6E            [ 7] 2865 	ld	l, (hl)
   69EF 2D            [ 4] 2866 	dec	l
   69F0 20 25         [12] 2867 	jr	NZ,00102$
                           2868 ;src/gameObject/gameObject.c:474: *posx=P_portal[1].posx;
   69F2 DD 6E FE      [19] 2869 	ld	l,-2 (ix)
   69F5 DD 66 FF      [19] 2870 	ld	h,-1 (ix)
   69F8 7E            [ 7] 2871 	ld	a, (hl)
   69F9 02            [ 7] 2872 	ld	(bc), a
                           2873 ;src/gameObject/gameObject.c:475: *posy=P_portal[1].posy;
   69FA FD 21 07 00   [14] 2874 	ld	iy, #0x0007
   69FE C5            [11] 2875 	push	bc
   69FF ED 4B 15 AB   [20] 2876 	ld	bc, (_P_portal)
   6A03 FD 09         [15] 2877 	add	iy, bc
   6A05 C1            [10] 2878 	pop	bc
   6A06 FD 7E 02      [19] 2879 	ld	a, 2 (iy)
   6A09 12            [ 7] 2880 	ld	(de), a
                           2881 ;src/gameObject/gameObject.c:476: mover1casilla(posx,posy,movimiento);                
   6A0A DD 7E 0A      [19] 2882 	ld	a, 10 (ix)
   6A0D F5            [11] 2883 	push	af
   6A0E 33            [ 6] 2884 	inc	sp
   6A0F D5            [11] 2885 	push	de
   6A10 C5            [11] 2886 	push	bc
   6A11 CD 3A 67      [17] 2887 	call	_mover1casilla
   6A14 F1            [10] 2888 	pop	af
   6A15 F1            [10] 2889 	pop	af
   6A16 33            [ 6] 2890 	inc	sp
   6A17                    2891 00102$:
                           2892 ;src/gameObject/gameObject.c:478: return hay_Colision;               
   6A17 2E 01         [ 7] 2893 	ld	l, #0x01
   6A19 18 52         [12] 2894 	jr	00113$
   6A1B                    2895 00106$:
                           2896 ;src/gameObject/gameObject.c:481: if(*posx==P_portal[1].posx){
   6A1B DD 6E FE      [19] 2897 	ld	l,-2 (ix)
   6A1E DD 66 FF      [19] 2898 	ld	h,-1 (ix)
   6A21 7E            [ 7] 2899 	ld	a, (hl)
   6A22 DD 77 FB      [19] 2900 	ld	-5 (ix), a
   6A25 DD 7E FA      [19] 2901 	ld	a, -6 (ix)
   6A28 DD 96 FB      [19] 2902 	sub	a, -5 (ix)
   6A2B 20 3E         [12] 2903 	jr	NZ,00112$
                           2904 ;src/gameObject/gameObject.c:482: if(*posy==P_portal[1].posy){
   6A2D 1A            [ 7] 2905 	ld	a, (de)
   6A2E DD 77 FB      [19] 2906 	ld	-5 (ix), a
   6A31 DD 6E FC      [19] 2907 	ld	l,-4 (ix)
   6A34 DD 66 FD      [19] 2908 	ld	h,-3 (ix)
   6A37 23            [ 6] 2909 	inc	hl
   6A38 23            [ 6] 2910 	inc	hl
   6A39 7E            [ 7] 2911 	ld	a, (hl)
   6A3A DD 77 FE      [19] 2912 	ld	-2 (ix), a
   6A3D DD 7E FB      [19] 2913 	ld	a, -5 (ix)
   6A40 DD 96 FE      [19] 2914 	sub	a, -2 (ix)
   6A43 20 26         [12] 2915 	jr	NZ,00112$
                           2916 ;src/gameObject/gameObject.c:483: if(objeto->sprite==sprite_Player){
   6A45 DD 6E F7      [19] 2917 	ld	l,-9 (ix)
   6A48 DD 66 F8      [19] 2918 	ld	h,-8 (ix)
   6A4B 6E            [ 7] 2919 	ld	l, (hl)
   6A4C 2D            [ 4] 2920 	dec	l
   6A4D 20 18         [12] 2921 	jr	NZ,00108$
                           2922 ;src/gameObject/gameObject.c:484: *posx=P_portal[0].posx;
   6A4F DD 7E F9      [19] 2923 	ld	a, -7 (ix)
   6A52 02            [ 7] 2924 	ld	(bc), a
                           2925 ;src/gameObject/gameObject.c:485: *posy=P_portal[0].posy;
   6A53 2A 15 AB      [16] 2926 	ld	hl, (_P_portal)
   6A56 23            [ 6] 2927 	inc	hl
   6A57 23            [ 6] 2928 	inc	hl
   6A58 7E            [ 7] 2929 	ld	a, (hl)
   6A59 12            [ 7] 2930 	ld	(de), a
                           2931 ;src/gameObject/gameObject.c:486: mover1casilla(posx,posy,movimiento);                
   6A5A DD 7E 0A      [19] 2932 	ld	a, 10 (ix)
   6A5D F5            [11] 2933 	push	af
   6A5E 33            [ 6] 2934 	inc	sp
   6A5F D5            [11] 2935 	push	de
   6A60 C5            [11] 2936 	push	bc
   6A61 CD 3A 67      [17] 2937 	call	_mover1casilla
   6A64 F1            [10] 2938 	pop	af
   6A65 F1            [10] 2939 	pop	af
   6A66 33            [ 6] 2940 	inc	sp
   6A67                    2941 00108$:
                           2942 ;src/gameObject/gameObject.c:488: return hay_Colision;                   
   6A67 2E 01         [ 7] 2943 	ld	l, #0x01
   6A69 18 02         [12] 2944 	jr	00113$
   6A6B                    2945 00112$:
                           2946 ;src/gameObject/gameObject.c:491: return no_Hay_Colision;        
   6A6B 2E 00         [ 7] 2947 	ld	l, #0x00
   6A6D                    2948 00113$:
   6A6D DD F9         [10] 2949 	ld	sp, ix
   6A6F DD E1         [14] 2950 	pop	ix
   6A71 C9            [10] 2951 	ret
                           2952 ;src/gameObject/gameObject.c:493: u8 comprobarPuertas(u8 posx, u8 posy){
                           2953 ;	---------------------------------
                           2954 ; Function comprobarPuertas
                           2955 ; ---------------------------------
   6A72                    2956 _comprobarPuertas::
   6A72 DD E5         [15] 2957 	push	ix
   6A74 DD 21 00 00   [14] 2958 	ld	ix,#0
   6A78 DD 39         [15] 2959 	add	ix,sp
                           2960 ;src/gameObject/gameObject.c:494: for(u8 i=0;i<PuertasMaximas;i++){
   6A7A 0E 00         [ 7] 2961 	ld	c, #0x00
   6A7C                    2962 00106$:
   6A7C 79            [ 4] 2963 	ld	a, c
   6A7D D6 06         [ 7] 2964 	sub	a, #0x06
   6A7F 30 32         [12] 2965 	jr	NC,00104$
                           2966 ;src/gameObject/gameObject.c:495: if(posx==P_puertas[i].posx && posy==P_puertas[i].posy){
   6A81 06 00         [ 7] 2967 	ld	b,#0x00
   6A83 69            [ 4] 2968 	ld	l, c
   6A84 60            [ 4] 2969 	ld	h, b
   6A85 29            [11] 2970 	add	hl, hl
   6A86 09            [11] 2971 	add	hl, bc
   6A87 29            [11] 2972 	add	hl, hl
   6A88 09            [11] 2973 	add	hl, bc
   6A89 45            [ 4] 2974 	ld	b, l
   6A8A 54            [ 4] 2975 	ld	d, h
   6A8B FD 21 17 AB   [14] 2976 	ld	iy, #_P_puertas
   6A8F FD 7E 00      [19] 2977 	ld	a, 0 (iy)
   6A92 80            [ 4] 2978 	add	a, b
   6A93 5F            [ 4] 2979 	ld	e, a
   6A94 FD 7E 01      [19] 2980 	ld	a, 1 (iy)
   6A97 8A            [ 4] 2981 	adc	a, d
   6A98 57            [ 4] 2982 	ld	d, a
   6A99 6B            [ 4] 2983 	ld	l, e
   6A9A 62            [ 4] 2984 	ld	h, d
   6A9B 23            [ 6] 2985 	inc	hl
   6A9C DD 7E 04      [19] 2986 	ld	a,4 (ix)
   6A9F 96            [ 7] 2987 	sub	a,(hl)
   6AA0 20 0E         [12] 2988 	jr	NZ,00107$
   6AA2 6B            [ 4] 2989 	ld	l, e
   6AA3 62            [ 4] 2990 	ld	h, d
   6AA4 23            [ 6] 2991 	inc	hl
   6AA5 23            [ 6] 2992 	inc	hl
   6AA6 DD 7E 05      [19] 2993 	ld	a,5 (ix)
   6AA9 96            [ 7] 2994 	sub	a,(hl)
   6AAA 20 04         [12] 2995 	jr	NZ,00107$
                           2996 ;src/gameObject/gameObject.c:496: return P_puertas[i].num;
   6AAC 1A            [ 7] 2997 	ld	a, (de)
   6AAD 6F            [ 4] 2998 	ld	l, a
   6AAE 18 05         [12] 2999 	jr	00108$
   6AB0                    3000 00107$:
                           3001 ;src/gameObject/gameObject.c:494: for(u8 i=0;i<PuertasMaximas;i++){
   6AB0 0C            [ 4] 3002 	inc	c
   6AB1 18 C9         [12] 3003 	jr	00106$
   6AB3                    3004 00104$:
                           3005 ;src/gameObject/gameObject.c:499: return seguir_En_Nivel;
   6AB3 2E 00         [ 7] 3006 	ld	l, #0x00
   6AB5                    3007 00108$:
   6AB5 DD E1         [14] 3008 	pop	ix
   6AB7 C9            [10] 3009 	ret
                           3010 ;src/gameObject/gameObject.c:501: u8 comprobarColeccionables(u8 posx, u8 posy ,u8 sprite){
                           3011 ;	---------------------------------
                           3012 ; Function comprobarColeccionables
                           3013 ; ---------------------------------
   6AB8                    3014 _comprobarColeccionables::
   6AB8 DD E5         [15] 3015 	push	ix
   6ABA DD 21 00 00   [14] 3016 	ld	ix,#0
   6ABE DD 39         [15] 3017 	add	ix,sp
   6AC0 F5            [11] 3018 	push	af
   6AC1 F5            [11] 3019 	push	af
                           3020 ;src/gameObject/gameObject.c:502: for(u8 i=0;i<ColeccionablesMaximos;i++){
   6AC2 01 00 00      [10] 3021 	ld	bc,#0x0000
   6AC5                    3022 00114$:
   6AC5 78            [ 4] 3023 	ld	a, b
   6AC6 D6 03         [ 7] 3024 	sub	a, #0x03
   6AC8 D2 58 6B      [10] 3025 	jp	NC, 00112$
                           3026 ;src/gameObject/gameObject.c:503: if(posx==P_col[i].posx && posy==P_col[i].posy){
   6ACB 68            [ 4] 3027 	ld	l, b
   6ACC 26 00         [ 7] 3028 	ld	h, #0x00
   6ACE 29            [11] 3029 	add	hl, hl
   6ACF 29            [11] 3030 	add	hl, hl
   6AD0 DD 75 FE      [19] 3031 	ld	-2 (ix), l
   6AD3 DD 74 FF      [19] 3032 	ld	-1 (ix), h
   6AD6 FD 21 19 AB   [14] 3033 	ld	iy, #_P_col
   6ADA FD 7E 00      [19] 3034 	ld	a, 0 (iy)
   6ADD DD 86 FE      [19] 3035 	add	a, -2 (ix)
   6AE0 DD 77 FC      [19] 3036 	ld	-4 (ix), a
   6AE3 FD 7E 01      [19] 3037 	ld	a, 1 (iy)
   6AE6 DD 8E FF      [19] 3038 	adc	a, -1 (ix)
   6AE9 DD 77 FD      [19] 3039 	ld	-3 (ix), a
   6AEC E1            [10] 3040 	pop	hl
   6AED E5            [11] 3041 	push	hl
   6AEE 23            [ 6] 3042 	inc	hl
   6AEF DD 7E 04      [19] 3043 	ld	a,4 (ix)
   6AF2 96            [ 7] 3044 	sub	a,(hl)
   6AF3 20 5E         [12] 3045 	jr	NZ,00115$
   6AF5 E1            [10] 3046 	pop	hl
   6AF6 E5            [11] 3047 	push	hl
   6AF7 23            [ 6] 3048 	inc	hl
   6AF8 23            [ 6] 3049 	inc	hl
   6AF9 DD 7E 05      [19] 3050 	ld	a,5 (ix)
   6AFC 96            [ 7] 3051 	sub	a,(hl)
   6AFD 20 54         [12] 3052 	jr	NZ,00115$
                           3053 ;src/gameObject/gameObject.c:504: if(sprite==sprite_Player){
   6AFF DD 7E 06      [19] 3054 	ld	a, 6 (ix)
   6B02 3D            [ 4] 3055 	dec	a
   6B03 20 4A         [12] 3056 	jr	NZ,00108$
                           3057 ;src/gameObject/gameObject.c:505: P_colList[P_col[i].num]=coleccionable_NOACTIVO;
   6B05 E1            [10] 3058 	pop	hl
   6B06 E5            [11] 3059 	push	hl
   6B07 5E            [ 7] 3060 	ld	e, (hl)
   6B08 FD 2A 21 AB   [20] 3061 	ld	iy, (_P_colList)
   6B0C 16 00         [ 7] 3062 	ld	d,#0x00
   6B0E FD 19         [15] 3063 	add	iy, de
   6B10 FD 36 00 01   [19] 3064 	ld	0 (iy), #0x01
                           3065 ;src/gameObject/gameObject.c:506: if(P_col[i].sprite==sprite_luz){
   6B14 FD 2A 19 AB   [20] 3066 	ld	iy, (_P_col)
   6B18 DD 5E FE      [19] 3067 	ld	e,-2 (ix)
   6B1B DD 56 FF      [19] 3068 	ld	d,-1 (ix)
   6B1E FD 19         [15] 3069 	add	iy, de
   6B20 FD 7E 03      [19] 3070 	ld	a, 3 (iy)
   6B23 FE 25         [ 7] 3071 	cp	a, #0x25
   6B25 20 08         [12] 3072 	jr	NZ,00105$
                           3073 ;src/gameObject/gameObject.c:507: *P_luz=*P_luz+1;                                                             
   6B27 2A 1B AB      [16] 3074 	ld	hl, (_P_luz)
   6B2A 46            [ 7] 3075 	ld	b, (hl)
   6B2B 04            [ 4] 3076 	inc	b
   6B2C 70            [ 7] 3077 	ld	(hl), b
   6B2D 18 12         [12] 3078 	jr	00106$
   6B2F                    3079 00105$:
                           3080 ;src/gameObject/gameObject.c:508: }else if(P_col[i].sprite==sprite_amstradTape){                
   6B2F D6 2F         [ 7] 3081 	sub	a, #0x2f
   6B31 20 08         [12] 3082 	jr	NZ,00102$
                           3083 ;src/gameObject/gameObject.c:509: *P_ams=*P_ams+1;
   6B33 2A 1F AB      [16] 3084 	ld	hl, (_P_ams)
   6B36 46            [ 7] 3085 	ld	b, (hl)
   6B37 04            [ 4] 3086 	inc	b
   6B38 70            [ 7] 3087 	ld	(hl), b
   6B39 18 06         [12] 3088 	jr	00106$
   6B3B                    3089 00102$:
                           3090 ;src/gameObject/gameObject.c:511: *P_fam=*P_fam+1;
   6B3B 2A 1D AB      [16] 3091 	ld	hl, (_P_fam)
   6B3E 46            [ 7] 3092 	ld	b, (hl)
   6B3F 04            [ 4] 3093 	inc	b
   6B40 70            [ 7] 3094 	ld	(hl), b
   6B41                    3095 00106$:
                           3096 ;src/gameObject/gameObject.c:513: P_col[i].posx=0;
   6B41 69            [ 4] 3097 	ld	l, c
   6B42 26 00         [ 7] 3098 	ld	h, #0x00
   6B44 29            [11] 3099 	add	hl, hl
   6B45 29            [11] 3100 	add	hl, hl
   6B46 4D            [ 4] 3101 	ld	c, l
   6B47 44            [ 4] 3102 	ld	b, h
   6B48 2A 19 AB      [16] 3103 	ld	hl, (_P_col)
   6B4B 09            [11] 3104 	add	hl, bc
   6B4C 23            [ 6] 3105 	inc	hl
   6B4D 36 00         [10] 3106 	ld	(hl), #0x00
   6B4F                    3107 00108$:
                           3108 ;src/gameObject/gameObject.c:515: return hay_Colision; 
   6B4F 2E 01         [ 7] 3109 	ld	l, #0x01
   6B51 18 07         [12] 3110 	jr	00116$
   6B53                    3111 00115$:
                           3112 ;src/gameObject/gameObject.c:502: for(u8 i=0;i<ColeccionablesMaximos;i++){
   6B53 04            [ 4] 3113 	inc	b
   6B54 48            [ 4] 3114 	ld	c, b
   6B55 C3 C5 6A      [10] 3115 	jp	00114$
   6B58                    3116 00112$:
                           3117 ;src/gameObject/gameObject.c:518: return no_Hay_Colision;
   6B58 2E 00         [ 7] 3118 	ld	l, #0x00
   6B5A                    3119 00116$:
   6B5A DD F9         [10] 3120 	ld	sp, ix
   6B5C DD E1         [14] 3121 	pop	ix
   6B5E C9            [10] 3122 	ret
                           3123 ;src/gameObject/gameObject.c:521: u8 comprobarEnemigos(u8 posx,u8 posy ,u8 posicion){
                           3124 ;	---------------------------------
                           3125 ; Function comprobarEnemigos
                           3126 ; ---------------------------------
   6B5F                    3127 _comprobarEnemigos::
   6B5F DD E5         [15] 3128 	push	ix
   6B61 DD 21 00 00   [14] 3129 	ld	ix,#0
   6B65 DD 39         [15] 3130 	add	ix,sp
                           3131 ;src/gameObject/gameObject.c:522: if(posicion==posicion_Izquieda){
   6B67 DD 7E 06      [19] 3132 	ld	a, 6 (ix)
                           3133 ;src/gameObject/gameObject.c:523: for(u8 i=0;i<enemigosMaximos;i++){
   6B6A B7            [ 4] 3134 	or	a,a
   6B6B 20 2B         [12] 3135 	jr	NZ,00128$
   6B6D 4F            [ 4] 3136 	ld	c,a
   6B6E                    3137 00113$:
   6B6E 79            [ 4] 3138 	ld	a, c
   6B6F D6 05         [ 7] 3139 	sub	a, #0x05
   6B71 30 51         [12] 3140 	jr	NC,00111$
                           3141 ;src/gameObject/gameObject.c:524: if(enemigosIzquierda[i].posx==posx && enemigosIzquierda[i].posy==posy){
   6B73 06 00         [ 7] 3142 	ld	b,#0x00
   6B75 69            [ 4] 3143 	ld	l, c
   6B76 60            [ 4] 3144 	ld	h, b
   6B77 29            [11] 3145 	add	hl, hl
   6B78 09            [11] 3146 	add	hl, bc
   6B79 29            [11] 3147 	add	hl, hl
   6B7A 09            [11] 3148 	add	hl, bc
   6B7B 11 F9 AB      [10] 3149 	ld	de, #_enemigosIzquierda
   6B7E 19            [11] 3150 	add	hl, de
   6B7F 5D            [ 4] 3151 	ld	e,l
   6B80 54            [ 4] 3152 	ld	d,h
   6B81 23            [ 6] 3153 	inc	hl
   6B82 DD 7E 04      [19] 3154 	ld	a,4 (ix)
   6B85 96            [ 7] 3155 	sub	a,(hl)
   6B86 20 0D         [12] 3156 	jr	NZ,00114$
   6B88 EB            [ 4] 3157 	ex	de,hl
   6B89 23            [ 6] 3158 	inc	hl
   6B8A 23            [ 6] 3159 	inc	hl
   6B8B DD 7E 05      [19] 3160 	ld	a,5 (ix)
   6B8E 96            [ 7] 3161 	sub	a,(hl)
   6B8F 20 04         [12] 3162 	jr	NZ,00114$
                           3163 ;src/gameObject/gameObject.c:525: return hay_Colision;
   6B91 2E 01         [ 7] 3164 	ld	l, #0x01
   6B93 18 31         [12] 3165 	jr	00118$
   6B95                    3166 00114$:
                           3167 ;src/gameObject/gameObject.c:523: for(u8 i=0;i<enemigosMaximos;i++){
   6B95 0C            [ 4] 3168 	inc	c
   6B96 18 D6         [12] 3169 	jr	00113$
                           3170 ;src/gameObject/gameObject.c:529: for(u8 i=0;i<enemigosMaximos;i++){
   6B98                    3171 00128$:
   6B98 0E 00         [ 7] 3172 	ld	c, #0x00
   6B9A                    3173 00116$:
   6B9A 79            [ 4] 3174 	ld	a, c
   6B9B D6 05         [ 7] 3175 	sub	a, #0x05
   6B9D 30 25         [12] 3176 	jr	NC,00111$
                           3177 ;src/gameObject/gameObject.c:530: if(enemigosDerecha[i].posx==posx && enemigosDerecha[i].posy==posy){
   6B9F 06 00         [ 7] 3178 	ld	b,#0x00
   6BA1 69            [ 4] 3179 	ld	l, c
   6BA2 60            [ 4] 3180 	ld	h, b
   6BA3 29            [11] 3181 	add	hl, hl
   6BA4 09            [11] 3182 	add	hl, bc
   6BA5 29            [11] 3183 	add	hl, hl
   6BA6 09            [11] 3184 	add	hl, bc
   6BA7 11 1C AC      [10] 3185 	ld	de, #_enemigosDerecha
   6BAA 19            [11] 3186 	add	hl, de
   6BAB 5D            [ 4] 3187 	ld	e,l
   6BAC 54            [ 4] 3188 	ld	d,h
   6BAD 23            [ 6] 3189 	inc	hl
   6BAE DD 7E 04      [19] 3190 	ld	a,4 (ix)
   6BB1 96            [ 7] 3191 	sub	a,(hl)
   6BB2 20 0D         [12] 3192 	jr	NZ,00117$
   6BB4 EB            [ 4] 3193 	ex	de,hl
   6BB5 23            [ 6] 3194 	inc	hl
   6BB6 23            [ 6] 3195 	inc	hl
   6BB7 DD 7E 05      [19] 3196 	ld	a,5 (ix)
   6BBA 96            [ 7] 3197 	sub	a,(hl)
   6BBB 20 04         [12] 3198 	jr	NZ,00117$
                           3199 ;src/gameObject/gameObject.c:531: return hay_Colision;
   6BBD 2E 01         [ 7] 3200 	ld	l, #0x01
   6BBF 18 05         [12] 3201 	jr	00118$
   6BC1                    3202 00117$:
                           3203 ;src/gameObject/gameObject.c:529: for(u8 i=0;i<enemigosMaximos;i++){
   6BC1 0C            [ 4] 3204 	inc	c
   6BC2 18 D6         [12] 3205 	jr	00116$
   6BC4                    3206 00111$:
                           3207 ;src/gameObject/gameObject.c:535: return no_Hay_Colision;
   6BC4 2E 00         [ 7] 3208 	ld	l, #0x00
   6BC6                    3209 00118$:
   6BC6 DD E1         [14] 3210 	pop	ix
   6BC8 C9            [10] 3211 	ret
                           3212 	.area _CODE
                           3213 	.area _INITIALIZER
                           3214 	.area _CABS (ABS)
