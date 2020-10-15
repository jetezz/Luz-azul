                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Character_Brother
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _Character_Brother_1
                             12 	.globl _Character_Brother_0
                             13 	.globl _Character_Brother
                             14 	.globl _Character_BrotherPALETTE
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
   4B95                      47 _Character_BrotherPALETTE:
   4B95 54                   48 	.db #0x54	; 84	'T'
   4B96 44                   49 	.db #0x44	; 68	'D'
   4B97 55                   50 	.db #0x55	; 85	'U'
   4B98 5D                   51 	.db #0x5d	; 93
   4B99 56                   52 	.db #0x56	; 86	'V'
   4B9A 46                   53 	.db #0x46	; 70	'F'
   4B9B 57                   54 	.db #0x57	; 87	'W'
   4B9C 5E                   55 	.db #0x5e	; 94
   4B9D 40                   56 	.db #0x40	; 64
   4B9E 5F                   57 	.db #0x5f	; 95
   4B9F 4F                   58 	.db #0x4f	; 79	'O'
   4BA0 5B                   59 	.db #0x5b	; 91
   4BA1 4B                   60 	.db #0x4b	; 75	'K'
   4BA2                      61 _Character_Brother:
   4BA2 A6 4B                62 	.dw _Character_Brother_0
   4BA4 BE 4B                63 	.dw _Character_Brother_1
   4BA6                      64 _Character_Brother_0:
   4BA6 F0                   65 	.db #0xf0	; 240
   4BA7 78                   66 	.db #0x78	; 120	'x'
   4BA8 00                   67 	.db #0x00	; 0
   4BA9 F0                   68 	.db #0xf0	; 240
   4BAA 78                   69 	.db #0x78	; 120	'x'
   4BAB 00                   70 	.db #0x00	; 0
   4BAC B1                   71 	.db #0xb1	; 177
   4BAD 1B                   72 	.db #0x1b	; 27
   4BAE 00                   73 	.db #0x00	; 0
   4BAF B1                   74 	.db #0xb1	; 177
   4BB0 1B                   75 	.db #0x1b	; 27
   4BB1 00                   76 	.db #0x00	; 0
   4BB2 A5                   77 	.db #0xa5	; 165
   4BB3 5A                   78 	.db #0x5a	; 90	'Z'
   4BB4 00                   79 	.db #0x00	; 0
   4BB5 A5                   80 	.db #0xa5	; 165
   4BB6 5A                   81 	.db #0x5a	; 90	'Z'
   4BB7 00                   82 	.db #0x00	; 0
   4BB8 04                   83 	.db #0x04	; 4
   4BB9 C0                   84 	.db #0xc0	; 192
   4BBA 05                   85 	.db #0x05	; 5
   4BBB 04                   86 	.db #0x04	; 4
   4BBC C0                   87 	.db #0xc0	; 192
   4BBD 05                   88 	.db #0x05	; 5
   4BBE                      89 _Character_Brother_1:
   4BBE 48                   90 	.db #0x48	; 72	'H'
   4BBF C0                   91 	.db #0xc0	; 192
   4BC0 1B                   92 	.db #0x1b	; 27
   4BC1 48                   93 	.db #0x48	; 72	'H'
   4BC2 C0                   94 	.db #0xc0	; 192
   4BC3 1B                   95 	.db #0x1b	; 27
   4BC4 4A                   96 	.db #0x4a	; 74	'J'
   4BC5 C0                   97 	.db #0xc0	; 192
   4BC6 11                   98 	.db #0x11	; 17
   4BC7 4A                   99 	.db #0x4a	; 74	'J'
   4BC8 C0                  100 	.db #0xc0	; 192
   4BC9 11                  101 	.db #0x11	; 17
   4BCA 85                  102 	.db #0x85	; 133
   4BCB 80                  103 	.db #0x80	; 128
   4BCC 00                  104 	.db #0x00	; 0
   4BCD 85                  105 	.db #0x85	; 133
   4BCE 80                  106 	.db #0x80	; 128
   4BCF 00                  107 	.db #0x00	; 0
   4BD0 A8                  108 	.db #0xa8	; 168
   4BD1 FC                  109 	.db #0xfc	; 252
   4BD2 00                  110 	.db #0x00	; 0
   4BD3 A8                  111 	.db #0xa8	; 168
   4BD4 FC                  112 	.db #0xfc	; 252
   4BD5 00                  113 	.db #0x00	; 0
                            114 	.area _INITIALIZER
                            115 	.area _CABS (ABS)
