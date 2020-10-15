                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Character_Sister
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _Character_Sister_1
                             12 	.globl _Character_Sister_0
                             13 	.globl _Character_Sister
                             14 	.globl _Character_SisterPALETTE
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
   4B44                      47 _Character_SisterPALETTE:
   4B44 54                   48 	.db #0x54	; 84	'T'
   4B45 44                   49 	.db #0x44	; 68	'D'
   4B46 55                   50 	.db #0x55	; 85	'U'
   4B47 5D                   51 	.db #0x5d	; 93
   4B48 56                   52 	.db #0x56	; 86	'V'
   4B49 46                   53 	.db #0x46	; 70	'F'
   4B4A 57                   54 	.db #0x57	; 87	'W'
   4B4B 5E                   55 	.db #0x5e	; 94
   4B4C 40                   56 	.db #0x40	; 64
   4B4D 5F                   57 	.db #0x5f	; 95
   4B4E 4F                   58 	.db #0x4f	; 79	'O'
   4B4F 5B                   59 	.db #0x5b	; 91
   4B50 4B                   60 	.db #0x4b	; 75	'K'
   4B51                      61 _Character_Sister:
   4B51 55 4B                62 	.dw _Character_Sister_0
   4B53 75 4B                63 	.dw _Character_Sister_1
   4B55                      64 _Character_Sister_0:
   4B55 00                   65 	.db #0x00	; 0
   4B56 FC                   66 	.db #0xfc	; 252
   4B57 FC                   67 	.db #0xfc	; 252
   4B58 00                   68 	.db #0x00	; 0
   4B59 00                   69 	.db #0x00	; 0
   4B5A FC                   70 	.db #0xfc	; 252
   4B5B FC                   71 	.db #0xfc	; 252
   4B5C 00                   72 	.db #0x00	; 0
   4B5D 54                   73 	.db #0x54	; 84	'T'
   4B5E B9                   74 	.db #0xb9	; 185
   4B5F 1B                   75 	.db #0x1b	; 27
   4B60 00                   76 	.db #0x00	; 0
   4B61 54                   77 	.db #0x54	; 84	'T'
   4B62 B9                   78 	.db #0xb9	; 185
   4B63 1B                   79 	.db #0x1b	; 27
   4B64 00                   80 	.db #0x00	; 0
   4B65 54                   81 	.db #0x54	; 84	'T'
   4B66 AD                   82 	.db #0xad	; 173
   4B67 5E                   83 	.db #0x5e	; 94
   4B68 00                   84 	.db #0x00	; 0
   4B69 54                   85 	.db #0x54	; 84	'T'
   4B6A AD                   86 	.db #0xad	; 173
   4B6B 5E                   87 	.db #0x5e	; 94
   4B6C 00                   88 	.db #0x00	; 0
   4B6D FC                   89 	.db #0xfc	; 252
   4B6E FC                   90 	.db #0xfc	; 252
   4B6F FC                   91 	.db #0xfc	; 252
   4B70 00                   92 	.db #0x00	; 0
   4B71 FC                   93 	.db #0xfc	; 252
   4B72 FC                   94 	.db #0xfc	; 252
   4B73 FC                   95 	.db #0xfc	; 252
   4B74 00                   96 	.db #0x00	; 0
   4B75                      97 _Character_Sister_1:
   4B75 54                   98 	.db #0x54	; 84	'T'
   4B76 5E                   99 	.db #0x5e	; 94
   4B77 FC                  100 	.db #0xfc	; 252
   4B78 A8                  101 	.db #0xa8	; 168
   4B79 54                  102 	.db #0x54	; 84	'T'
   4B7A 5E                  103 	.db #0x5e	; 94
   4B7B FC                  104 	.db #0xfc	; 252
   4B7C A8                  105 	.db #0xa8	; 168
   4B7D A8                  106 	.db #0xa8	; 168
   4B7E AD                  107 	.db #0xad	; 173
   4B7F FC                  108 	.db #0xfc	; 252
   4B80 1E                  109 	.db #0x1e	; 30
   4B81 A8                  110 	.db #0xa8	; 168
   4B82 AD                  111 	.db #0xad	; 173
   4B83 FC                  112 	.db #0xfc	; 252
   4B84 1E                  113 	.db #0x1e	; 30
   4B85 00                  114 	.db #0x00	; 0
   4B86 A8                  115 	.db #0xa8	; 168
   4B87 A8                  116 	.db #0xa8	; 168
   4B88 22                  117 	.db #0x22	; 34
   4B89 00                  118 	.db #0x00	; 0
   4B8A A8                  119 	.db #0xa8	; 168
   4B8B A8                  120 	.db #0xa8	; 168
   4B8C 22                  121 	.db #0x22	; 34
   4B8D 00                  122 	.db #0x00	; 0
   4B8E 02                  123 	.db #0x02	; 2
   4B8F 03                  124 	.db #0x03	; 3
   4B90 00                  125 	.db #0x00	; 0
   4B91 00                  126 	.db #0x00	; 0
   4B92 02                  127 	.db #0x02	; 2
   4B93 03                  128 	.db #0x03	; 3
   4B94 00                  129 	.db #0x00	; 0
                            130 	.area _INITIALIZER
                            131 	.area _CABS (ABS)
