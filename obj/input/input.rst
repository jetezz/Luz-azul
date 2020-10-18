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
                             16 	.globl _keyR
                             17 	.globl _movimientoPlayer
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
                             29 ;--------------------------------------------------------
                             30 ; absolute external ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DABS (ABS)
                             33 ;--------------------------------------------------------
                             34 ; global & static initialisations
                             35 ;--------------------------------------------------------
                             36 	.area _HOME
                             37 	.area _GSINIT
                             38 	.area _GSFINAL
                             39 	.area _GSINIT
                             40 ;--------------------------------------------------------
                             41 ; Home
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _HOME
                             45 ;--------------------------------------------------------
                             46 ; code
                             47 ;--------------------------------------------------------
                             48 	.area _CODE
                             49 ;src/input/input.c:4: void scanKey(){
                             50 ;	---------------------------------
                             51 ; Function scanKey
                             52 ; ---------------------------------
   9AB0                      53 _scanKey::
                             54 ;src/input/input.c:5: cpct_scanKeyboard_f();
   9AB0 C3 CF 9E      [10]   55 	jp  _cpct_scanKeyboard_f
                             56 ;src/input/input.c:8: u8 keyScape(){
                             57 ;	---------------------------------
                             58 ; Function keyScape
                             59 ; ---------------------------------
   9AB3                      60 _keyScape::
                             61 ;src/input/input.c:9: u8 pulsada=0;
   9AB3 2E 00         [ 7]   62 	ld	l, #0x00
                             63 ;src/input/input.c:10: if(cpct_isKeyPressed (Key_Esc))
   9AB5 E5            [11]   64 	push	hl
   9AB6 21 08 04      [10]   65 	ld	hl, #0x0408
   9AB9 CD C3 9E      [17]   66 	call	_cpct_isKeyPressed
   9ABC 7D            [ 4]   67 	ld	a, l
   9ABD E1            [10]   68 	pop	hl
   9ABE B7            [ 4]   69 	or	a, a
   9ABF C8            [11]   70 	ret	Z
                             71 ;src/input/input.c:11: pulsada=1;
   9AC0 2E 01         [ 7]   72 	ld	l, #0x01
                             73 ;src/input/input.c:12: return pulsada;    
   9AC2 C9            [10]   74 	ret
                             75 ;src/input/input.c:14: u8 keyFire(){
                             76 ;	---------------------------------
                             77 ; Function keyFire
                             78 ; ---------------------------------
   9AC3                      79 _keyFire::
                             80 ;src/input/input.c:15: u8 pulsada=0;
   9AC3 2E 00         [ 7]   81 	ld	l, #0x00
                             82 ;src/input/input.c:16: if(cpct_isKeyPressed (Key_Space))
   9AC5 E5            [11]   83 	push	hl
   9AC6 21 05 80      [10]   84 	ld	hl, #0x8005
   9AC9 CD C3 9E      [17]   85 	call	_cpct_isKeyPressed
   9ACC 7D            [ 4]   86 	ld	a, l
   9ACD E1            [10]   87 	pop	hl
   9ACE B7            [ 4]   88 	or	a, a
   9ACF C8            [11]   89 	ret	Z
                             90 ;src/input/input.c:17: pulsada=1;
   9AD0 2E 01         [ 7]   91 	ld	l, #0x01
                             92 ;src/input/input.c:18: return pulsada; 
   9AD2 C9            [10]   93 	ret
                             94 ;src/input/input.c:20: u8 keyR(){
                             95 ;	---------------------------------
                             96 ; Function keyR
                             97 ; ---------------------------------
   9AD3                      98 _keyR::
                             99 ;src/input/input.c:21: u8 pulsada=no;
   9AD3 2E 01         [ 7]  100 	ld	l, #0x01
                            101 ;src/input/input.c:22: if(cpct_isKeyPressed (Key_R))
   9AD5 E5            [11]  102 	push	hl
   9AD6 21 06 04      [10]  103 	ld	hl, #0x0406
   9AD9 CD C3 9E      [17]  104 	call	_cpct_isKeyPressed
   9ADC 7D            [ 4]  105 	ld	a, l
   9ADD E1            [10]  106 	pop	hl
   9ADE B7            [ 4]  107 	or	a, a
   9ADF C8            [11]  108 	ret	Z
                            109 ;src/input/input.c:23: pulsada=si;
   9AE0 2E 00         [ 7]  110 	ld	l, #0x00
                            111 ;src/input/input.c:24: return pulsada; 
   9AE2 C9            [10]  112 	ret
                            113 ;src/input/input.c:28: u8 movimientoPlayer(){
                            114 ;	---------------------------------
                            115 ; Function movimientoPlayer
                            116 ; ---------------------------------
   9AE3                     117 _movimientoPlayer::
                            118 ;src/input/input.c:29: u8 pulsada=0;
                            119 ;src/input/input.c:30: u8 movimiento=mover_SinMovimiento;
   9AE3 21 00 00      [10]  120 	ld	hl,#0x0000
                            121 ;src/input/input.c:31: if(cpct_isKeyPressed (Key_CursorUp)){
   9AE6 E5            [11]  122 	push	hl
   9AE7 21 00 01      [10]  123 	ld	hl, #0x0100
   9AEA CD C3 9E      [17]  124 	call	_cpct_isKeyPressed
   9AED 7D            [ 4]  125 	ld	a, l
   9AEE E1            [10]  126 	pop	hl
   9AEF B7            [ 4]  127 	or	a, a
   9AF0 28 03         [12]  128 	jr	Z,00102$
                            129 ;src/input/input.c:32: movimiento=mover_Arriba;
                            130 ;src/input/input.c:33: pulsada=1;
   9AF2 21 02 01      [10]  131 	ld	hl,#0x0102
   9AF5                     132 00102$:
                            133 ;src/input/input.c:35: if(cpct_isKeyPressed (Key_CursorDown)){
   9AF5 E5            [11]  134 	push	hl
   9AF6 21 00 04      [10]  135 	ld	hl, #0x0400
   9AF9 CD C3 9E      [17]  136 	call	_cpct_isKeyPressed
   9AFC 7D            [ 4]  137 	ld	a, l
   9AFD E1            [10]  138 	pop	hl
   9AFE B7            [ 4]  139 	or	a, a
   9AFF 28 0A         [12]  140 	jr	Z,00106$
                            141 ;src/input/input.c:36: movimiento=mover_Abajo;
   9B01 2E 04         [ 7]  142 	ld	l, #0x04
                            143 ;src/input/input.c:37: if(pulsada==1)
   9B03 25            [ 4]  144 	dec	h
   9B04 20 03         [12]  145 	jr	NZ,00104$
                            146 ;src/input/input.c:38: return mover_SinMovimiento;
   9B06 2E 00         [ 7]  147 	ld	l, #0x00
   9B08 C9            [10]  148 	ret
   9B09                     149 00104$:
                            150 ;src/input/input.c:39: pulsada=1;
   9B09 26 01         [ 7]  151 	ld	h, #0x01
   9B0B                     152 00106$:
                            153 ;src/input/input.c:41: if(cpct_isKeyPressed (Key_CursorLeft)){
   9B0B E5            [11]  154 	push	hl
   9B0C 21 01 01      [10]  155 	ld	hl, #0x0101
   9B0F CD C3 9E      [17]  156 	call	_cpct_isKeyPressed
   9B12 7D            [ 4]  157 	ld	a, l
   9B13 E1            [10]  158 	pop	hl
   9B14 B7            [ 4]  159 	or	a, a
   9B15 28 0A         [12]  160 	jr	Z,00110$
                            161 ;src/input/input.c:42: movimiento=mover_Izquierda;
   9B17 2E 01         [ 7]  162 	ld	l, #0x01
                            163 ;src/input/input.c:43: if(pulsada==1)
   9B19 25            [ 4]  164 	dec	h
   9B1A 20 03         [12]  165 	jr	NZ,00108$
                            166 ;src/input/input.c:44: return mover_SinMovimiento;
   9B1C 2E 00         [ 7]  167 	ld	l, #0x00
   9B1E C9            [10]  168 	ret
   9B1F                     169 00108$:
                            170 ;src/input/input.c:45: pulsada=1;
   9B1F 26 01         [ 7]  171 	ld	h, #0x01
   9B21                     172 00110$:
                            173 ;src/input/input.c:47: if(cpct_isKeyPressed (Key_CursorRight)){
   9B21 E5            [11]  174 	push	hl
   9B22 21 00 02      [10]  175 	ld	hl, #0x0200
   9B25 CD C3 9E      [17]  176 	call	_cpct_isKeyPressed
   9B28 7D            [ 4]  177 	ld	a, l
   9B29 E1            [10]  178 	pop	hl
   9B2A B7            [ 4]  179 	or	a, a
   9B2B C8            [11]  180 	ret	Z
                            181 ;src/input/input.c:48: movimiento=mover_Derecha;
   9B2C 2E 03         [ 7]  182 	ld	l, #0x03
                            183 ;src/input/input.c:49: if(pulsada==1)
   9B2E 25            [ 4]  184 	dec	h
   9B2F C0            [11]  185 	ret	NZ
                            186 ;src/input/input.c:50: return mover_SinMovimiento;         
   9B30 2E 00         [ 7]  187 	ld	l, #0x00
                            188 ;src/input/input.c:52: return movimiento;
   9B32 C9            [10]  189 	ret
                            190 	.area _CODE
                            191 	.area _INITIALIZER
                            192 	.area _CABS (ABS)
