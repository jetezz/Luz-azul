                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module PortalDoor_G
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _PortalDoor_G_1
                             12 	.globl _PortalDoor_G_0
                             13 	.globl _PortalDoor_G
                             14 	.globl _PortalDoor_GPALETTE
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
   5078                      47 _PortalDoor_GPALETTE:
   5078 54                   48 	.db #0x54	; 84	'T'
   5079 5B                   49 	.db #0x5b	; 91
   507A 4F                   50 	.db #0x4f	; 79	'O'
   507B 5D                   51 	.db #0x5d	; 93
   507C 44                   52 	.db #0x44	; 68	'D'
   507D 5F                   53 	.db #0x5f	; 95
   507E 4B                   54 	.db #0x4b	; 75	'K'
   507F 55                   55 	.db #0x55	; 85	'U'
   5080 56                   56 	.db #0x56	; 86	'V'
   5081 40                   57 	.db #0x40	; 64
   5082 5C                   58 	.db #0x5c	; 92
   5083 46                   59 	.db #0x46	; 70	'F'
   5084 5B                   60 	.db #0x5b	; 91
   5085 5B                   61 	.db #0x5b	; 91
   5086 5E                   62 	.db #0x5e	; 94
   5087                      63 _PortalDoor_G:
   5087 8B 50                64 	.dw _PortalDoor_G_0
   5089 AB 50                65 	.dw _PortalDoor_G_1
   508B                      66 _PortalDoor_G_0:
   508B 20                   67 	.db #0x20	; 32
   508C 20                   68 	.db #0x20	; 32
   508D 20                   69 	.db #0x20	; 32
   508E A8                   70 	.db #0xa8	; 168
   508F 20                   71 	.db #0x20	; 32
   5090 20                   72 	.db #0x20	; 32
   5091 20                   73 	.db #0x20	; 32
   5092 A8                   74 	.db #0xa8	; 168
   5093 10                   75 	.db #0x10	; 16
   5094 54                   76 	.db #0x54	; 84	'T'
   5095 54                   77 	.db #0x54	; 84	'T'
   5096 54                   78 	.db #0x54	; 84	'T'
   5097 10                   79 	.db #0x10	; 16
   5098 54                   80 	.db #0x54	; 84	'T'
   5099 54                   81 	.db #0x54	; 84	'T'
   509A 54                   82 	.db #0x54	; 84	'T'
   509B A8                   83 	.db #0xa8	; 168
   509C A8                   84 	.db #0xa8	; 168
   509D A8                   85 	.db #0xa8	; 168
   509E A8                   86 	.db #0xa8	; 168
   509F A8                   87 	.db #0xa8	; 168
   50A0 A8                   88 	.db #0xa8	; 168
   50A1 A8                   89 	.db #0xa8	; 168
   50A2 A8                   90 	.db #0xa8	; 168
   50A3 10                   91 	.db #0x10	; 16
   50A4 54                   92 	.db #0x54	; 84	'T'
   50A5 54                   93 	.db #0x54	; 84	'T'
   50A6 54                   94 	.db #0x54	; 84	'T'
   50A7 10                   95 	.db #0x10	; 16
   50A8 54                   96 	.db #0x54	; 84	'T'
   50A9 54                   97 	.db #0x54	; 84	'T'
   50AA 54                   98 	.db #0x54	; 84	'T'
   50AB                      99 _PortalDoor_G_1:
   50AB 20                  100 	.db #0x20	; 32
   50AC 20                  101 	.db #0x20	; 32
   50AD A8                  102 	.db #0xa8	; 168
   50AE A8                  103 	.db #0xa8	; 168
   50AF 20                  104 	.db #0x20	; 32
   50B0 20                  105 	.db #0x20	; 32
   50B1 A8                  106 	.db #0xa8	; 168
   50B2 A8                  107 	.db #0xa8	; 168
   50B3 54                  108 	.db #0x54	; 84	'T'
   50B4 54                  109 	.db #0x54	; 84	'T'
   50B5 54                  110 	.db #0x54	; 84	'T'
   50B6 54                  111 	.db #0x54	; 84	'T'
   50B7 54                  112 	.db #0x54	; 84	'T'
   50B8 54                  113 	.db #0x54	; 84	'T'
   50B9 54                  114 	.db #0x54	; 84	'T'
   50BA 54                  115 	.db #0x54	; 84	'T'
   50BB 20                  116 	.db #0x20	; 32
   50BC 20                  117 	.db #0x20	; 32
   50BD A8                  118 	.db #0xa8	; 168
   50BE A8                  119 	.db #0xa8	; 168
   50BF 20                  120 	.db #0x20	; 32
   50C0 20                  121 	.db #0x20	; 32
   50C1 A8                  122 	.db #0xa8	; 168
   50C2 A8                  123 	.db #0xa8	; 168
   50C3 10                  124 	.db #0x10	; 16
   50C4 54                  125 	.db #0x54	; 84	'T'
   50C5 54                  126 	.db #0x54	; 84	'T'
   50C6 54                  127 	.db #0x54	; 84	'T'
   50C7 10                  128 	.db #0x10	; 16
   50C8 54                  129 	.db #0x54	; 84	'T'
   50C9 54                  130 	.db #0x54	; 84	'T'
   50CA 54                  131 	.db #0x54	; 84	'T'
                            132 	.area _INITIALIZER
                            133 	.area _CABS (ABS)
