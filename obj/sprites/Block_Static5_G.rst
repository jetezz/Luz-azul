                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Block_Static5_G
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _Block_Static5_G_1
                             12 	.globl _Block_Static5_G_0
                             13 	.globl _Block_Static5_G
                             14 	.globl _Block_Static5_GPALETTE
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
   54AF                      47 _Block_Static5_GPALETTE:
   54AF 54                   48 	.db #0x54	; 84	'T'
   54B0 5B                   49 	.db #0x5b	; 91
   54B1 4F                   50 	.db #0x4f	; 79	'O'
   54B2 5D                   51 	.db #0x5d	; 93
   54B3 44                   52 	.db #0x44	; 68	'D'
   54B4 5F                   53 	.db #0x5f	; 95
   54B5 4B                   54 	.db #0x4b	; 75	'K'
   54B6 55                   55 	.db #0x55	; 85	'U'
   54B7 56                   56 	.db #0x56	; 86	'V'
   54B8 40                   57 	.db #0x40	; 64
   54B9 5C                   58 	.db #0x5c	; 92
   54BA 46                   59 	.db #0x46	; 70	'F'
   54BB 5B                   60 	.db #0x5b	; 91
   54BC 5B                   61 	.db #0x5b	; 91
   54BD 5E                   62 	.db #0x5e	; 94
   54BE                      63 _Block_Static5_G:
   54BE C2 54                64 	.dw _Block_Static5_G_0
   54C0 E2 54                65 	.dw _Block_Static5_G_1
   54C2                      66 _Block_Static5_G_0:
   54C2 CF                   67 	.db #0xcf	; 207
   54C3 CF                   68 	.db #0xcf	; 207
   54C4 CF                   69 	.db #0xcf	; 207
   54C5 CF                   70 	.db #0xcf	; 207
   54C6 CF                   71 	.db #0xcf	; 207
   54C7 CF                   72 	.db #0xcf	; 207
   54C8 CF                   73 	.db #0xcf	; 207
   54C9 CF                   74 	.db #0xcf	; 207
   54CA CF                   75 	.db #0xcf	; 207
   54CB FC                   76 	.db #0xfc	; 252
   54CC FC                   77 	.db #0xfc	; 252
   54CD CF                   78 	.db #0xcf	; 207
   54CE CF                   79 	.db #0xcf	; 207
   54CF FC                   80 	.db #0xfc	; 252
   54D0 FC                   81 	.db #0xfc	; 252
   54D1 CF                   82 	.db #0xcf	; 207
   54D2 CF                   83 	.db #0xcf	; 207
   54D3 00                   84 	.db #0x00	; 0
   54D4 00                   85 	.db #0x00	; 0
   54D5 CF                   86 	.db #0xcf	; 207
   54D6 CF                   87 	.db #0xcf	; 207
   54D7 00                   88 	.db #0x00	; 0
   54D8 00                   89 	.db #0x00	; 0
   54D9 CF                   90 	.db #0xcf	; 207
   54DA CF                   91 	.db #0xcf	; 207
   54DB CF                   92 	.db #0xcf	; 207
   54DC CF                   93 	.db #0xcf	; 207
   54DD CF                   94 	.db #0xcf	; 207
   54DE CF                   95 	.db #0xcf	; 207
   54DF CF                   96 	.db #0xcf	; 207
   54E0 CF                   97 	.db #0xcf	; 207
   54E1 CF                   98 	.db #0xcf	; 207
   54E2                      99 _Block_Static5_G_1:
   54E2 FC                  100 	.db #0xfc	; 252
   54E3 FC                  101 	.db #0xfc	; 252
   54E4 30                  102 	.db #0x30	; 48	'0'
   54E5 30                  103 	.db #0x30	; 48	'0'
   54E6 FC                  104 	.db #0xfc	; 252
   54E7 FC                  105 	.db #0xfc	; 252
   54E8 30                  106 	.db #0x30	; 48	'0'
   54E9 30                  107 	.db #0x30	; 48	'0'
   54EA 00                  108 	.db #0x00	; 0
   54EB 00                  109 	.db #0x00	; 0
   54EC 00                  110 	.db #0x00	; 0
   54ED 00                  111 	.db #0x00	; 0
   54EE 00                  112 	.db #0x00	; 0
   54EF 00                  113 	.db #0x00	; 0
   54F0 00                  114 	.db #0x00	; 0
   54F1 00                  115 	.db #0x00	; 0
   54F2 FC                  116 	.db #0xfc	; 252
   54F3 FC                  117 	.db #0xfc	; 252
   54F4 30                  118 	.db #0x30	; 48	'0'
   54F5 30                  119 	.db #0x30	; 48	'0'
   54F6 FC                  120 	.db #0xfc	; 252
   54F7 FC                  121 	.db #0xfc	; 252
   54F8 30                  122 	.db #0x30	; 48	'0'
   54F9 30                  123 	.db #0x30	; 48	'0'
   54FA FC                  124 	.db #0xfc	; 252
   54FB FC                  125 	.db #0xfc	; 252
   54FC 30                  126 	.db #0x30	; 48	'0'
   54FD 30                  127 	.db #0x30	; 48	'0'
   54FE FC                  128 	.db #0xfc	; 252
   54FF FC                  129 	.db #0xfc	; 252
   5500 30                  130 	.db #0x30	; 48	'0'
   5501 30                  131 	.db #0x30	; 48	'0'
                            132 	.area _INITIALIZER
                            133 	.area _CABS (ABS)
