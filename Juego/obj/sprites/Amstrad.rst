                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Amstrad
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _Amstrad_1
                             12 	.globl _Amstrad_0
                             13 	.globl _Amstrad
                             14 	.globl _AmstradPALETTE
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
   4A5F                      47 _AmstradPALETTE:
   4A5F 54                   48 	.db #0x54	; 84	'T'
   4A60 5B                   49 	.db #0x5b	; 91
   4A61 4F                   50 	.db #0x4f	; 79	'O'
   4A62 5D                   51 	.db #0x5d	; 93
   4A63 44                   52 	.db #0x44	; 68	'D'
   4A64 5F                   53 	.db #0x5f	; 95
   4A65 4B                   54 	.db #0x4b	; 75	'K'
   4A66 55                   55 	.db #0x55	; 85	'U'
   4A67 56                   56 	.db #0x56	; 86	'V'
   4A68 40                   57 	.db #0x40	; 64
   4A69 5C                   58 	.db #0x5c	; 92
   4A6A 46                   59 	.db #0x46	; 70	'F'
   4A6B 5B                   60 	.db #0x5b	; 91
   4A6C 5B                   61 	.db #0x5b	; 91
   4A6D 5E                   62 	.db #0x5e	; 94
   4A6E                      63 _Amstrad:
   4A6E 72 4A                64 	.dw _Amstrad_0
   4A70 92 4A                65 	.dw _Amstrad_1
   4A72                      66 _Amstrad_0:
   4A72 41                   67 	.db #0x41	; 65	'A'
   4A73 C2                   68 	.db #0xc2	; 194
   4A74 FC                   69 	.db #0xfc	; 252
   4A75 A8                   70 	.db #0xa8	; 168
   4A76 41                   71 	.db #0x41	; 65	'A'
   4A77 C2                   72 	.db #0xc2	; 194
   4A78 FC                   73 	.db #0xfc	; 252
   4A79 A8                   74 	.db #0xa8	; 168
   4A7A C3                   75 	.db #0xc3	; 195
   4A7B C2                   76 	.db #0xc2	; 194
   4A7C ED                   77 	.db #0xed	; 237
   4A7D 74                   78 	.db #0x74	; 116	't'
   4A7E C3                   79 	.db #0xc3	; 195
   4A7F C2                   80 	.db #0xc2	; 194
   4A80 ED                   81 	.db #0xed	; 237
   4A81 74                   82 	.db #0x74	; 116	't'
   4A82 C3                   83 	.db #0xc3	; 195
   4A83 C2                   84 	.db #0xc2	; 194
   4A84 B8                   85 	.db #0xb8	; 184
   4A85 DE                   86 	.db #0xde	; 222
   4A86 C3                   87 	.db #0xc3	; 195
   4A87 C2                   88 	.db #0xc2	; 194
   4A88 B8                   89 	.db #0xb8	; 184
   4A89 DE                   90 	.db #0xde	; 222
   4A8A C3                   91 	.db #0xc3	; 195
   4A8B C2                   92 	.db #0xc2	; 194
   4A8C B8                   93 	.db #0xb8	; 184
   4A8D 74                   94 	.db #0x74	; 116	't'
   4A8E C3                   95 	.db #0xc3	; 195
   4A8F C2                   96 	.db #0xc2	; 194
   4A90 B8                   97 	.db #0xb8	; 184
   4A91 74                   98 	.db #0x74	; 116	't'
   4A92                      99 _Amstrad_1:
   4A92 C3                  100 	.db #0xc3	; 195
   4A93 C2                  101 	.db #0xc2	; 194
   4A94 B8                  102 	.db #0xb8	; 184
   4A95 DE                  103 	.db #0xde	; 222
   4A96 C3                  104 	.db #0xc3	; 195
   4A97 C2                  105 	.db #0xc2	; 194
   4A98 B8                  106 	.db #0xb8	; 184
   4A99 DE                  107 	.db #0xde	; 222
   4A9A C3                  108 	.db #0xc3	; 195
   4A9B C2                  109 	.db #0xc2	; 194
   4A9C ED                  110 	.db #0xed	; 237
   4A9D DE                  111 	.db #0xde	; 222
   4A9E C3                  112 	.db #0xc3	; 195
   4A9F C2                  113 	.db #0xc2	; 194
   4AA0 ED                  114 	.db #0xed	; 237
   4AA1 DE                  115 	.db #0xde	; 222
   4AA2 41                  116 	.db #0x41	; 65	'A'
   4AA3 80                  117 	.db #0x80	; 128
   4AA4 FC                  118 	.db #0xfc	; 252
   4AA5 FC                  119 	.db #0xfc	; 252
   4AA6 41                  120 	.db #0x41	; 65	'A'
   4AA7 80                  121 	.db #0x80	; 128
   4AA8 FC                  122 	.db #0xfc	; 252
   4AA9 FC                  123 	.db #0xfc	; 252
   4AAA 10                  124 	.db #0x10	; 16
   4AAB 20                  125 	.db #0x20	; 32
   4AAC 30                  126 	.db #0x30	; 48	'0'
   4AAD 30                  127 	.db #0x30	; 48	'0'
   4AAE 10                  128 	.db #0x10	; 16
   4AAF 20                  129 	.db #0x20	; 32
   4AB0 30                  130 	.db #0x30	; 48	'0'
   4AB1 30                  131 	.db #0x30	; 48	'0'
                            132 	.area _INITIALIZER
                            133 	.area _CABS (ABS)
