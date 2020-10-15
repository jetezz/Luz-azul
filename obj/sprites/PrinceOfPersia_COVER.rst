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
   486B                      47 _PrinceOfPersia_COVERPALETTE:
   486B 54                   48 	.db #0x54	; 84	'T'
   486C 44                   49 	.db #0x44	; 68	'D'
   486D 55                   50 	.db #0x55	; 85	'U'
   486E 5D                   51 	.db #0x5d	; 93
   486F 56                   52 	.db #0x56	; 86	'V'
   4870 46                   53 	.db #0x46	; 70	'F'
   4871 57                   54 	.db #0x57	; 87	'W'
   4872 5E                   55 	.db #0x5e	; 94
   4873 40                   56 	.db #0x40	; 64
   4874 5F                   57 	.db #0x5f	; 95
   4875 4F                   58 	.db #0x4f	; 79	'O'
   4876 5B                   59 	.db #0x5b	; 91
   4877 4B                   60 	.db #0x4b	; 75	'K'
   4878                      61 _PrinceOfPersia_COVER:
   4878 7C 48                62 	.dw _PrinceOfPersia_COVER_0
   487A 9C 48                63 	.dw _PrinceOfPersia_COVER_1
   487C                      64 _PrinceOfPersia_COVER_0:
   487C FC                   65 	.db #0xfc	; 252
   487D FC                   66 	.db #0xfc	; 252
   487E FC                   67 	.db #0xfc	; 252
   487F FC                   68 	.db #0xfc	; 252
   4880 FC                   69 	.db #0xfc	; 252
   4881 FC                   70 	.db #0xfc	; 252
   4882 FC                   71 	.db #0xfc	; 252
   4883 FC                   72 	.db #0xfc	; 252
   4884 FC                   73 	.db #0xfc	; 252
   4885 FC                   74 	.db #0xfc	; 252
   4886 FC                   75 	.db #0xfc	; 252
   4887 FC                   76 	.db #0xfc	; 252
   4888 FC                   77 	.db #0xfc	; 252
   4889 FC                   78 	.db #0xfc	; 252
   488A FC                   79 	.db #0xfc	; 252
   488B FC                   80 	.db #0xfc	; 252
   488C FC                   81 	.db #0xfc	; 252
   488D FC                   82 	.db #0xfc	; 252
   488E FC                   83 	.db #0xfc	; 252
   488F FC                   84 	.db #0xfc	; 252
   4890 FC                   85 	.db #0xfc	; 252
   4891 FC                   86 	.db #0xfc	; 252
   4892 FC                   87 	.db #0xfc	; 252
   4893 FC                   88 	.db #0xfc	; 252
   4894 FC                   89 	.db #0xfc	; 252
   4895 FC                   90 	.db #0xfc	; 252
   4896 FC                   91 	.db #0xfc	; 252
   4897 FC                   92 	.db #0xfc	; 252
   4898 FC                   93 	.db #0xfc	; 252
   4899 FC                   94 	.db #0xfc	; 252
   489A FC                   95 	.db #0xfc	; 252
   489B FC                   96 	.db #0xfc	; 252
   489C                      97 _PrinceOfPersia_COVER_1:
   489C FC                   98 	.db #0xfc	; 252
   489D FC                   99 	.db #0xfc	; 252
   489E FC                  100 	.db #0xfc	; 252
   489F FC                  101 	.db #0xfc	; 252
   48A0 FC                  102 	.db #0xfc	; 252
   48A1 FC                  103 	.db #0xfc	; 252
   48A2 FC                  104 	.db #0xfc	; 252
   48A3 FC                  105 	.db #0xfc	; 252
   48A4 FC                  106 	.db #0xfc	; 252
   48A5 FC                  107 	.db #0xfc	; 252
   48A6 FC                  108 	.db #0xfc	; 252
   48A7 FC                  109 	.db #0xfc	; 252
   48A8 FC                  110 	.db #0xfc	; 252
   48A9 FC                  111 	.db #0xfc	; 252
   48AA FC                  112 	.db #0xfc	; 252
   48AB FC                  113 	.db #0xfc	; 252
   48AC FC                  114 	.db #0xfc	; 252
   48AD FC                  115 	.db #0xfc	; 252
   48AE FC                  116 	.db #0xfc	; 252
   48AF FC                  117 	.db #0xfc	; 252
   48B0 FC                  118 	.db #0xfc	; 252
   48B1 FC                  119 	.db #0xfc	; 252
   48B2 FC                  120 	.db #0xfc	; 252
   48B3 FC                  121 	.db #0xfc	; 252
   48B4 FC                  122 	.db #0xfc	; 252
   48B5 FC                  123 	.db #0xfc	; 252
   48B6 FC                  124 	.db #0xfc	; 252
   48B7 FC                  125 	.db #0xfc	; 252
   48B8 FC                  126 	.db #0xfc	; 252
   48B9 FC                  127 	.db #0xfc	; 252
   48BA FC                  128 	.db #0xfc	; 252
   48BB FC                  129 	.db #0xfc	; 252
                            130 	.area _INITIALIZER
                            131 	.area _CABS (ABS)
