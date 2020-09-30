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
                             13 	.globl _cpct_setVideoMode
                             14 	.globl _cpct_disableFirmware
                             15 	.globl _game_palette
                             16 ;--------------------------------------------------------
                             17 ; special function registers
                             18 ;--------------------------------------------------------
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _DATA
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _INITIALIZED
                             27 ;--------------------------------------------------------
                             28 ; absolute external ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DABS (ABS)
                             31 ;--------------------------------------------------------
                             32 ; global & static initialisations
                             33 ;--------------------------------------------------------
                             34 	.area _HOME
                             35 	.area _GSINIT
                             36 	.area _GSFINAL
                             37 	.area _GSINIT
                             38 ;--------------------------------------------------------
                             39 ; Home
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _HOME
                             43 ;--------------------------------------------------------
                             44 ; code
                             45 ;--------------------------------------------------------
                             46 	.area _CODE
                             47 ;src/main.c:11: void main(void) {
                             48 ;	---------------------------------
                             49 ; Function main
                             50 ; ---------------------------------
   4DC4                      51 _main::
                             52 ;src/main.c:12: cpct_disableFirmware();
   4DC4 CD CF 4F      [17]   53 	call	_cpct_disableFirmware
                             54 ;src/main.c:13: cpct_setVideoMode(0);
   4DC7 2E 00         [ 7]   55 	ld	l, #0x00
   4DC9 CD C1 4F      [17]   56 	call	_cpct_setVideoMode
                             57 ;src/main.c:15: game();
   4DCC C3 DF 4D      [10]   58 	jp  _game
   4DCF                      59 _game_palette:
   4DCF 54                   60 	.db #0x54	; 84	'T'
   4DD0 5D                   61 	.db #0x5d	; 93
   4DD1 4E                   62 	.db #0x4e	; 78	'N'
   4DD2 44                   63 	.db #0x44	; 68	'D'
   4DD3 46                   64 	.db #0x46	; 70	'F'
   4DD4 42                   65 	.db #0x42	; 66	'B'
   4DD5 5C                   66 	.db #0x5c	; 92
   4DD6 47                   67 	.db #0x47	; 71	'G'
   4DD7 45                   68 	.db #0x45	; 69	'E'
   4DD8 58                   69 	.db #0x58	; 88	'X'
   4DD9 4D                   70 	.db #0x4d	; 77	'M'
   4DDA 43                   71 	.db #0x43	; 67	'C'
   4DDB 4F                   72 	.db #0x4f	; 79	'O'
   4DDC 40                   73 	.db #0x40	; 64
   4DDD 4C                   74 	.db #0x4c	; 76	'L'
   4DDE 4B                   75 	.db #0x4b	; 75	'K'
                             76 	.area _CODE
                             77 	.area _INITIALIZER
                             78 	.area _CABS (ABS)
