                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module portal
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _portalSprite_1
                             12 	.globl _portalSprite_0
                             13 	.globl _portalSprite
                             14 	.globl _portalPALETTE
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
   4DA0                      47 _portalPALETTE:
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
   4DB0                      64 _portalSprite:
   4DB0 B4 4D                65 	.dw _portalSprite_0
   4DB2 D4 4D                66 	.dw _portalSprite_1
   4DB4                      67 _portalSprite_0:
   4DB4 0C                   68 	.db #0x0c	; 12
   4DB5 0C                   69 	.db #0x0c	; 12
   4DB6 0C                   70 	.db #0x0c	; 12
   4DB7 0C                   71 	.db #0x0c	; 12
   4DB8 0C                   72 	.db #0x0c	; 12
   4DB9 0C                   73 	.db #0x0c	; 12
   4DBA 0C                   74 	.db #0x0c	; 12
   4DBB 0C                   75 	.db #0x0c	; 12
   4DBC 3F                   76 	.db #0x3f	; 63
   4DBD 3F                   77 	.db #0x3f	; 63
   4DBE 3F                   78 	.db #0x3f	; 63
   4DBF 3F                   79 	.db #0x3f	; 63
   4DC0 3F                   80 	.db #0x3f	; 63
   4DC1 3F                   81 	.db #0x3f	; 63
   4DC2 3F                   82 	.db #0x3f	; 63
   4DC3 3F                   83 	.db #0x3f	; 63
   4DC4 3F                   84 	.db #0x3f	; 63
   4DC5 2E                   85 	.db #0x2e	; 46
   4DC6 BF                   86 	.db #0xbf	; 191
   4DC7 3F                   87 	.db #0x3f	; 63
   4DC8 3F                   88 	.db #0x3f	; 63
   4DC9 4D                   89 	.db #0x4d	; 77	'M'
   4DCA DF                   90 	.db #0xdf	; 223
   4DCB 3F                   91 	.db #0x3f	; 63
   4DCC 2E                   92 	.db #0x2e	; 46
   4DCD CF                   93 	.db #0xcf	; 207
   4DCE CF                   94 	.db #0xcf	; 207
   4DCF BF                   95 	.db #0xbf	; 191
   4DD0 2E                   96 	.db #0x2e	; 46
   4DD1 CF                   97 	.db #0xcf	; 207
   4DD2 CF                   98 	.db #0xcf	; 207
   4DD3 BF                   99 	.db #0xbf	; 191
   4DD4                     100 _portalSprite_1:
   4DD4 2E                  101 	.db #0x2e	; 46
   4DD5 CF                  102 	.db #0xcf	; 207
   4DD6 CF                  103 	.db #0xcf	; 207
   4DD7 BF                  104 	.db #0xbf	; 191
   4DD8 3F                  105 	.db #0x3f	; 63
   4DD9 4D                  106 	.db #0x4d	; 77	'M'
   4DDA DF                  107 	.db #0xdf	; 223
   4DDB 3F                  108 	.db #0x3f	; 63
   4DDC 3F                  109 	.db #0x3f	; 63
   4DDD 2E                  110 	.db #0x2e	; 46
   4DDE BF                  111 	.db #0xbf	; 191
   4DDF 3F                  112 	.db #0x3f	; 63
   4DE0 3F                  113 	.db #0x3f	; 63
   4DE1 3F                  114 	.db #0x3f	; 63
   4DE2 3F                  115 	.db #0x3f	; 63
   4DE3 3F                  116 	.db #0x3f	; 63
   4DE4 3F                  117 	.db #0x3f	; 63
   4DE5 3F                  118 	.db #0x3f	; 63
   4DE6 3F                  119 	.db #0x3f	; 63
   4DE7 3F                  120 	.db #0x3f	; 63
   4DE8 3F                  121 	.db #0x3f	; 63
   4DE9 3F                  122 	.db #0x3f	; 63
   4DEA 3F                  123 	.db #0x3f	; 63
   4DEB 3F                  124 	.db #0x3f	; 63
   4DEC 0C                  125 	.db #0x0c	; 12
   4DED 0C                  126 	.db #0x0c	; 12
   4DEE 0C                  127 	.db #0x0c	; 12
   4DEF 0C                  128 	.db #0x0c	; 12
   4DF0 0C                  129 	.db #0x0c	; 12
   4DF1 0C                  130 	.db #0x0c	; 12
   4DF2 0C                  131 	.db #0x0c	; 12
   4DF3 0C                  132 	.db #0x0c	; 12
                            133 	.area _INITIALIZER
                            134 	.area _CABS (ABS)
