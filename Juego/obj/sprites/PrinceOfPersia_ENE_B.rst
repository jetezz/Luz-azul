                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module PrinceOfPersia_ENE_B
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _PrinceOfPersia_ENE_B_1
                             12 	.globl _PrinceOfPersia_ENE_B_0
                             13 	.globl _PrinceOfPersia_ENE_B
                             14 	.globl _PrinceOfPersia_ENE_BPALETTE
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
   48C0                      47 _PrinceOfPersia_ENE_BPALETTE:
   48C0 54                   48 	.db #0x54	; 84	'T'
   48C1 5B                   49 	.db #0x5b	; 91
   48C2 4F                   50 	.db #0x4f	; 79	'O'
   48C3 5D                   51 	.db #0x5d	; 93
   48C4 44                   52 	.db #0x44	; 68	'D'
   48C5 5F                   53 	.db #0x5f	; 95
   48C6 4B                   54 	.db #0x4b	; 75	'K'
   48C7 55                   55 	.db #0x55	; 85	'U'
   48C8 56                   56 	.db #0x56	; 86	'V'
   48C9 40                   57 	.db #0x40	; 64
   48CA 5C                   58 	.db #0x5c	; 92
   48CB 46                   59 	.db #0x46	; 70	'F'
   48CC 5B                   60 	.db #0x5b	; 91
   48CD 5B                   61 	.db #0x5b	; 91
   48CE 5E                   62 	.db #0x5e	; 94
   48CF                      63 _PrinceOfPersia_ENE_B:
   48CF D3 48                64 	.dw _PrinceOfPersia_ENE_B_0
   48D1 F3 48                65 	.dw _PrinceOfPersia_ENE_B_1
   48D3                      66 _PrinceOfPersia_ENE_B_0:
   48D3 00                   67 	.db #0x00	; 0
   48D4 CC                   68 	.db #0xcc	; 204
   48D5 00                   69 	.db #0x00	; 0
   48D6 00                   70 	.db #0x00	; 0
   48D7 00                   71 	.db #0x00	; 0
   48D8 CC                   72 	.db #0xcc	; 204
   48D9 00                   73 	.db #0x00	; 0
   48DA 00                   74 	.db #0x00	; 0
   48DB 00                   75 	.db #0x00	; 0
   48DC CC                   76 	.db #0xcc	; 204
   48DD 00                   77 	.db #0x00	; 0
   48DE 00                   78 	.db #0x00	; 0
   48DF 00                   79 	.db #0x00	; 0
   48E0 CC                   80 	.db #0xcc	; 204
   48E1 00                   81 	.db #0x00	; 0
   48E2 00                   82 	.db #0x00	; 0
   48E3 44                   83 	.db #0x44	; 68	'D'
   48E4 D8                   84 	.db #0xd8	; 216
   48E5 00                   85 	.db #0x00	; 0
   48E6 00                   86 	.db #0x00	; 0
   48E7 44                   87 	.db #0x44	; 68	'D'
   48E8 D8                   88 	.db #0xd8	; 216
   48E9 00                   89 	.db #0x00	; 0
   48EA 00                   90 	.db #0x00	; 0
   48EB 7A                   91 	.db #0x7a	; 122	'z'
   48EC 3F                   92 	.db #0x3f	; 63
   48ED 00                   93 	.db #0x00	; 0
   48EE 00                   94 	.db #0x00	; 0
   48EF 7A                   95 	.db #0x7a	; 122	'z'
   48F0 3F                   96 	.db #0x3f	; 63
   48F1 00                   97 	.db #0x00	; 0
   48F2 00                   98 	.db #0x00	; 0
   48F3                      99 _PrinceOfPersia_ENE_B_1:
   48F3 44                  100 	.db #0x44	; 68	'D'
   48F4 2A                  101 	.db #0x2a	; 42
   48F5 E1                  102 	.db #0xe1	; 225
   48F6 C3                  103 	.db #0xc3	; 195
   48F7 44                  104 	.db #0x44	; 68	'D'
   48F8 2A                  105 	.db #0x2a	; 42
   48F9 E1                  106 	.db #0xe1	; 225
   48FA C3                  107 	.db #0xc3	; 195
   48FB CC                  108 	.db #0xcc	; 204
   48FC C6                  109 	.db #0xc6	; 198
   48FD 82                  110 	.db #0x82	; 130
   48FE 00                  111 	.db #0x00	; 0
   48FF CC                  112 	.db #0xcc	; 204
   4900 C6                  113 	.db #0xc6	; 198
   4901 82                  114 	.db #0x82	; 130
   4902 00                  115 	.db #0x00	; 0
   4903 C3                  116 	.db #0xc3	; 195
   4904 C3                  117 	.db #0xc3	; 195
   4905 82                  118 	.db #0x82	; 130
   4906 00                  119 	.db #0x00	; 0
   4907 C3                  120 	.db #0xc3	; 195
   4908 C3                  121 	.db #0xc3	; 195
   4909 82                  122 	.db #0x82	; 130
   490A 00                  123 	.db #0x00	; 0
   490B CC                  124 	.db #0xcc	; 204
   490C F0                  125 	.db #0xf0	; 240
   490D A0                  126 	.db #0xa0	; 160
   490E 00                  127 	.db #0x00	; 0
   490F CC                  128 	.db #0xcc	; 204
   4910 F0                  129 	.db #0xf0	; 240
   4911 A0                  130 	.db #0xa0	; 160
   4912 00                  131 	.db #0x00	; 0
                            132 	.area _INITIALIZER
                            133 	.area _CABS (ABS)
