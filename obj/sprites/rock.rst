                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module rock
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _rock_1
                             12 	.globl _rock_0
                             13 	.globl _rock
                             14 	.globl _rockPALETTE
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
   4DA0                      47 _rockPALETTE:
   4DA0 54                   48 	.db #0x54	; 84	'T'
   4DA1 5D                   49 	.db #0x5d	; 93
   4DA2 4E                   50 	.db #0x4e	; 78	'N'
   4DA3 44                   51 	.db #0x44	; 68	'D'
   4DA4 46                   52 	.db #0x46	; 70	'F'
   4DA5 42                   53 	.db #0x42	; 66	'B'
   4DA6 5C                   54 	.db #0x5c	; 92
   4DA7 47                   55 	.db #0x47	; 71	'G'
   4DA8 45                   56 	.db #0x45	; 69	'E'
   4DA9 58                   57 	.db #0x58	; 88	'X'
   4DAA 5D                   58 	.db #0x5d	; 93
   4DAB 43                   59 	.db #0x43	; 67	'C'
   4DAC 4F                   60 	.db #0x4f	; 79	'O'
   4DAD 40                   61 	.db #0x40	; 64
   4DAE 4C                   62 	.db #0x4c	; 76	'L'
   4DAF 4B                   63 	.db #0x4b	; 75	'K'
   4DB0                      64 _rock:
   4DB0 B4 4D                65 	.dw _rock_0
   4DB2 D4 4D                66 	.dw _rock_1
   4DB4                      67 _rock_0:
   4DB4 00                   68 	.db #0x00	; 0
   4DB5 00                   69 	.db #0x00	; 0
   4DB6 00                   70 	.db #0x00	; 0
   4DB7 00                   71 	.db #0x00	; 0
   4DB8 14                   72 	.db #0x14	; 20
   4DB9 2C                   73 	.db #0x2c	; 44
   4DBA 0C                   74 	.db #0x0c	; 12
   4DBB 08                   75 	.db #0x08	; 8
   4DBC 55                   76 	.db #0x55	; 85	'U'
   4DBD FF                   77 	.db #0xff	; 255
   4DBE FF                   78 	.db #0xff	; 255
   4DBF AA                   79 	.db #0xaa	; 170
   4DC0 A0                   80 	.db #0xa0	; 160
   4DC1 FF                   81 	.db #0xff	; 255
   4DC2 FF                   82 	.db #0xff	; 255
   4DC3 50                   83 	.db #0x50	; 80	'P'
   4DC4 A0                   84 	.db #0xa0	; 160
   4DC5 FB                   85 	.db #0xfb	; 251
   4DC6 F7                   86 	.db #0xf7	; 247
   4DC7 50                   87 	.db #0x50	; 80	'P'
   4DC8 A0                   88 	.db #0xa0	; 160
   4DC9 FB                   89 	.db #0xfb	; 251
   4DCA F3                   90 	.db #0xf3	; 243
   4DCB 50                   91 	.db #0x50	; 80	'P'
   4DCC A0                   92 	.db #0xa0	; 160
   4DCD FB                   93 	.db #0xfb	; 251
   4DCE F7                   94 	.db #0xf7	; 247
   4DCF 50                   95 	.db #0x50	; 80	'P'
   4DD0 A0                   96 	.db #0xa0	; 160
   4DD1 F3                   97 	.db #0xf3	; 243
   4DD2 F3                   98 	.db #0xf3	; 243
   4DD3 50                   99 	.db #0x50	; 80	'P'
   4DD4                     100 _rock_1:
   4DD4 A0                  101 	.db #0xa0	; 160
   4DD5 FB                  102 	.db #0xfb	; 251
   4DD6 F3                  103 	.db #0xf3	; 243
   4DD7 50                  104 	.db #0x50	; 80	'P'
   4DD8 A0                  105 	.db #0xa0	; 160
   4DD9 F3                  106 	.db #0xf3	; 243
   4DDA F3                  107 	.db #0xf3	; 243
   4DDB 50                  108 	.db #0x50	; 80	'P'
   4DDC F0                  109 	.db #0xf0	; 240
   4DDD 00                  110 	.db #0x00	; 0
   4DDE 00                  111 	.db #0x00	; 0
   4DDF F0                  112 	.db #0xf0	; 240
   4DE0 F0                  113 	.db #0xf0	; 240
   4DE1 F5                  114 	.db #0xf5	; 245
   4DE2 FA                  115 	.db #0xfa	; 250
   4DE3 F0                  116 	.db #0xf0	; 240
   4DE4 F0                  117 	.db #0xf0	; 240
   4DE5 F5                  118 	.db #0xf5	; 245
   4DE6 FA                  119 	.db #0xfa	; 250
   4DE7 F0                  120 	.db #0xf0	; 240
   4DE8 F0                  121 	.db #0xf0	; 240
   4DE9 F5                  122 	.db #0xf5	; 245
   4DEA FA                  123 	.db #0xfa	; 250
   4DEB F0                  124 	.db #0xf0	; 240
   4DEC F0                  125 	.db #0xf0	; 240
   4DED F5                  126 	.db #0xf5	; 245
   4DEE FA                  127 	.db #0xfa	; 250
   4DEF F0                  128 	.db #0xf0	; 240
   4DF0 FF                  129 	.db #0xff	; 255
   4DF1 FF                  130 	.db #0xff	; 255
   4DF2 FF                  131 	.db #0xff	; 255
   4DF3 FF                  132 	.db #0xff	; 255
                            133 	.area _INITIALIZER
                            134 	.area _CABS (ABS)
