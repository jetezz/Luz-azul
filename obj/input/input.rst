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
   5D53                      52 _scanKey::
                             53 ;src/input/input.c:5: cpct_scanKeyboard_f();
   5D53 C3 D7 5E      [10]   54 	jp  _cpct_scanKeyboard_f
                             55 ;src/input/input.c:8: u8 keyScape(){
                             56 ;	---------------------------------
                             57 ; Function keyScape
                             58 ; ---------------------------------
   5D56                      59 _keyScape::
                             60 ;src/input/input.c:9: u8 pulsada=0;
   5D56 2E 00         [ 7]   61 	ld	l, #0x00
                             62 ;src/input/input.c:10: if(cpct_isKeyPressed (Key_Esc))
   5D58 E5            [11]   63 	push	hl
   5D59 21 08 04      [10]   64 	ld	hl, #0x0408
   5D5C CD CB 5E      [17]   65 	call	_cpct_isKeyPressed
   5D5F 7D            [ 4]   66 	ld	a, l
   5D60 E1            [10]   67 	pop	hl
   5D61 B7            [ 4]   68 	or	a, a
   5D62 C8            [11]   69 	ret	Z
                             70 ;src/input/input.c:11: pulsada=1;
   5D63 2E 01         [ 7]   71 	ld	l, #0x01
                             72 ;src/input/input.c:12: return pulsada;    
   5D65 C9            [10]   73 	ret
                             74 ;src/input/input.c:14: u8 keyFire(){
                             75 ;	---------------------------------
                             76 ; Function keyFire
                             77 ; ---------------------------------
   5D66                      78 _keyFire::
                             79 ;src/input/input.c:15: u8 pulsada=0;
   5D66 2E 00         [ 7]   80 	ld	l, #0x00
                             81 ;src/input/input.c:16: if(cpct_isKeyPressed (Key_Space))
   5D68 E5            [11]   82 	push	hl
   5D69 21 05 80      [10]   83 	ld	hl, #0x8005
   5D6C CD CB 5E      [17]   84 	call	_cpct_isKeyPressed
   5D6F 7D            [ 4]   85 	ld	a, l
   5D70 E1            [10]   86 	pop	hl
   5D71 B7            [ 4]   87 	or	a, a
   5D72 C8            [11]   88 	ret	Z
                             89 ;src/input/input.c:17: pulsada=1;
   5D73 2E 01         [ 7]   90 	ld	l, #0x01
                             91 ;src/input/input.c:18: return pulsada; 
   5D75 C9            [10]   92 	ret
                             93 ;src/input/input.c:22: u8 movimientoPlayer(){
                             94 ;	---------------------------------
                             95 ; Function movimientoPlayer
                             96 ; ---------------------------------
   5D76                      97 _movimientoPlayer::
                             98 ;src/input/input.c:23: u8 pulsada=0;
                             99 ;src/input/input.c:24: u8 movimiento=mover_SinMovimiento;
   5D76 21 00 00      [10]  100 	ld	hl,#0x0000
                            101 ;src/input/input.c:25: if(cpct_isKeyPressed (Key_CursorUp)){
   5D79 E5            [11]  102 	push	hl
   5D7A 21 00 01      [10]  103 	ld	hl, #0x0100
   5D7D CD CB 5E      [17]  104 	call	_cpct_isKeyPressed
   5D80 7D            [ 4]  105 	ld	a, l
   5D81 E1            [10]  106 	pop	hl
   5D82 B7            [ 4]  107 	or	a, a
   5D83 28 03         [12]  108 	jr	Z,00102$
                            109 ;src/input/input.c:26: movimiento=mover_Arriba;
                            110 ;src/input/input.c:27: pulsada=1;
   5D85 21 02 01      [10]  111 	ld	hl,#0x0102
   5D88                     112 00102$:
                            113 ;src/input/input.c:29: if(cpct_isKeyPressed (Key_CursorDown)){
   5D88 E5            [11]  114 	push	hl
   5D89 21 00 04      [10]  115 	ld	hl, #0x0400
   5D8C CD CB 5E      [17]  116 	call	_cpct_isKeyPressed
   5D8F 7D            [ 4]  117 	ld	a, l
   5D90 E1            [10]  118 	pop	hl
   5D91 B7            [ 4]  119 	or	a, a
   5D92 28 0A         [12]  120 	jr	Z,00106$
                            121 ;src/input/input.c:30: movimiento=mover_Abajo;
   5D94 2E 04         [ 7]  122 	ld	l, #0x04
                            123 ;src/input/input.c:31: if(pulsada==1)
   5D96 25            [ 4]  124 	dec	h
   5D97 20 03         [12]  125 	jr	NZ,00104$
                            126 ;src/input/input.c:32: return mover_SinMovimiento;
   5D99 2E 00         [ 7]  127 	ld	l, #0x00
   5D9B C9            [10]  128 	ret
   5D9C                     129 00104$:
                            130 ;src/input/input.c:33: pulsada=1;
   5D9C 26 01         [ 7]  131 	ld	h, #0x01
   5D9E                     132 00106$:
                            133 ;src/input/input.c:35: if(cpct_isKeyPressed (Key_CursorLeft)){
   5D9E E5            [11]  134 	push	hl
   5D9F 21 01 01      [10]  135 	ld	hl, #0x0101
   5DA2 CD CB 5E      [17]  136 	call	_cpct_isKeyPressed
   5DA5 7D            [ 4]  137 	ld	a, l
   5DA6 E1            [10]  138 	pop	hl
   5DA7 B7            [ 4]  139 	or	a, a
   5DA8 28 0A         [12]  140 	jr	Z,00110$
                            141 ;src/input/input.c:36: movimiento=mover_Izquierda;
   5DAA 2E 01         [ 7]  142 	ld	l, #0x01
                            143 ;src/input/input.c:37: if(pulsada==1)
   5DAC 25            [ 4]  144 	dec	h
   5DAD 20 03         [12]  145 	jr	NZ,00108$
                            146 ;src/input/input.c:38: return mover_SinMovimiento;
   5DAF 2E 00         [ 7]  147 	ld	l, #0x00
   5DB1 C9            [10]  148 	ret
   5DB2                     149 00108$:
                            150 ;src/input/input.c:39: pulsada=1;
   5DB2 26 01         [ 7]  151 	ld	h, #0x01
   5DB4                     152 00110$:
                            153 ;src/input/input.c:41: if(cpct_isKeyPressed (Key_CursorRight)){
   5DB4 E5            [11]  154 	push	hl
   5DB5 21 00 02      [10]  155 	ld	hl, #0x0200
   5DB8 CD CB 5E      [17]  156 	call	_cpct_isKeyPressed
   5DBB 7D            [ 4]  157 	ld	a, l
   5DBC E1            [10]  158 	pop	hl
   5DBD B7            [ 4]  159 	or	a, a
   5DBE C8            [11]  160 	ret	Z
                            161 ;src/input/input.c:42: movimiento=mover_Derecha;
   5DBF 2E 03         [ 7]  162 	ld	l, #0x03
                            163 ;src/input/input.c:43: if(pulsada==1)
   5DC1 25            [ 4]  164 	dec	h
   5DC2 C0            [11]  165 	ret	NZ
                            166 ;src/input/input.c:44: return mover_SinMovimiento;         
   5DC3 2E 00         [ 7]  167 	ld	l, #0x00
                            168 ;src/input/input.c:46: return movimiento;
   5DC5 C9            [10]  169 	ret
                            170 	.area _CODE
                            171 	.area _INITIALIZER
                            172 	.area _CABS (ABS)
