                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Character_Father
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _Character_Father_1
                             12 	.globl _Character_Father_0
                             13 	.globl _Character_Father
                             14 	.globl _Character_FatherPALETTE
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
   4BAB                      47 _Character_FatherPALETTE:
   4BAB 54                   48 	.db #0x54	; 84	'T'
   4BAC 5B                   49 	.db #0x5b	; 91
   4BAD 4F                   50 	.db #0x4f	; 79	'O'
   4BAE 5D                   51 	.db #0x5d	; 93
   4BAF 44                   52 	.db #0x44	; 68	'D'
   4BB0 5F                   53 	.db #0x5f	; 95
   4BB1 4B                   54 	.db #0x4b	; 75	'K'
   4BB2 55                   55 	.db #0x55	; 85	'U'
   4BB3 56                   56 	.db #0x56	; 86	'V'
   4BB4 40                   57 	.db #0x40	; 64
   4BB5 5C                   58 	.db #0x5c	; 92
   4BB6 46                   59 	.db #0x46	; 70	'F'
   4BB7 5B                   60 	.db #0x5b	; 91
   4BB8 5B                   61 	.db #0x5b	; 91
   4BB9 5E                   62 	.db #0x5e	; 94
   4BBA                      63 _Character_Father:
   4BBA BE 4B                64 	.dw _Character_Father_0
   4BBC DE 4B                65 	.dw _Character_Father_1
   4BBE                      66 _Character_Father_0:
   4BBE 00                   67 	.db #0x00	; 0
   4BBF 41                   68 	.db #0x41	; 65	'A'
   4BC0 C3                   69 	.db #0xc3	; 195
   4BC1 00                   70 	.db #0x00	; 0
   4BC2 00                   71 	.db #0x00	; 0
   4BC3 41                   72 	.db #0x41	; 65	'A'
   4BC4 C3                   73 	.db #0xc3	; 195
   4BC5 00                   74 	.db #0x00	; 0
   4BC6 00                   75 	.db #0x00	; 0
   4BC7 96                   76 	.db #0x96	; 150
   4BC8 1C                   77 	.db #0x1c	; 28
   4BC9 00                   78 	.db #0x00	; 0
   4BCA 00                   79 	.db #0x00	; 0
   4BCB 96                   80 	.db #0x96	; 150
   4BCC 1C                   81 	.db #0x1c	; 28
   4BCD 00                   82 	.db #0x00	; 0
   4BCE 00                   83 	.db #0x00	; 0
   4BCF 86                   84 	.db #0x86	; 134
   4BD0 49                   85 	.db #0x49	; 73	'I'
   4BD1 00                   86 	.db #0x00	; 0
   4BD2 00                   87 	.db #0x00	; 0
   4BD3 86                   88 	.db #0x86	; 134
   4BD4 49                   89 	.db #0x49	; 73	'I'
   4BD5 00                   90 	.db #0x00	; 0
   4BD6 00                   91 	.db #0x00	; 0
   4BD7 10                   92 	.db #0x10	; 16
   4BD8 20                   93 	.db #0x20	; 32
   4BD9 40                   94 	.db #0x40	; 64
   4BDA 00                   95 	.db #0x00	; 0
   4BDB 10                   96 	.db #0x10	; 16
   4BDC 20                   97 	.db #0x20	; 32
   4BDD 40                   98 	.db #0x40	; 64
   4BDE                      99 _Character_Father_1:
   4BDE 10                  100 	.db #0x10	; 16
   4BDF 30                  101 	.db #0x30	; 48	'0'
   4BE0 30                  102 	.db #0x30	; 48	'0'
   4BE1 14                  103 	.db #0x14	; 20
   4BE2 10                  104 	.db #0x10	; 16
   4BE3 30                  105 	.db #0x30	; 48	'0'
   4BE4 30                  106 	.db #0x30	; 48	'0'
   4BE5 14                  107 	.db #0x14	; 20
   4BE6 08                  108 	.db #0x08	; 8
   4BE7 30                  109 	.db #0x30	; 48	'0'
   4BE8 30                  110 	.db #0x30	; 48	'0'
   4BE9 0C                  111 	.db #0x0c	; 12
   4BEA 08                  112 	.db #0x08	; 8
   4BEB 30                  113 	.db #0x30	; 48	'0'
   4BEC 30                  114 	.db #0x30	; 48	'0'
   4BED 0C                  115 	.db #0x0c	; 12
   4BEE 00                  116 	.db #0x00	; 0
   4BEF 8A                  117 	.db #0x8a	; 138
   4BF0 8A                  118 	.db #0x8a	; 138
   4BF1 00                  119 	.db #0x00	; 0
   4BF2 00                  120 	.db #0x00	; 0
   4BF3 8A                  121 	.db #0x8a	; 138
   4BF4 8A                  122 	.db #0x8a	; 138
   4BF5 00                  123 	.db #0x00	; 0
   4BF6 41                  124 	.db #0x41	; 65	'A'
   4BF7 82                  125 	.db #0x82	; 130
   4BF8 C3                  126 	.db #0xc3	; 195
   4BF9 00                  127 	.db #0x00	; 0
   4BFA 41                  128 	.db #0x41	; 65	'A'
   4BFB 82                  129 	.db #0x82	; 130
   4BFC C3                  130 	.db #0xc3	; 195
   4BFD 00                  131 	.db #0x00	; 0
                            132 	.area _INITIALIZER
                            133 	.area _CABS (ABS)
