                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module rockInmovil
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _rockInmovil_1
                             12 	.globl _rockInmovil_0
                             13 	.globl _rockInmovil
                             14 	.globl _rockInmovilPALETTE
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
   4E9C                      47 _rockInmovilPALETTE:
   4E9C 54                   48 	.db #0x54	; 84	'T'
   4E9D 5D                   49 	.db #0x5d	; 93
   4E9E 4E                   50 	.db #0x4e	; 78	'N'
   4E9F 44                   51 	.db #0x44	; 68	'D'
   4EA0 46                   52 	.db #0x46	; 70	'F'
   4EA1 42                   53 	.db #0x42	; 66	'B'
   4EA2 5C                   54 	.db #0x5c	; 92
   4EA3 47                   55 	.db #0x47	; 71	'G'
   4EA4 45                   56 	.db #0x45	; 69	'E'
   4EA5 58                   57 	.db #0x58	; 88	'X'
   4EA6 5D                   58 	.db #0x5d	; 93
   4EA7 43                   59 	.db #0x43	; 67	'C'
   4EA8 4F                   60 	.db #0x4f	; 79	'O'
   4EA9 40                   61 	.db #0x40	; 64
   4EAA 4C                   62 	.db #0x4c	; 76	'L'
   4EAB 4B                   63 	.db #0x4b	; 75	'K'
   4EAC                      64 _rockInmovil:
   4EAC B0 4E                65 	.dw _rockInmovil_0
   4EAE D0 4E                66 	.dw _rockInmovil_1
   4EB0                      67 _rockInmovil_0:
   4EB0 00                   68 	.db #0x00	; 0
   4EB1 00                   69 	.db #0x00	; 0
   4EB2 00                   70 	.db #0x00	; 0
   4EB3 00                   71 	.db #0x00	; 0
   4EB4 14                   72 	.db #0x14	; 20
   4EB5 2C                   73 	.db #0x2c	; 44
   4EB6 0C                   74 	.db #0x0c	; 12
   4EB7 08                   75 	.db #0x08	; 8
   4EB8 55                   76 	.db #0x55	; 85	'U'
   4EB9 FF                   77 	.db #0xff	; 255
   4EBA FF                   78 	.db #0xff	; 255
   4EBB AA                   79 	.db #0xaa	; 170
   4EBC 2A                   80 	.db #0x2a	; 42
   4EBD FF                   81 	.db #0xff	; 255
   4EBE FF                   82 	.db #0xff	; 255
   4EBF 15                   83 	.db #0x15	; 21
   4EC0 2A                   84 	.db #0x2a	; 42
   4EC1 FB                   85 	.db #0xfb	; 251
   4EC2 F7                   86 	.db #0xf7	; 247
   4EC3 15                   87 	.db #0x15	; 21
   4EC4 2A                   88 	.db #0x2a	; 42
   4EC5 FB                   89 	.db #0xfb	; 251
   4EC6 F3                   90 	.db #0xf3	; 243
   4EC7 15                   91 	.db #0x15	; 21
   4EC8 2A                   92 	.db #0x2a	; 42
   4EC9 FB                   93 	.db #0xfb	; 251
   4ECA F7                   94 	.db #0xf7	; 247
   4ECB 15                   95 	.db #0x15	; 21
   4ECC 2A                   96 	.db #0x2a	; 42
   4ECD F3                   97 	.db #0xf3	; 243
   4ECE F3                   98 	.db #0xf3	; 243
   4ECF 15                   99 	.db #0x15	; 21
   4ED0                     100 _rockInmovil_1:
   4ED0 2A                  101 	.db #0x2a	; 42
   4ED1 FB                  102 	.db #0xfb	; 251
   4ED2 F3                  103 	.db #0xf3	; 243
   4ED3 15                  104 	.db #0x15	; 21
   4ED4 2A                  105 	.db #0x2a	; 42
   4ED5 F3                  106 	.db #0xf3	; 243
   4ED6 F3                  107 	.db #0xf3	; 243
   4ED7 15                  108 	.db #0x15	; 21
   4ED8 3F                  109 	.db #0x3f	; 63
   4ED9 00                  110 	.db #0x00	; 0
   4EDA 00                  111 	.db #0x00	; 0
   4EDB 3F                  112 	.db #0x3f	; 63
   4EDC 3F                  113 	.db #0x3f	; 63
   4EDD 7F                  114 	.db #0x7f	; 127
   4EDE BF                  115 	.db #0xbf	; 191
   4EDF 3F                  116 	.db #0x3f	; 63
   4EE0 3F                  117 	.db #0x3f	; 63
   4EE1 7F                  118 	.db #0x7f	; 127
   4EE2 BF                  119 	.db #0xbf	; 191
   4EE3 3F                  120 	.db #0x3f	; 63
   4EE4 3F                  121 	.db #0x3f	; 63
   4EE5 7F                  122 	.db #0x7f	; 127
   4EE6 BF                  123 	.db #0xbf	; 191
   4EE7 3F                  124 	.db #0x3f	; 63
   4EE8 3F                  125 	.db #0x3f	; 63
   4EE9 7F                  126 	.db #0x7f	; 127
   4EEA BF                  127 	.db #0xbf	; 191
   4EEB 3F                  128 	.db #0x3f	; 63
   4EEC FF                  129 	.db #0xff	; 255
   4EED FF                  130 	.db #0xff	; 255
   4EEE FF                  131 	.db #0xff	; 255
   4EEF FF                  132 	.db #0xff	; 255
                            133 	.area _INITIALIZER
                            134 	.area _CABS (ABS)
