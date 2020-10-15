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
   71D9                      49 _calcularPosicionEnPantalla::
   71D9 DD E5         [15]   50 	push	ix
   71DB DD 21 00 00   [14]   51 	ld	ix,#0
   71DF DD 39         [15]   52 	add	ix,sp
                             53 ;src/fisicas/fisicas.c:20: return cpctm_screenPtr(CPCT_VMEM_START, posx*4, posy*16);
   71E1 DD 6E 05      [19]   54 	ld	l, 5 (ix)
   71E4 26 00         [ 7]   55 	ld	h, #0x00
   71E6 29            [11]   56 	add	hl, hl
   71E7 29            [11]   57 	add	hl, hl
   71E8 29            [11]   58 	add	hl, hl
   71E9 29            [11]   59 	add	hl, hl
   71EA EB            [ 4]   60 	ex	de,hl
   71EB 4B            [ 4]   61 	ld	c, e
   71EC 42            [ 4]   62 	ld	b, d
   71ED CB 28         [ 8]   63 	sra	b
   71EF CB 19         [ 8]   64 	rr	c
   71F1 CB 28         [ 8]   65 	sra	b
   71F3 CB 19         [ 8]   66 	rr	c
   71F5 CB 28         [ 8]   67 	sra	b
   71F7 CB 19         [ 8]   68 	rr	c
   71F9 69            [ 4]   69 	ld	l, c
   71FA 60            [ 4]   70 	ld	h, b
   71FB 29            [11]   71 	add	hl, hl
   71FC 29            [11]   72 	add	hl, hl
   71FD 09            [11]   73 	add	hl, bc
   71FE 29            [11]   74 	add	hl, hl
   71FF 29            [11]   75 	add	hl, hl
   7200 29            [11]   76 	add	hl, hl
   7201 29            [11]   77 	add	hl, hl
   7202 01 00 C0      [10]   78 	ld	bc, #0xc000
   7205 09            [11]   79 	add	hl, bc
   7206 7B            [ 4]   80 	ld	a, e
   7207 E6 07         [ 7]   81 	and	a, #0x07
   7209 07            [ 4]   82 	rlca
   720A 07            [ 4]   83 	rlca
   720B 07            [ 4]   84 	rlca
   720C E6 F8         [ 7]   85 	and	a, #0xf8
   720E 47            [ 4]   86 	ld	b, a
   720F 0E 00         [ 7]   87 	ld	c, #0x00
   7211 09            [11]   88 	add	hl,bc
   7212 4D            [ 4]   89 	ld	c, l
   7213 44            [ 4]   90 	ld	b, h
   7214 DD 6E 04      [19]   91 	ld	l, 4 (ix)
   7217 26 00         [ 7]   92 	ld	h, #0x00
   7219 29            [11]   93 	add	hl, hl
   721A 29            [11]   94 	add	hl, hl
   721B 09            [11]   95 	add	hl, bc
   721C DD E1         [14]   96 	pop	ix
   721E C9            [10]   97 	ret
                             98 ;src/fisicas/fisicas.c:22: u8 calcularMaximosyMinimos(u8 movimiento,u8 posx, u8 posy,u8 posicion){   
                             99 ;	---------------------------------
                            100 ; Function calcularMaximosyMinimos
                            101 ; ---------------------------------
   721F                     102 _calcularMaximosyMinimos::
   721F DD E5         [15]  103 	push	ix
   7221 DD 21 00 00   [14]  104 	ld	ix,#0
   7225 DD 39         [15]  105 	add	ix,sp
                            106 ;src/fisicas/fisicas.c:25: if(posicion==posicion_Izquieda){        
   7227 DD 7E 07      [19]  107 	ld	a, 7 (ix)
   722A B7            [ 4]  108 	or	a, a
   722B 20 06         [12]  109 	jr	NZ,00102$
                            110 ;src/fisicas/fisicas.c:26: maximox=posxMax;
   722D 0E 07         [ 7]  111 	ld	c, #0x07
                            112 ;src/fisicas/fisicas.c:27: minimox=posMin;
   722F 1E 01         [ 7]  113 	ld	e, #0x01
   7231 18 04         [12]  114 	jr	00103$
   7233                     115 00102$:
                            116 ;src/fisicas/fisicas.c:29: maximox=posxMaxEspejo;
   7233 0E 0F         [ 7]  117 	ld	c, #0x0f
                            118 ;src/fisicas/fisicas.c:30: minimox=posxminEspejo;
   7235 1E 09         [ 7]  119 	ld	e, #0x09
   7237                     120 00103$:
                            121 ;src/fisicas/fisicas.c:33: if(movimiento!=mover_SinMovimiento){
   7237 DD 7E 04      [19]  122 	ld	a, 4 (ix)
   723A B7            [ 4]  123 	or	a, a
   723B 28 75         [12]  124 	jr	Z,00124$
                            125 ;src/fisicas/fisicas.c:35: if(posx-1<minimox)
   723D DD 6E 05      [19]  126 	ld	l, 5 (ix)
   7240 26 00         [ 7]  127 	ld	h, #0x00
                            128 ;src/fisicas/fisicas.c:34: if(movimiento==mover_Izquierda){
   7242 DD 7E 04      [19]  129 	ld	a, 4 (ix)
   7245 3D            [ 4]  130 	dec	a
   7246 20 15         [12]  131 	jr	NZ,00121$
                            132 ;src/fisicas/fisicas.c:35: if(posx-1<minimox)
   7248 2B            [ 6]  133 	dec	hl
   7249 0E 00         [ 7]  134 	ld	c, #0x00
   724B 7D            [ 4]  135 	ld	a, l
   724C 93            [ 4]  136 	sub	a, e
   724D 7C            [ 4]  137 	ld	a, h
   724E 99            [ 4]  138 	sbc	a, c
   724F E2 54 72      [10]  139 	jp	PO, 00169$
   7252 EE 80         [ 7]  140 	xor	a, #0x80
   7254                     141 00169$:
   7254 F2 B2 72      [10]  142 	jp	P, 00124$
                            143 ;src/fisicas/fisicas.c:36: movimiento=mover_SinMovimiento;
   7257 DD 36 04 00   [19]  144 	ld	4 (ix), #0x00
   725B 18 55         [12]  145 	jr	00124$
   725D                     146 00121$:
                            147 ;src/fisicas/fisicas.c:38: if(posy-1<posMin)
   725D DD 5E 06      [19]  148 	ld	e, 6 (ix)
   7260 16 00         [ 7]  149 	ld	d, #0x00
                            150 ;src/fisicas/fisicas.c:37: }else if(movimiento==mover_Arriba){
   7262 DD 7E 04      [19]  151 	ld	a, 4 (ix)
   7265 D6 02         [ 7]  152 	sub	a, #0x02
   7267 20 12         [12]  153 	jr	NZ,00118$
                            154 ;src/fisicas/fisicas.c:38: if(posy-1<posMin)
   7269 1B            [ 6]  155 	dec	de
   726A 7B            [ 4]  156 	ld	a, e
   726B D6 01         [ 7]  157 	sub	a, #0x01
   726D 7A            [ 4]  158 	ld	a, d
   726E 17            [ 4]  159 	rla
   726F 3F            [ 4]  160 	ccf
   7270 1F            [ 4]  161 	rra
   7271 DE 80         [ 7]  162 	sbc	a, #0x80
   7273 30 3D         [12]  163 	jr	NC,00124$
                            164 ;src/fisicas/fisicas.c:39: movimiento=mover_SinMovimiento;
   7275 DD 36 04 00   [19]  165 	ld	4 (ix), #0x00
   7279 18 37         [12]  166 	jr	00124$
   727B                     167 00118$:
                            168 ;src/fisicas/fisicas.c:40: }else if(movimiento==mover_Derecha){
   727B DD 7E 04      [19]  169 	ld	a, 4 (ix)
   727E D6 03         [ 7]  170 	sub	a, #0x03
   7280 20 15         [12]  171 	jr	NZ,00115$
                            172 ;src/fisicas/fisicas.c:41: if(posx+1>maximox)
   7282 23            [ 6]  173 	inc	hl
   7283 06 00         [ 7]  174 	ld	b, #0x00
   7285 79            [ 4]  175 	ld	a, c
   7286 95            [ 4]  176 	sub	a, l
   7287 78            [ 4]  177 	ld	a, b
   7288 9C            [ 4]  178 	sbc	a, h
   7289 E2 8E 72      [10]  179 	jp	PO, 00174$
   728C EE 80         [ 7]  180 	xor	a, #0x80
   728E                     181 00174$:
   728E F2 B2 72      [10]  182 	jp	P, 00124$
                            183 ;src/fisicas/fisicas.c:42: movimiento=mover_SinMovimiento;
   7291 DD 36 04 00   [19]  184 	ld	4 (ix), #0x00
   7295 18 1B         [12]  185 	jr	00124$
   7297                     186 00115$:
                            187 ;src/fisicas/fisicas.c:43: }else if(movimiento==mover_Abajo){
   7297 DD 7E 04      [19]  188 	ld	a, 4 (ix)
   729A D6 04         [ 7]  189 	sub	a, #0x04
   729C 20 14         [12]  190 	jr	NZ,00124$
                            191 ;src/fisicas/fisicas.c:44: if(posy+1>posyMax)
   729E 13            [ 6]  192 	inc	de
   729F 4B            [ 4]  193 	ld	c, e
   72A0 3E 07         [ 7]  194 	ld	a, #0x07
   72A2 B9            [ 4]  195 	cp	a, c
   72A3 3E 00         [ 7]  196 	ld	a, #0x00
   72A5 9A            [ 4]  197 	sbc	a, d
   72A6 E2 AB 72      [10]  198 	jp	PO, 00177$
   72A9 EE 80         [ 7]  199 	xor	a, #0x80
   72AB                     200 00177$:
   72AB F2 B2 72      [10]  201 	jp	P, 00124$
                            202 ;src/fisicas/fisicas.c:45: movimiento=mover_SinMovimiento;
   72AE DD 36 04 00   [19]  203 	ld	4 (ix), #0x00
   72B2                     204 00124$:
                            205 ;src/fisicas/fisicas.c:48: return movimiento;
   72B2 DD 6E 04      [19]  206 	ld	l, 4 (ix)
   72B5 DD E1         [14]  207 	pop	ix
   72B7 C9            [10]  208 	ret
                            209 ;src/fisicas/fisicas.c:50: u8 comprobarColisiones1vs1(u8 posx, u8 posy,u8 posxRock, u8 posyRock){    
                            210 ;	---------------------------------
                            211 ; Function comprobarColisiones1vs1
                            212 ; ---------------------------------
   72B8                     213 _comprobarColisiones1vs1::
                            214 ;src/fisicas/fisicas.c:51: if(posx==posxRock && posy==posyRock){        
   72B8 21 02 00      [10]  215 	ld	hl, #2+0
   72BB 39            [11]  216 	add	hl, sp
   72BC 7E            [ 7]  217 	ld	a, (hl)
   72BD FD 21 04 00   [14]  218 	ld	iy, #4
   72C1 FD 39         [15]  219 	add	iy, sp
   72C3 FD 96 00      [19]  220 	sub	a, 0 (iy)
   72C6 20 13         [12]  221 	jr	NZ,00102$
   72C8 21 03 00      [10]  222 	ld	hl, #3+0
   72CB 39            [11]  223 	add	hl, sp
   72CC 7E            [ 7]  224 	ld	a, (hl)
   72CD FD 21 05 00   [14]  225 	ld	iy, #5
   72D1 FD 39         [15]  226 	add	iy, sp
   72D3 FD 96 00      [19]  227 	sub	a, 0 (iy)
   72D6 20 03         [12]  228 	jr	NZ,00102$
                            229 ;src/fisicas/fisicas.c:52: return hay_Colision;
   72D8 2E 01         [ 7]  230 	ld	l, #0x01
   72DA C9            [10]  231 	ret
   72DB                     232 00102$:
                            233 ;src/fisicas/fisicas.c:54: return no_Hay_Colision;
   72DB 2E 00         [ 7]  234 	ld	l, #0x00
   72DD C9            [10]  235 	ret
                            236 	.area _CODE
                            237 	.area _INITIALIZER
                            238 	.area _CABS (ABS)
