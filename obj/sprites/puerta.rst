                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module puerta
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _puertalSprite_1
                             12 	.globl _puertalSprite_0
                             13 	.globl _puertaSprite
                             14 	.globl _puertaPALETTE
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
   4DA0                      47 _puertaPALETTE:
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
   4DB0                      64 _puertaSprite:
   4DB0 B4 4D                65 	.dw _puertalSprite_0
   4DB2 D4 4D                66 	.dw _puertalSprite_1
   4DB4                      67 _puertalSprite_0:
   4DB4 3C                   68 	.db #0x3c	; 60
   4DB5 3C                   69 	.db #0x3c	; 60
   4DB6 3C                   70 	.db #0x3c	; 60
   4DB7 3C                   71 	.db #0x3c	; 60
   4DB8 3C                   72 	.db #0x3c	; 60
   4DB9 3C                   73 	.db #0x3c	; 60
   4DBA 3C                   74 	.db #0x3c	; 60
   4DBB 3C                   75 	.db #0x3c	; 60
   4DBC 3C                   76 	.db #0x3c	; 60
   4DBD 3C                   77 	.db #0x3c	; 60
   4DBE 3C                   78 	.db #0x3c	; 60
   4DBF 3C                   79 	.db #0x3c	; 60
   4DC0 3C                   80 	.db #0x3c	; 60
   4DC1 3C                   81 	.db #0x3c	; 60
   4DC2 3C                   82 	.db #0x3c	; 60
   4DC3 3C                   83 	.db #0x3c	; 60
   4DC4 3C                   84 	.db #0x3c	; 60
   4DC5 3C                   85 	.db #0x3c	; 60
   4DC6 3C                   86 	.db #0x3c	; 60
   4DC7 3C                   87 	.db #0x3c	; 60
   4DC8 3C                   88 	.db #0x3c	; 60
   4DC9 3C                   89 	.db #0x3c	; 60
   4DCA 3C                   90 	.db #0x3c	; 60
   4DCB 3C                   91 	.db #0x3c	; 60
   4DCC 3C                   92 	.db #0x3c	; 60
   4DCD 3C                   93 	.db #0x3c	; 60
   4DCE 3C                   94 	.db #0x3c	; 60
   4DCF 3C                   95 	.db #0x3c	; 60
   4DD0 0C                   96 	.db #0x0c	; 12
   4DD1 0C                   97 	.db #0x0c	; 12
   4DD2 0C                   98 	.db #0x0c	; 12
   4DD3 0C                   99 	.db #0x0c	; 12
   4DD4                     100 _puertalSprite_1:
   4DD4 3C                  101 	.db #0x3c	; 60
   4DD5 3C                  102 	.db #0x3c	; 60
   4DD6 3C                  103 	.db #0x3c	; 60
   4DD7 3C                  104 	.db #0x3c	; 60
   4DD8 3C                  105 	.db #0x3c	; 60
   4DD9 3C                  106 	.db #0x3c	; 60
   4DDA 3C                  107 	.db #0x3c	; 60
   4DDB 3C                  108 	.db #0x3c	; 60
   4DDC 3C                  109 	.db #0x3c	; 60
   4DDD 14                  110 	.db #0x14	; 20
   4DDE 28                  111 	.db #0x28	; 40
   4DDF 3C                  112 	.db #0x3c	; 60
   4DE0 3C                  113 	.db #0x3c	; 60
   4DE1 14                  114 	.db #0x14	; 20
   4DE2 28                  115 	.db #0x28	; 40
   4DE3 3C                  116 	.db #0x3c	; 60
   4DE4 3C                  117 	.db #0x3c	; 60
   4DE5 14                  118 	.db #0x14	; 20
   4DE6 28                  119 	.db #0x28	; 40
   4DE7 3C                  120 	.db #0x3c	; 60
   4DE8 3C                  121 	.db #0x3c	; 60
   4DE9 14                  122 	.db #0x14	; 20
   4DEA 28                  123 	.db #0x28	; 40
   4DEB 3C                  124 	.db #0x3c	; 60
   4DEC 3C                  125 	.db #0x3c	; 60
   4DED 3C                  126 	.db #0x3c	; 60
   4DEE 3C                  127 	.db #0x3c	; 60
   4DEF 3C                  128 	.db #0x3c	; 60
   4DF0 0C                  129 	.db #0x0c	; 12
   4DF1 0C                  130 	.db #0x0c	; 12
   4DF2 0C                  131 	.db #0x0c	; 12
   4DF3 0C                  132 	.db #0x0c	; 12
                            133 	.area _INITIALIZER
                            134 	.area _CABS (ABS)
