                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module hud
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _dibujarGameObjectColSprite
                             12 	.globl _cpct_drawStringM0
                             13 	.globl _cpct_setDrawCharM0
                             14 	.globl _cpct_drawSolidBox
                             15 	.globl _contadorPasos
                             16 	.globl _contadorAmstr
                             17 	.globl _contadorFamilia
                             18 	.globl _contadorLuz
                             19 	.globl _asd
                             20 	.globl _initHud
                             21 	.globl _actualizarHud
                             22 ;--------------------------------------------------------
                             23 ; special function registers
                             24 ;--------------------------------------------------------
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DATA
   B1B7                      29 _P_portal:
   B1B7                      30 	.ds 2
   B1B9                      31 _P_puertas:
   B1B9                      32 	.ds 2
   B1BB                      33 _P_col:
   B1BB                      34 	.ds 2
   B1BD                      35 _P_luz:
   B1BD                      36 	.ds 2
   B1BF                      37 _P_fam:
   B1BF                      38 	.ds 2
   B1C1                      39 _P_ams:
   B1C1                      40 	.ds 2
   B1C3                      41 _P_colList:
   B1C3                      42 	.ds 2
   B1C5                      43 _contadorLuz::
   B1C5                      44 	.ds 1
   B1C6                      45 _contadorFamilia::
   B1C6                      46 	.ds 1
   B1C7                      47 _contadorAmstr::
   B1C7                      48 	.ds 1
   B1C8                      49 _contadorPasos::
   B1C8                      50 	.ds 1
                             51 ;--------------------------------------------------------
                             52 ; ram data
                             53 ;--------------------------------------------------------
                             54 	.area _INITIALIZED
                             55 ;--------------------------------------------------------
                             56 ; absolute external ram data
                             57 ;--------------------------------------------------------
                             58 	.area _DABS (ABS)
                             59 ;--------------------------------------------------------
                             60 ; global & static initialisations
                             61 ;--------------------------------------------------------
                             62 	.area _HOME
                             63 	.area _GSINIT
                             64 	.area _GSFINAL
                             65 	.area _GSINIT
                             66 ;--------------------------------------------------------
                             67 ; Home
                             68 ;--------------------------------------------------------
                             69 	.area _HOME
                             70 	.area _HOME
                             71 ;--------------------------------------------------------
                             72 ; code
                             73 ;--------------------------------------------------------
                             74 	.area _CODE
                             75 ;src/hud/hud.c:21: void asd(){
                             76 ;	---------------------------------
                             77 ; Function asd
                             78 ; ---------------------------------
   9C26                      79 _asd::
                             80 ;src/hud/hud.c:32: }
   9C26 C9            [10]   81 	ret
                             82 ;src/hud/hud.c:33: void initHud(){
                             83 ;	---------------------------------
                             84 ; Function initHud
                             85 ; ---------------------------------
   9C27                      86 _initHud::
   9C27 DD E5         [15]   87 	push	ix
   9C29 DD 21 00 00   [14]   88 	ld	ix,#0
   9C2D DD 39         [15]   89 	add	ix,sp
   9C2F F5            [11]   90 	push	af
                             91 ;src/hud/hud.c:34: char text[] = "0";
   9C30 21 00 00      [10]   92 	ld	hl, #0x0000
   9C33 39            [11]   93 	add	hl, sp
   9C34 4D            [ 4]   94 	ld	c,l
   9C35 44            [ 4]   95 	ld	b,h
   9C36 36 30         [10]   96 	ld	(hl),#0x30
   9C38 59            [ 4]   97 	ld	e, c
   9C39 50            [ 4]   98 	ld	d, b
   9C3A 13            [ 6]   99 	inc	de
   9C3B AF            [ 4]  100 	xor	a, a
   9C3C 12            [ 7]  101 	ld	(de), a
                            102 ;src/hud/hud.c:36: cpct_setDrawCharM0(1, 0);
   9C3D C5            [11]  103 	push	bc
   9C3E 21 01 00      [10]  104 	ld	hl, #0x0001
   9C41 E5            [11]  105 	push	hl
   9C42 CD A1 AA      [17]  106 	call	_cpct_setDrawCharM0
   9C45 21 11 01      [10]  107 	ld	hl, #0x0111
   9C48 E5            [11]  108 	push	hl
   9C49 3E 25         [ 7]  109 	ld	a, #0x25
   9C4B F5            [11]  110 	push	af
   9C4C 33            [ 6]  111 	inc	sp
   9C4D CD F9 5E      [17]  112 	call	_dibujarGameObjectColSprite
   9C50 33            [ 6]  113 	inc	sp
   9C51 21 11 03      [10]  114 	ld	hl,#0x0311
   9C54 E3            [19]  115 	ex	(sp),hl
   9C55 3E 27         [ 7]  116 	ld	a, #0x27
   9C57 F5            [11]  117 	push	af
   9C58 33            [ 6]  118 	inc	sp
   9C59 CD F9 5E      [17]  119 	call	_dibujarGameObjectColSprite
   9C5C 33            [ 6]  120 	inc	sp
   9C5D 21 11 05      [10]  121 	ld	hl,#0x0511
   9C60 E3            [19]  122 	ex	(sp),hl
   9C61 3E 2F         [ 7]  123 	ld	a, #0x2f
   9C63 F5            [11]  124 	push	af
   9C64 33            [ 6]  125 	inc	sp
   9C65 CD F9 5E      [17]  126 	call	_dibujarGameObjectColSprite
   9C68 F1            [10]  127 	pop	af
   9C69 33            [ 6]  128 	inc	sp
   9C6A C1            [10]  129 	pop	bc
                            130 ;src/hud/hud.c:42: cpct_drawStringM0(text,PuntoLuz);
   9C6B 59            [ 4]  131 	ld	e, c
   9C6C 50            [ 4]  132 	ld	d, b
   9C6D C5            [11]  133 	push	bc
   9C6E 21 EA E0      [10]  134 	ld	hl, #0xe0ea
   9C71 E5            [11]  135 	push	hl
   9C72 D5            [11]  136 	push	de
   9C73 CD 79 A7      [17]  137 	call	_cpct_drawStringM0
   9C76 C1            [10]  138 	pop	bc
                            139 ;src/hud/hud.c:43: cpct_drawStringM0(text,PuntoFamilia);
   9C77 59            [ 4]  140 	ld	e, c
   9C78 50            [ 4]  141 	ld	d, b
   9C79 C5            [11]  142 	push	bc
   9C7A 21 2A E2      [10]  143 	ld	hl, #0xe22a
   9C7D E5            [11]  144 	push	hl
   9C7E D5            [11]  145 	push	de
   9C7F CD 79 A7      [17]  146 	call	_cpct_drawStringM0
   9C82 C1            [10]  147 	pop	bc
                            148 ;src/hud/hud.c:44: cpct_drawStringM0(text,PuntoCartuchos);
   9C83 21 6A E3      [10]  149 	ld	hl, #0xe36a
   9C86 E5            [11]  150 	push	hl
   9C87 C5            [11]  151 	push	bc
   9C88 CD 79 A7      [17]  152 	call	_cpct_drawStringM0
                            153 ;src/hud/hud.c:47: contadorLuz=0;
   9C8B 21 C5 B1      [10]  154 	ld	hl,#_contadorLuz + 0
   9C8E 36 00         [10]  155 	ld	(hl), #0x00
                            156 ;src/hud/hud.c:48: contadorFamilia=0;
   9C90 21 C6 B1      [10]  157 	ld	hl,#_contadorFamilia + 0
   9C93 36 00         [10]  158 	ld	(hl), #0x00
                            159 ;src/hud/hud.c:49: contadorAmstr=0;
   9C95 21 C7 B1      [10]  160 	ld	hl,#_contadorAmstr + 0
   9C98 36 00         [10]  161 	ld	(hl), #0x00
                            162 ;src/hud/hud.c:50: contadorPasos=0;
   9C9A 21 C8 B1      [10]  163 	ld	hl,#_contadorPasos + 0
   9C9D 36 00         [10]  164 	ld	(hl), #0x00
   9C9F DD F9         [10]  165 	ld	sp, ix
   9CA1 DD E1         [14]  166 	pop	ix
   9CA3 C9            [10]  167 	ret
                            168 ;src/hud/hud.c:53: void actualizarHud(u8 luz, u8 familia,u8 amstr,u8 pasos){
                            169 ;	---------------------------------
                            170 ; Function actualizarHud
                            171 ; ---------------------------------
   9CA4                     172 _actualizarHud::
   9CA4 DD E5         [15]  173 	push	ix
   9CA6 DD 21 00 00   [14]  174 	ld	ix,#0
   9CAA DD 39         [15]  175 	add	ix,sp
   9CAC 3B            [ 6]  176 	dec	sp
                            177 ;src/hud/hud.c:54: char text[1] = "X";    
   9CAD 21 00 00      [10]  178 	ld	hl, #0x0000
   9CB0 39            [11]  179 	add	hl, sp
   9CB1 4D            [ 4]  180 	ld	c,l
   9CB2 44            [ 4]  181 	ld	b,h
   9CB3 36 58         [10]  182 	ld	(hl),#0x58
                            183 ;src/hud/hud.c:58: if(luz!=contadorLuz){
   9CB5 DD 7E 04      [19]  184 	ld	a, 4 (ix)
   9CB8 FD 21 C5 B1   [14]  185 	ld	iy, #_contadorLuz
   9CBC FD 96 00      [19]  186 	sub	a, 0 (iy)
   9CBF 28 29         [12]  187 	jr	Z,00102$
                            188 ;src/hud/hud.c:59: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 20),0x00,4,16);
   9CC1 C5            [11]  189 	push	bc
   9CC2 21 04 10      [10]  190 	ld	hl, #0x1004
   9CC5 E5            [11]  191 	push	hl
   9CC6 21 00 00      [10]  192 	ld	hl, #0x0000
   9CC9 E5            [11]  193 	push	hl
   9CCA 21 EA E0      [10]  194 	ld	hl, #0xe0ea
   9CCD E5            [11]  195 	push	hl
   9CCE CD F6 A9      [17]  196 	call	_cpct_drawSolidBox
   9CD1 C1            [10]  197 	pop	bc
                            198 ;src/hud/hud.c:60: text[0]=luz+'0';
   9CD2 DD 7E 04      [19]  199 	ld	a, 4 (ix)
   9CD5 C6 30         [ 7]  200 	add	a, #0x30
   9CD7 02            [ 7]  201 	ld	(bc), a
                            202 ;src/hud/hud.c:61: cpct_drawStringM0(text,PuntoLuz);
   9CD8 59            [ 4]  203 	ld	e, c
   9CD9 50            [ 4]  204 	ld	d, b
   9CDA C5            [11]  205 	push	bc
   9CDB 21 EA E0      [10]  206 	ld	hl, #0xe0ea
   9CDE E5            [11]  207 	push	hl
   9CDF D5            [11]  208 	push	de
   9CE0 CD 79 A7      [17]  209 	call	_cpct_drawStringM0
   9CE3 C1            [10]  210 	pop	bc
                            211 ;src/hud/hud.c:62: contadorLuz=luz;
   9CE4 DD 7E 04      [19]  212 	ld	a, 4 (ix)
   9CE7 32 C5 B1      [13]  213 	ld	(#_contadorLuz + 0),a
   9CEA                     214 00102$:
                            215 ;src/hud/hud.c:64: if(familia!=contadorFamilia){
   9CEA DD 7E 05      [19]  216 	ld	a, 5 (ix)
   9CED FD 21 C6 B1   [14]  217 	ld	iy, #_contadorFamilia
   9CF1 FD 96 00      [19]  218 	sub	a, 0 (iy)
   9CF4 28 29         [12]  219 	jr	Z,00104$
                            220 ;src/hud/hud.c:65: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 52),0x00,4,16);
   9CF6 C5            [11]  221 	push	bc
   9CF7 21 04 10      [10]  222 	ld	hl, #0x1004
   9CFA E5            [11]  223 	push	hl
   9CFB 21 00 00      [10]  224 	ld	hl, #0x0000
   9CFE E5            [11]  225 	push	hl
   9CFF 21 2A E2      [10]  226 	ld	hl, #0xe22a
   9D02 E5            [11]  227 	push	hl
   9D03 CD F6 A9      [17]  228 	call	_cpct_drawSolidBox
   9D06 C1            [10]  229 	pop	bc
                            230 ;src/hud/hud.c:66: text[0]=familia+'0';
   9D07 DD 7E 05      [19]  231 	ld	a, 5 (ix)
   9D0A C6 30         [ 7]  232 	add	a, #0x30
   9D0C 02            [ 7]  233 	ld	(bc), a
                            234 ;src/hud/hud.c:67: cpct_drawStringM0(text,PuntoFamilia);
   9D0D 59            [ 4]  235 	ld	e, c
   9D0E 50            [ 4]  236 	ld	d, b
   9D0F C5            [11]  237 	push	bc
   9D10 21 2A E2      [10]  238 	ld	hl, #0xe22a
   9D13 E5            [11]  239 	push	hl
   9D14 D5            [11]  240 	push	de
   9D15 CD 79 A7      [17]  241 	call	_cpct_drawStringM0
   9D18 C1            [10]  242 	pop	bc
                            243 ;src/hud/hud.c:68: contadorFamilia=familia;
   9D19 DD 7E 05      [19]  244 	ld	a, 5 (ix)
   9D1C 32 C6 B1      [13]  245 	ld	(#_contadorFamilia + 0),a
   9D1F                     246 00104$:
                            247 ;src/hud/hud.c:70: if(amstr!=contadorAmstr){
   9D1F DD 7E 06      [19]  248 	ld	a, 6 (ix)
   9D22 FD 21 C7 B1   [14]  249 	ld	iy, #_contadorAmstr
   9D26 FD 96 00      [19]  250 	sub	a, 0 (iy)
   9D29 28 29         [12]  251 	jr	Z,00106$
                            252 ;src/hud/hud.c:71: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 84),0x00,4,16);
   9D2B C5            [11]  253 	push	bc
   9D2C 21 04 10      [10]  254 	ld	hl, #0x1004
   9D2F E5            [11]  255 	push	hl
   9D30 21 00 00      [10]  256 	ld	hl, #0x0000
   9D33 E5            [11]  257 	push	hl
   9D34 21 6A E3      [10]  258 	ld	hl, #0xe36a
   9D37 E5            [11]  259 	push	hl
   9D38 CD F6 A9      [17]  260 	call	_cpct_drawSolidBox
   9D3B C1            [10]  261 	pop	bc
                            262 ;src/hud/hud.c:72: text[0]=amstr+'0';
   9D3C DD 7E 06      [19]  263 	ld	a, 6 (ix)
   9D3F C6 30         [ 7]  264 	add	a, #0x30
   9D41 02            [ 7]  265 	ld	(bc), a
                            266 ;src/hud/hud.c:73: cpct_drawStringM0(text,PuntoCartuchos);
   9D42 59            [ 4]  267 	ld	e, c
   9D43 50            [ 4]  268 	ld	d, b
   9D44 C5            [11]  269 	push	bc
   9D45 21 6A E3      [10]  270 	ld	hl, #0xe36a
   9D48 E5            [11]  271 	push	hl
   9D49 D5            [11]  272 	push	de
   9D4A CD 79 A7      [17]  273 	call	_cpct_drawStringM0
   9D4D C1            [10]  274 	pop	bc
                            275 ;src/hud/hud.c:74: contadorAmstr=amstr;
   9D4E DD 7E 06      [19]  276 	ld	a, 6 (ix)
   9D51 32 C7 B1      [13]  277 	ld	(#_contadorAmstr + 0),a
   9D54                     278 00106$:
                            279 ;src/hud/hud.c:76: if(pasos!=contadorPasos){
   9D54 DD 7E 07      [19]  280 	ld	a, 7 (ix)
   9D57 FD 21 C8 B1   [14]  281 	ld	iy, #_contadorPasos
   9D5B FD 96 00      [19]  282 	sub	a, 0 (iy)
   9D5E 28 5A         [12]  283 	jr	Z,00109$
                            284 ;src/hud/hud.c:77: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 72, 116),0x00,4,16);
   9D60 C5            [11]  285 	push	bc
   9D61 21 04 10      [10]  286 	ld	hl, #0x1004
   9D64 E5            [11]  287 	push	hl
   9D65 21 00 00      [10]  288 	ld	hl, #0x0000
   9D68 E5            [11]  289 	push	hl
   9D69 21 A8 E4      [10]  290 	ld	hl, #0xe4a8
   9D6C E5            [11]  291 	push	hl
   9D6D CD F6 A9      [17]  292 	call	_cpct_drawSolidBox
   9D70 3E 0A         [ 7]  293 	ld	a, #0x0a
   9D72 F5            [11]  294 	push	af
   9D73 33            [ 6]  295 	inc	sp
   9D74 DD 7E 07      [19]  296 	ld	a, 7 (ix)
   9D77 F5            [11]  297 	push	af
   9D78 33            [ 6]  298 	inc	sp
   9D79 CD 80 A9      [17]  299 	call	__divuchar
   9D7C F1            [10]  300 	pop	af
   9D7D C1            [10]  301 	pop	bc
   9D7E 26 00         [ 7]  302 	ld	h, #0x00
                            303 ;src/hud/hud.c:79: unidades=pasos%10;       
   9D80 E5            [11]  304 	push	hl
   9D81 C5            [11]  305 	push	bc
   9D82 3E 0A         [ 7]  306 	ld	a, #0x0a
   9D84 F5            [11]  307 	push	af
   9D85 33            [ 6]  308 	inc	sp
   9D86 DD 7E 07      [19]  309 	ld	a, 7 (ix)
   9D89 F5            [11]  310 	push	af
   9D8A 33            [ 6]  311 	inc	sp
   9D8B CD BC A8      [17]  312 	call	__moduchar
   9D8E F1            [10]  313 	pop	af
   9D8F 5D            [ 4]  314 	ld	e, l
   9D90 C1            [10]  315 	pop	bc
   9D91 E1            [10]  316 	pop	hl
   9D92 16 00         [ 7]  317 	ld	d, #0x00
                            318 ;src/hud/hud.c:80: text[0]=decimas+'0';
   9D94 7D            [ 4]  319 	ld	a, l
   9D95 C6 30         [ 7]  320 	add	a, #0x30
   9D97 02            [ 7]  321 	ld	(bc), a
                            322 ;src/hud/hud.c:81: cpct_drawStringM0(text,PuntoPasos);
   9D98 C5            [11]  323 	push	bc
   9D99 FD E1         [14]  324 	pop	iy
   9D9B C5            [11]  325 	push	bc
   9D9C D5            [11]  326 	push	de
   9D9D 21 A8 E4      [10]  327 	ld	hl, #0xe4a8
   9DA0 E5            [11]  328 	push	hl
   9DA1 FD E5         [15]  329 	push	iy
   9DA3 CD 79 A7      [17]  330 	call	_cpct_drawStringM0
   9DA6 D1            [10]  331 	pop	de
   9DA7 C1            [10]  332 	pop	bc
                            333 ;src/hud/hud.c:82: text[0]=unidades +'0';
   9DA8 7B            [ 4]  334 	ld	a, e
   9DA9 C6 30         [ 7]  335 	add	a, #0x30
   9DAB 02            [ 7]  336 	ld	(bc), a
                            337 ;src/hud/hud.c:83: cpct_drawStringM0(text,PuntoPasos2);       
   9DAC 21 AC E4      [10]  338 	ld	hl, #0xe4ac
   9DAF E5            [11]  339 	push	hl
   9DB0 C5            [11]  340 	push	bc
   9DB1 CD 79 A7      [17]  341 	call	_cpct_drawStringM0
                            342 ;src/hud/hud.c:84: contadorPasos=pasos;
   9DB4 DD 7E 07      [19]  343 	ld	a, 7 (ix)
   9DB7 32 C8 B1      [13]  344 	ld	(#_contadorPasos + 0),a
   9DBA                     345 00109$:
   9DBA 33            [ 6]  346 	inc	sp
   9DBB DD E1         [14]  347 	pop	ix
   9DBD C9            [10]  348 	ret
                            349 	.area _CODE
                            350 	.area _INITIALIZER
                            351 	.area _CABS (ABS)
