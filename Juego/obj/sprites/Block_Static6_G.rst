                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Block_Static6_G
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _Block_Static6_G_1
                             12 	.globl _Block_Static6_G_0
                             13 	.globl _Block_Static6_G
                             14 	.globl _Block_Static6_G_BPALETTE
                             15 ;--------------------------------------------------------
                             16 ; special function registers
                             17 ;--------------------------------------------------------
                             18 ;--------------------------------------------------------
                             19 ; ram data
                             20 ;--------------------------------------------------------
                             21 	.area _DATA
                             22 ;--------------------------------------------------------
                             23 ; ram data
                             24 ;--------------------------------------------------------
                             25 	.area _INITIALIZED
                             26 ;--------------------------------------------------------
                             27 ; absolute external ram data
                             28 ;--------------------------------------------------------
                             29 	.area _DABS (ABS)
                             30 ;--------------------------------------------------------
                             31 ; global & static initialisations
                             32 ;--------------------------------------------------------
                             33 	.area _HOME
                             34 	.area _GSINIT
                             35 	.area _GSFINAL
                             36 	.area _GSINIT
                             37 ;--------------------------------------------------------
                             38 ; Home
                             39 ;--------------------------------------------------------
                             40 	.area _HOME
                             41 	.area _HOME
                             42 ;--------------------------------------------------------
                             43 ; code
                             44 ;--------------------------------------------------------
                             45 	.area _CODE
                             46 	.area _CODE
   5409                      47 _Block_Static6_G_BPALETTE:
   5409 54                   48 	.db #0x54	; 84	'T'
   540A 5B                   49 	.db #0x5b	; 91
   540B 4F                   50 	.db #0x4f	; 79	'O'
   540C 5D                   51 	.db #0x5d	; 93
   540D 44                   52 	.db #0x44	; 68	'D'
   540E 5F                   53 	.db #0x5f	; 95
   540F 4B                   54 	.db #0x4b	; 75	'K'
   5410 55                   55 	.db #0x55	; 85	'U'
   5411 56                   56 	.db #0x56	; 86	'V'
   5412 40                   57 	.db #0x40	; 64
   5413 5C                   58 	.db #0x5c	; 92
   5414 46                   59 	.db #0x46	; 70	'F'
   5415 5B                   60 	.db #0x5b	; 91
   5416 5B                   61 	.db #0x5b	; 91
   5417 5E                   62 	.db #0x5e	; 94
   5418                      63 _Block_Static6_G:
   5418 1C 54                64 	.dw _Block_Static6_G_0
   541A 3C 54                65 	.dw _Block_Static6_G_1
   541C                      66 _Block_Static6_G_0:
   541C CF                   67 	.db #0xcf	; 207
   541D CF                   68 	.db #0xcf	; 207
   541E CF                   69 	.db #0xcf	; 207
   541F CF                   70 	.db #0xcf	; 207
   5420 CF                   71 	.db #0xcf	; 207
   5421 CF                   72 	.db #0xcf	; 207
   5422 CF                   73 	.db #0xcf	; 207
   5423 CF                   74 	.db #0xcf	; 207
   5424 CF                   75 	.db #0xcf	; 207
   5425 CF                   76 	.db #0xcf	; 207
   5426 CF                   77 	.db #0xcf	; 207
   5427 CF                   78 	.db #0xcf	; 207
   5428 CF                   79 	.db #0xcf	; 207
   5429 CF                   80 	.db #0xcf	; 207
   542A CF                   81 	.db #0xcf	; 207
   542B CF                   82 	.db #0xcf	; 207
   542C CF                   83 	.db #0xcf	; 207
   542D CF                   84 	.db #0xcf	; 207
   542E CF                   85 	.db #0xcf	; 207
   542F CF                   86 	.db #0xcf	; 207
   5430 CF                   87 	.db #0xcf	; 207
   5431 CF                   88 	.db #0xcf	; 207
   5432 CF                   89 	.db #0xcf	; 207
   5433 CF                   90 	.db #0xcf	; 207
   5434 CF                   91 	.db #0xcf	; 207
   5435 CF                   92 	.db #0xcf	; 207
   5436 CF                   93 	.db #0xcf	; 207
   5437 CF                   94 	.db #0xcf	; 207
   5438 CF                   95 	.db #0xcf	; 207
   5439 CF                   96 	.db #0xcf	; 207
   543A CF                   97 	.db #0xcf	; 207
   543B CF                   98 	.db #0xcf	; 207
   543C                      99 _Block_Static6_G_1:
   543C FC                  100 	.db #0xfc	; 252
   543D FC                  101 	.db #0xfc	; 252
   543E 30                  102 	.db #0x30	; 48	'0'
   543F 30                  103 	.db #0x30	; 48	'0'
   5440 FC                  104 	.db #0xfc	; 252
   5441 FC                  105 	.db #0xfc	; 252
   5442 30                  106 	.db #0x30	; 48	'0'
   5443 30                  107 	.db #0x30	; 48	'0'
   5444 00                  108 	.db #0x00	; 0
   5445 00                  109 	.db #0x00	; 0
   5446 00                  110 	.db #0x00	; 0
   5447 00                  111 	.db #0x00	; 0
   5448 00                  112 	.db #0x00	; 0
   5449 00                  113 	.db #0x00	; 0
   544A 00                  114 	.db #0x00	; 0
   544B 00                  115 	.db #0x00	; 0
   544C FC                  116 	.db #0xfc	; 252
   544D FC                  117 	.db #0xfc	; 252
   544E 30                  118 	.db #0x30	; 48	'0'
   544F 30                  119 	.db #0x30	; 48	'0'
   5450 FC                  120 	.db #0xfc	; 252
   5451 FC                  121 	.db #0xfc	; 252
   5452 30                  122 	.db #0x30	; 48	'0'
   5453 30                  123 	.db #0x30	; 48	'0'
   5454 B8                  124 	.db #0xb8	; 184
   5455 20                  125 	.db #0x20	; 32
   5456 54                  126 	.db #0x54	; 84	'T'
   5457 B8                  127 	.db #0xb8	; 184
   5458 B8                  128 	.db #0xb8	; 184
   5459 20                  129 	.db #0x20	; 32
   545A 54                  130 	.db #0x54	; 84	'T'
   545B B8                  131 	.db #0xb8	; 184
                            132 	.area _INITIALIZER
                            133 	.area _CABS (ABS)
