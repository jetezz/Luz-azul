                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module portal
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _portalSprite_1
                             12 	.globl _portalSprite_0
                             13 	.globl _portalSprite
                             14 	.globl _portalPALETTE
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
   4DF4                      47 _portalPALETTE:
   4DF4 54                   48 	.db #0x54	; 84	'T'
   4DF5 5D                   49 	.db #0x5d	; 93
   4DF6 4E                   50 	.db #0x4e	; 78	'N'
   4DF7 44                   51 	.db #0x44	; 68	'D'
   4DF8 46                   52 	.db #0x46	; 70	'F'
   4DF9 42                   53 	.db #0x42	; 66	'B'
   4DFA 5C                   54 	.db #0x5c	; 92
   4DFB 47                   55 	.db #0x47	; 71	'G'
   4DFC 45                   56 	.db #0x45	; 69	'E'
   4DFD 58                   57 	.db #0x58	; 88	'X'
   4DFE 5D                   58 	.db #0x5d	; 93
   4DFF 43                   59 	.db #0x43	; 67	'C'
   4E00 4F                   60 	.db #0x4f	; 79	'O'
   4E01 40                   61 	.db #0x40	; 64
   4E02 4C                   62 	.db #0x4c	; 76	'L'
   4E03 4B                   63 	.db #0x4b	; 75	'K'
   4E04                      64 _portalSprite:
   4E04 08 4E                65 	.dw _portalSprite_0
   4E06 28 4E                66 	.dw _portalSprite_1
   4E08                      67 _portalSprite_0:
   4E08 0C                   68 	.db #0x0c	; 12
   4E09 0C                   69 	.db #0x0c	; 12
   4E0A 0C                   70 	.db #0x0c	; 12
   4E0B 0C                   71 	.db #0x0c	; 12
   4E0C 0C                   72 	.db #0x0c	; 12
   4E0D 0C                   73 	.db #0x0c	; 12
   4E0E 0C                   74 	.db #0x0c	; 12
   4E0F 0C                   75 	.db #0x0c	; 12
   4E10 3F                   76 	.db #0x3f	; 63
   4E11 3F                   77 	.db #0x3f	; 63
   4E12 3F                   78 	.db #0x3f	; 63
   4E13 3F                   79 	.db #0x3f	; 63
   4E14 3F                   80 	.db #0x3f	; 63
   4E15 3F                   81 	.db #0x3f	; 63
   4E16 3F                   82 	.db #0x3f	; 63
   4E17 3F                   83 	.db #0x3f	; 63
   4E18 3F                   84 	.db #0x3f	; 63
   4E19 2E                   85 	.db #0x2e	; 46
   4E1A BF                   86 	.db #0xbf	; 191
   4E1B 3F                   87 	.db #0x3f	; 63
   4E1C 3F                   88 	.db #0x3f	; 63
   4E1D 4D                   89 	.db #0x4d	; 77	'M'
   4E1E DF                   90 	.db #0xdf	; 223
   4E1F 3F                   91 	.db #0x3f	; 63
   4E20 2E                   92 	.db #0x2e	; 46
   4E21 CF                   93 	.db #0xcf	; 207
   4E22 CF                   94 	.db #0xcf	; 207
   4E23 BF                   95 	.db #0xbf	; 191
   4E24 2E                   96 	.db #0x2e	; 46
   4E25 CF                   97 	.db #0xcf	; 207
   4E26 CF                   98 	.db #0xcf	; 207
   4E27 BF                   99 	.db #0xbf	; 191
   4E28                     100 _portalSprite_1:
   4E28 2E                  101 	.db #0x2e	; 46
   4E29 CF                  102 	.db #0xcf	; 207
   4E2A CF                  103 	.db #0xcf	; 207
   4E2B BF                  104 	.db #0xbf	; 191
   4E2C 3F                  105 	.db #0x3f	; 63
   4E2D 4D                  106 	.db #0x4d	; 77	'M'
   4E2E DF                  107 	.db #0xdf	; 223
   4E2F 3F                  108 	.db #0x3f	; 63
   4E30 3F                  109 	.db #0x3f	; 63
   4E31 2E                  110 	.db #0x2e	; 46
   4E32 BF                  111 	.db #0xbf	; 191
   4E33 3F                  112 	.db #0x3f	; 63
   4E34 3F                  113 	.db #0x3f	; 63
   4E35 3F                  114 	.db #0x3f	; 63
   4E36 3F                  115 	.db #0x3f	; 63
   4E37 3F                  116 	.db #0x3f	; 63
   4E38 3F                  117 	.db #0x3f	; 63
   4E39 3F                  118 	.db #0x3f	; 63
   4E3A 3F                  119 	.db #0x3f	; 63
   4E3B 3F                  120 	.db #0x3f	; 63
   4E3C 3F                  121 	.db #0x3f	; 63
   4E3D 3F                  122 	.db #0x3f	; 63
   4E3E 3F                  123 	.db #0x3f	; 63
   4E3F 3F                  124 	.db #0x3f	; 63
   4E40 0C                  125 	.db #0x0c	; 12
   4E41 0C                  126 	.db #0x0c	; 12
   4E42 0C                  127 	.db #0x0c	; 12
   4E43 0C                  128 	.db #0x0c	; 12
   4E44 0C                  129 	.db #0x0c	; 12
   4E45 0C                  130 	.db #0x0c	; 12
   4E46 0C                  131 	.db #0x0c	; 12
   4E47 0C                  132 	.db #0x0c	; 12
                            133 	.area _INITIALIZER
                            134 	.area _CABS (ABS)
