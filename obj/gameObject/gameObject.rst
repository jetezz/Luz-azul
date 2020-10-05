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
                             16 	.globl _dibujarGameObject
                             17 	.globl _limpiarRastro
                             18 	.globl _moverGameObject
                             19 	.globl _comprobarColisiones
                             20 	.globl _moverElEspejo
                             21 	.globl _movimientoSimple
                             22 ;--------------------------------------------------------
                             23 ; special function registers
                             24 ;--------------------------------------------------------
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DATA
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
                             53 ;src/gameObject/gameObject.c:18: void dibujarGameObject(TGameObject* objeto){
                             54 ;	---------------------------------
                             55 ; Function dibujarGameObject
                             56 ; ---------------------------------
   4E6F                      57 _dibujarGameObject::
   4E6F DD E5         [15]   58 	push	ix
   4E71 DD 21 00 00   [14]   59 	ld	ix,#0
   4E75 DD 39         [15]   60 	add	ix,sp
                             61 ;src/gameObject/gameObject.c:19: if(objeto->posx!=0){
   4E77 DD 4E 04      [19]   62 	ld	c,4 (ix)
   4E7A DD 46 05      [19]   63 	ld	b,5 (ix)
   4E7D 69            [ 4]   64 	ld	l, c
   4E7E 60            [ 4]   65 	ld	h, b
   4E7F 23            [ 6]   66 	inc	hl
   4E80 56            [ 7]   67 	ld	d, (hl)
   4E81 7A            [ 4]   68 	ld	a, d
   4E82 B7            [ 4]   69 	or	a, a
   4E83 28 59         [12]   70 	jr	Z,00111$
                             71 ;src/gameObject/gameObject.c:20: if(objeto->sprite==sprite_Player){
   4E85 69            [ 4]   72 	ld	l, c
   4E86 60            [ 4]   73 	ld	h, b
   4E87 23            [ 6]   74 	inc	hl
   4E88 23            [ 6]   75 	inc	hl
   4E89 23            [ 6]   76 	inc	hl
   4E8A 5E            [ 7]   77 	ld	e, (hl)
                             78 ;src/gameObject/gameObject.c:21: cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   4E8B 69            [ 4]   79 	ld	l, c
   4E8C 60            [ 4]   80 	ld	h, b
   4E8D 23            [ 6]   81 	inc	hl
   4E8E 23            [ 6]   82 	inc	hl
                             83 ;src/gameObject/gameObject.c:20: if(objeto->sprite==sprite_Player){
   4E8F 7B            [ 4]   84 	ld	a, e
   4E90 3D            [ 4]   85 	dec	a
   4E91 20 17         [12]   86 	jr	NZ,00107$
                             87 ;src/gameObject/gameObject.c:21: cpct_drawSprite(playerSprite_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
   4E93 46            [ 7]   88 	ld	b, (hl)
   4E94 4A            [ 4]   89 	ld	c, d
   4E95 C5            [11]   90 	push	bc
   4E96 CD 1B 54      [17]   91 	call	_calcularPosicionEnPantalla
   4E99 F1            [10]   92 	pop	af
   4E9A 4D            [ 4]   93 	ld	c, l
   4E9B 44            [ 4]   94 	ld	b, h
   4E9C 21 04 10      [10]   95 	ld	hl, #0x1004
   4E9F E5            [11]   96 	push	hl
   4EA0 C5            [11]   97 	push	bc
   4EA1 21 08 4E      [10]   98 	ld	hl, #_playerSprite_0
   4EA4 E5            [11]   99 	push	hl
   4EA5 CD 9A 55      [17]  100 	call	_cpct_drawSprite
   4EA8 18 34         [12]  101 	jr	00111$
   4EAA                     102 00107$:
                            103 ;src/gameObject/gameObject.c:22: }else if(objeto->sprite==sprite_Rock){
   4EAA 7B            [ 4]  104 	ld	a, e
   4EAB D6 02         [ 7]  105 	sub	a, #0x02
   4EAD 20 17         [12]  106 	jr	NZ,00104$
                            107 ;src/gameObject/gameObject.c:23: cpct_drawSprite(rock_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   4EAF 46            [ 7]  108 	ld	b, (hl)
   4EB0 4A            [ 4]  109 	ld	c, d
   4EB1 C5            [11]  110 	push	bc
   4EB2 CD 1B 54      [17]  111 	call	_calcularPosicionEnPantalla
   4EB5 F1            [10]  112 	pop	af
   4EB6 4D            [ 4]  113 	ld	c, l
   4EB7 44            [ 4]  114 	ld	b, h
   4EB8 21 04 10      [10]  115 	ld	hl, #0x1004
   4EBB E5            [11]  116 	push	hl
   4EBC C5            [11]  117 	push	bc
   4EBD 21 B4 4D      [10]  118 	ld	hl, #_rock_0
   4EC0 E5            [11]  119 	push	hl
   4EC1 CD 9A 55      [17]  120 	call	_cpct_drawSprite
   4EC4 18 18         [12]  121 	jr	00111$
   4EC6                     122 00104$:
                            123 ;src/gameObject/gameObject.c:24: }else if(objeto->sprite==sprite_RockInmovil){
   4EC6 7B            [ 4]  124 	ld	a, e
   4EC7 D6 03         [ 7]  125 	sub	a, #0x03
   4EC9 20 13         [12]  126 	jr	NZ,00111$
                            127 ;src/gameObject/gameObject.c:25: cpct_drawSprite(rockInmovil_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
   4ECB 46            [ 7]  128 	ld	b, (hl)
   4ECC 4A            [ 4]  129 	ld	c, d
   4ECD C5            [11]  130 	push	bc
   4ECE CD 1B 54      [17]  131 	call	_calcularPosicionEnPantalla
   4ED1 F1            [10]  132 	pop	af
   4ED2 01 60 4D      [10]  133 	ld	bc, #_rockInmovil_0+0
   4ED5 11 04 10      [10]  134 	ld	de, #0x1004
   4ED8 D5            [11]  135 	push	de
   4ED9 E5            [11]  136 	push	hl
   4EDA C5            [11]  137 	push	bc
   4EDB CD 9A 55      [17]  138 	call	_cpct_drawSprite
   4EDE                     139 00111$:
   4EDE DD E1         [14]  140 	pop	ix
   4EE0 C9            [10]  141 	ret
                            142 ;src/gameObject/gameObject.c:30: void limpiarRastro(u8 posx, u8 posy){
                            143 ;	---------------------------------
                            144 ; Function limpiarRastro
                            145 ; ---------------------------------
   4EE1                     146 _limpiarRastro::
                            147 ;src/gameObject/gameObject.c:31: cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
   4EE1 21 03 00      [10]  148 	ld	hl, #3+0
   4EE4 39            [11]  149 	add	hl, sp
   4EE5 7E            [ 7]  150 	ld	a, (hl)
   4EE6 F5            [11]  151 	push	af
   4EE7 33            [ 6]  152 	inc	sp
   4EE8 21 03 00      [10]  153 	ld	hl, #3+0
   4EEB 39            [11]  154 	add	hl, sp
   4EEC 7E            [ 7]  155 	ld	a, (hl)
   4EED F5            [11]  156 	push	af
   4EEE 33            [ 6]  157 	inc	sp
   4EEF CD 1B 54      [17]  158 	call	_calcularPosicionEnPantalla
   4EF2 F1            [10]  159 	pop	af
   4EF3 01 04 10      [10]  160 	ld	bc, #0x1004
   4EF6 C5            [11]  161 	push	bc
   4EF7 01 00 00      [10]  162 	ld	bc, #0x0000
   4EFA C5            [11]  163 	push	bc
   4EFB E5            [11]  164 	push	hl
   4EFC CD 0C 57      [17]  165 	call	_cpct_drawSolidBox
   4EFF C9            [10]  166 	ret
                            167 ;src/gameObject/gameObject.c:33: void moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8 posicion){       
                            168 ;	---------------------------------
                            169 ; Function moverGameObject
                            170 ; ---------------------------------
   4F00                     171 _moverGameObject::
   4F00 DD E5         [15]  172 	push	ix
   4F02 DD 21 00 00   [14]  173 	ld	ix,#0
   4F06 DD 39         [15]  174 	add	ix,sp
   4F08 21 F3 FF      [10]  175 	ld	hl, #-13
   4F0B 39            [11]  176 	add	hl, sp
   4F0C F9            [ 6]  177 	ld	sp, hl
                            178 ;src/gameObject/gameObject.c:34: if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){    
   4F0D DD 7E 04      [19]  179 	ld	a, 4 (ix)
   4F10 DD 77 F5      [19]  180 	ld	-11 (ix), a
   4F13 DD 7E 05      [19]  181 	ld	a, 5 (ix)
   4F16 DD 77 F6      [19]  182 	ld	-10 (ix), a
   4F19 DD 7E F5      [19]  183 	ld	a, -11 (ix)
   4F1C C6 04         [ 7]  184 	add	a, #0x04
   4F1E DD 77 FE      [19]  185 	ld	-2 (ix), a
   4F21 DD 7E F6      [19]  186 	ld	a, -10 (ix)
   4F24 CE 00         [ 7]  187 	adc	a, #0x00
   4F26 DD 77 FF      [19]  188 	ld	-1 (ix), a
   4F29 DD 6E FE      [19]  189 	ld	l,-2 (ix)
   4F2C DD 66 FF      [19]  190 	ld	h,-1 (ix)
   4F2F 4E            [ 7]  191 	ld	c, (hl)
   4F30 DD 7E F5      [19]  192 	ld	a, -11 (ix)
   4F33 C6 03         [ 7]  193 	add	a, #0x03
   4F35 DD 77 FC      [19]  194 	ld	-4 (ix), a
   4F38 DD 7E F6      [19]  195 	ld	a, -10 (ix)
   4F3B CE 00         [ 7]  196 	adc	a, #0x00
   4F3D DD 77 FD      [19]  197 	ld	-3 (ix), a
   4F40 79            [ 4]  198 	ld	a, c
   4F41 B7            [ 4]  199 	or	a, a
   4F42 28 0B         [12]  200 	jr	Z,00113$
   4F44 DD 6E FC      [19]  201 	ld	l,-4 (ix)
   4F47 DD 66 FD      [19]  202 	ld	h,-3 (ix)
   4F4A 46            [ 7]  203 	ld	b, (hl)
   4F4B 05            [ 4]  204 	dec	b
   4F4C CA 90 50      [10]  205 	jp	Z,00114$
   4F4F                     206 00113$:
                            207 ;src/gameObject/gameObject.c:35: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy);            
   4F4F DD 7E F5      [19]  208 	ld	a, -11 (ix)
   4F52 C6 02         [ 7]  209 	add	a, #0x02
   4F54 DD 77 FA      [19]  210 	ld	-6 (ix), a
   4F57 DD 7E F6      [19]  211 	ld	a, -10 (ix)
   4F5A CE 00         [ 7]  212 	adc	a, #0x00
   4F5C DD 77 FB      [19]  213 	ld	-5 (ix), a
   4F5F DD 6E FA      [19]  214 	ld	l,-6 (ix)
   4F62 DD 66 FB      [19]  215 	ld	h,-5 (ix)
   4F65 56            [ 7]  216 	ld	d, (hl)
   4F66 DD 7E F5      [19]  217 	ld	a, -11 (ix)
   4F69 C6 01         [ 7]  218 	add	a, #0x01
   4F6B DD 77 F8      [19]  219 	ld	-8 (ix), a
   4F6E DD 7E F6      [19]  220 	ld	a, -10 (ix)
   4F71 CE 00         [ 7]  221 	adc	a, #0x00
   4F73 DD 77 F9      [19]  222 	ld	-7 (ix), a
   4F76 DD 6E F8      [19]  223 	ld	l,-8 (ix)
   4F79 DD 66 F9      [19]  224 	ld	h,-7 (ix)
   4F7C 5E            [ 7]  225 	ld	e, (hl)
   4F7D D5            [11]  226 	push	de
   4F7E DD 7E 06      [19]  227 	ld	a, 6 (ix)
   4F81 F5            [11]  228 	push	af
   4F82 33            [ 6]  229 	inc	sp
   4F83 CD 61 54      [17]  230 	call	_calcularMaximosyMinimos
   4F86 F1            [10]  231 	pop	af
   4F87 33            [ 6]  232 	inc	sp
                            233 ;src/gameObject/gameObject.c:36: if(movimiento!=mover_SinMovimiento){                  
   4F88 DD 75 F7      [19]  234 	ld	-9 (ix), l
   4F8B 7D            [ 4]  235 	ld	a, l
   4F8C B7            [ 4]  236 	or	a, a
   4F8D CA 98 50      [10]  237 	jp	Z, 00117$
                            238 ;src/gameObject/gameObject.c:37: u8 nextPosx=objeto->posx;
   4F90 DD 6E F8      [19]  239 	ld	l,-8 (ix)
   4F93 DD 66 F9      [19]  240 	ld	h,-7 (ix)
   4F96 7E            [ 7]  241 	ld	a, (hl)
   4F97 DD 77 F4      [19]  242 	ld	-12 (ix), a
                            243 ;src/gameObject/gameObject.c:38: u8 nextPosy=objeto->posy;
   4F9A DD 6E FA      [19]  244 	ld	l,-6 (ix)
   4F9D DD 66 FB      [19]  245 	ld	h,-5 (ix)
   4FA0 7E            [ 7]  246 	ld	a, (hl)
   4FA1 DD 77 F3      [19]  247 	ld	-13 (ix), a
                            248 ;src/gameObject/gameObject.c:41: if(objeto->sprite==sprite_Player|| objeto->sprite==sprite_Rock){
   4FA4 DD 6E FC      [19]  249 	ld	l,-4 (ix)
   4FA7 DD 66 FD      [19]  250 	ld	h,-3 (ix)
   4FAA 7E            [ 7]  251 	ld	a, (hl)
   4FAB FE 01         [ 7]  252 	cp	a, #0x01
   4FAD 28 04         [12]  253 	jr	Z,00101$
   4FAF D6 02         [ 7]  254 	sub	a, #0x02
   4FB1 20 18         [12]  255 	jr	NZ,00102$
   4FB3                     256 00101$:
                            257 ;src/gameObject/gameObject.c:42: movimientoSimple(&nextPosx,&nextPosy,movimiento); 
   4FB3 21 00 00      [10]  258 	ld	hl, #0x0000
   4FB6 39            [11]  259 	add	hl, sp
   4FB7 EB            [ 4]  260 	ex	de,hl
   4FB8 21 01 00      [10]  261 	ld	hl, #0x0001
   4FBB 39            [11]  262 	add	hl, sp
   4FBC 4D            [ 4]  263 	ld	c, l
   4FBD 44            [ 4]  264 	ld	b, h
   4FBE DD 7E F7      [19]  265 	ld	a, -9 (ix)
   4FC1 F5            [11]  266 	push	af
   4FC2 33            [ 6]  267 	inc	sp
   4FC3 D5            [11]  268 	push	de
   4FC4 C5            [11]  269 	push	bc
   4FC5 CD D3 51      [17]  270 	call	_movimientoSimple
   4FC8 F1            [10]  271 	pop	af
   4FC9 F1            [10]  272 	pop	af
   4FCA 33            [ 6]  273 	inc	sp
   4FCB                     274 00102$:
                            275 ;src/gameObject/gameObject.c:45: ObjetoColisionado=comprobarColisiones(nextPosx,nextPosy,rocasCol);               
   4FCB DD 6E 07      [19]  276 	ld	l,7 (ix)
   4FCE DD 66 08      [19]  277 	ld	h,8 (ix)
   4FD1 E5            [11]  278 	push	hl
   4FD2 DD 66 F3      [19]  279 	ld	h, -13 (ix)
   4FD5 DD 6E F4      [19]  280 	ld	l, -12 (ix)
   4FD8 E5            [11]  281 	push	hl
   4FD9 CD 9D 50      [17]  282 	call	_comprobarColisiones
   4FDC F1            [10]  283 	pop	af
   4FDD F1            [10]  284 	pop	af
   4FDE 4D            [ 4]  285 	ld	c, l
                            286 ;src/gameObject/gameObject.c:47: if(ObjetoColisionado==SinColision){             
   4FDF 79            [ 4]  287 	ld	a, c
   4FE0 D6 32         [ 7]  288 	sub	a, #0x32
   4FE2 20 65         [12]  289 	jr	NZ,00109$
                            290 ;src/gameObject/gameObject.c:48: limpiarRastro(objeto->posx,objeto->posy);
   4FE4 DD 6E FA      [19]  291 	ld	l,-6 (ix)
   4FE7 DD 66 FB      [19]  292 	ld	h,-5 (ix)
   4FEA 46            [ 7]  293 	ld	b, (hl)
   4FEB DD 6E F8      [19]  294 	ld	l,-8 (ix)
   4FEE DD 66 F9      [19]  295 	ld	h,-7 (ix)
   4FF1 4E            [ 7]  296 	ld	c, (hl)
   4FF2 C5            [11]  297 	push	bc
   4FF3 CD E1 4E      [17]  298 	call	_limpiarRastro
   4FF6 F1            [10]  299 	pop	af
                            300 ;src/gameObject/gameObject.c:49: objeto->posx=nextPosx;
   4FF7 DD 6E F8      [19]  301 	ld	l,-8 (ix)
   4FFA DD 66 F9      [19]  302 	ld	h,-7 (ix)
   4FFD DD 7E F4      [19]  303 	ld	a, -12 (ix)
   5000 77            [ 7]  304 	ld	(hl), a
                            305 ;src/gameObject/gameObject.c:50: objeto->posy=nextPosy;
   5001 DD 6E FA      [19]  306 	ld	l,-6 (ix)
   5004 DD 66 FB      [19]  307 	ld	h,-5 (ix)
   5007 DD 7E F3      [19]  308 	ld	a, -13 (ix)
   500A 77            [ 7]  309 	ld	(hl), a
                            310 ;src/gameObject/gameObject.c:51: dibujarGameObject(objeto);
   500B C1            [10]  311 	pop	bc
   500C E1            [10]  312 	pop	hl
   500D E5            [11]  313 	push	hl
   500E C5            [11]  314 	push	bc
   500F E5            [11]  315 	push	hl
   5010 CD 6F 4E      [17]  316 	call	_dibujarGameObject
   5013 F1            [10]  317 	pop	af
                            318 ;src/gameObject/gameObject.c:52: if(objeto->sprite!=sprite_Player)
   5014 DD 6E FC      [19]  319 	ld	l,-4 (ix)
   5017 DD 66 FD      [19]  320 	ld	h,-3 (ix)
   501A 4E            [ 7]  321 	ld	c, (hl)
   501B 0D            [ 4]  322 	dec	c
   501C 28 68         [12]  323 	jr	Z,00110$
                            324 ;src/gameObject/gameObject.c:53: moverElEspejo(objeto->num,movimiento,rocasCol,rocasEspejo,posicion);                 
   501E DD 6E F5      [19]  325 	ld	l,-11 (ix)
   5021 DD 66 F6      [19]  326 	ld	h,-10 (ix)
   5024 46            [ 7]  327 	ld	b, (hl)
   5025 DD 7E 0B      [19]  328 	ld	a, 11 (ix)
   5028 F5            [11]  329 	push	af
   5029 33            [ 6]  330 	inc	sp
   502A DD 6E 09      [19]  331 	ld	l,9 (ix)
   502D DD 66 0A      [19]  332 	ld	h,10 (ix)
   5030 E5            [11]  333 	push	hl
   5031 DD 6E 07      [19]  334 	ld	l,7 (ix)
   5034 DD 66 08      [19]  335 	ld	h,8 (ix)
   5037 E5            [11]  336 	push	hl
   5038 DD 7E F7      [19]  337 	ld	a, -9 (ix)
   503B F5            [11]  338 	push	af
   503C 33            [ 6]  339 	inc	sp
   503D C5            [11]  340 	push	bc
   503E 33            [ 6]  341 	inc	sp
   503F CD E6 50      [17]  342 	call	_moverElEspejo
   5042 21 07 00      [10]  343 	ld	hl, #7
   5045 39            [11]  344 	add	hl, sp
   5046 F9            [ 6]  345 	ld	sp, hl
   5047 18 3D         [12]  346 	jr	00110$
   5049                     347 00109$:
                            348 ;src/gameObject/gameObject.c:55: if(objeto->sprite==sprite_Player)          
   5049 DD 6E FC      [19]  349 	ld	l,-4 (ix)
   504C DD 66 FD      [19]  350 	ld	h,-3 (ix)
   504F 46            [ 7]  351 	ld	b, (hl)
   5050 10 34         [13]  352 	djnz	00110$
                            353 ;src/gameObject/gameObject.c:56: moverGameObject(&rocasCol[ObjetoColisionado],movimiento,rocasCol,rocasEspejo,posicion);                      
   5052 06 00         [ 7]  354 	ld	b,#0x00
   5054 69            [ 4]  355 	ld	l, c
   5055 60            [ 4]  356 	ld	h, b
   5056 29            [11]  357 	add	hl, hl
   5057 29            [11]  358 	add	hl, hl
   5058 09            [11]  359 	add	hl, bc
   5059 4D            [ 4]  360 	ld	c, l
   505A 44            [ 4]  361 	ld	b, h
   505B 79            [ 4]  362 	ld	a, c
   505C DD 86 07      [19]  363 	add	a, 7 (ix)
   505F 4F            [ 4]  364 	ld	c, a
   5060 78            [ 4]  365 	ld	a, b
   5061 DD 8E 08      [19]  366 	adc	a, 8 (ix)
   5064 47            [ 4]  367 	ld	b, a
   5065 DD 7E 0B      [19]  368 	ld	a, 11 (ix)
   5068 F5            [11]  369 	push	af
   5069 33            [ 6]  370 	inc	sp
   506A DD 6E 09      [19]  371 	ld	l,9 (ix)
   506D DD 66 0A      [19]  372 	ld	h,10 (ix)
   5070 E5            [11]  373 	push	hl
   5071 DD 6E 07      [19]  374 	ld	l,7 (ix)
   5074 DD 66 08      [19]  375 	ld	h,8 (ix)
   5077 E5            [11]  376 	push	hl
   5078 DD 7E F7      [19]  377 	ld	a, -9 (ix)
   507B F5            [11]  378 	push	af
   507C 33            [ 6]  379 	inc	sp
   507D C5            [11]  380 	push	bc
   507E CD 00 4F      [17]  381 	call	_moverGameObject
   5081 21 08 00      [10]  382 	ld	hl, #8
   5084 39            [11]  383 	add	hl, sp
   5085 F9            [ 6]  384 	ld	sp, hl
   5086                     385 00110$:
                            386 ;src/gameObject/gameObject.c:58: objeto->cronoMovimiento=retardoMovimiento;
   5086 DD 6E FE      [19]  387 	ld	l,-2 (ix)
   5089 DD 66 FF      [19]  388 	ld	h,-1 (ix)
   508C 36 FF         [10]  389 	ld	(hl), #0xff
   508E 18 08         [12]  390 	jr	00117$
   5090                     391 00114$:
                            392 ;src/gameObject/gameObject.c:61: objeto->cronoMovimiento-=1;
   5090 0D            [ 4]  393 	dec	c
   5091 DD 6E FE      [19]  394 	ld	l,-2 (ix)
   5094 DD 66 FF      [19]  395 	ld	h,-1 (ix)
   5097 71            [ 7]  396 	ld	(hl), c
   5098                     397 00117$:
   5098 DD F9         [10]  398 	ld	sp, ix
   509A DD E1         [14]  399 	pop	ix
   509C C9            [10]  400 	ret
                            401 ;src/gameObject/gameObject.c:64: u8 comprobarColisiones(u8 posx,u8 posy,TGameObject* rocas){
                            402 ;	---------------------------------
                            403 ; Function comprobarColisiones
                            404 ; ---------------------------------
   509D                     405 _comprobarColisiones::
   509D DD E5         [15]  406 	push	ix
   509F DD 21 00 00   [14]  407 	ld	ix,#0
   50A3 DD 39         [15]  408 	add	ix,sp
                            409 ;src/gameObject/gameObject.c:65: u8 colision=SinColision;
                            410 ;src/gameObject/gameObject.c:67: for(u8 i=0;i<RocasMaximas;i++){
   50A5 01 32 00      [10]  411 	ld	bc,#0x0032
   50A8                     412 00107$:
   50A8 78            [ 4]  413 	ld	a, b
   50A9 D6 05         [ 7]  414 	sub	a, #0x05
   50AB 30 35         [12]  415 	jr	NC,00105$
                            416 ;src/gameObject/gameObject.c:68: if(rocas[i].posx!=0){
   50AD 58            [ 4]  417 	ld	e,b
   50AE 16 00         [ 7]  418 	ld	d,#0x00
   50B0 6B            [ 4]  419 	ld	l, e
   50B1 62            [ 4]  420 	ld	h, d
   50B2 29            [11]  421 	add	hl, hl
   50B3 29            [11]  422 	add	hl, hl
   50B4 19            [11]  423 	add	hl, de
   50B5 EB            [ 4]  424 	ex	de,hl
   50B6 DD 7E 06      [19]  425 	ld	a, 6 (ix)
   50B9 83            [ 4]  426 	add	a, e
   50BA 5F            [ 4]  427 	ld	e, a
   50BB DD 7E 07      [19]  428 	ld	a, 7 (ix)
   50BE 8A            [ 4]  429 	adc	a, d
   50BF 57            [ 4]  430 	ld	d, a
   50C0 6B            [ 4]  431 	ld	l, e
   50C1 62            [ 4]  432 	ld	h, d
   50C2 23            [ 6]  433 	inc	hl
   50C3 7E            [ 7]  434 	ld	a, (hl)
   50C4 B7            [ 4]  435 	or	a, a
   50C5 28 18         [12]  436 	jr	Z,00108$
                            437 ;src/gameObject/gameObject.c:69: if(comprobarColisiones1vs1(posx,posy,rocas[i].posx,rocas[i].posy)==hay_Colision){           
   50C7 EB            [ 4]  438 	ex	de,hl
   50C8 23            [ 6]  439 	inc	hl
   50C9 23            [ 6]  440 	inc	hl
   50CA 56            [ 7]  441 	ld	d, (hl)
   50CB C5            [11]  442 	push	bc
   50CC 5F            [ 4]  443 	ld	e, a
   50CD D5            [11]  444 	push	de
   50CE DD 66 05      [19]  445 	ld	h, 5 (ix)
   50D1 DD 6E 04      [19]  446 	ld	l, 4 (ix)
   50D4 E5            [11]  447 	push	hl
   50D5 CD E7 54      [17]  448 	call	_comprobarColisiones1vs1
   50D8 F1            [10]  449 	pop	af
   50D9 F1            [10]  450 	pop	af
   50DA C1            [10]  451 	pop	bc
   50DB 2D            [ 4]  452 	dec	l
   50DC 20 01         [12]  453 	jr	NZ,00108$
                            454 ;src/gameObject/gameObject.c:70: colision=i;
   50DE 48            [ 4]  455 	ld	c, b
   50DF                     456 00108$:
                            457 ;src/gameObject/gameObject.c:67: for(u8 i=0;i<RocasMaximas;i++){
   50DF 04            [ 4]  458 	inc	b
   50E0 18 C6         [12]  459 	jr	00107$
   50E2                     460 00105$:
                            461 ;src/gameObject/gameObject.c:74: return colision;
   50E2 69            [ 4]  462 	ld	l, c
   50E3 DD E1         [14]  463 	pop	ix
   50E5 C9            [10]  464 	ret
                            465 ;src/gameObject/gameObject.c:76: void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocas,TGameObject* rocasEspejo,u8 posicion){
                            466 ;	---------------------------------
                            467 ; Function moverElEspejo
                            468 ; ---------------------------------
   50E6                     469 _moverElEspejo::
   50E6 DD E5         [15]  470 	push	ix
   50E8 DD 21 00 00   [14]  471 	ld	ix,#0
   50EC DD 39         [15]  472 	add	ix,sp
   50EE 21 F6 FF      [10]  473 	ld	hl, #-10
   50F1 39            [11]  474 	add	hl, sp
   50F2 F9            [ 6]  475 	ld	sp, hl
                            476 ;src/gameObject/gameObject.c:80: u8 nextMovimiento=movimiento;   
   50F3 DD 5E 05      [19]  477 	ld	e, 5 (ix)
                            478 ;src/gameObject/gameObject.c:83: objetoEspejo=&rocasEspejo[num];
   50F6 DD 4E 04      [19]  479 	ld	c,4 (ix)
   50F9 06 00         [ 7]  480 	ld	b,#0x00
   50FB 69            [ 4]  481 	ld	l, c
   50FC 60            [ 4]  482 	ld	h, b
   50FD 29            [11]  483 	add	hl, hl
   50FE 29            [11]  484 	add	hl, hl
   50FF 09            [11]  485 	add	hl, bc
   5100 4D            [ 4]  486 	ld	c, l
   5101 44            [ 4]  487 	ld	b, h
                            488 ;src/gameObject/gameObject.c:82: if(posicion==posicion_Izquieda){
   5102 DD 7E 0A      [19]  489 	ld	a, 10 (ix)
   5105 B7            [ 4]  490 	or	a, a
   5106 20 17         [12]  491 	jr	NZ,00102$
                            492 ;src/gameObject/gameObject.c:83: objetoEspejo=&rocasEspejo[num];
   5108 DD 6E 08      [19]  493 	ld	l,8 (ix)
   510B DD 66 09      [19]  494 	ld	h,9 (ix)
   510E 09            [11]  495 	add	hl, bc
   510F 4D            [ 4]  496 	ld	c, l
   5110 44            [ 4]  497 	ld	b, h
                            498 ;src/gameObject/gameObject.c:84: objetosColisionables=rocasEspejo;        
   5111 DD 7E 08      [19]  499 	ld	a, 8 (ix)
   5114 DD 77 F8      [19]  500 	ld	-8 (ix), a
   5117 DD 7E 09      [19]  501 	ld	a, 9 (ix)
   511A DD 77 F9      [19]  502 	ld	-7 (ix), a
   511D 18 15         [12]  503 	jr	00103$
   511F                     504 00102$:
                            505 ;src/gameObject/gameObject.c:86: objetoEspejo=&rocas[num];
   511F DD 6E 06      [19]  506 	ld	l,6 (ix)
   5122 DD 66 07      [19]  507 	ld	h,7 (ix)
   5125 09            [11]  508 	add	hl, bc
   5126 4D            [ 4]  509 	ld	c, l
   5127 44            [ 4]  510 	ld	b, h
                            511 ;src/gameObject/gameObject.c:87: objetosColisionables=rocas;        
   5128 DD 7E 06      [19]  512 	ld	a, 6 (ix)
   512B DD 77 F8      [19]  513 	ld	-8 (ix), a
   512E DD 7E 07      [19]  514 	ld	a, 7 (ix)
   5131 DD 77 F9      [19]  515 	ld	-7 (ix), a
   5134                     516 00103$:
                            517 ;src/gameObject/gameObject.c:90: if(movimiento==mover_Izquierda){
   5134 7B            [ 4]  518 	ld	a, e
   5135 3D            [ 4]  519 	dec	a
   5136 20 02         [12]  520 	jr	NZ,00105$
                            521 ;src/gameObject/gameObject.c:91: nextMovimiento=mover_Derecha;
   5138 1E 03         [ 7]  522 	ld	e, #0x03
   513A                     523 00105$:
                            524 ;src/gameObject/gameObject.c:92: }if(movimiento==mover_Derecha){
   513A DD 7E 05      [19]  525 	ld	a, 5 (ix)
   513D D6 03         [ 7]  526 	sub	a, #0x03
   513F 20 02         [12]  527 	jr	NZ,00107$
                            528 ;src/gameObject/gameObject.c:93: nextMovimiento=mover_Izquierda;
   5141 1E 01         [ 7]  529 	ld	e, #0x01
   5143                     530 00107$:
                            531 ;src/gameObject/gameObject.c:98: if(nextMovimiento!=mover_SinMovimiento){                  
   5143 7B            [ 4]  532 	ld	a, e
   5144 B7            [ 4]  533 	or	a, a
   5145 CA CE 51      [10]  534 	jp	Z, 00112$
                            535 ;src/gameObject/gameObject.c:99: u8 nextPosx=objetoEspejo->posx;
   5148 21 01 00      [10]  536 	ld	hl, #0x0001
   514B 09            [11]  537 	add	hl,bc
   514C DD 75 FE      [19]  538 	ld	-2 (ix), l
   514F DD 74 FF      [19]  539 	ld	-1 (ix), h
   5152 7E            [ 7]  540 	ld	a, (hl)
   5153 DD 77 F7      [19]  541 	ld	-9 (ix), a
                            542 ;src/gameObject/gameObject.c:100: u8 nextPosy=objetoEspejo->posy;
   5156 21 02 00      [10]  543 	ld	hl, #0x0002
   5159 09            [11]  544 	add	hl,bc
   515A DD 75 FC      [19]  545 	ld	-4 (ix), l
   515D DD 74 FD      [19]  546 	ld	-3 (ix), h
   5160 7E            [ 7]  547 	ld	a, (hl)
   5161 DD 77 F6      [19]  548 	ld	-10 (ix), a
                            549 ;src/gameObject/gameObject.c:103: movimientoSimple(&nextPosx,&nextPosy,nextMovimiento);           
   5164 21 00 00      [10]  550 	ld	hl, #0x0000
   5167 39            [11]  551 	add	hl, sp
   5168 DD 75 FA      [19]  552 	ld	-6 (ix), l
   516B DD 74 FB      [19]  553 	ld	-5 (ix), h
   516E 21 01 00      [10]  554 	ld	hl, #0x0001
   5171 39            [11]  555 	add	hl, sp
   5172 C5            [11]  556 	push	bc
   5173 7B            [ 4]  557 	ld	a, e
   5174 F5            [11]  558 	push	af
   5175 33            [ 6]  559 	inc	sp
   5176 DD 5E FA      [19]  560 	ld	e,-6 (ix)
   5179 DD 56 FB      [19]  561 	ld	d,-5 (ix)
   517C D5            [11]  562 	push	de
   517D E5            [11]  563 	push	hl
   517E CD D3 51      [17]  564 	call	_movimientoSimple
   5181 F1            [10]  565 	pop	af
   5182 F1            [10]  566 	pop	af
   5183 33            [ 6]  567 	inc	sp
   5184 DD 6E F8      [19]  568 	ld	l,-8 (ix)
   5187 DD 66 F9      [19]  569 	ld	h,-7 (ix)
   518A E5            [11]  570 	push	hl
   518B DD 66 F6      [19]  571 	ld	h, -10 (ix)
   518E DD 6E F7      [19]  572 	ld	l, -9 (ix)
   5191 E5            [11]  573 	push	hl
   5192 CD 9D 50      [17]  574 	call	_comprobarColisiones
   5195 F1            [10]  575 	pop	af
   5196 F1            [10]  576 	pop	af
   5197 C1            [10]  577 	pop	bc
                            578 ;src/gameObject/gameObject.c:107: if(ObjetoColisionado==SinColision){             
   5198 7D            [ 4]  579 	ld	a, l
   5199 D6 32         [ 7]  580 	sub	a, #0x32
   519B 20 31         [12]  581 	jr	NZ,00112$
                            582 ;src/gameObject/gameObject.c:108: limpiarRastro(objetoEspejo->posx,objetoEspejo->posy);
   519D DD 6E FC      [19]  583 	ld	l,-4 (ix)
   51A0 DD 66 FD      [19]  584 	ld	h,-3 (ix)
   51A3 7E            [ 7]  585 	ld	a, (hl)
   51A4 DD 6E FE      [19]  586 	ld	l,-2 (ix)
   51A7 DD 66 FF      [19]  587 	ld	h,-1 (ix)
   51AA 56            [ 7]  588 	ld	d, (hl)
   51AB C5            [11]  589 	push	bc
   51AC F5            [11]  590 	push	af
   51AD 33            [ 6]  591 	inc	sp
   51AE D5            [11]  592 	push	de
   51AF 33            [ 6]  593 	inc	sp
   51B0 CD E1 4E      [17]  594 	call	_limpiarRastro
   51B3 F1            [10]  595 	pop	af
   51B4 C1            [10]  596 	pop	bc
                            597 ;src/gameObject/gameObject.c:109: objetoEspejo->posx=nextPosx;
   51B5 DD 6E FE      [19]  598 	ld	l,-2 (ix)
   51B8 DD 66 FF      [19]  599 	ld	h,-1 (ix)
   51BB DD 7E F7      [19]  600 	ld	a, -9 (ix)
   51BE 77            [ 7]  601 	ld	(hl), a
                            602 ;src/gameObject/gameObject.c:110: objetoEspejo->posy=nextPosy;
   51BF DD 6E FC      [19]  603 	ld	l,-4 (ix)
   51C2 DD 66 FD      [19]  604 	ld	h,-3 (ix)
   51C5 DD 7E F6      [19]  605 	ld	a, -10 (ix)
   51C8 77            [ 7]  606 	ld	(hl), a
                            607 ;src/gameObject/gameObject.c:111: dibujarGameObject(objetoEspejo);                             
   51C9 C5            [11]  608 	push	bc
   51CA CD 6F 4E      [17]  609 	call	_dibujarGameObject
   51CD F1            [10]  610 	pop	af
   51CE                     611 00112$:
   51CE DD F9         [10]  612 	ld	sp, ix
   51D0 DD E1         [14]  613 	pop	ix
   51D2 C9            [10]  614 	ret
                            615 ;src/gameObject/gameObject.c:117: void movimientoSimple(u8* posx, u8* posy,u8 movimiento){
                            616 ;	---------------------------------
                            617 ; Function movimientoSimple
                            618 ; ---------------------------------
   51D3                     619 _movimientoSimple::
   51D3 DD E5         [15]  620 	push	ix
   51D5 DD 21 00 00   [14]  621 	ld	ix,#0
   51D9 DD 39         [15]  622 	add	ix,sp
                            623 ;src/gameObject/gameObject.c:119: *posx-=1;
   51DB DD 4E 04      [19]  624 	ld	c,4 (ix)
   51DE DD 46 05      [19]  625 	ld	b,5 (ix)
                            626 ;src/gameObject/gameObject.c:118: if(movimiento==mover_Izquierda){
   51E1 DD 7E 08      [19]  627 	ld	a, 8 (ix)
   51E4 3D            [ 4]  628 	dec	a
   51E5 20 06         [12]  629 	jr	NZ,00110$
                            630 ;src/gameObject/gameObject.c:119: *posx-=1;
   51E7 0A            [ 7]  631 	ld	a, (bc)
   51E8 C6 FF         [ 7]  632 	add	a, #0xff
   51EA 02            [ 7]  633 	ld	(bc), a
   51EB 18 28         [12]  634 	jr	00112$
   51ED                     635 00110$:
                            636 ;src/gameObject/gameObject.c:121: *posy-=1;
   51ED DD 6E 06      [19]  637 	ld	l,6 (ix)
   51F0 DD 66 07      [19]  638 	ld	h,7 (ix)
                            639 ;src/gameObject/gameObject.c:120: }else if(movimiento==mover_Arriba){
   51F3 DD 7E 08      [19]  640 	ld	a, 8 (ix)
   51F6 D6 02         [ 7]  641 	sub	a, #0x02
   51F8 20 05         [12]  642 	jr	NZ,00107$
                            643 ;src/gameObject/gameObject.c:121: *posy-=1;
   51FA 4E            [ 7]  644 	ld	c, (hl)
   51FB 0D            [ 4]  645 	dec	c
   51FC 71            [ 7]  646 	ld	(hl), c
   51FD 18 16         [12]  647 	jr	00112$
   51FF                     648 00107$:
                            649 ;src/gameObject/gameObject.c:122: }else if(movimiento==mover_Derecha){
   51FF DD 7E 08      [19]  650 	ld	a, 8 (ix)
   5202 D6 03         [ 7]  651 	sub	a, #0x03
   5204 20 05         [12]  652 	jr	NZ,00104$
                            653 ;src/gameObject/gameObject.c:123: *posx+=1;
   5206 0A            [ 7]  654 	ld	a, (bc)
   5207 3C            [ 4]  655 	inc	a
   5208 02            [ 7]  656 	ld	(bc), a
   5209 18 0A         [12]  657 	jr	00112$
   520B                     658 00104$:
                            659 ;src/gameObject/gameObject.c:124: }else if(movimiento==mover_Abajo){
   520B DD 7E 08      [19]  660 	ld	a, 8 (ix)
   520E D6 04         [ 7]  661 	sub	a, #0x04
   5210 20 03         [12]  662 	jr	NZ,00112$
                            663 ;src/gameObject/gameObject.c:125: *posy+=1;
   5212 4E            [ 7]  664 	ld	c, (hl)
   5213 0C            [ 4]  665 	inc	c
   5214 71            [ 7]  666 	ld	(hl), c
   5215                     667 00112$:
   5215 DD E1         [14]  668 	pop	ix
   5217 C9            [10]  669 	ret
                            670 	.area _CODE
                            671 	.area _INITIALIZER
                            672 	.area _CABS (ABS)
