                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _game
                             13 	.globl _cpct_setPalette
                             14 	.globl _cpct_setVideoMode
                             15 	.globl _cpct_disableFirmware
                             16 	.globl _game_palette
                             17 ;--------------------------------------------------------
                             18 ; special function registers
                             19 ;--------------------------------------------------------
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _DATA
   76EC                      24 _P_portal:
   76EC                      25 	.ds 2
   76EE                      26 _P_puertas:
   76EE                      27 	.ds 2
   76F0                      28 _P_col:
   76F0                      29 	.ds 2
   76F2                      30 _P_luz:
   76F2                      31 	.ds 2
   76F4                      32 _P_fam:
   76F4                      33 	.ds 2
   76F6                      34 _P_ams:
   76F6                      35 	.ds 2
   76F8                      36 _P_colList:
   76F8                      37 	.ds 2
   76FA                      38 _movimientoGuardado:
   76FA                      39 	.ds 1
                             40 ;--------------------------------------------------------
                             41 ; ram data
                             42 ;--------------------------------------------------------
                             43 	.area _INITIALIZED
                             44 ;--------------------------------------------------------
                             45 ; absolute external ram data
                             46 ;--------------------------------------------------------
                             47 	.area _DABS (ABS)
                             48 ;--------------------------------------------------------
                             49 ; global & static initialisations
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _GSINIT
                             53 	.area _GSFINAL
                             54 	.area _GSINIT
                             55 ;--------------------------------------------------------
                             56 ; Home
                             57 ;--------------------------------------------------------
                             58 	.area _HOME
                             59 	.area _HOME
                             60 ;--------------------------------------------------------
                             61 ; code
                             62 ;--------------------------------------------------------
                             63 	.area _CODE
                             64 ;src/main.c:12: void main(void) {
                             65 ;	---------------------------------
                             66 ; Function main
                             67 ; ---------------------------------
   527B                      68 _main::
                             69 ;src/main.c:13: cpct_disableFirmware();
   527B CD CC 75      [17]   70 	call	_cpct_disableFirmware
                             71 ;src/main.c:14: cpct_setVideoMode(0);
   527E 2E 00         [ 7]   72 	ld	l, #0x00
   5280 CD BE 75      [17]   73 	call	_cpct_setVideoMode
                             74 ;src/main.c:15: cpct_setPalette(Block_HolePALETTE, 13);   
   5283 21 0D 00      [10]   75 	ld	hl, #0x000d
   5286 E5            [11]   76 	push	hl
   5287 21 27 4C      [10]   77 	ld	hl, #_Block_HolePALETTE
   528A E5            [11]   78 	push	hl
   528B CD 54 73      [17]   79 	call	_cpct_setPalette
                             80 ;src/main.c:16: game();
   528E CD 73 62      [17]   81 	call	_game
   5291 C9            [10]   82 	ret
   5292                      83 _game_palette:
   5292 54                   84 	.db #0x54	; 84	'T'
   5293 5C                   85 	.db #0x5c	; 92
   5294 5E                   86 	.db #0x5e	; 94
   5295 5D                   87 	.db #0x5d	; 93
   5296 5F                   88 	.db #0x5f	; 95
   5297 4F                   89 	.db #0x4f	; 79	'O'
   5298 44                   90 	.db #0x44	; 68	'D'
   5299 55                   91 	.db #0x55	; 85	'U'
   529A 57                   92 	.db #0x57	; 87	'W'
   529B 47                   93 	.db #0x47	; 71	'G'
   529C 5B                   94 	.db #0x5b	; 91
   529D 56                   95 	.db #0x56	; 86	'V'
   529E 40                   96 	.db #0x40	; 64
   529F 4B                   97 	.db #0x4b	; 75	'K'
   52A0 00                   98 	.db 0x00
   52A1 00                   99 	.db 0x00
                            100 	.area _CODE
                            101 	.area _INITIALIZER
                            102 	.area _CABS (ABS)
