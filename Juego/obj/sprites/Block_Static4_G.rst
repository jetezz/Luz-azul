                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Block_Static4_G
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _Block_Static4_G_1
                             12 	.globl _Block_Static4_G_0
                             13 	.globl _Block_Static4_G
                             14 	.globl _Block_Static4_GPALETTE
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
   5555                      47 _Block_Static4_GPALETTE:
   5555 54                   48 	.db #0x54	; 84	'T'
   5556 5B                   49 	.db #0x5b	; 91
   5557 4F                   50 	.db #0x4f	; 79	'O'
   5558 5D                   51 	.db #0x5d	; 93
   5559 44                   52 	.db #0x44	; 68	'D'
   555A 5F                   53 	.db #0x5f	; 95
   555B 4B                   54 	.db #0x4b	; 75	'K'
   555C 55                   55 	.db #0x55	; 85	'U'
   555D 56                   56 	.db #0x56	; 86	'V'
   555E 40                   57 	.db #0x40	; 64
   555F 5C                   58 	.db #0x5c	; 92
   5560 46                   59 	.db #0x46	; 70	'F'
   5561 5B                   60 	.db #0x5b	; 91
   5562 5B                   61 	.db #0x5b	; 91
   5563 5E                   62 	.db #0x5e	; 94
   5564                      63 _Block_Static4_G:
   5564 68 55                64 	.dw _Block_Static4_G_0
   5566 88 55                65 	.dw _Block_Static4_G_1
   5568                      66 _Block_Static4_G_0:
   5568 CF                   67 	.db #0xcf	; 207
   5569 CF                   68 	.db #0xcf	; 207
   556A CF                   69 	.db #0xcf	; 207
   556B CF                   70 	.db #0xcf	; 207
   556C CF                   71 	.db #0xcf	; 207
   556D CF                   72 	.db #0xcf	; 207
   556E CF                   73 	.db #0xcf	; 207
   556F CF                   74 	.db #0xcf	; 207
   5570 CF                   75 	.db #0xcf	; 207
   5571 CF                   76 	.db #0xcf	; 207
   5572 CF                   77 	.db #0xcf	; 207
   5573 CF                   78 	.db #0xcf	; 207
   5574 CF                   79 	.db #0xcf	; 207
   5575 CF                   80 	.db #0xcf	; 207
   5576 CF                   81 	.db #0xcf	; 207
   5577 CF                   82 	.db #0xcf	; 207
   5578 CF                   83 	.db #0xcf	; 207
   5579 CF                   84 	.db #0xcf	; 207
   557A CF                   85 	.db #0xcf	; 207
   557B CF                   86 	.db #0xcf	; 207
   557C CF                   87 	.db #0xcf	; 207
   557D CF                   88 	.db #0xcf	; 207
   557E CF                   89 	.db #0xcf	; 207
   557F CF                   90 	.db #0xcf	; 207
   5580 CF                   91 	.db #0xcf	; 207
   5581 CF                   92 	.db #0xcf	; 207
   5582 CF                   93 	.db #0xcf	; 207
   5583 CF                   94 	.db #0xcf	; 207
   5584 CF                   95 	.db #0xcf	; 207
   5585 CF                   96 	.db #0xcf	; 207
   5586 CF                   97 	.db #0xcf	; 207
   5587 CF                   98 	.db #0xcf	; 207
   5588                      99 _Block_Static4_G_1:
   5588 30                  100 	.db #0x30	; 48	'0'
   5589 30                  101 	.db #0x30	; 48	'0'
   558A 30                  102 	.db #0x30	; 48	'0'
   558B 30                  103 	.db #0x30	; 48	'0'
   558C 30                  104 	.db #0x30	; 48	'0'
   558D 30                  105 	.db #0x30	; 48	'0'
   558E 30                  106 	.db #0x30	; 48	'0'
   558F 30                  107 	.db #0x30	; 48	'0'
   5590 00                  108 	.db #0x00	; 0
   5591 00                  109 	.db #0x00	; 0
   5592 00                  110 	.db #0x00	; 0
   5593 00                  111 	.db #0x00	; 0
   5594 00                  112 	.db #0x00	; 0
   5595 00                  113 	.db #0x00	; 0
   5596 00                  114 	.db #0x00	; 0
   5597 00                  115 	.db #0x00	; 0
   5598 30                  116 	.db #0x30	; 48	'0'
   5599 30                  117 	.db #0x30	; 48	'0'
   559A 30                  118 	.db #0x30	; 48	'0'
   559B 30                  119 	.db #0x30	; 48	'0'
   559C 30                  120 	.db #0x30	; 48	'0'
   559D 30                  121 	.db #0x30	; 48	'0'
   559E 30                  122 	.db #0x30	; 48	'0'
   559F 30                  123 	.db #0x30	; 48	'0'
   55A0 00                  124 	.db #0x00	; 0
   55A1 00                  125 	.db #0x00	; 0
   55A2 54                  126 	.db #0x54	; 84	'T'
   55A3 B8                  127 	.db #0xb8	; 184
   55A4 00                  128 	.db #0x00	; 0
   55A5 00                  129 	.db #0x00	; 0
   55A6 54                  130 	.db #0x54	; 84	'T'
   55A7 B8                  131 	.db #0xb8	; 184
                            132 	.area _INITIALIZER
                            133 	.area _CABS (ABS)
