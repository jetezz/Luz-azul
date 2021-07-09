                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module PrinceOfPersia_COVER
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _PrinceOfPersia_COVER_1
                             12 	.globl _PrinceOfPersia_COVER_0
                             13 	.globl _PrinceOfPersia_COVER
                             14 	.globl _PrinceOfPersia_COVERPALETTE
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
   486D                      47 _PrinceOfPersia_COVERPALETTE:
   486D 54                   48 	.db #0x54	; 84	'T'
   486E 5B                   49 	.db #0x5b	; 91
   486F 4F                   50 	.db #0x4f	; 79	'O'
   4870 5D                   51 	.db #0x5d	; 93
   4871 44                   52 	.db #0x44	; 68	'D'
   4872 5F                   53 	.db #0x5f	; 95
   4873 4B                   54 	.db #0x4b	; 75	'K'
   4874 55                   55 	.db #0x55	; 85	'U'
   4875 56                   56 	.db #0x56	; 86	'V'
   4876 40                   57 	.db #0x40	; 64
   4877 5C                   58 	.db #0x5c	; 92
   4878 46                   59 	.db #0x46	; 70	'F'
   4879 5B                   60 	.db #0x5b	; 91
   487A 5B                   61 	.db #0x5b	; 91
   487B 5E                   62 	.db #0x5e	; 94
   487C                      63 _PrinceOfPersia_COVER:
   487C 80 48                64 	.dw _PrinceOfPersia_COVER_0
   487E A0 48                65 	.dw _PrinceOfPersia_COVER_1
   4880                      66 _PrinceOfPersia_COVER_0:
   4880 2F                   67 	.db #0x2f	; 47
   4881 0F                   68 	.db #0x0f	; 15
   4882 0F                   69 	.db #0x0f	; 15
   4883 1F                   70 	.db #0x1f	; 31
   4884 2F                   71 	.db #0x2f	; 47
   4885 0F                   72 	.db #0x0f	; 15
   4886 0F                   73 	.db #0x0f	; 15
   4887 1F                   74 	.db #0x1f	; 31
   4888 1F                   75 	.db #0x1f	; 31
   4889 3F                   76 	.db #0x3f	; 63
   488A 3F                   77 	.db #0x3f	; 63
   488B 2F                   78 	.db #0x2f	; 47
   488C 1F                   79 	.db #0x1f	; 31
   488D 3F                   80 	.db #0x3f	; 63
   488E 3F                   81 	.db #0x3f	; 63
   488F 2F                   82 	.db #0x2f	; 47
   4890 1F                   83 	.db #0x1f	; 31
   4891 1F                   84 	.db #0x1f	; 31
   4892 0F                   85 	.db #0x0f	; 15
   4893 2F                   86 	.db #0x2f	; 47
   4894 1F                   87 	.db #0x1f	; 31
   4895 1F                   88 	.db #0x1f	; 31
   4896 0F                   89 	.db #0x0f	; 15
   4897 2F                   90 	.db #0x2f	; 47
   4898 1F                   91 	.db #0x1f	; 31
   4899 0F                   92 	.db #0x0f	; 15
   489A 1F                   93 	.db #0x1f	; 31
   489B 2F                   94 	.db #0x2f	; 47
   489C 1F                   95 	.db #0x1f	; 31
   489D 0F                   96 	.db #0x0f	; 15
   489E 1F                   97 	.db #0x1f	; 31
   489F 2F                   98 	.db #0x2f	; 47
   48A0                      99 _PrinceOfPersia_COVER_1:
   48A0 1F                  100 	.db #0x1f	; 31
   48A1 1F                  101 	.db #0x1f	; 31
   48A2 0F                  102 	.db #0x0f	; 15
   48A3 2F                  103 	.db #0x2f	; 47
   48A4 1F                  104 	.db #0x1f	; 31
   48A5 1F                  105 	.db #0x1f	; 31
   48A6 0F                  106 	.db #0x0f	; 15
   48A7 2F                  107 	.db #0x2f	; 47
   48A8 1F                  108 	.db #0x1f	; 31
   48A9 0F                  109 	.db #0x0f	; 15
   48AA 0F                  110 	.db #0x0f	; 15
   48AB 2F                  111 	.db #0x2f	; 47
   48AC 1F                  112 	.db #0x1f	; 31
   48AD 0F                  113 	.db #0x0f	; 15
   48AE 0F                  114 	.db #0x0f	; 15
   48AF 2F                  115 	.db #0x2f	; 47
   48B0 1F                  116 	.db #0x1f	; 31
   48B1 3F                  117 	.db #0x3f	; 63
   48B2 3F                  118 	.db #0x3f	; 63
   48B3 2F                  119 	.db #0x2f	; 47
   48B4 1F                  120 	.db #0x1f	; 31
   48B5 3F                  121 	.db #0x3f	; 63
   48B6 3F                  122 	.db #0x3f	; 63
   48B7 2F                  123 	.db #0x2f	; 47
   48B8 2F                  124 	.db #0x2f	; 47
   48B9 0F                  125 	.db #0x0f	; 15
   48BA 0F                  126 	.db #0x0f	; 15
   48BB 1F                  127 	.db #0x1f	; 31
   48BC 2F                  128 	.db #0x2f	; 47
   48BD 0F                  129 	.db #0x0f	; 15
   48BE 0F                  130 	.db #0x0f	; 15
   48BF 1F                  131 	.db #0x1f	; 31
                            132 	.area _INITIALIZER
                            133 	.area _CABS (ABS)
