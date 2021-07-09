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
   9DBE                      49 _calcularPosicionEnPantalla::
   9DBE DD E5         [15]   50 	push	ix
   9DC0 DD 21 00 00   [14]   51 	ld	ix,#0
   9DC4 DD 39         [15]   52 	add	ix,sp
                             53 ;src/fisicas/fisicas.c:20: return cpctm_screenPtr(CPCT_VMEM_START, posx*4, posy*16);
   9DC6 DD 6E 05      [19]   54 	ld	l, 5 (ix)
   9DC9 26 00         [ 7]   55 	ld	h, #0x00
   9DCB 29            [11]   56 	add	hl, hl
   9DCC 29            [11]   57 	add	hl, hl
   9DCD 29            [11]   58 	add	hl, hl
   9DCE 29            [11]   59 	add	hl, hl
   9DCF EB            [ 4]   60 	ex	de,hl
   9DD0 4B            [ 4]   61 	ld	c, e
   9DD1 42            [ 4]   62 	ld	b, d
   9DD2 CB 28         [ 8]   63 	sra	b
   9DD4 CB 19         [ 8]   64 	rr	c
   9DD6 CB 28         [ 8]   65 	sra	b
   9DD8 CB 19         [ 8]   66 	rr	c
   9DDA CB 28         [ 8]   67 	sra	b
   9DDC CB 19         [ 8]   68 	rr	c
   9DDE 69            [ 4]   69 	ld	l, c
   9DDF 60            [ 4]   70 	ld	h, b
   9DE0 29            [11]   71 	add	hl, hl
   9DE1 29            [11]   72 	add	hl, hl
   9DE2 09            [11]   73 	add	hl, bc
   9DE3 29            [11]   74 	add	hl, hl
   9DE4 29            [11]   75 	add	hl, hl
   9DE5 29            [11]   76 	add	hl, hl
   9DE6 29            [11]   77 	add	hl, hl
   9DE7 01 00 C0      [10]   78 	ld	bc, #0xc000
   9DEA 09            [11]   79 	add	hl, bc
   9DEB 7B            [ 4]   80 	ld	a, e
   9DEC E6 07         [ 7]   81 	and	a, #0x07
   9DEE 07            [ 4]   82 	rlca
   9DEF 07            [ 4]   83 	rlca
   9DF0 07            [ 4]   84 	rlca
   9DF1 E6 F8         [ 7]   85 	and	a, #0xf8
   9DF3 47            [ 4]   86 	ld	b, a
   9DF4 0E 00         [ 7]   87 	ld	c, #0x00
   9DF6 09            [11]   88 	add	hl,bc
   9DF7 4D            [ 4]   89 	ld	c, l
   9DF8 44            [ 4]   90 	ld	b, h
   9DF9 DD 6E 04      [19]   91 	ld	l, 4 (ix)
   9DFC 26 00         [ 7]   92 	ld	h, #0x00
   9DFE 29            [11]   93 	add	hl, hl
   9DFF 29            [11]   94 	add	hl, hl
   9E00 09            [11]   95 	add	hl, bc
   9E01 DD E1         [14]   96 	pop	ix
   9E03 C9            [10]   97 	ret
                             98 ;src/fisicas/fisicas.c:22: u8 calcularMaximosyMinimos(u8 movimiento,u8 posx, u8 posy,u8 posicion){   
                             99 ;	---------------------------------
                            100 ; Function calcularMaximosyMinimos
                            101 ; ---------------------------------
   9E04                     102 _calcularMaximosyMinimos::
   9E04 DD E5         [15]  103 	push	ix
   9E06 DD 21 00 00   [14]  104 	ld	ix,#0
   9E0A DD 39         [15]  105 	add	ix,sp
                            106 ;src/fisicas/fisicas.c:25: if(posicion==posicion_Izquieda){        
   9E0C DD 7E 07      [19]  107 	ld	a, 7 (ix)
   9E0F B7            [ 4]  108 	or	a, a
   9E10 20 06         [12]  109 	jr	NZ,00102$
                            110 ;src/fisicas/fisicas.c:26: maximox=posxMax;
   9E12 0E 07         [ 7]  111 	ld	c, #0x07
                            112 ;src/fisicas/fisicas.c:27: minimox=posMin;
   9E14 1E 01         [ 7]  113 	ld	e, #0x01
   9E16 18 04         [12]  114 	jr	00103$
   9E18                     115 00102$:
                            116 ;src/fisicas/fisicas.c:29: maximox=posxMaxEspejo;
   9E18 0E 0F         [ 7]  117 	ld	c, #0x0f
                            118 ;src/fisicas/fisicas.c:30: minimox=posxminEspejo;
   9E1A 1E 09         [ 7]  119 	ld	e, #0x09
   9E1C                     120 00103$:
                            121 ;src/fisicas/fisicas.c:33: if(movimiento!=mover_SinMovimiento){
   9E1C DD 7E 04      [19]  122 	ld	a, 4 (ix)
   9E1F B7            [ 4]  123 	or	a, a
   9E20 28 75         [12]  124 	jr	Z,00124$
                            125 ;src/fisicas/fisicas.c:35: if(posx-1<minimox)
   9E22 DD 6E 05      [19]  126 	ld	l, 5 (ix)
   9E25 26 00         [ 7]  127 	ld	h, #0x00
                            128 ;src/fisicas/fisicas.c:34: if(movimiento==mover_Izquierda){
   9E27 DD 7E 04      [19]  129 	ld	a, 4 (ix)
   9E2A 3D            [ 4]  130 	dec	a
   9E2B 20 15         [12]  131 	jr	NZ,00121$
                            132 ;src/fisicas/fisicas.c:35: if(posx-1<minimox)
   9E2D 2B            [ 6]  133 	dec	hl
   9E2E 0E 00         [ 7]  134 	ld	c, #0x00
   9E30 7D            [ 4]  135 	ld	a, l
   9E31 93            [ 4]  136 	sub	a, e
   9E32 7C            [ 4]  137 	ld	a, h
   9E33 99            [ 4]  138 	sbc	a, c
   9E34 E2 39 9E      [10]  139 	jp	PO, 00169$
   9E37 EE 80         [ 7]  140 	xor	a, #0x80
   9E39                     141 00169$:
   9E39 F2 97 9E      [10]  142 	jp	P, 00124$
                            143 ;src/fisicas/fisicas.c:36: movimiento=mover_SinMovimiento;
   9E3C DD 36 04 00   [19]  144 	ld	4 (ix), #0x00
   9E40 18 55         [12]  145 	jr	00124$
   9E42                     146 00121$:
                            147 ;src/fisicas/fisicas.c:38: if(posy-1<posMin)
   9E42 DD 5E 06      [19]  148 	ld	e, 6 (ix)
   9E45 16 00         [ 7]  149 	ld	d, #0x00
                            150 ;src/fisicas/fisicas.c:37: }else if(movimiento==mover_Arriba){
   9E47 DD 7E 04      [19]  151 	ld	a, 4 (ix)
   9E4A D6 02         [ 7]  152 	sub	a, #0x02
   9E4C 20 12         [12]  153 	jr	NZ,00118$
                            154 ;src/fisicas/fisicas.c:38: if(posy-1<posMin)
   9E4E 1B            [ 6]  155 	dec	de
   9E4F 7B            [ 4]  156 	ld	a, e
   9E50 D6 01         [ 7]  157 	sub	a, #0x01
   9E52 7A            [ 4]  158 	ld	a, d
   9E53 17            [ 4]  159 	rla
   9E54 3F            [ 4]  160 	ccf
   9E55 1F            [ 4]  161 	rra
   9E56 DE 80         [ 7]  162 	sbc	a, #0x80
   9E58 30 3D         [12]  163 	jr	NC,00124$
                            164 ;src/fisicas/fisicas.c:39: movimiento=mover_SinMovimiento;
   9E5A DD 36 04 00   [19]  165 	ld	4 (ix), #0x00
   9E5E 18 37         [12]  166 	jr	00124$
   9E60                     167 00118$:
                            168 ;src/fisicas/fisicas.c:40: }else if(movimiento==mover_Derecha){
   9E60 DD 7E 04      [19]  169 	ld	a, 4 (ix)
   9E63 D6 03         [ 7]  170 	sub	a, #0x03
   9E65 20 15         [12]  171 	jr	NZ,00115$
                            172 ;src/fisicas/fisicas.c:41: if(posx+1>maximox)
   9E67 23            [ 6]  173 	inc	hl
   9E68 06 00         [ 7]  174 	ld	b, #0x00
   9E6A 79            [ 4]  175 	ld	a, c
   9E6B 95            [ 4]  176 	sub	a, l
   9E6C 78            [ 4]  177 	ld	a, b
   9E6D 9C            [ 4]  178 	sbc	a, h
   9E6E E2 73 9E      [10]  179 	jp	PO, 00174$
   9E71 EE 80         [ 7]  180 	xor	a, #0x80
   9E73                     181 00174$:
   9E73 F2 97 9E      [10]  182 	jp	P, 00124$
                            183 ;src/fisicas/fisicas.c:42: movimiento=mover_SinMovimiento;
   9E76 DD 36 04 00   [19]  184 	ld	4 (ix), #0x00
   9E7A 18 1B         [12]  185 	jr	00124$
   9E7C                     186 00115$:
                            187 ;src/fisicas/fisicas.c:43: }else if(movimiento==mover_Abajo){
   9E7C DD 7E 04      [19]  188 	ld	a, 4 (ix)
   9E7F D6 04         [ 7]  189 	sub	a, #0x04
   9E81 20 14         [12]  190 	jr	NZ,00124$
                            191 ;src/fisicas/fisicas.c:44: if(posy+1>posyMax)
   9E83 13            [ 6]  192 	inc	de
   9E84 4B            [ 4]  193 	ld	c, e
   9E85 3E 07         [ 7]  194 	ld	a, #0x07
   9E87 B9            [ 4]  195 	cp	a, c
   9E88 3E 00         [ 7]  196 	ld	a, #0x00
   9E8A 9A            [ 4]  197 	sbc	a, d
   9E8B E2 90 9E      [10]  198 	jp	PO, 00177$
   9E8E EE 80         [ 7]  199 	xor	a, #0x80
   9E90                     200 00177$:
   9E90 F2 97 9E      [10]  201 	jp	P, 00124$
                            202 ;src/fisicas/fisicas.c:45: movimiento=mover_SinMovimiento;
   9E93 DD 36 04 00   [19]  203 	ld	4 (ix), #0x00
   9E97                     204 00124$:
                            205 ;src/fisicas/fisicas.c:48: return movimiento;
   9E97 DD 6E 04      [19]  206 	ld	l, 4 (ix)
   9E9A DD E1         [14]  207 	pop	ix
   9E9C C9            [10]  208 	ret
                            209 ;src/fisicas/fisicas.c:50: u8 comprobarColisiones1vs1(u8 posx, u8 posy,u8 posxRock, u8 posyRock){    
                            210 ;	---------------------------------
                            211 ; Function comprobarColisiones1vs1
                            212 ; ---------------------------------
   9E9D                     213 _comprobarColisiones1vs1::
                            214 ;src/fisicas/fisicas.c:51: if(posx==posxRock && posy==posyRock){        
   9E9D 21 02 00      [10]  215 	ld	hl, #2+0
   9EA0 39            [11]  216 	add	hl, sp
   9EA1 7E            [ 7]  217 	ld	a, (hl)
   9EA2 FD 21 04 00   [14]  218 	ld	iy, #4
   9EA6 FD 39         [15]  219 	add	iy, sp
   9EA8 FD 96 00      [19]  220 	sub	a, 0 (iy)
   9EAB 20 13         [12]  221 	jr	NZ,00102$
   9EAD 21 03 00      [10]  222 	ld	hl, #3+0
   9EB0 39            [11]  223 	add	hl, sp
   9EB1 7E            [ 7]  224 	ld	a, (hl)
   9EB2 FD 21 05 00   [14]  225 	ld	iy, #5
   9EB6 FD 39         [15]  226 	add	iy, sp
   9EB8 FD 96 00      [19]  227 	sub	a, 0 (iy)
   9EBB 20 03         [12]  228 	jr	NZ,00102$
                            229 ;src/fisicas/fisicas.c:52: return hay_Colision;
   9EBD 2E 01         [ 7]  230 	ld	l, #0x01
   9EBF C9            [10]  231 	ret
   9EC0                     232 00102$:
                            233 ;src/fisicas/fisicas.c:54: return no_Hay_Colision;
   9EC0 2E 00         [ 7]  234 	ld	l, #0x00
   9EC2 C9            [10]  235 	ret
                            236 	.area _CODE
                            237 	.area _INITIALIZER
                            238 	.area _CABS (ABS)
