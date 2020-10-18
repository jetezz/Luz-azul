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
   4CA4                      47 _Character_BrotherPALETTE:
   4CA4 54                   48 	.db #0x54	; 84	'T'
   4CA5 5B                   49 	.db #0x5b	; 91
   4CA6 4F                   50 	.db #0x4f	; 79	'O'
   4CA7 5D                   51 	.db #0x5d	; 93
   4CA8 44                   52 	.db #0x44	; 68	'D'
   4CA9 5F                   53 	.db #0x5f	; 95
   4CAA 4B                   54 	.db #0x4b	; 75	'K'
   4CAB 55                   55 	.db #0x55	; 85	'U'
   4CAC 56                   56 	.db #0x56	; 86	'V'
   4CAD 40                   57 	.db #0x40	; 64
   4CAE 5C                   58 	.db #0x5c	; 92
   4CAF 46                   59 	.db #0x46	; 70	'F'
   4CB0 5B                   60 	.db #0x5b	; 91
   4CB1 5B                   61 	.db #0x5b	; 91
   4CB2 5E                   62 	.db #0x5e	; 94
   4CB3                      63 _Character_Brother:
   4CB3 B7 4C                64 	.dw _Character_Brother_0
   4CB5 CF 4C                65 	.dw _Character_Brother_1
   4CB7                      66 _Character_Brother_0:
   4CB7 CF                   67 	.db #0xcf	; 207
   4CB8 C5                   68 	.db #0xc5	; 197
   4CB9 00                   69 	.db #0x00	; 0
   4CBA CF                   70 	.db #0xcf	; 207
   4CBB C5                   71 	.db #0xc5	; 197
   4CBC 00                   72 	.db #0x00	; 0
   4CBD 9E                   73 	.db #0x9e	; 158
   4CBE 1C                   74 	.db #0x1c	; 28
   4CBF 00                   75 	.db #0x00	; 0
   4CC0 9E                   76 	.db #0x9e	; 158
   4CC1 1C                   77 	.db #0x1c	; 28
   4CC2 00                   78 	.db #0x00	; 0
   4CC3 8E                   79 	.db #0x8e	; 142
   4CC4 4D                   80 	.db #0x4d	; 77	'M'
   4CC5 00                   81 	.db #0x00	; 0
   4CC6 8E                   82 	.db #0x8e	; 142
   4CC7 4D                   83 	.db #0x4d	; 77	'M'
   4CC8 00                   84 	.db #0x00	; 0
   4CC9 54                   85 	.db #0x54	; 84	'T'
   4CCA 30                   86 	.db #0x30	; 48	'0'
   4CCB 04                   87 	.db #0x04	; 4
   4CCC 54                   88 	.db #0x54	; 84	'T'
   4CCD 30                   89 	.db #0x30	; 48	'0'
   4CCE 04                   90 	.db #0x04	; 4
   4CCF                      91 _Character_Brother_1:
   4CCF B8                   92 	.db #0xb8	; 184
   4CD0 30                   93 	.db #0x30	; 48	'0'
   4CD1 1C                   94 	.db #0x1c	; 28
   4CD2 B8                   95 	.db #0xb8	; 184
   4CD3 30                   96 	.db #0x30	; 48	'0'
   4CD4 1C                   97 	.db #0x1c	; 28
   4CD5 18                   98 	.db #0x18	; 24
   4CD6 30                   99 	.db #0x30	; 48	'0'
   4CD7 14                  100 	.db #0x14	; 20
   4CD8 18                  101 	.db #0x18	; 24
   4CD9 30                  102 	.db #0x30	; 48	'0'
   4CDA 14                  103 	.db #0x14	; 20
   4CDB 24                  104 	.db #0x24	; 36
   4CDC 20                  105 	.db #0x20	; 32
   4CDD 00                  106 	.db #0x00	; 0
   4CDE 24                  107 	.db #0x24	; 36
   4CDF 20                  108 	.db #0x20	; 32
   4CE0 00                  109 	.db #0x00	; 0
   4CE1 2A                  110 	.db #0x2a	; 42
   4CE2 3F                  111 	.db #0x3f	; 63
   4CE3 00                  112 	.db #0x00	; 0
   4CE4 2A                  113 	.db #0x2a	; 42
   4CE5 3F                  114 	.db #0x3f	; 63
   4CE6 00                  115 	.db #0x00	; 0
                            116 	.area _INITIALIZER
                            117 	.area _CABS (ABS)
