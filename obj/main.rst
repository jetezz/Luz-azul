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
   61A5                      24 _P_portal:
   61A5                      25 	.ds 2
   61A7                      26 _P_puertas:
   61A7                      27 	.ds 2
   61A9                      28 _movimientoGuardado:
   61A9                      29 	.ds 1
                             30 ;--------------------------------------------------------
                             31 ; ram data
                             32 ;--------------------------------------------------------
                             33 	.area _INITIALIZED
                             34 ;--------------------------------------------------------
                             35 ; absolute external ram data
                             36 ;--------------------------------------------------------
                             37 	.area _DABS (ABS)
                             38 ;--------------------------------------------------------
                             39 ; global & static initialisations
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _GSINIT
                             43 	.area _GSFINAL
                             44 	.area _GSINIT
                             45 ;--------------------------------------------------------
                             46 ; Home
                             47 ;--------------------------------------------------------
                             48 	.area _HOME
                             49 	.area _HOME
                             50 ;--------------------------------------------------------
                             51 ; code
                             52 ;--------------------------------------------------------
                             53 	.area _CODE
                             54 ;src/main.c:11: void main(void) {
                             55 ;	---------------------------------
                             56 ; Function main
                             57 ; ---------------------------------
   4F98                      58 _main::
                             59 ;src/main.c:12: cpct_disableFirmware();
   4F98 CD BA 60      [17]   60 	call	_cpct_disableFirmware
                             61 ;src/main.c:13: cpct_setVideoMode(0);
   4F9B 2E 00         [ 7]   62 	ld	l, #0x00
   4F9D CD AC 60      [17]   63 	call	_cpct_setVideoMode
                             64 ;src/main.c:14: cpct_setPalette(game_palette, 16);   
   4FA0 21 10 00      [10]   65 	ld	hl, #0x0010
   4FA3 E5            [11]   66 	push	hl
   4FA4 21 AF 4F      [10]   67 	ld	hl, #_game_palette
   4FA7 E5            [11]   68 	push	hl
   4FA8 CD 41 5F      [17]   69 	call	_cpct_setPalette
                             70 ;src/main.c:15: game();
   4FAB CD 3A 5B      [17]   71 	call	_game
   4FAE C9            [10]   72 	ret
   4FAF                      73 _game_palette:
   4FAF 54                   74 	.db #0x54	; 84	'T'
   4FB0 5D                   75 	.db #0x5d	; 93
   4FB1 4E                   76 	.db #0x4e	; 78	'N'
   4FB2 44                   77 	.db #0x44	; 68	'D'
   4FB3 46                   78 	.db #0x46	; 70	'F'
   4FB4 42                   79 	.db #0x42	; 66	'B'
   4FB5 5C                   80 	.db #0x5c	; 92
   4FB6 47                   81 	.db #0x47	; 71	'G'
   4FB7 45                   82 	.db #0x45	; 69	'E'
   4FB8 58                   83 	.db #0x58	; 88	'X'
   4FB9 4D                   84 	.db #0x4d	; 77	'M'
   4FBA 43                   85 	.db #0x43	; 67	'C'
   4FBB 4F                   86 	.db #0x4f	; 79	'O'
   4FBC 40                   87 	.db #0x40	; 64
   4FBD 4C                   88 	.db #0x4c	; 76	'L'
   4FBE 4B                   89 	.db #0x4b	; 75	'K'
                             90 	.area _CODE
                             91 	.area _INITIALIZER
                             92 	.area _CABS (ABS)
