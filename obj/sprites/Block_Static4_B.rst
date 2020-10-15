                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Block_Static4_B
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _Block_Static4_B_1
                             12 	.globl _Block_Static4_B_0
                             13 	.globl _Block_Static4_B
                             14 	.globl _Block_Static4_BPALETTE
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
   4EAF                      47 _Block_Static4_BPALETTE:
   4EAF 54                   48 	.db #0x54	; 84	'T'
   4EB0 44                   49 	.db #0x44	; 68	'D'
   4EB1 55                   50 	.db #0x55	; 85	'U'
   4EB2 5D                   51 	.db #0x5d	; 93
   4EB3 56                   52 	.db #0x56	; 86	'V'
   4EB4 46                   53 	.db #0x46	; 70	'F'
   4EB5 57                   54 	.db #0x57	; 87	'W'
   4EB6 5E                   55 	.db #0x5e	; 94
   4EB7 40                   56 	.db #0x40	; 64
   4EB8 5F                   57 	.db #0x5f	; 95
   4EB9 4F                   58 	.db #0x4f	; 79	'O'
   4EBA 5B                   59 	.db #0x5b	; 91
   4EBB 4B                   60 	.db #0x4b	; 75	'K'
   4EBC                      61 _Block_Static4_B:
   4EBC C0 4E                62 	.dw _Block_Static4_B_0
   4EBE E0 4E                63 	.dw _Block_Static4_B_1
   4EC0                      64 _Block_Static4_B_0:
   4EC0 30                   65 	.db #0x30	; 48	'0'
   4EC1 30                   66 	.db #0x30	; 48	'0'
   4EC2 12                   67 	.db #0x12	; 18
   4EC3 30                   68 	.db #0x30	; 48	'0'
   4EC4 30                   69 	.db #0x30	; 48	'0'
   4EC5 30                   70 	.db #0x30	; 48	'0'
   4EC6 12                   71 	.db #0x12	; 18
   4EC7 30                   72 	.db #0x30	; 48	'0'
   4EC8 03                   73 	.db #0x03	; 3
   4EC9 03                   74 	.db #0x03	; 3
   4ECA 03                   75 	.db #0x03	; 3
   4ECB 03                   76 	.db #0x03	; 3
   4ECC 03                   77 	.db #0x03	; 3
   4ECD 03                   78 	.db #0x03	; 3
   4ECE 03                   79 	.db #0x03	; 3
   4ECF 03                   80 	.db #0x03	; 3
   4ED0 03                   81 	.db #0x03	; 3
   4ED1 03                   82 	.db #0x03	; 3
   4ED2 03                   83 	.db #0x03	; 3
   4ED3 03                   84 	.db #0x03	; 3
   4ED4 03                   85 	.db #0x03	; 3
   4ED5 03                   86 	.db #0x03	; 3
   4ED6 03                   87 	.db #0x03	; 3
   4ED7 03                   88 	.db #0x03	; 3
   4ED8 03                   89 	.db #0x03	; 3
   4ED9 03                   90 	.db #0x03	; 3
   4EDA 03                   91 	.db #0x03	; 3
   4EDB 03                   92 	.db #0x03	; 3
   4EDC 03                   93 	.db #0x03	; 3
   4EDD 03                   94 	.db #0x03	; 3
   4EDE 03                   95 	.db #0x03	; 3
   4EDF 03                   96 	.db #0x03	; 3
   4EE0                      97 _Block_Static4_B_1:
   4EE0 CC                   98 	.db #0xcc	; 204
   4EE1 CC                   99 	.db #0xcc	; 204
   4EE2 CC                  100 	.db #0xcc	; 204
   4EE3 CC                  101 	.db #0xcc	; 204
   4EE4 CC                  102 	.db #0xcc	; 204
   4EE5 CC                  103 	.db #0xcc	; 204
   4EE6 CC                  104 	.db #0xcc	; 204
   4EE7 CC                  105 	.db #0xcc	; 204
   4EE8 00                  106 	.db #0x00	; 0
   4EE9 00                  107 	.db #0x00	; 0
   4EEA 00                  108 	.db #0x00	; 0
   4EEB 00                  109 	.db #0x00	; 0
   4EEC 00                  110 	.db #0x00	; 0
   4EED 00                  111 	.db #0x00	; 0
   4EEE 00                  112 	.db #0x00	; 0
   4EEF 00                  113 	.db #0x00	; 0
   4EF0 CC                  114 	.db #0xcc	; 204
   4EF1 CC                  115 	.db #0xcc	; 204
   4EF2 CC                  116 	.db #0xcc	; 204
   4EF3 CC                  117 	.db #0xcc	; 204
   4EF4 CC                  118 	.db #0xcc	; 204
   4EF5 CC                  119 	.db #0xcc	; 204
   4EF6 CC                  120 	.db #0xcc	; 204
   4EF7 CC                  121 	.db #0xcc	; 204
   4EF8 00                  122 	.db #0x00	; 0
   4EF9 00                  123 	.db #0x00	; 0
   4EFA 41                  124 	.db #0x41	; 65	'A'
   4EFB C6                  125 	.db #0xc6	; 198
   4EFC 00                  126 	.db #0x00	; 0
   4EFD 00                  127 	.db #0x00	; 0
   4EFE 41                  128 	.db #0x41	; 65	'A'
   4EFF C6                  129 	.db #0xc6	; 198
                            130 	.area _INITIALIZER
                            131 	.area _CABS (ABS)
