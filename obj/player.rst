                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module player
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _array_1
                             12 	.globl _array_0
                             13 	.globl _tileset
                             14 	.globl _PALETTE
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
   4D4C                      47 _PALETTE:
   4D4C 54                   48 	.db #0x54	; 84	'T'
   4D4D 44                   49 	.db #0x44	; 68	'D'
   4D4E 55                   50 	.db #0x55	; 85	'U'
   4D4F 5C                   51 	.db #0x5c	; 92
   4D50 5D                   52 	.db #0x5d	; 93
   4D51 4C                   53 	.db #0x4c	; 76	'L'
   4D52 56                   54 	.db #0x56	; 86	'V'
   4D53 57                   55 	.db #0x57	; 87	'W'
   4D54 4E                   56 	.db #0x4e	; 78	'N'
   4D55 52                   57 	.db #0x52	; 82	'R'
   4D56 42                   58 	.db #0x42	; 66	'B'
   4D57 53                   59 	.db #0x53	; 83	'S'
   4D58 5A                   60 	.db #0x5a	; 90	'Z'
   4D59 59                   61 	.db #0x59	; 89	'Y'
   4D5A 4A                   62 	.db #0x4a	; 74	'J'
   4D5B 4B                   63 	.db #0x4b	; 75	'K'
   4D5C                      64 _tileset:
   4D5C 60 4D                65 	.dw _array_0
   4D5E 92 4D                66 	.dw _array_1
   4D60                      67 _array_0:
   4D60 00                   68 	.db #0x00	; 0
   4D61 00                   69 	.db #0x00	; 0
   4D62 00                   70 	.db #0x00	; 0
   4D63 00                   71 	.db #0x00	; 0
   4D64 00                   72 	.db #0x00	; 0
   4D65 55                   73 	.db #0x55	; 85	'U'
   4D66 FF                   74 	.db #0xff	; 255
   4D67 F0                   75 	.db #0xf0	; 240
   4D68 FF                   76 	.db #0xff	; 255
   4D69 AA                   77 	.db #0xaa	; 170
   4D6A 55                   78 	.db #0x55	; 85	'U'
   4D6B FF                   79 	.db #0xff	; 255
   4D6C F0                   80 	.db #0xf0	; 240
   4D6D FF                   81 	.db #0xff	; 255
   4D6E AA                   82 	.db #0xaa	; 170
   4D6F 55                   83 	.db #0x55	; 85	'U'
   4D70 FF                   84 	.db #0xff	; 255
   4D71 F0                   85 	.db #0xf0	; 240
   4D72 FF                   86 	.db #0xff	; 255
   4D73 AA                   87 	.db #0xaa	; 170
   4D74 55                   88 	.db #0x55	; 85	'U'
   4D75 FF                   89 	.db #0xff	; 255
   4D76 F0                   90 	.db #0xf0	; 240
   4D77 FF                   91 	.db #0xff	; 255
   4D78 AA                   92 	.db #0xaa	; 170
   4D79 55                   93 	.db #0x55	; 85	'U'
   4D7A FF                   94 	.db #0xff	; 255
   4D7B F0                   95 	.db #0xf0	; 240
   4D7C FF                   96 	.db #0xff	; 255
   4D7D AA                   97 	.db #0xaa	; 170
   4D7E 55                   98 	.db #0x55	; 85	'U'
   4D7F FF                   99 	.db #0xff	; 255
   4D80 F0                  100 	.db #0xf0	; 240
   4D81 FF                  101 	.db #0xff	; 255
   4D82 AA                  102 	.db #0xaa	; 170
   4D83 55                  103 	.db #0x55	; 85	'U'
   4D84 FF                  104 	.db #0xff	; 255
   4D85 F0                  105 	.db #0xf0	; 240
   4D86 FF                  106 	.db #0xff	; 255
   4D87 AA                  107 	.db #0xaa	; 170
   4D88 55                  108 	.db #0x55	; 85	'U'
   4D89 FF                  109 	.db #0xff	; 255
   4D8A F0                  110 	.db #0xf0	; 240
   4D8B FF                  111 	.db #0xff	; 255
   4D8C AA                  112 	.db #0xaa	; 170
   4D8D 55                  113 	.db #0x55	; 85	'U'
   4D8E FF                  114 	.db #0xff	; 255
   4D8F F0                  115 	.db #0xf0	; 240
   4D90 FF                  116 	.db #0xff	; 255
   4D91 AA                  117 	.db #0xaa	; 170
   4D92                     118 _array_1:
   4D92 55                  119 	.db #0x55	; 85	'U'
   4D93 FF                  120 	.db #0xff	; 255
   4D94 F0                  121 	.db #0xf0	; 240
   4D95 FF                  122 	.db #0xff	; 255
   4D96 AA                  123 	.db #0xaa	; 170
   4D97 55                  124 	.db #0x55	; 85	'U'
   4D98 FF                  125 	.db #0xff	; 255
   4D99 F0                  126 	.db #0xf0	; 240
   4D9A FF                  127 	.db #0xff	; 255
   4D9B AA                  128 	.db #0xaa	; 170
   4D9C 55                  129 	.db #0x55	; 85	'U'
   4D9D FF                  130 	.db #0xff	; 255
   4D9E F0                  131 	.db #0xf0	; 240
   4D9F FF                  132 	.db #0xff	; 255
   4DA0 AA                  133 	.db #0xaa	; 170
   4DA1 55                  134 	.db #0x55	; 85	'U'
   4DA2 FF                  135 	.db #0xff	; 255
   4DA3 F0                  136 	.db #0xf0	; 240
   4DA4 FF                  137 	.db #0xff	; 255
   4DA5 AA                  138 	.db #0xaa	; 170
   4DA6 55                  139 	.db #0x55	; 85	'U'
   4DA7 FF                  140 	.db #0xff	; 255
   4DA8 F0                  141 	.db #0xf0	; 240
   4DA9 FF                  142 	.db #0xff	; 255
   4DAA AA                  143 	.db #0xaa	; 170
   4DAB 55                  144 	.db #0x55	; 85	'U'
   4DAC FF                  145 	.db #0xff	; 255
   4DAD F0                  146 	.db #0xf0	; 240
   4DAE FF                  147 	.db #0xff	; 255
   4DAF AA                  148 	.db #0xaa	; 170
   4DB0 55                  149 	.db #0x55	; 85	'U'
   4DB1 FF                  150 	.db #0xff	; 255
   4DB2 F0                  151 	.db #0xf0	; 240
   4DB3 FF                  152 	.db #0xff	; 255
   4DB4 AA                  153 	.db #0xaa	; 170
   4DB5 55                  154 	.db #0x55	; 85	'U'
   4DB6 FF                  155 	.db #0xff	; 255
   4DB7 F0                  156 	.db #0xf0	; 240
   4DB8 FF                  157 	.db #0xff	; 255
   4DB9 AA                  158 	.db #0xaa	; 170
   4DBA 55                  159 	.db #0x55	; 85	'U'
   4DBB FF                  160 	.db #0xff	; 255
   4DBC F0                  161 	.db #0xf0	; 240
   4DBD FF                  162 	.db #0xff	; 255
   4DBE AA                  163 	.db #0xaa	; 170
   4DBF 00                  164 	.db #0x00	; 0
   4DC0 00                  165 	.db #0x00	; 0
   4DC1 00                  166 	.db #0x00	; 0
   4DC2 00                  167 	.db #0x00	; 0
   4DC3 00                  168 	.db #0x00	; 0
                            169 	.area _INITIALIZER
                            170 	.area _CABS (ABS)
