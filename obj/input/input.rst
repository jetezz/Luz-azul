                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module input
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_isKeyPressed
                             12 	.globl _cpct_scanKeyboard_f
                             13 	.globl _scanKey
                             14 	.globl _keyScape
                             15 	.globl _keyFire
                             16 	.globl _movimientoPlayer
                             17 ;--------------------------------------------------------
                             18 ; special function registers
                             19 ;--------------------------------------------------------
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _DATA
                             24 ;--------------------------------------------------------
                             25 ; ram data
                             26 ;--------------------------------------------------------
                             27 	.area _INITIALIZED
                             28 ;--------------------------------------------------------
                             29 ; absolute external ram data
                             30 ;--------------------------------------------------------
                             31 	.area _DABS (ABS)
                             32 ;--------------------------------------------------------
                             33 ; global & static initialisations
                             34 ;--------------------------------------------------------
                             35 	.area _HOME
                             36 	.area _GSINIT
                             37 	.area _GSFINAL
                             38 	.area _GSINIT
                             39 ;--------------------------------------------------------
                             40 ; Home
                             41 ;--------------------------------------------------------
                             42 	.area _HOME
                             43 	.area _HOME
                             44 ;--------------------------------------------------------
                             45 ; code
                             46 ;--------------------------------------------------------
                             47 	.area _CODE
                             48 ;src/input/input.c:4: void scanKey(){
                             49 ;	---------------------------------
                             50 ; Function scanKey
                             51 ; ---------------------------------
   53A8                      52 _scanKey::
                             53 ;src/input/input.c:5: cpct_scanKeyboard_f();
   53A8 C3 19 55      [10]   54 	jp  _cpct_scanKeyboard_f
                             55 ;src/input/input.c:8: u8 keyScape(){
                             56 ;	---------------------------------
                             57 ; Function keyScape
                             58 ; ---------------------------------
   53AB                      59 _keyScape::
                             60 ;src/input/input.c:9: u8 pulsada=0;
   53AB 2E 00         [ 7]   61 	ld	l, #0x00
                             62 ;src/input/input.c:10: if(cpct_isKeyPressed (Key_Esc))
   53AD E5            [11]   63 	push	hl
   53AE 21 08 04      [10]   64 	ld	hl, #0x0408
   53B1 CD 0D 55      [17]   65 	call	_cpct_isKeyPressed
   53B4 7D            [ 4]   66 	ld	a, l
   53B5 E1            [10]   67 	pop	hl
   53B6 B7            [ 4]   68 	or	a, a
   53B7 C8            [11]   69 	ret	Z
                             70 ;src/input/input.c:11: pulsada=1;
   53B8 2E 01         [ 7]   71 	ld	l, #0x01
                             72 ;src/input/input.c:12: return pulsada;    
   53BA C9            [10]   73 	ret
                             74 ;src/input/input.c:14: u8 keyFire(){
                             75 ;	---------------------------------
                             76 ; Function keyFire
                             77 ; ---------------------------------
   53BB                      78 _keyFire::
                             79 ;src/input/input.c:15: u8 pulsada=0;
   53BB 2E 00         [ 7]   80 	ld	l, #0x00
                             81 ;src/input/input.c:16: if(cpct_isKeyPressed (Key_Space))
   53BD E5            [11]   82 	push	hl
   53BE 21 05 80      [10]   83 	ld	hl, #0x8005
   53C1 CD 0D 55      [17]   84 	call	_cpct_isKeyPressed
   53C4 7D            [ 4]   85 	ld	a, l
   53C5 E1            [10]   86 	pop	hl
   53C6 B7            [ 4]   87 	or	a, a
   53C7 C8            [11]   88 	ret	Z
                             89 ;src/input/input.c:17: pulsada=1;
   53C8 2E 01         [ 7]   90 	ld	l, #0x01
                             91 ;src/input/input.c:18: return pulsada; 
   53CA C9            [10]   92 	ret
                             93 ;src/input/input.c:22: u8 movimientoPlayer(){
                             94 ;	---------------------------------
                             95 ; Function movimientoPlayer
                             96 ; ---------------------------------
   53CB                      97 _movimientoPlayer::
                             98 ;src/input/input.c:23: u8 pulsada=0;
                             99 ;src/input/input.c:24: u8 movimiento=mover_SinMovimiento;
   53CB 21 00 00      [10]  100 	ld	hl,#0x0000
                            101 ;src/input/input.c:25: if(cpct_isKeyPressed (Key_CursorUp)){
   53CE E5            [11]  102 	push	hl
   53CF 21 00 01      [10]  103 	ld	hl, #0x0100
   53D2 CD 0D 55      [17]  104 	call	_cpct_isKeyPressed
   53D5 7D            [ 4]  105 	ld	a, l
   53D6 E1            [10]  106 	pop	hl
   53D7 B7            [ 4]  107 	or	a, a
   53D8 28 03         [12]  108 	jr	Z,00102$
                            109 ;src/input/input.c:26: movimiento=mover_Arriba;
                            110 ;src/input/input.c:27: pulsada=1;
   53DA 21 02 01      [10]  111 	ld	hl,#0x0102
   53DD                     112 00102$:
                            113 ;src/input/input.c:29: if(cpct_isKeyPressed (Key_CursorDown)){
   53DD E5            [11]  114 	push	hl
   53DE 21 00 04      [10]  115 	ld	hl, #0x0400
   53E1 CD 0D 55      [17]  116 	call	_cpct_isKeyPressed
   53E4 7D            [ 4]  117 	ld	a, l
   53E5 E1            [10]  118 	pop	hl
   53E6 B7            [ 4]  119 	or	a, a
   53E7 28 0A         [12]  120 	jr	Z,00106$
                            121 ;src/input/input.c:30: movimiento=mover_Abajo;
   53E9 2E 04         [ 7]  122 	ld	l, #0x04
                            123 ;src/input/input.c:31: if(pulsada==1)
   53EB 25            [ 4]  124 	dec	h
   53EC 20 03         [12]  125 	jr	NZ,00104$
                            126 ;src/input/input.c:32: return mover_SinMovimiento;
   53EE 2E 00         [ 7]  127 	ld	l, #0x00
   53F0 C9            [10]  128 	ret
   53F1                     129 00104$:
                            130 ;src/input/input.c:33: pulsada=1;
   53F1 26 01         [ 7]  131 	ld	h, #0x01
   53F3                     132 00106$:
                            133 ;src/input/input.c:35: if(cpct_isKeyPressed (Key_CursorLeft)){
   53F3 E5            [11]  134 	push	hl
   53F4 21 01 01      [10]  135 	ld	hl, #0x0101
   53F7 CD 0D 55      [17]  136 	call	_cpct_isKeyPressed
   53FA 7D            [ 4]  137 	ld	a, l
   53FB E1            [10]  138 	pop	hl
   53FC B7            [ 4]  139 	or	a, a
   53FD 28 0A         [12]  140 	jr	Z,00110$
                            141 ;src/input/input.c:36: movimiento=mover_Izquierda;
   53FF 2E 01         [ 7]  142 	ld	l, #0x01
                            143 ;src/input/input.c:37: if(pulsada==1)
   5401 25            [ 4]  144 	dec	h
   5402 20 03         [12]  145 	jr	NZ,00108$
                            146 ;src/input/input.c:38: return mover_SinMovimiento;
   5404 2E 00         [ 7]  147 	ld	l, #0x00
   5406 C9            [10]  148 	ret
   5407                     149 00108$:
                            150 ;src/input/input.c:39: pulsada=1;
   5407 26 01         [ 7]  151 	ld	h, #0x01
   5409                     152 00110$:
                            153 ;src/input/input.c:41: if(cpct_isKeyPressed (Key_CursorRight)){
   5409 E5            [11]  154 	push	hl
   540A 21 00 02      [10]  155 	ld	hl, #0x0200
   540D CD 0D 55      [17]  156 	call	_cpct_isKeyPressed
   5410 7D            [ 4]  157 	ld	a, l
   5411 E1            [10]  158 	pop	hl
   5412 B7            [ 4]  159 	or	a, a
   5413 C8            [11]  160 	ret	Z
                            161 ;src/input/input.c:42: movimiento=mover_Derecha;
   5414 2E 03         [ 7]  162 	ld	l, #0x03
                            163 ;src/input/input.c:43: if(pulsada==1)
   5416 25            [ 4]  164 	dec	h
   5417 C0            [11]  165 	ret	NZ
                            166 ;src/input/input.c:44: return mover_SinMovimiento;         
   5418 2E 00         [ 7]  167 	ld	l, #0x00
                            168 ;src/input/input.c:46: return movimiento;
   541A C9            [10]  169 	ret
                            170 	.area _CODE
                            171 	.area _INITIALIZER
                            172 	.area _CABS (ABS)
