                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module fisicas
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _calcularPosicionEnPantalla
                             12 	.globl _calcularMaximosyMinimos
                             13 	.globl _comprobarColisiones1vs1
                             14 ;--------------------------------------------------------
                             15 ; special function registers
                             16 ;--------------------------------------------------------
                             17 ;--------------------------------------------------------
                             18 ; ram data
                             19 ;--------------------------------------------------------
                             20 	.area _DATA
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _INITIALIZED
                             25 ;--------------------------------------------------------
                             26 ; absolute external ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DABS (ABS)
                             29 ;--------------------------------------------------------
                             30 ; global & static initialisations
                             31 ;--------------------------------------------------------
                             32 	.area _HOME
                             33 	.area _GSINIT
                             34 	.area _GSFINAL
                             35 	.area _GSINIT
                             36 ;--------------------------------------------------------
                             37 ; Home
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _HOME
                             41 ;--------------------------------------------------------
                             42 ; code
                             43 ;--------------------------------------------------------
                             44 	.area _CODE
                             45 ;src/fisicas/fisicas.c:13: u8* calcularPosicionEnPantalla(u8 posx, u8 posy){
                             46 ;	---------------------------------
                             47 ; Function calcularPosicionEnPantalla
                             48 ; ---------------------------------
   541B                      49 _calcularPosicionEnPantalla::
   541B DD E5         [15]   50 	push	ix
   541D DD 21 00 00   [14]   51 	ld	ix,#0
   5421 DD 39         [15]   52 	add	ix,sp
                             53 ;src/fisicas/fisicas.c:15: return cpctm_screenPtr(CPCT_VMEM_START, posx*4, posy*16);
   5423 DD 6E 05      [19]   54 	ld	l, 5 (ix)
   5426 26 00         [ 7]   55 	ld	h, #0x00
   5428 29            [11]   56 	add	hl, hl
   5429 29            [11]   57 	add	hl, hl
   542A 29            [11]   58 	add	hl, hl
   542B 29            [11]   59 	add	hl, hl
   542C EB            [ 4]   60 	ex	de,hl
   542D 4B            [ 4]   61 	ld	c, e
   542E 42            [ 4]   62 	ld	b, d
   542F CB 28         [ 8]   63 	sra	b
   5431 CB 19         [ 8]   64 	rr	c
   5433 CB 28         [ 8]   65 	sra	b
   5435 CB 19         [ 8]   66 	rr	c
   5437 CB 28         [ 8]   67 	sra	b
   5439 CB 19         [ 8]   68 	rr	c
   543B 69            [ 4]   69 	ld	l, c
   543C 60            [ 4]   70 	ld	h, b
   543D 29            [11]   71 	add	hl, hl
   543E 29            [11]   72 	add	hl, hl
   543F 09            [11]   73 	add	hl, bc
   5440 29            [11]   74 	add	hl, hl
   5441 29            [11]   75 	add	hl, hl
   5442 29            [11]   76 	add	hl, hl
   5443 29            [11]   77 	add	hl, hl
   5444 01 00 C0      [10]   78 	ld	bc, #0xc000
   5447 09            [11]   79 	add	hl, bc
   5448 7B            [ 4]   80 	ld	a, e
   5449 E6 07         [ 7]   81 	and	a, #0x07
   544B 07            [ 4]   82 	rlca
   544C 07            [ 4]   83 	rlca
   544D 07            [ 4]   84 	rlca
   544E E6 F8         [ 7]   85 	and	a, #0xf8
   5450 47            [ 4]   86 	ld	b, a
   5451 0E 00         [ 7]   87 	ld	c, #0x00
   5453 09            [11]   88 	add	hl,bc
   5454 4D            [ 4]   89 	ld	c, l
   5455 44            [ 4]   90 	ld	b, h
   5456 DD 6E 04      [19]   91 	ld	l, 4 (ix)
   5459 26 00         [ 7]   92 	ld	h, #0x00
   545B 29            [11]   93 	add	hl, hl
   545C 29            [11]   94 	add	hl, hl
   545D 09            [11]   95 	add	hl, bc
   545E DD E1         [14]   96 	pop	ix
   5460 C9            [10]   97 	ret
                             98 ;src/fisicas/fisicas.c:17: u8 calcularMaximosyMinimos(u8 movimiento,u8 posx, u8 posy){      
                             99 ;	---------------------------------
                            100 ; Function calcularMaximosyMinimos
                            101 ; ---------------------------------
   5461                     102 _calcularMaximosyMinimos::
   5461 DD E5         [15]  103 	push	ix
   5463 DD 21 00 00   [14]  104 	ld	ix,#0
   5467 DD 39         [15]  105 	add	ix,sp
                            106 ;src/fisicas/fisicas.c:18: if(movimiento!=mover_SinMovimiento){
   5469 DD 7E 04      [19]  107 	ld	a, 4 (ix)
   546C B7            [ 4]  108 	or	a, a
   546D 28 72         [12]  109 	jr	Z,00121$
                            110 ;src/fisicas/fisicas.c:20: if(posx-1<posMin)
   546F DD 5E 05      [19]  111 	ld	e, 5 (ix)
   5472 16 00         [ 7]  112 	ld	d, #0x00
                            113 ;src/fisicas/fisicas.c:19: if(movimiento==mover_Izquierda){
   5474 DD 7E 04      [19]  114 	ld	a, 4 (ix)
   5477 3D            [ 4]  115 	dec	a
   5478 20 12         [12]  116 	jr	NZ,00118$
                            117 ;src/fisicas/fisicas.c:20: if(posx-1<posMin)
   547A 1B            [ 6]  118 	dec	de
   547B 7B            [ 4]  119 	ld	a, e
   547C D6 01         [ 7]  120 	sub	a, #0x01
   547E 7A            [ 4]  121 	ld	a, d
   547F 17            [ 4]  122 	rla
   5480 3F            [ 4]  123 	ccf
   5481 1F            [ 4]  124 	rra
   5482 DE 80         [ 7]  125 	sbc	a, #0x80
   5484 30 5B         [12]  126 	jr	NC,00121$
                            127 ;src/fisicas/fisicas.c:21: movimiento=mover_SinMovimiento;
   5486 DD 36 04 00   [19]  128 	ld	4 (ix), #0x00
   548A 18 55         [12]  129 	jr	00121$
   548C                     130 00118$:
                            131 ;src/fisicas/fisicas.c:23: if(posy-1<posMin)
   548C DD 4E 06      [19]  132 	ld	c, 6 (ix)
   548F 06 00         [ 7]  133 	ld	b, #0x00
                            134 ;src/fisicas/fisicas.c:22: }else if(movimiento==mover_Arriba){
   5491 DD 7E 04      [19]  135 	ld	a, 4 (ix)
   5494 D6 02         [ 7]  136 	sub	a, #0x02
   5496 20 12         [12]  137 	jr	NZ,00115$
                            138 ;src/fisicas/fisicas.c:23: if(posy-1<posMin)
   5498 0B            [ 6]  139 	dec	bc
   5499 79            [ 4]  140 	ld	a, c
   549A D6 01         [ 7]  141 	sub	a, #0x01
   549C 78            [ 4]  142 	ld	a, b
   549D 17            [ 4]  143 	rla
   549E 3F            [ 4]  144 	ccf
   549F 1F            [ 4]  145 	rra
   54A0 DE 80         [ 7]  146 	sbc	a, #0x80
   54A2 30 3D         [12]  147 	jr	NC,00121$
                            148 ;src/fisicas/fisicas.c:24: movimiento=mover_SinMovimiento;
   54A4 DD 36 04 00   [19]  149 	ld	4 (ix), #0x00
   54A8 18 37         [12]  150 	jr	00121$
   54AA                     151 00115$:
                            152 ;src/fisicas/fisicas.c:25: }else if(movimiento==mover_Derecha){
   54AA DD 7E 04      [19]  153 	ld	a, 4 (ix)
   54AD D6 03         [ 7]  154 	sub	a, #0x03
   54AF 20 16         [12]  155 	jr	NZ,00112$
                            156 ;src/fisicas/fisicas.c:26: if(posx+1>posxMax)
   54B1 13            [ 6]  157 	inc	de
   54B2 4B            [ 4]  158 	ld	c, e
   54B3 3E 07         [ 7]  159 	ld	a, #0x07
   54B5 B9            [ 4]  160 	cp	a, c
   54B6 3E 00         [ 7]  161 	ld	a, #0x00
   54B8 9A            [ 4]  162 	sbc	a, d
   54B9 E2 BE 54      [10]  163 	jp	PO, 00166$
   54BC EE 80         [ 7]  164 	xor	a, #0x80
   54BE                     165 00166$:
   54BE F2 E1 54      [10]  166 	jp	P, 00121$
                            167 ;src/fisicas/fisicas.c:27: movimiento=mover_SinMovimiento;
   54C1 DD 36 04 00   [19]  168 	ld	4 (ix), #0x00
   54C5 18 1A         [12]  169 	jr	00121$
   54C7                     170 00112$:
                            171 ;src/fisicas/fisicas.c:28: }else if(movimiento==mover_Abajo){
   54C7 DD 7E 04      [19]  172 	ld	a, 4 (ix)
   54CA D6 04         [ 7]  173 	sub	a, #0x04
   54CC 20 13         [12]  174 	jr	NZ,00121$
                            175 ;src/fisicas/fisicas.c:29: if(posy+1>posyMax)
   54CE 03            [ 6]  176 	inc	bc
   54CF 3E 09         [ 7]  177 	ld	a, #0x09
   54D1 B9            [ 4]  178 	cp	a, c
   54D2 3E 00         [ 7]  179 	ld	a, #0x00
   54D4 98            [ 4]  180 	sbc	a, b
   54D5 E2 DA 54      [10]  181 	jp	PO, 00169$
   54D8 EE 80         [ 7]  182 	xor	a, #0x80
   54DA                     183 00169$:
   54DA F2 E1 54      [10]  184 	jp	P, 00121$
                            185 ;src/fisicas/fisicas.c:30: movimiento=mover_SinMovimiento;
   54DD DD 36 04 00   [19]  186 	ld	4 (ix), #0x00
   54E1                     187 00121$:
                            188 ;src/fisicas/fisicas.c:33: return movimiento;
   54E1 DD 6E 04      [19]  189 	ld	l, 4 (ix)
   54E4 DD E1         [14]  190 	pop	ix
   54E6 C9            [10]  191 	ret
                            192 ;src/fisicas/fisicas.c:35: u8 comprobarColisiones1vs1(u8 posx, u8 posy,u8 posxRock, u8 posyRock){    
                            193 ;	---------------------------------
                            194 ; Function comprobarColisiones1vs1
                            195 ; ---------------------------------
   54E7                     196 _comprobarColisiones1vs1::
                            197 ;src/fisicas/fisicas.c:36: if(posx==posxRock && posy==posyRock){        
   54E7 21 02 00      [10]  198 	ld	hl, #2+0
   54EA 39            [11]  199 	add	hl, sp
   54EB 7E            [ 7]  200 	ld	a, (hl)
   54EC FD 21 04 00   [14]  201 	ld	iy, #4
   54F0 FD 39         [15]  202 	add	iy, sp
   54F2 FD 96 00      [19]  203 	sub	a, 0 (iy)
   54F5 20 13         [12]  204 	jr	NZ,00102$
   54F7 21 03 00      [10]  205 	ld	hl, #3+0
   54FA 39            [11]  206 	add	hl, sp
   54FB 7E            [ 7]  207 	ld	a, (hl)
   54FC FD 21 05 00   [14]  208 	ld	iy, #5
   5500 FD 39         [15]  209 	add	iy, sp
   5502 FD 96 00      [19]  210 	sub	a, 0 (iy)
   5505 20 03         [12]  211 	jr	NZ,00102$
                            212 ;src/fisicas/fisicas.c:37: return hay_Colision;
   5507 2E 01         [ 7]  213 	ld	l, #0x01
   5509 C9            [10]  214 	ret
   550A                     215 00102$:
                            216 ;src/fisicas/fisicas.c:39: return no_Hay_Colision;
   550A 2E 00         [ 7]  217 	ld	l, #0x00
   550C C9            [10]  218 	ret
                            219 	.area _CODE
                            220 	.area _INITIALIZER
                            221 	.area _CABS (ABS)
