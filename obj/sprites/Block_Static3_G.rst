                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Block_Static3_G
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _Block_Static3_G_1
                             12 	.globl _Block_Static3_G_0
                             13 	.globl _Block_Static3_G
                             14 	.globl _Block_Static3_GPALETTE
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
   4FA2                      47 _Block_Static3_GPALETTE:
   4FA2 54                   48 	.db #0x54	; 84	'T'
   4FA3 44                   49 	.db #0x44	; 68	'D'
   4FA4 55                   50 	.db #0x55	; 85	'U'
   4FA5 5D                   51 	.db #0x5d	; 93
   4FA6 56                   52 	.db #0x56	; 86	'V'
   4FA7 46                   53 	.db #0x46	; 70	'F'
   4FA8 57                   54 	.db #0x57	; 87	'W'
   4FA9 5E                   55 	.db #0x5e	; 94
   4FAA 40                   56 	.db #0x40	; 64
   4FAB 5F                   57 	.db #0x5f	; 95
   4FAC 4F                   58 	.db #0x4f	; 79	'O'
   4FAD 5B                   59 	.db #0x5b	; 91
   4FAE 4B                   60 	.db #0x4b	; 75	'K'
   4FAF                      61 _Block_Static3_G:
   4FAF B3 4F                62 	.dw _Block_Static3_G_0
   4FB1 D3 4F                63 	.dw _Block_Static3_G_1
   4FB3                      64 _Block_Static3_G_0:
   4FB3 3C                   65 	.db #0x3c	; 60
   4FB4 3C                   66 	.db #0x3c	; 60
   4FB5 3C                   67 	.db #0x3c	; 60
   4FB6 3C                   68 	.db #0x3c	; 60
   4FB7 3C                   69 	.db #0x3c	; 60
   4FB8 3C                   70 	.db #0x3c	; 60
   4FB9 3C                   71 	.db #0x3c	; 60
   4FBA 3C                   72 	.db #0x3c	; 60
   4FBB 78                   73 	.db #0x78	; 120	'x'
   4FBC F0                   74 	.db #0xf0	; 240
   4FBD F0                   75 	.db #0xf0	; 240
   4FBE F0                   76 	.db #0xf0	; 240
   4FBF 78                   77 	.db #0x78	; 120	'x'
   4FC0 F0                   78 	.db #0xf0	; 240
   4FC1 F0                   79 	.db #0xf0	; 240
   4FC2 F0                   80 	.db #0xf0	; 240
   4FC3 78                   81 	.db #0x78	; 120	'x'
   4FC4 F0                   82 	.db #0xf0	; 240
   4FC5 F0                   83 	.db #0xf0	; 240
   4FC6 F0                   84 	.db #0xf0	; 240
   4FC7 78                   85 	.db #0x78	; 120	'x'
   4FC8 F0                   86 	.db #0xf0	; 240
   4FC9 F0                   87 	.db #0xf0	; 240
   4FCA F0                   88 	.db #0xf0	; 240
   4FCB 78                   89 	.db #0x78	; 120	'x'
   4FCC F0                   90 	.db #0xf0	; 240
   4FCD F0                   91 	.db #0xf0	; 240
   4FCE F0                   92 	.db #0xf0	; 240
   4FCF 78                   93 	.db #0x78	; 120	'x'
   4FD0 F0                   94 	.db #0xf0	; 240
   4FD1 F0                   95 	.db #0xf0	; 240
   4FD2 F0                   96 	.db #0xf0	; 240
   4FD3                      97 _Block_Static3_G_1:
   4FD3 0C                   98 	.db #0x0c	; 12
   4FD4 0C                   99 	.db #0x0c	; 12
   4FD5 0C                  100 	.db #0x0c	; 12
   4FD6 0C                  101 	.db #0x0c	; 12
   4FD7 0C                  102 	.db #0x0c	; 12
   4FD8 0C                  103 	.db #0x0c	; 12
   4FD9 0C                  104 	.db #0x0c	; 12
   4FDA 0C                  105 	.db #0x0c	; 12
   4FDB 00                  106 	.db #0x00	; 0
   4FDC 00                  107 	.db #0x00	; 0
   4FDD 00                  108 	.db #0x00	; 0
   4FDE 00                  109 	.db #0x00	; 0
   4FDF 00                  110 	.db #0x00	; 0
   4FE0 00                  111 	.db #0x00	; 0
   4FE1 00                  112 	.db #0x00	; 0
   4FE2 00                  113 	.db #0x00	; 0
   4FE3 0C                  114 	.db #0x0c	; 12
   4FE4 0C                  115 	.db #0x0c	; 12
   4FE5 0C                  116 	.db #0x0c	; 12
   4FE6 0C                  117 	.db #0x0c	; 12
   4FE7 0C                  118 	.db #0x0c	; 12
   4FE8 0C                  119 	.db #0x0c	; 12
   4FE9 0C                  120 	.db #0x0c	; 12
   4FEA 0C                  121 	.db #0x0c	; 12
   4FEB 48                  122 	.db #0x48	; 72	'H'
   4FEC 80                  123 	.db #0x80	; 128
   4FED 00                  124 	.db #0x00	; 0
   4FEE 00                  125 	.db #0x00	; 0
   4FEF 48                  126 	.db #0x48	; 72	'H'
   4FF0 80                  127 	.db #0x80	; 128
   4FF1 00                  128 	.db #0x00	; 0
   4FF2 00                  129 	.db #0x00	; 0
                            130 	.area _INITIALIZER
                            131 	.area _CABS (ABS)
