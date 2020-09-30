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
                             48 ;src/main.c:11: void main(void) {
                             49 ;	---------------------------------
                             50 ; Function main
                             51 ; ---------------------------------
   4DA0                      52 _main::
                             53 ;src/main.c:12: cpct_disableFirmware();
   4DA0 CD 7D 50      [17]   54 	call	_cpct_disableFirmware
                             55 ;src/main.c:13: cpct_setVideoMode(0);
   4DA3 2E 00         [ 7]   56 	ld	l, #0x00
   4DA5 CD 6F 50      [17]   57 	call	_cpct_setVideoMode
                             58 ;src/main.c:14: cpct_setPalette(game_palette, 16);   
   4DA8 21 10 00      [10]   59 	ld	hl, #0x0010
   4DAB E5            [11]   60 	push	hl
   4DAC 21 B7 4D      [10]   61 	ld	hl, #_game_palette
   4DAF E5            [11]   62 	push	hl
   4DB0 CD 04 4F      [17]   63 	call	_cpct_setPalette
                             64 ;src/main.c:15: game();
   4DB3 CD FB 4D      [17]   65 	call	_game
   4DB6 C9            [10]   66 	ret
   4DB7                      67 _game_palette:
   4DB7 54                   68 	.db #0x54	; 84	'T'
   4DB8 5D                   69 	.db #0x5d	; 93
   4DB9 4E                   70 	.db #0x4e	; 78	'N'
   4DBA 44                   71 	.db #0x44	; 68	'D'
   4DBB 46                   72 	.db #0x46	; 70	'F'
   4DBC 42                   73 	.db #0x42	; 66	'B'
   4DBD 5C                   74 	.db #0x5c	; 92
   4DBE 47                   75 	.db #0x47	; 71	'G'
   4DBF 45                   76 	.db #0x45	; 69	'E'
   4DC0 58                   77 	.db #0x58	; 88	'X'
   4DC1 4D                   78 	.db #0x4d	; 77	'M'
   4DC2 43                   79 	.db #0x43	; 67	'C'
   4DC3 4F                   80 	.db #0x4f	; 79	'O'
   4DC4 40                   81 	.db #0x40	; 64
   4DC5 4C                   82 	.db #0x4c	; 76	'L'
   4DC6 4B                   83 	.db #0x4b	; 75	'K'
                             84 	.area _CODE
                             85 	.area _INITIALIZER
                             86 	.area _CABS (ABS)
