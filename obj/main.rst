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
   AB06                      24 _P_portal:
   AB06                      25 	.ds 2
   AB08                      26 _P_puertas:
   AB08                      27 	.ds 2
   AB0A                      28 _P_col:
   AB0A                      29 	.ds 2
   AB0C                      30 _P_luz:
   AB0C                      31 	.ds 2
   AB0E                      32 _P_fam:
   AB0E                      33 	.ds 2
   AB10                      34 _P_ams:
   AB10                      35 	.ds 2
   AB12                      36 _P_colList:
   AB12                      37 	.ds 2
   AB14                      38 _movimientoGuardado:
   AB14                      39 	.ds 1
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
   58E6                      68 _main::
                             69 ;src/main.c:13: cpct_disableFirmware();
   58E6 CD E6 A9      [17]   70 	call	_cpct_disableFirmware
                             71 ;src/main.c:14: cpct_setVideoMode(0);
   58E9 2E 00         [ 7]   72 	ld	l, #0x00
   58EB CD D8 A9      [17]   73 	call	_cpct_setVideoMode
                             74 ;src/main.c:15: cpct_setPalette(Block_HolePALETTE, 16);   
   58EE 21 10 00      [10]   75 	ld	hl, #0x0010
   58F1 E5            [11]   76 	push	hl
   58F2 21 3A 4D      [10]   77 	ld	hl, #_Block_HolePALETTE
   58F5 E5            [11]   78 	push	hl
   58F6 CD 39 9F      [17]   79 	call	_cpct_setPalette
                             80 ;src/main.c:16: game();
   58F9 CD 17 71      [17]   81 	call	_game
   58FC C9            [10]   82 	ret
   58FD                      83 _game_palette:
   58FD 54                   84 	.db #0x54	; 84	'T'
   58FE 5C                   85 	.db #0x5c	; 92
   58FF 5E                   86 	.db #0x5e	; 94
   5900 5D                   87 	.db #0x5d	; 93
   5901 5F                   88 	.db #0x5f	; 95
   5902 4F                   89 	.db #0x4f	; 79	'O'
   5903 44                   90 	.db #0x44	; 68	'D'
   5904 55                   91 	.db #0x55	; 85	'U'
   5905 57                   92 	.db #0x57	; 87	'W'
   5906 47                   93 	.db #0x47	; 71	'G'
   5907 5B                   94 	.db #0x5b	; 91
   5908 56                   95 	.db #0x56	; 86	'V'
   5909 40                   96 	.db #0x40	; 64
   590A 4B                   97 	.db #0x4b	; 75	'K'
   590B 00                   98 	.db 0x00
   590C 00                   99 	.db 0x00
                            100 	.area _CODE
                            101 	.area _INITIALIZER
                            102 	.area _CABS (ABS)
