                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module PortalDoor_B
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _PortalDoor_B_1
                             12 	.globl _PortalDoor_B_0
                             13 	.globl _PortalDoor_B
                             14 	.globl _PortalDoor_BPALETTE
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
   5025                      47 _PortalDoor_BPALETTE:
   5025 54                   48 	.db #0x54	; 84	'T'
   5026 5B                   49 	.db #0x5b	; 91
   5027 4F                   50 	.db #0x4f	; 79	'O'
   5028 5D                   51 	.db #0x5d	; 93
   5029 44                   52 	.db #0x44	; 68	'D'
   502A 5F                   53 	.db #0x5f	; 95
   502B 4B                   54 	.db #0x4b	; 75	'K'
   502C 55                   55 	.db #0x55	; 85	'U'
   502D 56                   56 	.db #0x56	; 86	'V'
   502E 40                   57 	.db #0x40	; 64
   502F 5C                   58 	.db #0x5c	; 92
   5030 46                   59 	.db #0x46	; 70	'F'
   5031 5B                   60 	.db #0x5b	; 91
   5032 5B                   61 	.db #0x5b	; 91
   5033 5E                   62 	.db #0x5e	; 94
   5034                      63 _PortalDoor_B:
   5034 38 50                64 	.dw _PortalDoor_B_0
   5036 58 50                65 	.dw _PortalDoor_B_1
   5038                      66 _PortalDoor_B_0:
   5038 20                   67 	.db #0x20	; 32
   5039 20                   68 	.db #0x20	; 32
   503A 20                   69 	.db #0x20	; 32
   503B 20                   70 	.db #0x20	; 32
   503C 20                   71 	.db #0x20	; 32
   503D 20                   72 	.db #0x20	; 32
   503E 20                   73 	.db #0x20	; 32
   503F 20                   74 	.db #0x20	; 32
   5040 44                   75 	.db #0x44	; 68	'D'
   5041 44                   76 	.db #0x44	; 68	'D'
   5042 10                   77 	.db #0x10	; 16
   5043 10                   78 	.db #0x10	; 16
   5044 44                   79 	.db #0x44	; 68	'D'
   5045 44                   80 	.db #0x44	; 68	'D'
   5046 10                   81 	.db #0x10	; 16
   5047 10                   82 	.db #0x10	; 16
   5048 88                   83 	.db #0x88	; 136
   5049 88                   84 	.db #0x88	; 136
   504A 88                   85 	.db #0x88	; 136
   504B 88                   86 	.db #0x88	; 136
   504C 88                   87 	.db #0x88	; 136
   504D 88                   88 	.db #0x88	; 136
   504E 88                   89 	.db #0x88	; 136
   504F 88                   90 	.db #0x88	; 136
   5050 44                   91 	.db #0x44	; 68	'D'
   5051 44                   92 	.db #0x44	; 68	'D'
   5052 10                   93 	.db #0x10	; 16
   5053 10                   94 	.db #0x10	; 16
   5054 44                   95 	.db #0x44	; 68	'D'
   5055 44                   96 	.db #0x44	; 68	'D'
   5056 10                   97 	.db #0x10	; 16
   5057 10                   98 	.db #0x10	; 16
   5058                      99 _PortalDoor_B_1:
   5058 88                  100 	.db #0x88	; 136
   5059 88                  101 	.db #0x88	; 136
   505A 88                  102 	.db #0x88	; 136
   505B 20                  103 	.db #0x20	; 32
   505C 88                  104 	.db #0x88	; 136
   505D 88                  105 	.db #0x88	; 136
   505E 88                  106 	.db #0x88	; 136
   505F 20                  107 	.db #0x20	; 32
   5060 44                  108 	.db #0x44	; 68	'D'
   5061 44                  109 	.db #0x44	; 68	'D'
   5062 44                  110 	.db #0x44	; 68	'D'
   5063 44                  111 	.db #0x44	; 68	'D'
   5064 44                  112 	.db #0x44	; 68	'D'
   5065 44                  113 	.db #0x44	; 68	'D'
   5066 44                  114 	.db #0x44	; 68	'D'
   5067 44                  115 	.db #0x44	; 68	'D'
   5068 88                  116 	.db #0x88	; 136
   5069 88                  117 	.db #0x88	; 136
   506A 88                  118 	.db #0x88	; 136
   506B 20                  119 	.db #0x20	; 32
   506C 88                  120 	.db #0x88	; 136
   506D 88                  121 	.db #0x88	; 136
   506E 88                  122 	.db #0x88	; 136
   506F 20                  123 	.db #0x20	; 32
   5070 44                  124 	.db #0x44	; 68	'D'
   5071 10                  125 	.db #0x10	; 16
   5072 10                  126 	.db #0x10	; 16
   5073 10                  127 	.db #0x10	; 16
   5074 44                  128 	.db #0x44	; 68	'D'
   5075 10                  129 	.db #0x10	; 16
   5076 10                  130 	.db #0x10	; 16
   5077 10                  131 	.db #0x10	; 16
                            132 	.area _INITIALIZER
                            133 	.area _CABS (ABS)
