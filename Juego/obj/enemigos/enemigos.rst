                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module enemigos
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _abs
                             12 	.globl _mover1casilla
                             13 	.globl _moverYdibujar
                             14 	.globl _dibujarGameObject
                             15 	.globl _contadorEnemigosDe
                             16 	.globl _contadorEnemigosIz
                             17 	.globl _enemigosDerecha
                             18 	.globl _enemigosIzquierda
                             19 	.globl _initEnemigos
                             20 	.globl _crearEnemigos
                             21 	.globl _dibujarEnemigos
                             22 	.globl _resetEnemigos
                             23 	.globl _activarIAS
                             24 	.globl _iaEnemigo1
                             25 	.globl _iaEnemigo2
                             26 	.globl _crearEnemigoIzquierda
                             27 	.globl _crearEnemigoDerecha
                             28 	.globl _sinEnemigos
                             29 	.globl _enemigosNivel01
                             30 	.globl _enemigosNvel_trap_01
                             31 	.globl _enemigosNvel_04
                             32 	.globl _enemigosNvel_04_01
                             33 ;--------------------------------------------------------
                             34 ; special function registers
                             35 ;--------------------------------------------------------
                             36 ;--------------------------------------------------------
                             37 ; ram data
                             38 ;--------------------------------------------------------
                             39 	.area _DATA
   AB87                      40 _creadorDeEnemigos:
   AB87                      41 	.ds 100
   ABEB                      42 _P_portal:
   ABEB                      43 	.ds 2
   ABED                      44 _P_puertas:
   ABED                      45 	.ds 2
   ABEF                      46 _P_col:
   ABEF                      47 	.ds 2
   ABF1                      48 _P_luz:
   ABF1                      49 	.ds 2
   ABF3                      50 _P_fam:
   ABF3                      51 	.ds 2
   ABF5                      52 _P_ams:
   ABF5                      53 	.ds 2
   ABF7                      54 _P_colList:
   ABF7                      55 	.ds 2
   ABF9                      56 _enemigosIzquierda::
   ABF9                      57 	.ds 35
   AC1C                      58 _enemigosDerecha::
   AC1C                      59 	.ds 35
   AC3F                      60 _contadorEnemigosIz::
   AC3F                      61 	.ds 1
   AC40                      62 _contadorEnemigosDe::
   AC40                      63 	.ds 1
                             64 ;--------------------------------------------------------
                             65 ; ram data
                             66 ;--------------------------------------------------------
                             67 	.area _INITIALIZED
                             68 ;--------------------------------------------------------
                             69 ; absolute external ram data
                             70 ;--------------------------------------------------------
                             71 	.area _DABS (ABS)
                             72 ;--------------------------------------------------------
                             73 ; global & static initialisations
                             74 ;--------------------------------------------------------
                             75 	.area _HOME
                             76 	.area _GSINIT
                             77 	.area _GSFINAL
                             78 	.area _GSINIT
                             79 ;--------------------------------------------------------
                             80 ; Home
                             81 ;--------------------------------------------------------
                             82 	.area _HOME
                             83 	.area _HOME
                             84 ;--------------------------------------------------------
                             85 ; code
                             86 ;--------------------------------------------------------
                             87 	.area _CODE
                             88 ;src/enemigos/enemigos.c:15: void initEnemigos(){
                             89 ;	---------------------------------
                             90 ; Function initEnemigos
                             91 ; ---------------------------------
   6BE3                      92 _initEnemigos::
                             93 ;src/enemigos/enemigos.c:16: creadorDeEnemigos[nivel_01]=sinEnemigos;
   6BE3 21 AE 70      [10]   94 	ld	hl, #_sinEnemigos
   6BE6 22 89 AB      [16]   95 	ld	((_creadorDeEnemigos + 0x0002)), hl
                             96 ;src/enemigos/enemigos.c:17: creadorDeEnemigos[nivel_TRAP_01]=enemigosNvel_trap_01;
   6BE9 21 BD 70      [10]   97 	ld	hl, #_enemigosNvel_trap_01
   6BEC 22 8D AB      [16]   98 	ld	((_creadorDeEnemigos + 0x0006)), hl
                             99 ;src/enemigos/enemigos.c:18: creadorDeEnemigos[nivel_02]=sinEnemigos;
   6BEF 21 AE 70      [10]  100 	ld	hl, #_sinEnemigos
   6BF2 22 8F AB      [16]  101 	ld	((_creadorDeEnemigos + 0x0008)), hl
                            102 ;src/enemigos/enemigos.c:19: creadorDeEnemigos[nivel_01_01]=sinEnemigos;
   6BF5 22 8B AB      [16]  103 	ld	((_creadorDeEnemigos + 0x0004)), hl
                            104 ;src/enemigos/enemigos.c:20: creadorDeEnemigos[nivel_03]=sinEnemigos;
   6BF8 22 91 AB      [16]  105 	ld	((_creadorDeEnemigos + 0x000a)), hl
                            106 ;src/enemigos/enemigos.c:21: creadorDeEnemigos[nivel_04]=enemigosNvel_04;
   6BFB 21 EF 70      [10]  107 	ld	hl, #_enemigosNvel_04
   6BFE 22 93 AB      [16]  108 	ld	((_creadorDeEnemigos + 0x000c)), hl
                            109 ;src/enemigos/enemigos.c:22: creadorDeEnemigos[nivel_04_01]=enemigosNvel_04_01;
   6C01 21 09 71      [10]  110 	ld	hl, #_enemigosNvel_04_01
   6C04 22 95 AB      [16]  111 	ld	((_creadorDeEnemigos + 0x000e)), hl
                            112 ;src/enemigos/enemigos.c:23: creadorDeEnemigos[nivel_05]=sinEnemigos;
   6C07 21 AE 70      [10]  113 	ld	hl, #_sinEnemigos
   6C0A 22 97 AB      [16]  114 	ld	((_creadorDeEnemigos + 0x0010)), hl
                            115 ;src/enemigos/enemigos.c:29: contadorEnemigosIz=0;
   6C0D 21 3F AC      [10]  116 	ld	hl,#_contadorEnemigosIz + 0
   6C10 36 00         [10]  117 	ld	(hl), #0x00
                            118 ;src/enemigos/enemigos.c:30: contadorEnemigosDe=0;
   6C12 21 40 AC      [10]  119 	ld	hl,#_contadorEnemigosDe + 0
   6C15 36 00         [10]  120 	ld	(hl), #0x00
   6C17 C9            [10]  121 	ret
                            122 ;src/enemigos/enemigos.c:32: void crearEnemigos(u8 nivel){
                            123 ;	---------------------------------
                            124 ; Function crearEnemigos
                            125 ; ---------------------------------
   6C18                     126 _crearEnemigos::
   6C18 DD E5         [15]  127 	push	ix
   6C1A DD 21 00 00   [14]  128 	ld	ix,#0
   6C1E DD 39         [15]  129 	add	ix,sp
                            130 ;src/enemigos/enemigos.c:33: resetEnemigos();
   6C20 CD 9E 6C      [17]  131 	call	_resetEnemigos
                            132 ;src/enemigos/enemigos.c:34: creadorDeEnemigos[nivel]();
   6C23 01 87 AB      [10]  133 	ld	bc, #_creadorDeEnemigos+0
   6C26 DD 6E 04      [19]  134 	ld	l, 4 (ix)
   6C29 26 00         [ 7]  135 	ld	h, #0x00
   6C2B 29            [11]  136 	add	hl, hl
   6C2C 09            [11]  137 	add	hl, bc
   6C2D 4E            [ 7]  138 	ld	c, (hl)
   6C2E 23            [ 6]  139 	inc	hl
   6C2F 66            [ 7]  140 	ld	h, (hl)
   6C30 69            [ 4]  141 	ld	l, c
   6C31 CD CF A9      [17]  142 	call	___sdcc_call_hl
                            143 ;src/enemigos/enemigos.c:35: dibujarEnemigos();
   6C34 DD E1         [14]  144 	pop	ix
   6C36 C3 39 6C      [10]  145 	jp	_dibujarEnemigos
                            146 ;src/enemigos/enemigos.c:38: void dibujarEnemigos(){
                            147 ;	---------------------------------
                            148 ; Function dibujarEnemigos
                            149 ; ---------------------------------
   6C39                     150 _dibujarEnemigos::
   6C39 DD E5         [15]  151 	push	ix
   6C3B DD 21 00 00   [14]  152 	ld	ix,#0
   6C3F DD 39         [15]  153 	add	ix,sp
   6C41 F5            [11]  154 	push	af
                            155 ;src/enemigos/enemigos.c:39: for(u8 i=0;i<enemigosMaximos ;i++){
   6C42 0E 00         [ 7]  156 	ld	c, #0x00
   6C44                     157 00111$:
   6C44 79            [ 4]  158 	ld	a, c
   6C45 D6 05         [ 7]  159 	sub	a, #0x05
   6C47 30 50         [12]  160 	jr	NC,00113$
                            161 ;src/enemigos/enemigos.c:40: if(enemigosIzquierda[i].posx>0){
   6C49 06 00         [ 7]  162 	ld	b,#0x00
   6C4B 69            [ 4]  163 	ld	l, c
   6C4C 60            [ 4]  164 	ld	h, b
   6C4D 29            [11]  165 	add	hl, hl
   6C4E 09            [11]  166 	add	hl, bc
   6C4F 29            [11]  167 	add	hl, hl
   6C50 09            [11]  168 	add	hl, bc
   6C51 EB            [ 4]  169 	ex	de,hl
   6C52 FD 21 F9 AB   [14]  170 	ld	iy, #_enemigosIzquierda
   6C56 FD 19         [15]  171 	add	iy, de
   6C58 FD E5         [15]  172 	push	iy
   6C5A E1            [10]  173 	pop	hl
   6C5B 23            [ 6]  174 	inc	hl
   6C5C 7E            [ 7]  175 	ld	a, (hl)
   6C5D B7            [ 4]  176 	or	a, a
   6C5E 28 17         [12]  177 	jr	Z,00104$
                            178 ;src/enemigos/enemigos.c:41: if (enemigosIzquierda[i].sprite==sprite_enemigo1){
   6C60 FD E5         [15]  179 	push	iy
   6C62 E1            [10]  180 	pop	hl
   6C63 23            [ 6]  181 	inc	hl
   6C64 23            [ 6]  182 	inc	hl
   6C65 23            [ 6]  183 	inc	hl
   6C66 7E            [ 7]  184 	ld	a, (hl)
   6C67 D6 2A         [ 7]  185 	sub	a, #0x2a
   6C69 20 0C         [12]  186 	jr	NZ,00104$
                            187 ;src/enemigos/enemigos.c:42: dibujarGameObject(&enemigosIzquierda[i]);
   6C6B FD E5         [15]  188 	push	iy
   6C6D E1            [10]  189 	pop	hl
   6C6E C5            [11]  190 	push	bc
   6C6F D5            [11]  191 	push	de
   6C70 E5            [11]  192 	push	hl
   6C71 CD 57 59      [17]  193 	call	_dibujarGameObject
   6C74 F1            [10]  194 	pop	af
   6C75 D1            [10]  195 	pop	de
   6C76 C1            [10]  196 	pop	bc
   6C77                     197 00104$:
                            198 ;src/enemigos/enemigos.c:45: if(enemigosDerecha[i].posx>0){
   6C77 21 1C AC      [10]  199 	ld	hl, #_enemigosDerecha
   6C7A 19            [11]  200 	add	hl,de
   6C7B E3            [19]  201 	ex	(sp), hl
   6C7C E1            [10]  202 	pop	hl
   6C7D E5            [11]  203 	push	hl
   6C7E 23            [ 6]  204 	inc	hl
   6C7F 7E            [ 7]  205 	ld	a, (hl)
   6C80 B7            [ 4]  206 	or	a, a
   6C81 28 13         [12]  207 	jr	Z,00112$
                            208 ;src/enemigos/enemigos.c:46: if (enemigosDerecha[i].sprite==sprite_enemigo1){
   6C83 E1            [10]  209 	pop	hl
   6C84 E5            [11]  210 	push	hl
   6C85 23            [ 6]  211 	inc	hl
   6C86 23            [ 6]  212 	inc	hl
   6C87 23            [ 6]  213 	inc	hl
   6C88 7E            [ 7]  214 	ld	a, (hl)
   6C89 D6 2A         [ 7]  215 	sub	a, #0x2a
   6C8B 20 09         [12]  216 	jr	NZ,00112$
                            217 ;src/enemigos/enemigos.c:47: dibujarGameObject(&enemigosDerecha[i]);                
   6C8D D1            [10]  218 	pop	de
   6C8E D5            [11]  219 	push	de
   6C8F C5            [11]  220 	push	bc
   6C90 D5            [11]  221 	push	de
   6C91 CD 57 59      [17]  222 	call	_dibujarGameObject
   6C94 F1            [10]  223 	pop	af
   6C95 C1            [10]  224 	pop	bc
   6C96                     225 00112$:
                            226 ;src/enemigos/enemigos.c:39: for(u8 i=0;i<enemigosMaximos ;i++){
   6C96 0C            [ 4]  227 	inc	c
   6C97 18 AB         [12]  228 	jr	00111$
   6C99                     229 00113$:
   6C99 DD F9         [10]  230 	ld	sp, ix
   6C9B DD E1         [14]  231 	pop	ix
   6C9D C9            [10]  232 	ret
                            233 ;src/enemigos/enemigos.c:53: void resetEnemigos(){
                            234 ;	---------------------------------
                            235 ; Function resetEnemigos
                            236 ; ---------------------------------
   6C9E                     237 _resetEnemigos::
                            238 ;src/enemigos/enemigos.c:54: for (u8 i=0;i<enemigosMaximos;i++){
   6C9E 0E 00         [ 7]  239 	ld	c, #0x00
   6CA0                     240 00103$:
   6CA0 79            [ 4]  241 	ld	a, c
   6CA1 D6 05         [ 7]  242 	sub	a, #0x05
   6CA3 D0            [11]  243 	ret	NC
                            244 ;src/enemigos/enemigos.c:55: enemigosIzquierda[i].posx=0;
   6CA4 06 00         [ 7]  245 	ld	b,#0x00
   6CA6 69            [ 4]  246 	ld	l, c
   6CA7 60            [ 4]  247 	ld	h, b
   6CA8 29            [11]  248 	add	hl, hl
   6CA9 09            [11]  249 	add	hl, bc
   6CAA 29            [11]  250 	add	hl, hl
   6CAB 09            [11]  251 	add	hl, bc
   6CAC EB            [ 4]  252 	ex	de,hl
   6CAD 21 FA AB      [10]  253 	ld	hl,#_enemigosIzquierda+1
   6CB0 19            [11]  254 	add	hl,de
   6CB1 36 00         [10]  255 	ld	(hl), #0x00
                            256 ;src/enemigos/enemigos.c:56: enemigosDerecha[i].posx=0;
   6CB3 21 1D AC      [10]  257 	ld	hl,#_enemigosDerecha+1
   6CB6 19            [11]  258 	add	hl,de
   6CB7 36 00         [10]  259 	ld	(hl), #0x00
                            260 ;src/enemigos/enemigos.c:54: for (u8 i=0;i<enemigosMaximos;i++){
   6CB9 0C            [ 4]  261 	inc	c
   6CBA 18 E4         [12]  262 	jr	00103$
                            263 ;src/enemigos/enemigos.c:60: u8 activarIAS(u8 posx, u8 posy,u8 posicion,TGameObject* rocas,TGameObject* rocasEspejo, u8 frecuencias){
                            264 ;	---------------------------------
                            265 ; Function activarIAS
                            266 ; ---------------------------------
   6CBC                     267 _activarIAS::
   6CBC DD E5         [15]  268 	push	ix
   6CBE DD 21 00 00   [14]  269 	ld	ix,#0
   6CC2 DD 39         [15]  270 	add	ix,sp
   6CC4 21 F8 FF      [10]  271 	ld	hl, #-8
   6CC7 39            [11]  272 	add	hl, sp
   6CC8 F9            [ 6]  273 	ld	sp, hl
                            274 ;src/enemigos/enemigos.c:61: u8 estado=no_pasa_nada;
   6CC9 DD 36 FC 00   [19]  275 	ld	-4 (ix), #0x00
                            276 ;src/enemigos/enemigos.c:62: if(frecuencias==0){        
   6CCD DD 7E 0B      [19]  277 	ld	a, 11 (ix)
   6CD0 B7            [ 4]  278 	or	a, a
   6CD1 C2 CE 6D      [10]  279 	jp	NZ, 00121$
                            280 ;src/enemigos/enemigos.c:63: for(u8 i=0;i<enemigosMaximos;i++){
   6CD4 DD 7E 06      [19]  281 	ld	a, 6 (ix)
   6CD7 3D            [ 4]  282 	dec	a
   6CD8 20 04         [12]  283 	jr	NZ,00172$
   6CDA 3E 01         [ 7]  284 	ld	a,#0x01
   6CDC 18 01         [12]  285 	jr	00173$
   6CDE                     286 00172$:
   6CDE AF            [ 4]  287 	xor	a,a
   6CDF                     288 00173$:
   6CDF DD 77 FD      [19]  289 	ld	-3 (ix), a
   6CE2 DD 77 FB      [19]  290 	ld	-5 (ix), a
   6CE5 DD 36 F8 00   [19]  291 	ld	-8 (ix), #0x00
   6CE9                     292 00123$:
   6CE9 DD 7E F8      [19]  293 	ld	a, -8 (ix)
   6CEC D6 05         [ 7]  294 	sub	a, #0x05
   6CEE D2 CE 6D      [10]  295 	jp	NC, 00121$
                            296 ;src/enemigos/enemigos.c:64: if(enemigosIzquierda[i].posx>0){
   6CF1 DD 4E F8      [19]  297 	ld	c,-8 (ix)
   6CF4 06 00         [ 7]  298 	ld	b,#0x00
   6CF6 69            [ 4]  299 	ld	l, c
   6CF7 60            [ 4]  300 	ld	h, b
   6CF8 29            [11]  301 	add	hl, hl
   6CF9 09            [11]  302 	add	hl, bc
   6CFA 29            [11]  303 	add	hl, hl
   6CFB 09            [11]  304 	add	hl, bc
   6CFC 4D            [ 4]  305 	ld	c, l
   6CFD 44            [ 4]  306 	ld	b, h
   6CFE 21 F9 AB      [10]  307 	ld	hl, #_enemigosIzquierda
   6D01 09            [11]  308 	add	hl,bc
   6D02 5D            [ 4]  309 	ld	e,l
   6D03 54            [ 4]  310 	ld	d,h
   6D04 23            [ 6]  311 	inc	hl
   6D05 7E            [ 7]  312 	ld	a, (hl)
   6D06 B7            [ 4]  313 	or	a, a
   6D07 28 4C         [12]  314 	jr	Z,00109$
                            315 ;src/enemigos/enemigos.c:65: if(enemigosIzquierda[i].sprite==sprite_enemigo1){
   6D09 6B            [ 4]  316 	ld	l, e
   6D0A 62            [ 4]  317 	ld	h, d
   6D0B 23            [ 6]  318 	inc	hl
   6D0C 23            [ 6]  319 	inc	hl
   6D0D 23            [ 6]  320 	inc	hl
   6D0E 7E            [ 7]  321 	ld	a, (hl)
   6D0F D6 2A         [ 7]  322 	sub	a, #0x2a
   6D11 20 22         [12]  323 	jr	NZ,00106$
                            324 ;src/enemigos/enemigos.c:66: if(posicion==posicion_Izquieda)
   6D13 DD 7E 06      [19]  325 	ld	a, 6 (ix)
   6D16 B7            [ 4]  326 	or	a, a
   6D17 20 3C         [12]  327 	jr	NZ,00109$
                            328 ;src/enemigos/enemigos.c:67: estado=iaEnemigo1(&enemigosIzquierda[i],posx,posy,rocas);
   6D19 C5            [11]  329 	push	bc
   6D1A DD 6E 07      [19]  330 	ld	l,7 (ix)
   6D1D DD 66 08      [19]  331 	ld	h,8 (ix)
   6D20 E5            [11]  332 	push	hl
   6D21 DD 66 05      [19]  333 	ld	h, 5 (ix)
   6D24 DD 6E 04      [19]  334 	ld	l, 4 (ix)
   6D27 E5            [11]  335 	push	hl
   6D28 D5            [11]  336 	push	de
   6D29 CD D6 6D      [17]  337 	call	_iaEnemigo1
   6D2C F1            [10]  338 	pop	af
   6D2D F1            [10]  339 	pop	af
   6D2E F1            [10]  340 	pop	af
   6D2F C1            [10]  341 	pop	bc
   6D30 DD 75 FC      [19]  342 	ld	-4 (ix), l
   6D33 18 20         [12]  343 	jr	00109$
   6D35                     344 00106$:
                            345 ;src/enemigos/enemigos.c:69: if(posicion==posicion_Izquieda)
   6D35 DD 7E 06      [19]  346 	ld	a, 6 (ix)
   6D38 B7            [ 4]  347 	or	a, a
   6D39 20 1A         [12]  348 	jr	NZ,00109$
                            349 ;src/enemigos/enemigos.c:70: estado=iaEnemigo2(&enemigosIzquierda[i],posx,posy,rocas);
   6D3B C5            [11]  350 	push	bc
   6D3C DD 6E 07      [19]  351 	ld	l,7 (ix)
   6D3F DD 66 08      [19]  352 	ld	h,8 (ix)
   6D42 E5            [11]  353 	push	hl
   6D43 DD 66 05      [19]  354 	ld	h, 5 (ix)
   6D46 DD 6E 04      [19]  355 	ld	l, 4 (ix)
   6D49 E5            [11]  356 	push	hl
   6D4A D5            [11]  357 	push	de
   6D4B CD E8 6E      [17]  358 	call	_iaEnemigo2
   6D4E F1            [10]  359 	pop	af
   6D4F F1            [10]  360 	pop	af
   6D50 F1            [10]  361 	pop	af
   6D51 C1            [10]  362 	pop	bc
   6D52 DD 75 FC      [19]  363 	ld	-4 (ix), l
   6D55                     364 00109$:
                            365 ;src/enemigos/enemigos.c:74: if(enemigosDerecha[i].posx>0){
   6D55 21 1C AC      [10]  366 	ld	hl, #_enemigosDerecha
   6D58 09            [11]  367 	add	hl,bc
   6D59 DD 75 F9      [19]  368 	ld	-7 (ix), l
   6D5C DD 74 FA      [19]  369 	ld	-6 (ix), h
   6D5F 23            [ 6]  370 	inc	hl
   6D60 7E            [ 7]  371 	ld	a, (hl)
   6D61 B7            [ 4]  372 	or	a, a
   6D62 28 64         [12]  373 	jr	Z,00124$
                            374 ;src/enemigos/enemigos.c:75: if(enemigosDerecha[i].sprite==sprite_enemigo1){
   6D64 DD 7E F9      [19]  375 	ld	a, -7 (ix)
   6D67 DD 77 FE      [19]  376 	ld	-2 (ix), a
   6D6A DD 7E FA      [19]  377 	ld	a, -6 (ix)
   6D6D DD 77 FF      [19]  378 	ld	-1 (ix), a
   6D70 DD 6E FE      [19]  379 	ld	l,-2 (ix)
   6D73 DD 66 FF      [19]  380 	ld	h,-1 (ix)
   6D76 23            [ 6]  381 	inc	hl
   6D77 23            [ 6]  382 	inc	hl
   6D78 23            [ 6]  383 	inc	hl
   6D79 7E            [ 7]  384 	ld	a, (hl)
   6D7A D6 2A         [ 7]  385 	sub	a, #0x2a
   6D7C 20 26         [12]  386 	jr	NZ,00115$
                            387 ;src/enemigos/enemigos.c:76: if(posicion==posicion_Derecha)
   6D7E DD 7E FB      [19]  388 	ld	a, -5 (ix)
   6D81 B7            [ 4]  389 	or	a, a
   6D82 28 44         [12]  390 	jr	Z,00124$
                            391 ;src/enemigos/enemigos.c:77: estado=iaEnemigo1(&enemigosDerecha[i],posx,posy,rocasEspejo);                    
   6D84 DD 4E F9      [19]  392 	ld	c,-7 (ix)
   6D87 DD 46 FA      [19]  393 	ld	b,-6 (ix)
   6D8A DD 6E 09      [19]  394 	ld	l,9 (ix)
   6D8D DD 66 0A      [19]  395 	ld	h,10 (ix)
   6D90 E5            [11]  396 	push	hl
   6D91 DD 66 05      [19]  397 	ld	h, 5 (ix)
   6D94 DD 6E 04      [19]  398 	ld	l, 4 (ix)
   6D97 E5            [11]  399 	push	hl
   6D98 C5            [11]  400 	push	bc
   6D99 CD D6 6D      [17]  401 	call	_iaEnemigo1
   6D9C F1            [10]  402 	pop	af
   6D9D F1            [10]  403 	pop	af
   6D9E F1            [10]  404 	pop	af
   6D9F DD 75 FC      [19]  405 	ld	-4 (ix), l
   6DA2 18 24         [12]  406 	jr	00124$
   6DA4                     407 00115$:
                            408 ;src/enemigos/enemigos.c:79: if(posicion==posicion_Derecha)
   6DA4 DD 7E FD      [19]  409 	ld	a, -3 (ix)
   6DA7 B7            [ 4]  410 	or	a, a
   6DA8 28 1E         [12]  411 	jr	Z,00124$
                            412 ;src/enemigos/enemigos.c:80: estado=iaEnemigo2(&enemigosDerecha[i],posx,posy,rocasEspejo);
   6DAA DD 4E F9      [19]  413 	ld	c,-7 (ix)
   6DAD DD 46 FA      [19]  414 	ld	b,-6 (ix)
   6DB0 DD 6E 09      [19]  415 	ld	l,9 (ix)
   6DB3 DD 66 0A      [19]  416 	ld	h,10 (ix)
   6DB6 E5            [11]  417 	push	hl
   6DB7 DD 66 05      [19]  418 	ld	h, 5 (ix)
   6DBA DD 6E 04      [19]  419 	ld	l, 4 (ix)
   6DBD E5            [11]  420 	push	hl
   6DBE C5            [11]  421 	push	bc
   6DBF CD E8 6E      [17]  422 	call	_iaEnemigo2
   6DC2 F1            [10]  423 	pop	af
   6DC3 F1            [10]  424 	pop	af
   6DC4 F1            [10]  425 	pop	af
   6DC5 DD 75 FC      [19]  426 	ld	-4 (ix), l
   6DC8                     427 00124$:
                            428 ;src/enemigos/enemigos.c:63: for(u8 i=0;i<enemigosMaximos;i++){
   6DC8 DD 34 F8      [23]  429 	inc	-8 (ix)
   6DCB C3 E9 6C      [10]  430 	jp	00123$
   6DCE                     431 00121$:
                            432 ;src/enemigos/enemigos.c:86: return estado;
   6DCE DD 6E FC      [19]  433 	ld	l, -4 (ix)
   6DD1 DD F9         [10]  434 	ld	sp, ix
   6DD3 DD E1         [14]  435 	pop	ix
   6DD5 C9            [10]  436 	ret
                            437 ;src/enemigos/enemigos.c:89: u8 iaEnemigo1(TGameObject* objeto,u8 posx, u8 posy,TGameObject* rocas){
                            438 ;	---------------------------------
                            439 ; Function iaEnemigo1
                            440 ; ---------------------------------
   6DD6                     441 _iaEnemigo1::
   6DD6 DD E5         [15]  442 	push	ix
   6DD8 DD 21 00 00   [14]  443 	ld	ix,#0
   6DDC DD 39         [15]  444 	add	ix,sp
   6DDE 21 FA FF      [10]  445 	ld	hl, #-6
   6DE1 39            [11]  446 	add	hl, sp
   6DE2 F9            [ 6]  447 	ld	sp, hl
                            448 ;src/enemigos/enemigos.c:93: if(objeto->posx != posx && objeto->posy != posy){
   6DE3 DD 46 04      [19]  449 	ld	b, 4 (ix)
   6DE6 DD 56 05      [19]  450 	ld	d, 5 (ix)
   6DE9 68            [ 4]  451 	ld	l, b
   6DEA 62            [ 4]  452 	ld	h, d
   6DEB 23            [ 6]  453 	inc	hl
   6DEC 4E            [ 7]  454 	ld	c, (hl)
   6DED DD 7E 06      [19]  455 	ld	a, 6 (ix)
   6DF0 91            [ 4]  456 	sub	a, c
   6DF1 20 04         [12]  457 	jr	NZ,00198$
   6DF3 3E 01         [ 7]  458 	ld	a,#0x01
   6DF5 18 01         [12]  459 	jr	00199$
   6DF7                     460 00198$:
   6DF7 AF            [ 4]  461 	xor	a,a
   6DF8                     462 00199$:
   6DF8 5F            [ 4]  463 	ld	e, a
   6DF9 78            [ 4]  464 	ld	a, b
   6DFA C6 02         [ 7]  465 	add	a, #0x02
   6DFC DD 77 FC      [19]  466 	ld	-4 (ix), a
   6DFF 7A            [ 4]  467 	ld	a, d
   6E00 CE 00         [ 7]  468 	adc	a, #0x00
   6E02 DD 77 FD      [19]  469 	ld	-3 (ix), a
   6E05 DD 6E FC      [19]  470 	ld	l,-4 (ix)
   6E08 DD 66 FD      [19]  471 	ld	h,-3 (ix)
   6E0B 7E            [ 7]  472 	ld	a, (hl)
   6E0C DD 77 FB      [19]  473 	ld	-5 (ix), a
   6E0F CB 43         [ 8]  474 	bit	0, e
   6E11 20 0D         [12]  475 	jr	NZ,00102$
   6E13 DD 7E 07      [19]  476 	ld	a, 7 (ix)
   6E16 DD 96 FB      [19]  477 	sub	a, -5 (ix)
   6E19 28 05         [12]  478 	jr	Z,00102$
                            479 ;src/enemigos/enemigos.c:94: return no_pasa_nada;
   6E1B 2E 00         [ 7]  480 	ld	l, #0x00
   6E1D C3 E3 6E      [10]  481 	jp	00132$
   6E20                     482 00102$:
                            483 ;src/enemigos/enemigos.c:96: if(objeto->posx==posx){        
   6E20 CB 43         [ 8]  484 	bit	0, e
   6E22 28 60         [12]  485 	jr	Z,00114$
                            486 ;src/enemigos/enemigos.c:99: posmenor=posy;
   6E24 DD 46 07      [19]  487 	ld	b, 7 (ix)
                            488 ;src/enemigos/enemigos.c:97: if(objeto->posy>posy){
   6E27 DD 7E 07      [19]  489 	ld	a, 7 (ix)
   6E2A DD 96 FB      [19]  490 	sub	a, -5 (ix)
   6E2D 30 0B         [12]  491 	jr	NC,00105$
                            492 ;src/enemigos/enemigos.c:98: posmayor=objeto->posy;
   6E2F DD 7E FB      [19]  493 	ld	a, -5 (ix)
   6E32 DD 77 FE      [19]  494 	ld	-2 (ix), a
                            495 ;src/enemigos/enemigos.c:99: posmenor=posy;
   6E35 DD 70 FF      [19]  496 	ld	-1 (ix), b
   6E38 18 09         [12]  497 	jr	00142$
   6E3A                     498 00105$:
                            499 ;src/enemigos/enemigos.c:101: posmayor=posy;
   6E3A DD 70 FE      [19]  500 	ld	-2 (ix), b
                            501 ;src/enemigos/enemigos.c:102: posmenor=objeto->posy;
   6E3D DD 7E FB      [19]  502 	ld	a, -5 (ix)
   6E40 DD 77 FF      [19]  503 	ld	-1 (ix), a
                            504 ;src/enemigos/enemigos.c:104: for(u8 i=0;i<RocasMaximas;i++){
   6E43                     505 00142$:
   6E43 06 00         [ 7]  506 	ld	b, #0x00
   6E45                     507 00127$:
   6E45 78            [ 4]  508 	ld	a, b
   6E46 D6 28         [ 7]  509 	sub	a, #0x28
   6E48 30 3A         [12]  510 	jr	NC,00114$
                            511 ;src/enemigos/enemigos.c:105: if(rocas[i].posx==posx){
   6E4A 58            [ 4]  512 	ld	e,b
   6E4B 16 00         [ 7]  513 	ld	d,#0x00
   6E4D 6B            [ 4]  514 	ld	l, e
   6E4E 62            [ 4]  515 	ld	h, d
   6E4F 29            [11]  516 	add	hl, hl
   6E50 19            [11]  517 	add	hl, de
   6E51 29            [11]  518 	add	hl, hl
   6E52 19            [11]  519 	add	hl, de
   6E53 EB            [ 4]  520 	ex	de,hl
   6E54 DD 7E 08      [19]  521 	ld	a, 8 (ix)
   6E57 83            [ 4]  522 	add	a, e
   6E58 5F            [ 4]  523 	ld	e, a
   6E59 DD 7E 09      [19]  524 	ld	a, 9 (ix)
   6E5C 8A            [ 4]  525 	adc	a, d
   6E5D 57            [ 4]  526 	ld	d, a
   6E5E 6B            [ 4]  527 	ld	l, e
   6E5F 62            [ 4]  528 	ld	h, d
   6E60 23            [ 6]  529 	inc	hl
   6E61 7E            [ 7]  530 	ld	a, (hl)
   6E62 DD 77 FB      [19]  531 	ld	-5 (ix), a
   6E65 DD 7E 06      [19]  532 	ld	a, 6 (ix)
   6E68 DD 96 FB      [19]  533 	sub	a, -5 (ix)
   6E6B 20 14         [12]  534 	jr	NZ,00128$
                            535 ;src/enemigos/enemigos.c:106: if(rocas[i].posy>posmenor && rocas[i].posy<posmayor){                    
   6E6D EB            [ 4]  536 	ex	de,hl
   6E6E 23            [ 6]  537 	inc	hl
   6E6F 23            [ 6]  538 	inc	hl
   6E70 5E            [ 7]  539 	ld	e, (hl)
   6E71 DD 7E FF      [19]  540 	ld	a, -1 (ix)
   6E74 93            [ 4]  541 	sub	a, e
   6E75 30 0A         [12]  542 	jr	NC,00128$
   6E77 7B            [ 4]  543 	ld	a, e
   6E78 DD 96 FE      [19]  544 	sub	a, -2 (ix)
   6E7B 30 04         [12]  545 	jr	NC,00128$
                            546 ;src/enemigos/enemigos.c:107: return no_pasa_nada;
   6E7D 2E 00         [ 7]  547 	ld	l, #0x00
   6E7F 18 62         [12]  548 	jr	00132$
   6E81                     549 00128$:
                            550 ;src/enemigos/enemigos.c:104: for(u8 i=0;i<RocasMaximas;i++){
   6E81 04            [ 4]  551 	inc	b
   6E82 18 C1         [12]  552 	jr	00127$
   6E84                     553 00114$:
                            554 ;src/enemigos/enemigos.c:112: if(objeto->posy==posy){        
   6E84 DD 6E FC      [19]  555 	ld	l,-4 (ix)
   6E87 DD 66 FD      [19]  556 	ld	h,-3 (ix)
   6E8A DD 7E 07      [19]  557 	ld	a,7 (ix)
   6E8D 96            [ 7]  558 	sub	a,(hl)
   6E8E 20 51         [12]  559 	jr	NZ,00125$
                            560 ;src/enemigos/enemigos.c:115: posmenor=posx;
   6E90 DD 5E 06      [19]  561 	ld	e, 6 (ix)
                            562 ;src/enemigos/enemigos.c:113: if(objeto->posx>posx){
   6E93 DD 7E 06      [19]  563 	ld	a, 6 (ix)
   6E96 91            [ 4]  564 	sub	a, c
   6E97 30 06         [12]  565 	jr	NC,00116$
                            566 ;src/enemigos/enemigos.c:114: posmayor=objeto->posx;
   6E99 DD 71 FA      [19]  567 	ld	-6 (ix), c
                            568 ;src/enemigos/enemigos.c:115: posmenor=posx;
   6E9C 4B            [ 4]  569 	ld	c, e
   6E9D 18 03         [12]  570 	jr	00149$
   6E9F                     571 00116$:
                            572 ;src/enemigos/enemigos.c:117: posmayor=posx;
   6E9F DD 73 FA      [19]  573 	ld	-6 (ix), e
                            574 ;src/enemigos/enemigos.c:118: posmenor=objeto->posx;
                            575 ;src/enemigos/enemigos.c:120: for(u8 i=0;i<RocasMaximas;i++){
   6EA2                     576 00149$:
   6EA2 06 00         [ 7]  577 	ld	b, #0x00
   6EA4                     578 00130$:
   6EA4 78            [ 4]  579 	ld	a, b
   6EA5 D6 28         [ 7]  580 	sub	a, #0x28
   6EA7 30 38         [12]  581 	jr	NC,00125$
                            582 ;src/enemigos/enemigos.c:121: if(rocas[i].posy==posy){
   6EA9 58            [ 4]  583 	ld	e,b
   6EAA 16 00         [ 7]  584 	ld	d,#0x00
   6EAC 6B            [ 4]  585 	ld	l, e
   6EAD 62            [ 4]  586 	ld	h, d
   6EAE 29            [11]  587 	add	hl, hl
   6EAF 19            [11]  588 	add	hl, de
   6EB0 29            [11]  589 	add	hl, hl
   6EB1 19            [11]  590 	add	hl, de
   6EB2 EB            [ 4]  591 	ex	de,hl
   6EB3 DD 7E 08      [19]  592 	ld	a, 8 (ix)
   6EB6 83            [ 4]  593 	add	a, e
   6EB7 5F            [ 4]  594 	ld	e, a
   6EB8 DD 7E 09      [19]  595 	ld	a, 9 (ix)
   6EBB 8A            [ 4]  596 	adc	a, d
   6EBC 57            [ 4]  597 	ld	d, a
   6EBD 6B            [ 4]  598 	ld	l, e
   6EBE 62            [ 4]  599 	ld	h, d
   6EBF 23            [ 6]  600 	inc	hl
   6EC0 23            [ 6]  601 	inc	hl
   6EC1 7E            [ 7]  602 	ld	a, (hl)
   6EC2 DD 77 FF      [19]  603 	ld	-1 (ix), a
   6EC5 DD 7E 07      [19]  604 	ld	a, 7 (ix)
   6EC8 DD 96 FF      [19]  605 	sub	a, -1 (ix)
   6ECB 20 11         [12]  606 	jr	NZ,00131$
                            607 ;src/enemigos/enemigos.c:122: if(rocas[i].posx>posmenor && rocas[i].posx<posmayor){                
   6ECD EB            [ 4]  608 	ex	de,hl
   6ECE 23            [ 6]  609 	inc	hl
   6ECF 5E            [ 7]  610 	ld	e, (hl)
   6ED0 79            [ 4]  611 	ld	a, c
   6ED1 93            [ 4]  612 	sub	a, e
   6ED2 30 0A         [12]  613 	jr	NC,00131$
   6ED4 7B            [ 4]  614 	ld	a, e
   6ED5 DD 96 FA      [19]  615 	sub	a, -6 (ix)
   6ED8 30 04         [12]  616 	jr	NC,00131$
                            617 ;src/enemigos/enemigos.c:123: return no_pasa_nada;
   6EDA 2E 00         [ 7]  618 	ld	l, #0x00
   6EDC 18 05         [12]  619 	jr	00132$
   6EDE                     620 00131$:
                            621 ;src/enemigos/enemigos.c:120: for(u8 i=0;i<RocasMaximas;i++){
   6EDE 04            [ 4]  622 	inc	b
   6EDF 18 C3         [12]  623 	jr	00130$
   6EE1                     624 00125$:
                            625 ;src/enemigos/enemigos.c:128: return player_muere;
   6EE1 2E 01         [ 7]  626 	ld	l, #0x01
   6EE3                     627 00132$:
   6EE3 DD F9         [10]  628 	ld	sp, ix
   6EE5 DD E1         [14]  629 	pop	ix
   6EE7 C9            [10]  630 	ret
                            631 ;src/enemigos/enemigos.c:131: u8 iaEnemigo2(TGameObject* objeto,u8 posx, u8 posy,TGameObject* rocas){
                            632 ;	---------------------------------
                            633 ; Function iaEnemigo2
                            634 ; ---------------------------------
   6EE8                     635 _iaEnemigo2::
   6EE8 DD E5         [15]  636 	push	ix
   6EEA DD 21 00 00   [14]  637 	ld	ix,#0
   6EEE DD 39         [15]  638 	add	ix,sp
   6EF0 21 F5 FF      [10]  639 	ld	hl, #-11
   6EF3 39            [11]  640 	add	hl, sp
   6EF4 F9            [ 6]  641 	ld	sp, hl
                            642 ;src/enemigos/enemigos.c:135: u8 nextPosx=0;
   6EF5 DD 36 F7 00   [19]  643 	ld	-9 (ix), #0x00
                            644 ;src/enemigos/enemigos.c:136: u8 nextPosy=0;
   6EF9 DD 36 F6 00   [19]  645 	ld	-10 (ix), #0x00
                            646 ;src/enemigos/enemigos.c:140: distanciax=posx-objeto->posx;
   6EFD DD 5E 06      [19]  647 	ld	e, 6 (ix)
   6F00 16 00         [ 7]  648 	ld	d, #0x00
   6F02 DD 4E 04      [19]  649 	ld	c,4 (ix)
   6F05 DD 46 05      [19]  650 	ld	b,5 (ix)
   6F08 21 01 00      [10]  651 	ld	hl, #0x0001
   6F0B 09            [11]  652 	add	hl,bc
   6F0C DD 75 FE      [19]  653 	ld	-2 (ix), l
   6F0F DD 74 FF      [19]  654 	ld	-1 (ix), h
   6F12 6E            [ 7]  655 	ld	l, (hl)
   6F13 26 00         [ 7]  656 	ld	h, #0x00
   6F15 7B            [ 4]  657 	ld	a, e
   6F16 95            [ 4]  658 	sub	a, l
   6F17 5F            [ 4]  659 	ld	e, a
   6F18 7A            [ 4]  660 	ld	a, d
   6F19 9C            [ 4]  661 	sbc	a, h
   6F1A DD 73 F8      [19]  662 	ld	-8 (ix), e
   6F1D DD 77 F9      [19]  663 	ld	-7 (ix), a
                            664 ;src/enemigos/enemigos.c:141: distanciay=posy-objeto->posy;
   6F20 DD 5E 07      [19]  665 	ld	e, 7 (ix)
   6F23 16 00         [ 7]  666 	ld	d, #0x00
   6F25 21 02 00      [10]  667 	ld	hl, #0x0002
   6F28 09            [11]  668 	add	hl,bc
   6F29 DD 75 FA      [19]  669 	ld	-6 (ix), l
   6F2C DD 74 FB      [19]  670 	ld	-5 (ix), h
   6F2F 6E            [ 7]  671 	ld	l, (hl)
   6F30 26 00         [ 7]  672 	ld	h, #0x00
   6F32 7B            [ 4]  673 	ld	a, e
   6F33 95            [ 4]  674 	sub	a, l
   6F34 5F            [ 4]  675 	ld	e, a
   6F35 7A            [ 4]  676 	ld	a, d
   6F36 9C            [ 4]  677 	sbc	a, h
   6F37 57            [ 4]  678 	ld	d, a
                            679 ;src/enemigos/enemigos.c:143: if(abs(distanciax)>abs(distanciay)){
   6F38 D5            [11]  680 	push	de
   6F39 DD 6E F8      [19]  681 	ld	l,-8 (ix)
   6F3C DD 66 F9      [19]  682 	ld	h,-7 (ix)
   6F3F E5            [11]  683 	push	hl
   6F40 CD B9 A9      [17]  684 	call	_abs
   6F43 F1            [10]  685 	pop	af
   6F44 DD 74 FD      [19]  686 	ld	-3 (ix), h
   6F47 DD 75 FC      [19]  687 	ld	-4 (ix), l
   6F4A D1            [10]  688 	pop	de
   6F4B D5            [11]  689 	push	de
   6F4C D5            [11]  690 	push	de
   6F4D CD B9 A9      [17]  691 	call	_abs
   6F50 F1            [10]  692 	pop	af
   6F51 D1            [10]  693 	pop	de
   6F52 7D            [ 4]  694 	ld	a, l
   6F53 DD 96 FC      [19]  695 	sub	a, -4 (ix)
   6F56 7C            [ 4]  696 	ld	a, h
   6F57 DD 9E FD      [19]  697 	sbc	a, -3 (ix)
   6F5A E2 5F 6F      [10]  698 	jp	PO, 00158$
   6F5D EE 80         [ 7]  699 	xor	a, #0x80
   6F5F                     700 00158$:
   6F5F F2 70 6F      [10]  701 	jp	P, 00108$
                            702 ;src/enemigos/enemigos.c:144: if(distanciax<0){
   6F62 DD CB F9 7E   [20]  703 	bit	7, -7 (ix)
   6F66 28 04         [12]  704 	jr	Z,00102$
                            705 ;src/enemigos/enemigos.c:145: nextMovimiento=mover_Izquierda;
   6F68 1E 01         [ 7]  706 	ld	e, #0x01
   6F6A 18 0E         [12]  707 	jr	00109$
   6F6C                     708 00102$:
                            709 ;src/enemigos/enemigos.c:147: nextMovimiento=mover_Derecha;
   6F6C 1E 03         [ 7]  710 	ld	e, #0x03
   6F6E 18 0A         [12]  711 	jr	00109$
   6F70                     712 00108$:
                            713 ;src/enemigos/enemigos.c:150: if(distanciay<0){
   6F70 CB 7A         [ 8]  714 	bit	7, d
   6F72 28 04         [12]  715 	jr	Z,00105$
                            716 ;src/enemigos/enemigos.c:151: nextMovimiento=mover_Arriba;
   6F74 1E 02         [ 7]  717 	ld	e, #0x02
   6F76 18 02         [12]  718 	jr	00109$
   6F78                     719 00105$:
                            720 ;src/enemigos/enemigos.c:153: nextMovimiento=mover_Abajo;
   6F78 1E 04         [ 7]  721 	ld	e, #0x04
   6F7A                     722 00109$:
                            723 ;src/enemigos/enemigos.c:157: nextPosx=objeto->posx;
   6F7A DD 6E FE      [19]  724 	ld	l,-2 (ix)
   6F7D DD 66 FF      [19]  725 	ld	h,-1 (ix)
   6F80 7E            [ 7]  726 	ld	a, (hl)
   6F81 DD 77 F7      [19]  727 	ld	-9 (ix), a
                            728 ;src/enemigos/enemigos.c:158: nextPosy=objeto->posy;
   6F84 DD 6E FA      [19]  729 	ld	l,-6 (ix)
   6F87 DD 66 FB      [19]  730 	ld	h,-5 (ix)
   6F8A 7E            [ 7]  731 	ld	a, (hl)
   6F8B DD 77 F6      [19]  732 	ld	-10 (ix), a
                            733 ;src/enemigos/enemigos.c:159: mover1casilla(&nextPosx,&nextPosy,nextMovimiento);
   6F8E 21 01 00      [10]  734 	ld	hl, #0x0001
   6F91 39            [11]  735 	add	hl, sp
   6F92 DD 75 FC      [19]  736 	ld	-4 (ix), l
   6F95 DD 74 FD      [19]  737 	ld	-3 (ix), h
   6F98 21 02 00      [10]  738 	ld	hl, #0x0002
   6F9B 39            [11]  739 	add	hl, sp
   6F9C C5            [11]  740 	push	bc
   6F9D 7B            [ 4]  741 	ld	a, e
   6F9E F5            [11]  742 	push	af
   6F9F 33            [ 6]  743 	inc	sp
   6FA0 DD 5E FC      [19]  744 	ld	e,-4 (ix)
   6FA3 DD 56 FD      [19]  745 	ld	d,-3 (ix)
   6FA6 D5            [11]  746 	push	de
   6FA7 E5            [11]  747 	push	hl
   6FA8 CD 3A 67      [17]  748 	call	_mover1casilla
   6FAB F1            [10]  749 	pop	af
   6FAC F1            [10]  750 	pop	af
   6FAD 33            [ 6]  751 	inc	sp
   6FAE C1            [10]  752 	pop	bc
                            753 ;src/enemigos/enemigos.c:160: for (u8 i=0;i<RocasMaximas;i++){
   6FAF DD 36 F5 00   [19]  754 	ld	-11 (ix), #0x00
   6FB3                     755 00118$:
   6FB3 DD 7E F5      [19]  756 	ld	a, -11 (ix)
   6FB6 D6 28         [ 7]  757 	sub	a, #0x28
   6FB8 30 36         [12]  758 	jr	NC,00113$
                            759 ;src/enemigos/enemigos.c:161: if(rocas[i].posx==nextPosx && rocas[i].posy==nextPosy){
   6FBA DD 5E F5      [19]  760 	ld	e,-11 (ix)
   6FBD 16 00         [ 7]  761 	ld	d,#0x00
   6FBF 6B            [ 4]  762 	ld	l, e
   6FC0 62            [ 4]  763 	ld	h, d
   6FC1 29            [11]  764 	add	hl, hl
   6FC2 19            [11]  765 	add	hl, de
   6FC3 29            [11]  766 	add	hl, hl
   6FC4 19            [11]  767 	add	hl, de
   6FC5 EB            [ 4]  768 	ex	de,hl
   6FC6 DD 7E 08      [19]  769 	ld	a, 8 (ix)
   6FC9 83            [ 4]  770 	add	a, e
   6FCA 5F            [ 4]  771 	ld	e, a
   6FCB DD 7E 09      [19]  772 	ld	a, 9 (ix)
   6FCE 8A            [ 4]  773 	adc	a, d
   6FCF 57            [ 4]  774 	ld	d, a
   6FD0 6B            [ 4]  775 	ld	l, e
   6FD1 62            [ 4]  776 	ld	h, d
   6FD2 23            [ 6]  777 	inc	hl
   6FD3 7E            [ 7]  778 	ld	a, (hl)
   6FD4 DD 77 FC      [19]  779 	ld	-4 (ix), a
   6FD7 DD 7E F7      [19]  780 	ld	a, -9 (ix)
   6FDA DD 96 FC      [19]  781 	sub	a, -4 (ix)
   6FDD 20 0C         [12]  782 	jr	NZ,00119$
   6FDF EB            [ 4]  783 	ex	de,hl
   6FE0 23            [ 6]  784 	inc	hl
   6FE1 23            [ 6]  785 	inc	hl
   6FE2 DD 7E F6      [19]  786 	ld	a,-10 (ix)
                            787 ;src/enemigos/enemigos.c:162: return no_pasa_nada;
   6FE5 96            [ 7]  788 	sub	a,(hl)
   6FE6 20 03         [12]  789 	jr	NZ,00119$
   6FE8 6F            [ 4]  790 	ld	l,a
   6FE9 18 28         [12]  791 	jr	00120$
   6FEB                     792 00119$:
                            793 ;src/enemigos/enemigos.c:160: for (u8 i=0;i<RocasMaximas;i++){
   6FEB DD 34 F5      [23]  794 	inc	-11 (ix)
   6FEE 18 C3         [12]  795 	jr	00118$
   6FF0                     796 00113$:
                            797 ;src/enemigos/enemigos.c:165: moverYdibujar(objeto,nextPosx,nextPosy);
   6FF0 DD 66 F6      [19]  798 	ld	h, -10 (ix)
   6FF3 DD 6E F7      [19]  799 	ld	l, -9 (ix)
   6FF6 E5            [11]  800 	push	hl
   6FF7 C5            [11]  801 	push	bc
   6FF8 CD D6 61      [17]  802 	call	_moverYdibujar
   6FFB F1            [10]  803 	pop	af
   6FFC F1            [10]  804 	pop	af
                            805 ;src/enemigos/enemigos.c:166: if(nextPosx==posx && nextPosy==posy){
   6FFD DD 7E F7      [19]  806 	ld	a, -9 (ix)
   7000 DD 96 06      [19]  807 	sub	a, 6 (ix)
   7003 20 0C         [12]  808 	jr	NZ,00115$
   7005 DD 7E F6      [19]  809 	ld	a, -10 (ix)
   7008 DD 96 07      [19]  810 	sub	a, 7 (ix)
   700B 20 04         [12]  811 	jr	NZ,00115$
                            812 ;src/enemigos/enemigos.c:167: return player_muere;
   700D 2E 01         [ 7]  813 	ld	l, #0x01
   700F 18 02         [12]  814 	jr	00120$
   7011                     815 00115$:
                            816 ;src/enemigos/enemigos.c:169: return no_pasa_nada;
   7011 2E 00         [ 7]  817 	ld	l, #0x00
   7013                     818 00120$:
   7013 DD F9         [10]  819 	ld	sp, ix
   7015 DD E1         [14]  820 	pop	ix
   7017 C9            [10]  821 	ret
                            822 ;src/enemigos/enemigos.c:177: void crearEnemigoIzquierda(u8 posx,u8 posy, u8 sprite){
                            823 ;	---------------------------------
                            824 ; Function crearEnemigoIzquierda
                            825 ; ---------------------------------
   7018                     826 _crearEnemigoIzquierda::
   7018 DD E5         [15]  827 	push	ix
   701A DD 21 00 00   [14]  828 	ld	ix,#0
   701E DD 39         [15]  829 	add	ix,sp
                            830 ;src/enemigos/enemigos.c:178: enemigosIzquierda[contadorEnemigosIz].posx=posx;
   7020 01 F9 AB      [10]  831 	ld	bc, #_enemigosIzquierda+0
   7023 ED 5B 3F AC   [20]  832 	ld	de, (_contadorEnemigosIz)
   7027 16 00         [ 7]  833 	ld	d, #0x00
   7029 6B            [ 4]  834 	ld	l, e
   702A 62            [ 4]  835 	ld	h, d
   702B 29            [11]  836 	add	hl, hl
   702C 19            [11]  837 	add	hl, de
   702D 29            [11]  838 	add	hl, hl
   702E 19            [11]  839 	add	hl, de
   702F 09            [11]  840 	add	hl, bc
   7030 23            [ 6]  841 	inc	hl
   7031 DD 7E 04      [19]  842 	ld	a, 4 (ix)
   7034 77            [ 7]  843 	ld	(hl), a
                            844 ;src/enemigos/enemigos.c:179: enemigosIzquierda[contadorEnemigosIz].posy=posy;
   7035 ED 5B 3F AC   [20]  845 	ld	de, (_contadorEnemigosIz)
   7039 16 00         [ 7]  846 	ld	d, #0x00
   703B 6B            [ 4]  847 	ld	l, e
   703C 62            [ 4]  848 	ld	h, d
   703D 29            [11]  849 	add	hl, hl
   703E 19            [11]  850 	add	hl, de
   703F 29            [11]  851 	add	hl, hl
   7040 19            [11]  852 	add	hl, de
   7041 09            [11]  853 	add	hl, bc
   7042 23            [ 6]  854 	inc	hl
   7043 23            [ 6]  855 	inc	hl
   7044 DD 7E 05      [19]  856 	ld	a, 5 (ix)
   7047 77            [ 7]  857 	ld	(hl), a
                            858 ;src/enemigos/enemigos.c:180: enemigosIzquierda[contadorEnemigosIz].sprite=sprite;
   7048 ED 5B 3F AC   [20]  859 	ld	de, (_contadorEnemigosIz)
   704C 16 00         [ 7]  860 	ld	d, #0x00
   704E 6B            [ 4]  861 	ld	l, e
   704F 62            [ 4]  862 	ld	h, d
   7050 29            [11]  863 	add	hl, hl
   7051 19            [11]  864 	add	hl, de
   7052 29            [11]  865 	add	hl, hl
   7053 19            [11]  866 	add	hl, de
   7054 09            [11]  867 	add	hl, bc
   7055 23            [ 6]  868 	inc	hl
   7056 23            [ 6]  869 	inc	hl
   7057 23            [ 6]  870 	inc	hl
   7058 DD 7E 06      [19]  871 	ld	a, 6 (ix)
   705B 77            [ 7]  872 	ld	(hl), a
                            873 ;src/enemigos/enemigos.c:181: contadorEnemigosIz++;
   705C 21 3F AC      [10]  874 	ld	hl, #_contadorEnemigosIz+0
   705F 34            [11]  875 	inc	(hl)
   7060 DD E1         [14]  876 	pop	ix
   7062 C9            [10]  877 	ret
                            878 ;src/enemigos/enemigos.c:183: void crearEnemigoDerecha(u8 posx,u8 posy, u8 sprite){
                            879 ;	---------------------------------
                            880 ; Function crearEnemigoDerecha
                            881 ; ---------------------------------
   7063                     882 _crearEnemigoDerecha::
   7063 DD E5         [15]  883 	push	ix
   7065 DD 21 00 00   [14]  884 	ld	ix,#0
   7069 DD 39         [15]  885 	add	ix,sp
                            886 ;src/enemigos/enemigos.c:184: enemigosDerecha[contadorEnemigosDe].posx=posx;
   706B 01 1C AC      [10]  887 	ld	bc, #_enemigosDerecha+0
   706E ED 5B 40 AC   [20]  888 	ld	de, (_contadorEnemigosDe)
   7072 16 00         [ 7]  889 	ld	d, #0x00
   7074 6B            [ 4]  890 	ld	l, e
   7075 62            [ 4]  891 	ld	h, d
   7076 29            [11]  892 	add	hl, hl
   7077 19            [11]  893 	add	hl, de
   7078 29            [11]  894 	add	hl, hl
   7079 19            [11]  895 	add	hl, de
   707A 09            [11]  896 	add	hl, bc
   707B 23            [ 6]  897 	inc	hl
   707C DD 7E 04      [19]  898 	ld	a, 4 (ix)
   707F 77            [ 7]  899 	ld	(hl), a
                            900 ;src/enemigos/enemigos.c:185: enemigosDerecha[contadorEnemigosDe].posy=posy;
   7080 ED 5B 40 AC   [20]  901 	ld	de, (_contadorEnemigosDe)
   7084 16 00         [ 7]  902 	ld	d, #0x00
   7086 6B            [ 4]  903 	ld	l, e
   7087 62            [ 4]  904 	ld	h, d
   7088 29            [11]  905 	add	hl, hl
   7089 19            [11]  906 	add	hl, de
   708A 29            [11]  907 	add	hl, hl
   708B 19            [11]  908 	add	hl, de
   708C 09            [11]  909 	add	hl, bc
   708D 23            [ 6]  910 	inc	hl
   708E 23            [ 6]  911 	inc	hl
   708F DD 7E 05      [19]  912 	ld	a, 5 (ix)
   7092 77            [ 7]  913 	ld	(hl), a
                            914 ;src/enemigos/enemigos.c:186: enemigosDerecha[contadorEnemigosDe].sprite=sprite;
   7093 ED 5B 40 AC   [20]  915 	ld	de, (_contadorEnemigosDe)
   7097 16 00         [ 7]  916 	ld	d, #0x00
   7099 6B            [ 4]  917 	ld	l, e
   709A 62            [ 4]  918 	ld	h, d
   709B 29            [11]  919 	add	hl, hl
   709C 19            [11]  920 	add	hl, de
   709D 29            [11]  921 	add	hl, hl
   709E 19            [11]  922 	add	hl, de
   709F 09            [11]  923 	add	hl, bc
   70A0 23            [ 6]  924 	inc	hl
   70A1 23            [ 6]  925 	inc	hl
   70A2 23            [ 6]  926 	inc	hl
   70A3 DD 7E 06      [19]  927 	ld	a, 6 (ix)
   70A6 77            [ 7]  928 	ld	(hl), a
                            929 ;src/enemigos/enemigos.c:187: contadorEnemigosDe++;
   70A7 21 40 AC      [10]  930 	ld	hl, #_contadorEnemigosDe+0
   70AA 34            [11]  931 	inc	(hl)
   70AB DD E1         [14]  932 	pop	ix
   70AD C9            [10]  933 	ret
                            934 ;src/enemigos/enemigos.c:190: void sinEnemigos(){
                            935 ;	---------------------------------
                            936 ; Function sinEnemigos
                            937 ; ---------------------------------
   70AE                     938 _sinEnemigos::
                            939 ;src/enemigos/enemigos.c:192: }
   70AE C9            [10]  940 	ret
                            941 ;src/enemigos/enemigos.c:195: void enemigosNivel01(){
                            942 ;	---------------------------------
                            943 ; Function enemigosNivel01
                            944 ; ---------------------------------
   70AF                     945 _enemigosNivel01::
                            946 ;src/enemigos/enemigos.c:196: crearEnemigoDerecha(14,3,sprite_enemigo1);
   70AF 21 03 2A      [10]  947 	ld	hl, #0x2a03
   70B2 E5            [11]  948 	push	hl
   70B3 3E 0E         [ 7]  949 	ld	a, #0x0e
   70B5 F5            [11]  950 	push	af
   70B6 33            [ 6]  951 	inc	sp
   70B7 CD 63 70      [17]  952 	call	_crearEnemigoDerecha
   70BA F1            [10]  953 	pop	af
   70BB 33            [ 6]  954 	inc	sp
   70BC C9            [10]  955 	ret
                            956 ;src/enemigos/enemigos.c:198: void enemigosNvel_trap_01(){
                            957 ;	---------------------------------
                            958 ; Function enemigosNvel_trap_01
                            959 ; ---------------------------------
   70BD                     960 _enemigosNvel_trap_01::
                            961 ;src/enemigos/enemigos.c:199: crearEnemigoIzquierda(2,2,sprite_enemigo1);
   70BD 21 02 2A      [10]  962 	ld	hl, #0x2a02
   70C0 E5            [11]  963 	push	hl
   70C1 3E 02         [ 7]  964 	ld	a, #0x02
   70C3 F5            [11]  965 	push	af
   70C4 33            [ 6]  966 	inc	sp
   70C5 CD 18 70      [17]  967 	call	_crearEnemigoIzquierda
                            968 ;src/enemigos/enemigos.c:200: crearEnemigoIzquierda(2,6,sprite_enemigo1);
   70C8 33            [ 6]  969 	inc	sp
   70C9 21 06 2A      [10]  970 	ld	hl,#0x2a06
   70CC E3            [19]  971 	ex	(sp),hl
   70CD 3E 02         [ 7]  972 	ld	a, #0x02
   70CF F5            [11]  973 	push	af
   70D0 33            [ 6]  974 	inc	sp
   70D1 CD 18 70      [17]  975 	call	_crearEnemigoIzquierda
                            976 ;src/enemigos/enemigos.c:201: crearEnemigoIzquierda(6,2,sprite_enemigo1);
   70D4 33            [ 6]  977 	inc	sp
   70D5 21 02 2A      [10]  978 	ld	hl,#0x2a02
   70D8 E3            [19]  979 	ex	(sp),hl
   70D9 3E 06         [ 7]  980 	ld	a, #0x06
   70DB F5            [11]  981 	push	af
   70DC 33            [ 6]  982 	inc	sp
   70DD CD 18 70      [17]  983 	call	_crearEnemigoIzquierda
                            984 ;src/enemigos/enemigos.c:202: crearEnemigoIzquierda(6,6,sprite_enemigo1);
   70E0 33            [ 6]  985 	inc	sp
   70E1 21 06 2A      [10]  986 	ld	hl,#0x2a06
   70E4 E3            [19]  987 	ex	(sp),hl
   70E5 3E 06         [ 7]  988 	ld	a, #0x06
   70E7 F5            [11]  989 	push	af
   70E8 33            [ 6]  990 	inc	sp
   70E9 CD 18 70      [17]  991 	call	_crearEnemigoIzquierda
   70EC F1            [10]  992 	pop	af
   70ED 33            [ 6]  993 	inc	sp
   70EE C9            [10]  994 	ret
                            995 ;src/enemigos/enemigos.c:204: void enemigosNvel_04(){
                            996 ;	---------------------------------
                            997 ; Function enemigosNvel_04
                            998 ; ---------------------------------
   70EF                     999 _enemigosNvel_04::
                           1000 ;src/enemigos/enemigos.c:205: crearEnemigoDerecha(12,3,sprite_enemigo1);
   70EF 21 03 2A      [10] 1001 	ld	hl, #0x2a03
   70F2 E5            [11] 1002 	push	hl
   70F3 3E 0C         [ 7] 1003 	ld	a, #0x0c
   70F5 F5            [11] 1004 	push	af
   70F6 33            [ 6] 1005 	inc	sp
   70F7 CD 63 70      [17] 1006 	call	_crearEnemigoDerecha
                           1007 ;src/enemigos/enemigos.c:206: crearEnemigoDerecha(12,5,sprite_enemigo1);
   70FA 33            [ 6] 1008 	inc	sp
   70FB 21 05 2A      [10] 1009 	ld	hl,#0x2a05
   70FE E3            [19] 1010 	ex	(sp),hl
   70FF 3E 0C         [ 7] 1011 	ld	a, #0x0c
   7101 F5            [11] 1012 	push	af
   7102 33            [ 6] 1013 	inc	sp
   7103 CD 63 70      [17] 1014 	call	_crearEnemigoDerecha
   7106 F1            [10] 1015 	pop	af
   7107 33            [ 6] 1016 	inc	sp
   7108 C9            [10] 1017 	ret
                           1018 ;src/enemigos/enemigos.c:208: void enemigosNvel_04_01(){
                           1019 ;	---------------------------------
                           1020 ; Function enemigosNvel_04_01
                           1021 ; ---------------------------------
   7109                    1022 _enemigosNvel_04_01::
                           1023 ;src/enemigos/enemigos.c:209: crearEnemigoIzquierda(4,4,sprite_enemigo1);
   7109 21 04 2A      [10] 1024 	ld	hl, #0x2a04
   710C E5            [11] 1025 	push	hl
   710D 3E 04         [ 7] 1026 	ld	a, #0x04
   710F F5            [11] 1027 	push	af
   7110 33            [ 6] 1028 	inc	sp
   7111 CD 18 70      [17] 1029 	call	_crearEnemigoIzquierda
   7114 F1            [10] 1030 	pop	af
   7115 33            [ 6] 1031 	inc	sp
   7116 C9            [10] 1032 	ret
                           1033 	.area _CODE
                           1034 	.area _INITIALIZER
                           1035 	.area _CABS (ABS)
