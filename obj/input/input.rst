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
                             15 	.globl _keyUp
                             16 	.globl _keyDown
                             17 	.globl _keyLeft
                             18 	.globl _keyRight
                             19 	.globl _keyFire
                             20 ;--------------------------------------------------------
                             21 ; special function registers
                             22 ;--------------------------------------------------------
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DATA
                             27 ;--------------------------------------------------------
                             28 ; ram data
                             29 ;--------------------------------------------------------
                             30 	.area _INITIALIZED
                             31 ;--------------------------------------------------------
                             32 ; absolute external ram data
                             33 ;--------------------------------------------------------
                             34 	.area _DABS (ABS)
                             35 ;--------------------------------------------------------
                             36 ; global & static initialisations
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _GSINIT
                             40 	.area _GSFINAL
                             41 	.area _GSINIT
                             42 ;--------------------------------------------------------
                             43 ; Home
                             44 ;--------------------------------------------------------
                             45 	.area _HOME
                             46 	.area _HOME
                             47 ;--------------------------------------------------------
                             48 ; code
                             49 ;--------------------------------------------------------
                             50 	.area _CODE
                             51 ;src/input/input.c:3: void scanKey(){
                             52 ;	---------------------------------
                             53 ; Function scanKey
                             54 ; ---------------------------------
   4E21                      55 _scanKey::
                             56 ;src/input/input.c:4: cpct_scanKeyboard_f();
   4E21 C3 90 4E      [10]   57 	jp  _cpct_scanKeyboard_f
                             58 ;src/input/input.c:7: u8 keyScape(){
                             59 ;	---------------------------------
                             60 ; Function keyScape
                             61 ; ---------------------------------
   4E24                      62 _keyScape::
                             63 ;src/input/input.c:8: u8 pulsada=0;
   4E24 2E 00         [ 7]   64 	ld	l, #0x00
                             65 ;src/input/input.c:9: if(cpct_isKeyPressed (Key_Esc))
   4E26 E5            [11]   66 	push	hl
   4E27 21 08 04      [10]   67 	ld	hl, #0x0408
   4E2A CD 84 4E      [17]   68 	call	_cpct_isKeyPressed
   4E2D 7D            [ 4]   69 	ld	a, l
   4E2E E1            [10]   70 	pop	hl
   4E2F B7            [ 4]   71 	or	a, a
   4E30 C8            [11]   72 	ret	Z
                             73 ;src/input/input.c:10: pulsada=1;
   4E31 2E 01         [ 7]   74 	ld	l, #0x01
                             75 ;src/input/input.c:11: return pulsada;    
   4E33 C9            [10]   76 	ret
                             77 ;src/input/input.c:13: u8 keyUp(){
                             78 ;	---------------------------------
                             79 ; Function keyUp
                             80 ; ---------------------------------
   4E34                      81 _keyUp::
                             82 ;src/input/input.c:14: u8 pulsada=0;
   4E34 2E 00         [ 7]   83 	ld	l, #0x00
                             84 ;src/input/input.c:15: if(cpct_isKeyPressed (Key_CursorUp))
   4E36 E5            [11]   85 	push	hl
   4E37 21 00 01      [10]   86 	ld	hl, #0x0100
   4E3A CD 84 4E      [17]   87 	call	_cpct_isKeyPressed
   4E3D 7D            [ 4]   88 	ld	a, l
   4E3E E1            [10]   89 	pop	hl
   4E3F B7            [ 4]   90 	or	a, a
   4E40 C8            [11]   91 	ret	Z
                             92 ;src/input/input.c:16: pulsada=1;
   4E41 2E 01         [ 7]   93 	ld	l, #0x01
                             94 ;src/input/input.c:17: return pulsada; 
   4E43 C9            [10]   95 	ret
                             96 ;src/input/input.c:19: u8 keyDown(){
                             97 ;	---------------------------------
                             98 ; Function keyDown
                             99 ; ---------------------------------
   4E44                     100 _keyDown::
                            101 ;src/input/input.c:20: u8 pulsada=0;
   4E44 2E 00         [ 7]  102 	ld	l, #0x00
                            103 ;src/input/input.c:21: if(cpct_isKeyPressed (Key_CursorDown))
   4E46 E5            [11]  104 	push	hl
   4E47 21 00 04      [10]  105 	ld	hl, #0x0400
   4E4A CD 84 4E      [17]  106 	call	_cpct_isKeyPressed
   4E4D 7D            [ 4]  107 	ld	a, l
   4E4E E1            [10]  108 	pop	hl
   4E4F B7            [ 4]  109 	or	a, a
   4E50 C8            [11]  110 	ret	Z
                            111 ;src/input/input.c:22: pulsada=1;
   4E51 2E 01         [ 7]  112 	ld	l, #0x01
                            113 ;src/input/input.c:23: return pulsada; 
   4E53 C9            [10]  114 	ret
                            115 ;src/input/input.c:25: u8 keyLeft(){
                            116 ;	---------------------------------
                            117 ; Function keyLeft
                            118 ; ---------------------------------
   4E54                     119 _keyLeft::
                            120 ;src/input/input.c:26: u8 pulsada=0;
   4E54 2E 00         [ 7]  121 	ld	l, #0x00
                            122 ;src/input/input.c:27: if(cpct_isKeyPressed (Key_CursorLeft))
   4E56 E5            [11]  123 	push	hl
   4E57 21 01 01      [10]  124 	ld	hl, #0x0101
   4E5A CD 84 4E      [17]  125 	call	_cpct_isKeyPressed
   4E5D 7D            [ 4]  126 	ld	a, l
   4E5E E1            [10]  127 	pop	hl
   4E5F B7            [ 4]  128 	or	a, a
   4E60 C8            [11]  129 	ret	Z
                            130 ;src/input/input.c:28: pulsada=1;
   4E61 2E 01         [ 7]  131 	ld	l, #0x01
                            132 ;src/input/input.c:29: return pulsada; 
   4E63 C9            [10]  133 	ret
                            134 ;src/input/input.c:31: u8 keyRight(){
                            135 ;	---------------------------------
                            136 ; Function keyRight
                            137 ; ---------------------------------
   4E64                     138 _keyRight::
                            139 ;src/input/input.c:32: u8 pulsada=0;
   4E64 2E 00         [ 7]  140 	ld	l, #0x00
                            141 ;src/input/input.c:33: if(cpct_isKeyPressed (Key_CursorRight))
   4E66 E5            [11]  142 	push	hl
   4E67 21 00 02      [10]  143 	ld	hl, #0x0200
   4E6A CD 84 4E      [17]  144 	call	_cpct_isKeyPressed
   4E6D 7D            [ 4]  145 	ld	a, l
   4E6E E1            [10]  146 	pop	hl
   4E6F B7            [ 4]  147 	or	a, a
   4E70 C8            [11]  148 	ret	Z
                            149 ;src/input/input.c:34: pulsada=1;
   4E71 2E 01         [ 7]  150 	ld	l, #0x01
                            151 ;src/input/input.c:35: return pulsada; 
   4E73 C9            [10]  152 	ret
                            153 ;src/input/input.c:37: u8 keyFire(){
                            154 ;	---------------------------------
                            155 ; Function keyFire
                            156 ; ---------------------------------
   4E74                     157 _keyFire::
                            158 ;src/input/input.c:38: u8 pulsada=0;
   4E74 2E 00         [ 7]  159 	ld	l, #0x00
                            160 ;src/input/input.c:39: if(cpct_isKeyPressed (Key_Space))
   4E76 E5            [11]  161 	push	hl
   4E77 21 05 80      [10]  162 	ld	hl, #0x8005
   4E7A CD 84 4E      [17]  163 	call	_cpct_isKeyPressed
   4E7D 7D            [ 4]  164 	ld	a, l
   4E7E E1            [10]  165 	pop	hl
   4E7F B7            [ 4]  166 	or	a, a
   4E80 C8            [11]  167 	ret	Z
                            168 ;src/input/input.c:40: pulsada=1;
   4E81 2E 01         [ 7]  169 	ld	l, #0x01
                            170 ;src/input/input.c:41: return pulsada; 
   4E83 C9            [10]  171 	ret
                            172 	.area _CODE
                            173 	.area _INITIALIZER
                            174 	.area _CABS (ABS)
