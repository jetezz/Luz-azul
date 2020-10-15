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
   4AA2                      47 _Character_FatherPALETTE:
   4AA2 54                   48 	.db #0x54	; 84	'T'
   4AA3 44                   49 	.db #0x44	; 68	'D'
   4AA4 55                   50 	.db #0x55	; 85	'U'
   4AA5 5D                   51 	.db #0x5d	; 93
   4AA6 56                   52 	.db #0x56	; 86	'V'
   4AA7 46                   53 	.db #0x46	; 70	'F'
   4AA8 57                   54 	.db #0x57	; 87	'W'
   4AA9 5E                   55 	.db #0x5e	; 94
   4AAA 40                   56 	.db #0x40	; 64
   4AAB 5F                   57 	.db #0x5f	; 95
   4AAC 4F                   58 	.db #0x4f	; 79	'O'
   4AAD 5B                   59 	.db #0x5b	; 91
   4AAE 4B                   60 	.db #0x4b	; 75	'K'
   4AAF                      61 _Character_Father:
   4AAF B3 4A                62 	.dw _Character_Father_0
   4AB1 D3 4A                63 	.dw _Character_Father_1
   4AB3                      64 _Character_Father_0:
   4AB3 00                   65 	.db #0x00	; 0
   4AB4 01                   66 	.db #0x01	; 1
   4AB5 03                   67 	.db #0x03	; 3
   4AB6 00                   68 	.db #0x00	; 0
   4AB7 00                   69 	.db #0x00	; 0
   4AB8 01                   70 	.db #0x01	; 1
   4AB9 03                   71 	.db #0x03	; 3
   4ABA 00                   72 	.db #0x00	; 0
   4ABB 00                   73 	.db #0x00	; 0
   4ABC 13                   74 	.db #0x13	; 19
   4ABD 1B                   75 	.db #0x1b	; 27
   4ABE 00                   76 	.db #0x00	; 0
   4ABF 00                   77 	.db #0x00	; 0
   4AC0 13                   78 	.db #0x13	; 19
   4AC1 1B                   79 	.db #0x1b	; 27
   4AC2 00                   80 	.db #0x00	; 0
   4AC3 00                   81 	.db #0x00	; 0
   4AC4 07                   82 	.db #0x07	; 7
   4AC5 0B                   83 	.db #0x0b	; 11
   4AC6 00                   84 	.db #0x00	; 0
   4AC7 00                   85 	.db #0x00	; 0
   4AC8 07                   86 	.db #0x07	; 7
   4AC9 0B                   87 	.db #0x0b	; 11
   4ACA 00                   88 	.db #0x00	; 0
   4ACB 00                   89 	.db #0x00	; 0
   4ACC 40                   90 	.db #0x40	; 64
   4ACD 80                   91 	.db #0x80	; 128
   4ACE 14                   92 	.db #0x14	; 20
   4ACF 00                   93 	.db #0x00	; 0
   4AD0 40                   94 	.db #0x40	; 64
   4AD1 80                   95 	.db #0x80	; 128
   4AD2 14                   96 	.db #0x14	; 20
   4AD3                      97 _Character_Father_1:
   4AD3 40                   98 	.db #0x40	; 64
   4AD4 C0                   99 	.db #0xc0	; 192
   4AD5 C0                  100 	.db #0xc0	; 192
   4AD6 11                  101 	.db #0x11	; 17
   4AD7 40                  102 	.db #0x40	; 64
   4AD8 C0                  103 	.db #0xc0	; 192
   4AD9 C0                  104 	.db #0xc0	; 192
   4ADA 11                  105 	.db #0x11	; 17
   4ADB 0A                  106 	.db #0x0a	; 10
   4ADC C0                  107 	.db #0xc0	; 192
   4ADD C0                  108 	.db #0xc0	; 192
   4ADE 0F                  109 	.db #0x0f	; 15
   4ADF 0A                  110 	.db #0x0a	; 10
   4AE0 C0                  111 	.db #0xc0	; 192
   4AE1 C0                  112 	.db #0xc0	; 192
   4AE2 0F                  113 	.db #0x0f	; 15
   4AE3 00                  114 	.db #0x00	; 0
   4AE4 28                  115 	.db #0x28	; 40
   4AE5 28                  116 	.db #0x28	; 40
   4AE6 00                  117 	.db #0x00	; 0
   4AE7 00                  118 	.db #0x00	; 0
   4AE8 28                  119 	.db #0x28	; 40
   4AE9 28                  120 	.db #0x28	; 40
   4AEA 00                  121 	.db #0x00	; 0
   4AEB 01                  122 	.db #0x01	; 1
   4AEC 02                  123 	.db #0x02	; 2
   4AED 03                  124 	.db #0x03	; 3
   4AEE 00                  125 	.db #0x00	; 0
   4AEF 01                  126 	.db #0x01	; 1
   4AF0 02                  127 	.db #0x02	; 2
   4AF1 03                  128 	.db #0x03	; 3
   4AF2 00                  129 	.db #0x00	; 0
                            130 	.area _INITIALIZER
                            131 	.area _CABS (ABS)
