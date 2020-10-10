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
                             45 ;src/fisicas/fisicas.c:18: u8* calcularPosicionEnPantalla(u8 posx, u8 posy){
                             46 ;	---------------------------------
                             47 ; Function calcularPosicionEnPantalla
                             48 ; ---------------------------------
   5DC6                      49 _calcularPosicionEnPantalla::
   5DC6 DD E5         [15]   50 	push	ix
   5DC8 DD 21 00 00   [14]   51 	ld	ix,#0
   5DCC DD 39         [15]   52 	add	ix,sp
                             53 ;src/fisicas/fisicas.c:20: return cpctm_screenPtr(CPCT_VMEM_START, posx*4, posy*16);
   5DCE DD 6E 05      [19]   54 	ld	l, 5 (ix)
   5DD1 26 00         [ 7]   55 	ld	h, #0x00
   5DD3 29            [11]   56 	add	hl, hl
   5DD4 29            [11]   57 	add	hl, hl
   5DD5 29            [11]   58 	add	hl, hl
   5DD6 29            [11]   59 	add	hl, hl
   5DD7 EB            [ 4]   60 	ex	de,hl
   5DD8 4B            [ 4]   61 	ld	c, e
   5DD9 42            [ 4]   62 	ld	b, d
   5DDA CB 28         [ 8]   63 	sra	b
   5DDC CB 19         [ 8]   64 	rr	c
   5DDE CB 28         [ 8]   65 	sra	b
   5DE0 CB 19         [ 8]   66 	rr	c
   5DE2 CB 28         [ 8]   67 	sra	b
   5DE4 CB 19         [ 8]   68 	rr	c
   5DE6 69            [ 4]   69 	ld	l, c
   5DE7 60            [ 4]   70 	ld	h, b
   5DE8 29            [11]   71 	add	hl, hl
   5DE9 29            [11]   72 	add	hl, hl
   5DEA 09            [11]   73 	add	hl, bc
   5DEB 29            [11]   74 	add	hl, hl
   5DEC 29            [11]   75 	add	hl, hl
   5DED 29            [11]   76 	add	hl, hl
   5DEE 29            [11]   77 	add	hl, hl
   5DEF 01 00 C0      [10]   78 	ld	bc, #0xc000
   5DF2 09            [11]   79 	add	hl, bc
   5DF3 7B            [ 4]   80 	ld	a, e
   5DF4 E6 07         [ 7]   81 	and	a, #0x07
   5DF6 07            [ 4]   82 	rlca
   5DF7 07            [ 4]   83 	rlca
   5DF8 07            [ 4]   84 	rlca
   5DF9 E6 F8         [ 7]   85 	and	a, #0xf8
   5DFB 47            [ 4]   86 	ld	b, a
   5DFC 0E 00         [ 7]   87 	ld	c, #0x00
   5DFE 09            [11]   88 	add	hl,bc
   5DFF 4D            [ 4]   89 	ld	c, l
   5E00 44            [ 4]   90 	ld	b, h
   5E01 DD 6E 04      [19]   91 	ld	l, 4 (ix)
   5E04 26 00         [ 7]   92 	ld	h, #0x00
   5E06 29            [11]   93 	add	hl, hl
   5E07 29            [11]   94 	add	hl, hl
   5E08 09            [11]   95 	add	hl, bc
   5E09 DD E1         [14]   96 	pop	ix
   5E0B C9            [10]   97 	ret
                             98 ;src/fisicas/fisicas.c:22: u8 calcularMaximosyMinimos(u8 movimiento,u8 posx, u8 posy,u8 posicion){   
                             99 ;	---------------------------------
                            100 ; Function calcularMaximosyMinimos
                            101 ; ---------------------------------
   5E0C                     102 _calcularMaximosyMinimos::
   5E0C DD E5         [15]  103 	push	ix
   5E0E DD 21 00 00   [14]  104 	ld	ix,#0
   5E12 DD 39         [15]  105 	add	ix,sp
                            106 ;src/fisicas/fisicas.c:25: if(posicion==posicion_Izquieda){        
   5E14 DD 7E 07      [19]  107 	ld	a, 7 (ix)
   5E17 B7            [ 4]  108 	or	a, a
   5E18 20 06         [12]  109 	jr	NZ,00102$
                            110 ;src/fisicas/fisicas.c:26: maximox=posxMax;
   5E1A 0E 07         [ 7]  111 	ld	c, #0x07
                            112 ;src/fisicas/fisicas.c:27: minimox=posMin;
   5E1C 1E 01         [ 7]  113 	ld	e, #0x01
   5E1E 18 04         [12]  114 	jr	00103$
   5E20                     115 00102$:
                            116 ;src/fisicas/fisicas.c:29: maximox=posxMaxEspejo;
   5E20 0E 0F         [ 7]  117 	ld	c, #0x0f
                            118 ;src/fisicas/fisicas.c:30: minimox=posxminEspejo;
   5E22 1E 09         [ 7]  119 	ld	e, #0x09
   5E24                     120 00103$:
                            121 ;src/fisicas/fisicas.c:33: if(movimiento!=mover_SinMovimiento){
   5E24 DD 7E 04      [19]  122 	ld	a, 4 (ix)
   5E27 B7            [ 4]  123 	or	a, a
   5E28 28 75         [12]  124 	jr	Z,00124$
                            125 ;src/fisicas/fisicas.c:35: if(posx-1<minimox)
   5E2A DD 6E 05      [19]  126 	ld	l, 5 (ix)
   5E2D 26 00         [ 7]  127 	ld	h, #0x00
                            128 ;src/fisicas/fisicas.c:34: if(movimiento==mover_Izquierda){
   5E2F DD 7E 04      [19]  129 	ld	a, 4 (ix)
   5E32 3D            [ 4]  130 	dec	a
   5E33 20 15         [12]  131 	jr	NZ,00121$
                            132 ;src/fisicas/fisicas.c:35: if(posx-1<minimox)
   5E35 2B            [ 6]  133 	dec	hl
   5E36 0E 00         [ 7]  134 	ld	c, #0x00
   5E38 7D            [ 4]  135 	ld	a, l
   5E39 93            [ 4]  136 	sub	a, e
   5E3A 7C            [ 4]  137 	ld	a, h
   5E3B 99            [ 4]  138 	sbc	a, c
   5E3C E2 41 5E      [10]  139 	jp	PO, 00169$
   5E3F EE 80         [ 7]  140 	xor	a, #0x80
   5E41                     141 00169$:
   5E41 F2 9F 5E      [10]  142 	jp	P, 00124$
                            143 ;src/fisicas/fisicas.c:36: movimiento=mover_SinMovimiento;
   5E44 DD 36 04 00   [19]  144 	ld	4 (ix), #0x00
   5E48 18 55         [12]  145 	jr	00124$
   5E4A                     146 00121$:
                            147 ;src/fisicas/fisicas.c:38: if(posy-1<posMin)
   5E4A DD 5E 06      [19]  148 	ld	e, 6 (ix)
   5E4D 16 00         [ 7]  149 	ld	d, #0x00
                            150 ;src/fisicas/fisicas.c:37: }else if(movimiento==mover_Arriba){
   5E4F DD 7E 04      [19]  151 	ld	a, 4 (ix)
   5E52 D6 02         [ 7]  152 	sub	a, #0x02
   5E54 20 12         [12]  153 	jr	NZ,00118$
                            154 ;src/fisicas/fisicas.c:38: if(posy-1<posMin)
   5E56 1B            [ 6]  155 	dec	de
   5E57 7B            [ 4]  156 	ld	a, e
   5E58 D6 01         [ 7]  157 	sub	a, #0x01
   5E5A 7A            [ 4]  158 	ld	a, d
   5E5B 17            [ 4]  159 	rla
   5E5C 3F            [ 4]  160 	ccf
   5E5D 1F            [ 4]  161 	rra
   5E5E DE 80         [ 7]  162 	sbc	a, #0x80
   5E60 30 3D         [12]  163 	jr	NC,00124$
                            164 ;src/fisicas/fisicas.c:39: movimiento=mover_SinMovimiento;
   5E62 DD 36 04 00   [19]  165 	ld	4 (ix), #0x00
   5E66 18 37         [12]  166 	jr	00124$
   5E68                     167 00118$:
                            168 ;src/fisicas/fisicas.c:40: }else if(movimiento==mover_Derecha){
   5E68 DD 7E 04      [19]  169 	ld	a, 4 (ix)
   5E6B D6 03         [ 7]  170 	sub	a, #0x03
   5E6D 20 15         [12]  171 	jr	NZ,00115$
                            172 ;src/fisicas/fisicas.c:41: if(posx+1>maximox)
   5E6F 23            [ 6]  173 	inc	hl
   5E70 06 00         [ 7]  174 	ld	b, #0x00
   5E72 79            [ 4]  175 	ld	a, c
   5E73 95            [ 4]  176 	sub	a, l
   5E74 78            [ 4]  177 	ld	a, b
   5E75 9C            [ 4]  178 	sbc	a, h
   5E76 E2 7B 5E      [10]  179 	jp	PO, 00174$
   5E79 EE 80         [ 7]  180 	xor	a, #0x80
   5E7B                     181 00174$:
   5E7B F2 9F 5E      [10]  182 	jp	P, 00124$
                            183 ;src/fisicas/fisicas.c:42: movimiento=mover_SinMovimiento;
   5E7E DD 36 04 00   [19]  184 	ld	4 (ix), #0x00
   5E82 18 1B         [12]  185 	jr	00124$
   5E84                     186 00115$:
                            187 ;src/fisicas/fisicas.c:43: }else if(movimiento==mover_Abajo){
   5E84 DD 7E 04      [19]  188 	ld	a, 4 (ix)
   5E87 D6 04         [ 7]  189 	sub	a, #0x04
   5E89 20 14         [12]  190 	jr	NZ,00124$
                            191 ;src/fisicas/fisicas.c:44: if(posy+1>posyMax)
   5E8B 13            [ 6]  192 	inc	de
   5E8C 4B            [ 4]  193 	ld	c, e
   5E8D 3E 07         [ 7]  194 	ld	a, #0x07
   5E8F B9            [ 4]  195 	cp	a, c
   5E90 3E 00         [ 7]  196 	ld	a, #0x00
   5E92 9A            [ 4]  197 	sbc	a, d
   5E93 E2 98 5E      [10]  198 	jp	PO, 00177$
   5E96 EE 80         [ 7]  199 	xor	a, #0x80
   5E98                     200 00177$:
   5E98 F2 9F 5E      [10]  201 	jp	P, 00124$
                            202 ;src/fisicas/fisicas.c:45: movimiento=mover_SinMovimiento;
   5E9B DD 36 04 00   [19]  203 	ld	4 (ix), #0x00
   5E9F                     204 00124$:
                            205 ;src/fisicas/fisicas.c:48: return movimiento;
   5E9F DD 6E 04      [19]  206 	ld	l, 4 (ix)
   5EA2 DD E1         [14]  207 	pop	ix
   5EA4 C9            [10]  208 	ret
                            209 ;src/fisicas/fisicas.c:50: u8 comprobarColisiones1vs1(u8 posx, u8 posy,u8 posxRock, u8 posyRock){    
                            210 ;	---------------------------------
                            211 ; Function comprobarColisiones1vs1
                            212 ; ---------------------------------
   5EA5                     213 _comprobarColisiones1vs1::
                            214 ;src/fisicas/fisicas.c:51: if(posx==posxRock && posy==posyRock){        
   5EA5 21 02 00      [10]  215 	ld	hl, #2+0
   5EA8 39            [11]  216 	add	hl, sp
   5EA9 7E            [ 7]  217 	ld	a, (hl)
   5EAA FD 21 04 00   [14]  218 	ld	iy, #4
   5EAE FD 39         [15]  219 	add	iy, sp
   5EB0 FD 96 00      [19]  220 	sub	a, 0 (iy)
   5EB3 20 13         [12]  221 	jr	NZ,00102$
   5EB5 21 03 00      [10]  222 	ld	hl, #3+0
   5EB8 39            [11]  223 	add	hl, sp
   5EB9 7E            [ 7]  224 	ld	a, (hl)
   5EBA FD 21 05 00   [14]  225 	ld	iy, #5
   5EBE FD 39         [15]  226 	add	iy, sp
   5EC0 FD 96 00      [19]  227 	sub	a, 0 (iy)
   5EC3 20 03         [12]  228 	jr	NZ,00102$
                            229 ;src/fisicas/fisicas.c:52: return hay_Colision;
   5EC5 2E 01         [ 7]  230 	ld	l, #0x01
   5EC7 C9            [10]  231 	ret
   5EC8                     232 00102$:
                            233 ;src/fisicas/fisicas.c:54: return no_Hay_Colision;
   5EC8 2E 00         [ 7]  234 	ld	l, #0x00
   5ECA C9            [10]  235 	ret
                            236 	.area _CODE
                            237 	.area _INITIALIZER
                            238 	.area _CABS (ABS)
