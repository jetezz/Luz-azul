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
   7C1A                      29 _P_portal:
   7C1A                      30 	.ds 2
   7C1C                      31 _P_puertas:
   7C1C                      32 	.ds 2
   7C1E                      33 _P_col:
   7C1E                      34 	.ds 2
   7C20                      35 _P_luz:
   7C20                      36 	.ds 2
   7C22                      37 _P_fam:
   7C22                      38 	.ds 2
   7C24                      39 _P_ams:
   7C24                      40 	.ds 2
   7C26                      41 _P_colList:
   7C26                      42 	.ds 2
   7C28                      43 _contadorLuz::
   7C28                      44 	.ds 1
   7C29                      45 _contadorFamilia::
   7C29                      46 	.ds 1
   7C2A                      47 _contadorAmstr::
   7C2A                      48 	.ds 1
   7C2B                      49 _contadorPasos::
   7C2B                      50 	.ds 1
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
   7041                      79 _asd::
                             80 ;src/hud/hud.c:32: }
   7041 C9            [10]   81 	ret
                             82 ;src/hud/hud.c:33: void initHud(){
                             83 ;	---------------------------------
                             84 ; Function initHud
                             85 ; ---------------------------------
   7042                      86 _initHud::
   7042 DD E5         [15]   87 	push	ix
   7044 DD 21 00 00   [14]   88 	ld	ix,#0
   7048 DD 39         [15]   89 	add	ix,sp
   704A F5            [11]   90 	push	af
                             91 ;src/hud/hud.c:34: char text[] = "0";
   704B 21 00 00      [10]   92 	ld	hl, #0x0000
   704E 39            [11]   93 	add	hl, sp
   704F 4D            [ 4]   94 	ld	c,l
   7050 44            [ 4]   95 	ld	b,h
   7051 36 30         [10]   96 	ld	(hl),#0x30
   7053 59            [ 4]   97 	ld	e, c
   7054 50            [ 4]   98 	ld	d, b
   7055 13            [ 6]   99 	inc	de
   7056 AF            [ 4]  100 	xor	a, a
   7057 12            [ 7]  101 	ld	(de), a
                            102 ;src/hud/hud.c:36: cpct_setDrawCharM0(3, 0);
   7058 C5            [11]  103 	push	bc
   7059 21 03 00      [10]  104 	ld	hl, #0x0003
   705C E5            [11]  105 	push	hl
   705D CD 87 76      [17]  106 	call	_cpct_setDrawCharM0
   7060 21 11 01      [10]  107 	ld	hl, #0x0111
   7063 E5            [11]  108 	push	hl
   7064 3E 15         [ 7]  109 	ld	a, #0x15
   7066 F5            [11]  110 	push	af
   7067 33            [ 6]  111 	inc	sp
   7068 CD 8D 56      [17]  112 	call	_dibujarGameObjectColSprite
   706B 33            [ 6]  113 	inc	sp
   706C 21 11 03      [10]  114 	ld	hl,#0x0311
   706F E3            [19]  115 	ex	(sp),hl
   7070 3E 17         [ 7]  116 	ld	a, #0x17
   7072 F5            [11]  117 	push	af
   7073 33            [ 6]  118 	inc	sp
   7074 CD 8D 56      [17]  119 	call	_dibujarGameObjectColSprite
   7077 33            [ 6]  120 	inc	sp
   7078 21 11 05      [10]  121 	ld	hl,#0x0511
   707B E3            [19]  122 	ex	(sp),hl
   707C 3E 1B         [ 7]  123 	ld	a, #0x1b
   707E F5            [11]  124 	push	af
   707F 33            [ 6]  125 	inc	sp
   7080 CD 8D 56      [17]  126 	call	_dibujarGameObjectColSprite
   7083 F1            [10]  127 	pop	af
   7084 33            [ 6]  128 	inc	sp
   7085 C1            [10]  129 	pop	bc
                            130 ;src/hud/hud.c:42: cpct_drawStringM0(text,PuntoLuz);
   7086 59            [ 4]  131 	ld	e, c
   7087 50            [ 4]  132 	ld	d, b
   7088 C5            [11]  133 	push	bc
   7089 21 EA E0      [10]  134 	ld	hl, #0xe0ea
   708C E5            [11]  135 	push	hl
   708D D5            [11]  136 	push	de
   708E CD 6B 73      [17]  137 	call	_cpct_drawStringM0
   7091 C1            [10]  138 	pop	bc
                            139 ;src/hud/hud.c:43: cpct_drawStringM0(text,PuntoFamilia);
   7092 59            [ 4]  140 	ld	e, c
   7093 50            [ 4]  141 	ld	d, b
   7094 C5            [11]  142 	push	bc
   7095 21 2A E2      [10]  143 	ld	hl, #0xe22a
   7098 E5            [11]  144 	push	hl
   7099 D5            [11]  145 	push	de
   709A CD 6B 73      [17]  146 	call	_cpct_drawStringM0
   709D C1            [10]  147 	pop	bc
                            148 ;src/hud/hud.c:44: cpct_drawStringM0(text,PuntoCartuchos);
   709E 21 6A E3      [10]  149 	ld	hl, #0xe36a
   70A1 E5            [11]  150 	push	hl
   70A2 C5            [11]  151 	push	bc
   70A3 CD 6B 73      [17]  152 	call	_cpct_drawStringM0
                            153 ;src/hud/hud.c:47: contadorLuz=0;
   70A6 21 28 7C      [10]  154 	ld	hl,#_contadorLuz + 0
   70A9 36 00         [10]  155 	ld	(hl), #0x00
                            156 ;src/hud/hud.c:48: contadorFamilia=0;
   70AB 21 29 7C      [10]  157 	ld	hl,#_contadorFamilia + 0
   70AE 36 00         [10]  158 	ld	(hl), #0x00
                            159 ;src/hud/hud.c:49: contadorAmstr=0;
   70B0 21 2A 7C      [10]  160 	ld	hl,#_contadorAmstr + 0
   70B3 36 00         [10]  161 	ld	(hl), #0x00
                            162 ;src/hud/hud.c:50: contadorPasos=0;
   70B5 21 2B 7C      [10]  163 	ld	hl,#_contadorPasos + 0
   70B8 36 00         [10]  164 	ld	(hl), #0x00
   70BA DD F9         [10]  165 	ld	sp, ix
   70BC DD E1         [14]  166 	pop	ix
   70BE C9            [10]  167 	ret
                            168 ;src/hud/hud.c:53: void actualizarHud(u8 luz, u8 familia,u8 amstr,u8 pasos){
                            169 ;	---------------------------------
                            170 ; Function actualizarHud
                            171 ; ---------------------------------
   70BF                     172 _actualizarHud::
   70BF DD E5         [15]  173 	push	ix
   70C1 DD 21 00 00   [14]  174 	ld	ix,#0
   70C5 DD 39         [15]  175 	add	ix,sp
   70C7 3B            [ 6]  176 	dec	sp
                            177 ;src/hud/hud.c:54: char text[1] = "X";    
   70C8 21 00 00      [10]  178 	ld	hl, #0x0000
   70CB 39            [11]  179 	add	hl, sp
   70CC 4D            [ 4]  180 	ld	c,l
   70CD 44            [ 4]  181 	ld	b,h
   70CE 36 58         [10]  182 	ld	(hl),#0x58
                            183 ;src/hud/hud.c:58: if(luz!=contadorLuz){
   70D0 DD 7E 04      [19]  184 	ld	a, 4 (ix)
   70D3 FD 21 28 7C   [14]  185 	ld	iy, #_contadorLuz
   70D7 FD 96 00      [19]  186 	sub	a, 0 (iy)
   70DA 28 29         [12]  187 	jr	Z,00102$
                            188 ;src/hud/hud.c:59: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 20),0x00,4,16);
   70DC C5            [11]  189 	push	bc
   70DD 21 04 10      [10]  190 	ld	hl, #0x1004
   70E0 E5            [11]  191 	push	hl
   70E1 21 00 00      [10]  192 	ld	hl, #0x0000
   70E4 E5            [11]  193 	push	hl
   70E5 21 EA E0      [10]  194 	ld	hl, #0xe0ea
   70E8 E5            [11]  195 	push	hl
   70E9 CD DC 75      [17]  196 	call	_cpct_drawSolidBox
   70EC C1            [10]  197 	pop	bc
                            198 ;src/hud/hud.c:60: text[0]=luz+'0';
   70ED DD 7E 04      [19]  199 	ld	a, 4 (ix)
   70F0 C6 30         [ 7]  200 	add	a, #0x30
   70F2 02            [ 7]  201 	ld	(bc), a
                            202 ;src/hud/hud.c:61: cpct_drawStringM0(text,PuntoLuz);
   70F3 59            [ 4]  203 	ld	e, c
   70F4 50            [ 4]  204 	ld	d, b
   70F5 C5            [11]  205 	push	bc
   70F6 21 EA E0      [10]  206 	ld	hl, #0xe0ea
   70F9 E5            [11]  207 	push	hl
   70FA D5            [11]  208 	push	de
   70FB CD 6B 73      [17]  209 	call	_cpct_drawStringM0
   70FE C1            [10]  210 	pop	bc
                            211 ;src/hud/hud.c:62: contadorLuz=luz;
   70FF DD 7E 04      [19]  212 	ld	a, 4 (ix)
   7102 32 28 7C      [13]  213 	ld	(#_contadorLuz + 0),a
   7105                     214 00102$:
                            215 ;src/hud/hud.c:64: if(familia!=contadorFamilia){
   7105 DD 7E 05      [19]  216 	ld	a, 5 (ix)
   7108 FD 21 29 7C   [14]  217 	ld	iy, #_contadorFamilia
   710C FD 96 00      [19]  218 	sub	a, 0 (iy)
   710F 28 29         [12]  219 	jr	Z,00104$
                            220 ;src/hud/hud.c:65: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 52),0x00,4,16);
   7111 C5            [11]  221 	push	bc
   7112 21 04 10      [10]  222 	ld	hl, #0x1004
   7115 E5            [11]  223 	push	hl
   7116 21 00 00      [10]  224 	ld	hl, #0x0000
   7119 E5            [11]  225 	push	hl
   711A 21 2A E2      [10]  226 	ld	hl, #0xe22a
   711D E5            [11]  227 	push	hl
   711E CD DC 75      [17]  228 	call	_cpct_drawSolidBox
   7121 C1            [10]  229 	pop	bc
                            230 ;src/hud/hud.c:66: text[0]=familia+'0';
   7122 DD 7E 05      [19]  231 	ld	a, 5 (ix)
   7125 C6 30         [ 7]  232 	add	a, #0x30
   7127 02            [ 7]  233 	ld	(bc), a
                            234 ;src/hud/hud.c:67: cpct_drawStringM0(text,PuntoFamilia);
   7128 59            [ 4]  235 	ld	e, c
   7129 50            [ 4]  236 	ld	d, b
   712A C5            [11]  237 	push	bc
   712B 21 2A E2      [10]  238 	ld	hl, #0xe22a
   712E E5            [11]  239 	push	hl
   712F D5            [11]  240 	push	de
   7130 CD 6B 73      [17]  241 	call	_cpct_drawStringM0
   7133 C1            [10]  242 	pop	bc
                            243 ;src/hud/hud.c:68: contadorFamilia=familia;
   7134 DD 7E 05      [19]  244 	ld	a, 5 (ix)
   7137 32 29 7C      [13]  245 	ld	(#_contadorFamilia + 0),a
   713A                     246 00104$:
                            247 ;src/hud/hud.c:70: if(amstr!=contadorAmstr){
   713A DD 7E 06      [19]  248 	ld	a, 6 (ix)
   713D FD 21 2A 7C   [14]  249 	ld	iy, #_contadorAmstr
   7141 FD 96 00      [19]  250 	sub	a, 0 (iy)
   7144 28 29         [12]  251 	jr	Z,00106$
                            252 ;src/hud/hud.c:71: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 84),0x00,4,16);
   7146 C5            [11]  253 	push	bc
   7147 21 04 10      [10]  254 	ld	hl, #0x1004
   714A E5            [11]  255 	push	hl
   714B 21 00 00      [10]  256 	ld	hl, #0x0000
   714E E5            [11]  257 	push	hl
   714F 21 6A E3      [10]  258 	ld	hl, #0xe36a
   7152 E5            [11]  259 	push	hl
   7153 CD DC 75      [17]  260 	call	_cpct_drawSolidBox
   7156 C1            [10]  261 	pop	bc
                            262 ;src/hud/hud.c:72: text[0]=amstr+'0';
   7157 DD 7E 06      [19]  263 	ld	a, 6 (ix)
   715A C6 30         [ 7]  264 	add	a, #0x30
   715C 02            [ 7]  265 	ld	(bc), a
                            266 ;src/hud/hud.c:73: cpct_drawStringM0(text,PuntoCartuchos);
   715D 59            [ 4]  267 	ld	e, c
   715E 50            [ 4]  268 	ld	d, b
   715F C5            [11]  269 	push	bc
   7160 21 6A E3      [10]  270 	ld	hl, #0xe36a
   7163 E5            [11]  271 	push	hl
   7164 D5            [11]  272 	push	de
   7165 CD 6B 73      [17]  273 	call	_cpct_drawStringM0
   7168 C1            [10]  274 	pop	bc
                            275 ;src/hud/hud.c:74: contadorAmstr=amstr;
   7169 DD 7E 06      [19]  276 	ld	a, 6 (ix)
   716C 32 2A 7C      [13]  277 	ld	(#_contadorAmstr + 0),a
   716F                     278 00106$:
                            279 ;src/hud/hud.c:76: if(pasos!=contadorPasos){
   716F DD 7E 07      [19]  280 	ld	a, 7 (ix)
   7172 FD 21 2B 7C   [14]  281 	ld	iy, #_contadorPasos
   7176 FD 96 00      [19]  282 	sub	a, 0 (iy)
   7179 28 5A         [12]  283 	jr	Z,00109$
                            284 ;src/hud/hud.c:77: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 72, 116),0x00,4,16);
   717B C5            [11]  285 	push	bc
   717C 21 04 10      [10]  286 	ld	hl, #0x1004
   717F E5            [11]  287 	push	hl
   7180 21 00 00      [10]  288 	ld	hl, #0x0000
   7183 E5            [11]  289 	push	hl
   7184 21 A8 E4      [10]  290 	ld	hl, #0xe4a8
   7187 E5            [11]  291 	push	hl
   7188 CD DC 75      [17]  292 	call	_cpct_drawSolidBox
   718B 3E 0A         [ 7]  293 	ld	a, #0x0a
   718D F5            [11]  294 	push	af
   718E 33            [ 6]  295 	inc	sp
   718F DD 7E 07      [19]  296 	ld	a, 7 (ix)
   7192 F5            [11]  297 	push	af
   7193 33            [ 6]  298 	inc	sp
   7194 CD 72 75      [17]  299 	call	__divuchar
   7197 F1            [10]  300 	pop	af
   7198 C1            [10]  301 	pop	bc
   7199 26 00         [ 7]  302 	ld	h, #0x00
                            303 ;src/hud/hud.c:79: unidades=pasos%10;       
   719B E5            [11]  304 	push	hl
   719C C5            [11]  305 	push	bc
   719D 3E 0A         [ 7]  306 	ld	a, #0x0a
   719F F5            [11]  307 	push	af
   71A0 33            [ 6]  308 	inc	sp
   71A1 DD 7E 07      [19]  309 	ld	a, 7 (ix)
   71A4 F5            [11]  310 	push	af
   71A5 33            [ 6]  311 	inc	sp
   71A6 CD AE 74      [17]  312 	call	__moduchar
   71A9 F1            [10]  313 	pop	af
   71AA 5D            [ 4]  314 	ld	e, l
   71AB C1            [10]  315 	pop	bc
   71AC E1            [10]  316 	pop	hl
   71AD 16 00         [ 7]  317 	ld	d, #0x00
                            318 ;src/hud/hud.c:80: text[0]=decimas+'0';
   71AF 7D            [ 4]  319 	ld	a, l
   71B0 C6 30         [ 7]  320 	add	a, #0x30
   71B2 02            [ 7]  321 	ld	(bc), a
                            322 ;src/hud/hud.c:81: cpct_drawStringM0(text,PuntoPasos);
   71B3 C5            [11]  323 	push	bc
   71B4 FD E1         [14]  324 	pop	iy
   71B6 C5            [11]  325 	push	bc
   71B7 D5            [11]  326 	push	de
   71B8 21 A8 E4      [10]  327 	ld	hl, #0xe4a8
   71BB E5            [11]  328 	push	hl
   71BC FD E5         [15]  329 	push	iy
   71BE CD 6B 73      [17]  330 	call	_cpct_drawStringM0
   71C1 D1            [10]  331 	pop	de
   71C2 C1            [10]  332 	pop	bc
                            333 ;src/hud/hud.c:82: text[0]=unidades +'0';
   71C3 7B            [ 4]  334 	ld	a, e
   71C4 C6 30         [ 7]  335 	add	a, #0x30
   71C6 02            [ 7]  336 	ld	(bc), a
                            337 ;src/hud/hud.c:83: cpct_drawStringM0(text,PuntoPasos2);       
   71C7 21 AC E4      [10]  338 	ld	hl, #0xe4ac
   71CA E5            [11]  339 	push	hl
   71CB C5            [11]  340 	push	bc
   71CC CD 6B 73      [17]  341 	call	_cpct_drawStringM0
                            342 ;src/hud/hud.c:84: contadorPasos=pasos;
   71CF DD 7E 07      [19]  343 	ld	a, 7 (ix)
   71D2 32 2B 7C      [13]  344 	ld	(#_contadorPasos + 0),a
   71D5                     345 00109$:
   71D5 33            [ 6]  346 	inc	sp
   71D6 DD E1         [14]  347 	pop	ix
   71D8 C9            [10]  348 	ret
                            349 	.area _CODE
                            350 	.area _INITIALIZER
                            351 	.area _CABS (ABS)
