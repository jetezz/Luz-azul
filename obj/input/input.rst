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
   6ECB                      53 _scanKey::
                             54 ;src/input/input.c:5: cpct_scanKeyboard_f();
   6ECB C3 EA 72      [10]   55 	jp  _cpct_scanKeyboard_f
                             56 ;src/input/input.c:8: u8 keyScape(){
                             57 ;	---------------------------------
                             58 ; Function keyScape
                             59 ; ---------------------------------
   6ECE                      60 _keyScape::
                             61 ;src/input/input.c:9: u8 pulsada=0;
   6ECE 2E 00         [ 7]   62 	ld	l, #0x00
                             63 ;src/input/input.c:10: if(cpct_isKeyPressed (Key_Esc))
   6ED0 E5            [11]   64 	push	hl
   6ED1 21 08 04      [10]   65 	ld	hl, #0x0408
   6ED4 CD DE 72      [17]   66 	call	_cpct_isKeyPressed
   6ED7 7D            [ 4]   67 	ld	a, l
   6ED8 E1            [10]   68 	pop	hl
   6ED9 B7            [ 4]   69 	or	a, a
   6EDA C8            [11]   70 	ret	Z
                             71 ;src/input/input.c:11: pulsada=1;
   6EDB 2E 01         [ 7]   72 	ld	l, #0x01
                             73 ;src/input/input.c:12: return pulsada;    
   6EDD C9            [10]   74 	ret
                             75 ;src/input/input.c:14: u8 keyFire(){
                             76 ;	---------------------------------
                             77 ; Function keyFire
                             78 ; ---------------------------------
   6EDE                      79 _keyFire::
                             80 ;src/input/input.c:15: u8 pulsada=0;
   6EDE 2E 00         [ 7]   81 	ld	l, #0x00
                             82 ;src/input/input.c:16: if(cpct_isKeyPressed (Key_Space))
   6EE0 E5            [11]   83 	push	hl
   6EE1 21 05 80      [10]   84 	ld	hl, #0x8005
   6EE4 CD DE 72      [17]   85 	call	_cpct_isKeyPressed
   6EE7 7D            [ 4]   86 	ld	a, l
   6EE8 E1            [10]   87 	pop	hl
   6EE9 B7            [ 4]   88 	or	a, a
   6EEA C8            [11]   89 	ret	Z
                             90 ;src/input/input.c:17: pulsada=1;
   6EEB 2E 01         [ 7]   91 	ld	l, #0x01
                             92 ;src/input/input.c:18: return pulsada; 
   6EED C9            [10]   93 	ret
                             94 ;src/input/input.c:20: u8 keyR(){
                             95 ;	---------------------------------
                             96 ; Function keyR
                             97 ; ---------------------------------
   6EEE                      98 _keyR::
                             99 ;src/input/input.c:21: u8 pulsada=no;
   6EEE 2E 01         [ 7]  100 	ld	l, #0x01
                            101 ;src/input/input.c:22: if(cpct_isKeyPressed (Key_R))
   6EF0 E5            [11]  102 	push	hl
   6EF1 21 06 04      [10]  103 	ld	hl, #0x0406
   6EF4 CD DE 72      [17]  104 	call	_cpct_isKeyPressed
   6EF7 7D            [ 4]  105 	ld	a, l
   6EF8 E1            [10]  106 	pop	hl
   6EF9 B7            [ 4]  107 	or	a, a
   6EFA C8            [11]  108 	ret	Z
                            109 ;src/input/input.c:23: pulsada=si;
   6EFB 2E 00         [ 7]  110 	ld	l, #0x00
                            111 ;src/input/input.c:24: return pulsada; 
   6EFD C9            [10]  112 	ret
                            113 ;src/input/input.c:28: u8 movimientoPlayer(){
                            114 ;	---------------------------------
                            115 ; Function movimientoPlayer
                            116 ; ---------------------------------
   6EFE                     117 _movimientoPlayer::
                            118 ;src/input/input.c:29: u8 pulsada=0;
                            119 ;src/input/input.c:30: u8 movimiento=mover_SinMovimiento;
   6EFE 21 00 00      [10]  120 	ld	hl,#0x0000
                            121 ;src/input/input.c:31: if(cpct_isKeyPressed (Key_CursorUp)){
   6F01 E5            [11]  122 	push	hl
   6F02 21 00 01      [10]  123 	ld	hl, #0x0100
   6F05 CD DE 72      [17]  124 	call	_cpct_isKeyPressed
   6F08 7D            [ 4]  125 	ld	a, l
   6F09 E1            [10]  126 	pop	hl
   6F0A B7            [ 4]  127 	or	a, a
   6F0B 28 03         [12]  128 	jr	Z,00102$
                            129 ;src/input/input.c:32: movimiento=mover_Arriba;
                            130 ;src/input/input.c:33: pulsada=1;
   6F0D 21 02 01      [10]  131 	ld	hl,#0x0102
   6F10                     132 00102$:
                            133 ;src/input/input.c:35: if(cpct_isKeyPressed (Key_CursorDown)){
   6F10 E5            [11]  134 	push	hl
   6F11 21 00 04      [10]  135 	ld	hl, #0x0400
   6F14 CD DE 72      [17]  136 	call	_cpct_isKeyPressed
   6F17 7D            [ 4]  137 	ld	a, l
   6F18 E1            [10]  138 	pop	hl
   6F19 B7            [ 4]  139 	or	a, a
   6F1A 28 0A         [12]  140 	jr	Z,00106$
                            141 ;src/input/input.c:36: movimiento=mover_Abajo;
   6F1C 2E 04         [ 7]  142 	ld	l, #0x04
                            143 ;src/input/input.c:37: if(pulsada==1)
   6F1E 25            [ 4]  144 	dec	h
   6F1F 20 03         [12]  145 	jr	NZ,00104$
                            146 ;src/input/input.c:38: return mover_SinMovimiento;
   6F21 2E 00         [ 7]  147 	ld	l, #0x00
   6F23 C9            [10]  148 	ret
   6F24                     149 00104$:
                            150 ;src/input/input.c:39: pulsada=1;
   6F24 26 01         [ 7]  151 	ld	h, #0x01
   6F26                     152 00106$:
                            153 ;src/input/input.c:41: if(cpct_isKeyPressed (Key_CursorLeft)){
   6F26 E5            [11]  154 	push	hl
   6F27 21 01 01      [10]  155 	ld	hl, #0x0101
   6F2A CD DE 72      [17]  156 	call	_cpct_isKeyPressed
   6F2D 7D            [ 4]  157 	ld	a, l
   6F2E E1            [10]  158 	pop	hl
   6F2F B7            [ 4]  159 	or	a, a
   6F30 28 0A         [12]  160 	jr	Z,00110$
                            161 ;src/input/input.c:42: movimiento=mover_Izquierda;
   6F32 2E 01         [ 7]  162 	ld	l, #0x01
                            163 ;src/input/input.c:43: if(pulsada==1)
   6F34 25            [ 4]  164 	dec	h
   6F35 20 03         [12]  165 	jr	NZ,00108$
                            166 ;src/input/input.c:44: return mover_SinMovimiento;
   6F37 2E 00         [ 7]  167 	ld	l, #0x00
   6F39 C9            [10]  168 	ret
   6F3A                     169 00108$:
                            170 ;src/input/input.c:45: pulsada=1;
   6F3A 26 01         [ 7]  171 	ld	h, #0x01
   6F3C                     172 00110$:
                            173 ;src/input/input.c:47: if(cpct_isKeyPressed (Key_CursorRight)){
   6F3C E5            [11]  174 	push	hl
   6F3D 21 00 02      [10]  175 	ld	hl, #0x0200
   6F40 CD DE 72      [17]  176 	call	_cpct_isKeyPressed
   6F43 7D            [ 4]  177 	ld	a, l
   6F44 E1            [10]  178 	pop	hl
   6F45 B7            [ 4]  179 	or	a, a
   6F46 C8            [11]  180 	ret	Z
                            181 ;src/input/input.c:48: movimiento=mover_Derecha;
   6F47 2E 03         [ 7]  182 	ld	l, #0x03
                            183 ;src/input/input.c:49: if(pulsada==1)
   6F49 25            [ 4]  184 	dec	h
   6F4A C0            [11]  185 	ret	NZ
                            186 ;src/input/input.c:50: return mover_SinMovimiento;         
   6F4B 2E 00         [ 7]  187 	ld	l, #0x00
                            188 ;src/input/input.c:52: return movimiento;
   6F4D C9            [10]  189 	ret
                            190 	.area _CODE
                            191 	.area _INITIALIZER
                            192 	.area _CABS (ABS)
