                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Wall_Dust_B
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _Wall_Dust_B_1
                             12 	.globl _Wall_Dust_B_0
                             13 	.globl _Wall_Dust_B
                             14 	.globl _Wall_Dust_BPALETTE
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
   4FD2                      47 _Wall_Dust_BPALETTE:
   4FD2 54                   48 	.db #0x54	; 84	'T'
   4FD3 5B                   49 	.db #0x5b	; 91
   4FD4 4F                   50 	.db #0x4f	; 79	'O'
   4FD5 5D                   51 	.db #0x5d	; 93
   4FD6 44                   52 	.db #0x44	; 68	'D'
   4FD7 5F                   53 	.db #0x5f	; 95
   4FD8 4B                   54 	.db #0x4b	; 75	'K'
   4FD9 55                   55 	.db #0x55	; 85	'U'
   4FDA 56                   56 	.db #0x56	; 86	'V'
   4FDB 40                   57 	.db #0x40	; 64
   4FDC 5C                   58 	.db #0x5c	; 92
   4FDD 46                   59 	.db #0x46	; 70	'F'
   4FDE 5B                   60 	.db #0x5b	; 91
   4FDF 5B                   61 	.db #0x5b	; 91
   4FE0 5E                   62 	.db #0x5e	; 94
   4FE1                      63 _Wall_Dust_B:
   4FE1 E5 4F                64 	.dw _Wall_Dust_B_0
   4FE3 05 50                65 	.dw _Wall_Dust_B_1
   4FE5                      66 _Wall_Dust_B_0:
   4FE5 44                   67 	.db #0x44	; 68	'D'
   4FE6 44                   68 	.db #0x44	; 68	'D'
   4FE7 88                   69 	.db #0x88	; 136
   4FE8 88                   70 	.db #0x88	; 136
   4FE9 44                   71 	.db #0x44	; 68	'D'
   4FEA 44                   72 	.db #0x44	; 68	'D'
   4FEB 88                   73 	.db #0x88	; 136
   4FEC 88                   74 	.db #0x88	; 136
   4FED 00                   75 	.db #0x00	; 0
   4FEE 00                   76 	.db #0x00	; 0
   4FEF 88                   77 	.db #0x88	; 136
   4FF0 00                   78 	.db #0x00	; 0
   4FF1 00                   79 	.db #0x00	; 0
   4FF2 00                   80 	.db #0x00	; 0
   4FF3 88                   81 	.db #0x88	; 136
   4FF4 00                   82 	.db #0x00	; 0
   4FF5 88                   83 	.db #0x88	; 136
   4FF6 88                   84 	.db #0x88	; 136
   4FF7 00                   85 	.db #0x00	; 0
   4FF8 44                   86 	.db #0x44	; 68	'D'
   4FF9 88                   87 	.db #0x88	; 136
   4FFA 88                   88 	.db #0x88	; 136
   4FFB 00                   89 	.db #0x00	; 0
   4FFC 44                   90 	.db #0x44	; 68	'D'
   4FFD 00                   91 	.db #0x00	; 0
   4FFE 00                   92 	.db #0x00	; 0
   4FFF 44                   93 	.db #0x44	; 68	'D'
   5000 00                   94 	.db #0x00	; 0
   5001 00                   95 	.db #0x00	; 0
   5002 00                   96 	.db #0x00	; 0
   5003 44                   97 	.db #0x44	; 68	'D'
   5004 00                   98 	.db #0x00	; 0
   5005                      99 _Wall_Dust_B_1:
   5005 88                  100 	.db #0x88	; 136
   5006 00                  101 	.db #0x00	; 0
   5007 00                  102 	.db #0x00	; 0
   5008 88                  103 	.db #0x88	; 136
   5009 88                  104 	.db #0x88	; 136
   500A 00                  105 	.db #0x00	; 0
   500B 00                  106 	.db #0x00	; 0
   500C 88                  107 	.db #0x88	; 136
   500D 88                  108 	.db #0x88	; 136
   500E 44                  109 	.db #0x44	; 68	'D'
   500F 00                  110 	.db #0x00	; 0
   5010 44                  111 	.db #0x44	; 68	'D'
   5011 88                  112 	.db #0x88	; 136
   5012 44                  113 	.db #0x44	; 68	'D'
   5013 00                  114 	.db #0x00	; 0
   5014 44                  115 	.db #0x44	; 68	'D'
   5015 00                  116 	.db #0x00	; 0
   5016 00                  117 	.db #0x00	; 0
   5017 00                  118 	.db #0x00	; 0
   5018 44                  119 	.db #0x44	; 68	'D'
   5019 00                  120 	.db #0x00	; 0
   501A 00                  121 	.db #0x00	; 0
   501B 00                  122 	.db #0x00	; 0
   501C 44                  123 	.db #0x44	; 68	'D'
   501D 44                  124 	.db #0x44	; 68	'D'
   501E 00                  125 	.db #0x00	; 0
   501F CC                  126 	.db #0xcc	; 204
   5020 00                  127 	.db #0x00	; 0
   5021 44                  128 	.db #0x44	; 68	'D'
   5022 00                  129 	.db #0x00	; 0
   5023 CC                  130 	.db #0xcc	; 204
   5024 00                  131 	.db #0x00	; 0
                            132 	.area _INITIALIZER
                            133 	.area _CABS (ABS)
