                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module Block_Static7_B
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _Block_Static7_B_1
                             12 	.globl _Block_Static7_B_0
                             13 	.globl _Block_Static7_B
                             14 	.globl _Block_Static7_B_BPALETTE
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
   5310                      47 _Block_Static7_B_BPALETTE:
   5310 54                   48 	.db #0x54	; 84	'T'
   5311 5B                   49 	.db #0x5b	; 91
   5312 4F                   50 	.db #0x4f	; 79	'O'
   5313 5D                   51 	.db #0x5d	; 93
   5314 44                   52 	.db #0x44	; 68	'D'
   5315 5F                   53 	.db #0x5f	; 95
   5316 4B                   54 	.db #0x4b	; 75	'K'
   5317 55                   55 	.db #0x55	; 85	'U'
   5318 56                   56 	.db #0x56	; 86	'V'
   5319 40                   57 	.db #0x40	; 64
   531A 5C                   58 	.db #0x5c	; 92
   531B 46                   59 	.db #0x46	; 70	'F'
   531C 5B                   60 	.db #0x5b	; 91
   531D 5B                   61 	.db #0x5b	; 91
   531E 5E                   62 	.db #0x5e	; 94
   531F                      63 _Block_Static7_B:
   531F 23 53                64 	.dw _Block_Static7_B_0
   5321 43 53                65 	.dw _Block_Static7_B_1
   5323                      66 _Block_Static7_B_0:
   5323 43                   67 	.db #0x43	; 67	'C'
   5324 83                   68 	.db #0x83	; 131
   5325 03                   69 	.db #0x03	; 3
   5326 83                   70 	.db #0x83	; 131
   5327 43                   71 	.db #0x43	; 67	'C'
   5328 83                   72 	.db #0x83	; 131
   5329 03                   73 	.db #0x03	; 3
   532A 83                   74 	.db #0x83	; 131
   532B 43                   75 	.db #0x43	; 67	'C'
   532C C3                   76 	.db #0xc3	; 195
   532D C3                   77 	.db #0xc3	; 195
   532E C3                   78 	.db #0xc3	; 195
   532F 43                   79 	.db #0x43	; 67	'C'
   5330 C3                   80 	.db #0xc3	; 195
   5331 C3                   81 	.db #0xc3	; 195
   5332 C3                   82 	.db #0xc3	; 195
   5333 43                   83 	.db #0x43	; 67	'C'
   5334 C3                   84 	.db #0xc3	; 195
   5335 C3                   85 	.db #0xc3	; 195
   5336 C3                   86 	.db #0xc3	; 195
   5337 43                   87 	.db #0x43	; 67	'C'
   5338 C3                   88 	.db #0xc3	; 195
   5339 C3                   89 	.db #0xc3	; 195
   533A C3                   90 	.db #0xc3	; 195
   533B 43                   91 	.db #0x43	; 67	'C'
   533C C3                   92 	.db #0xc3	; 195
   533D C3                   93 	.db #0xc3	; 195
   533E C3                   94 	.db #0xc3	; 195
   533F 43                   95 	.db #0x43	; 67	'C'
   5340 C3                   96 	.db #0xc3	; 195
   5341 C3                   97 	.db #0xc3	; 195
   5342 C3                   98 	.db #0xc3	; 195
   5343                      99 _Block_Static7_B_1:
   5343 C3                  100 	.db #0xc3	; 195
   5344 C3                  101 	.db #0xc3	; 195
   5345 C3                  102 	.db #0xc3	; 195
   5346 C3                  103 	.db #0xc3	; 195
   5347 C3                  104 	.db #0xc3	; 195
   5348 C3                  105 	.db #0xc3	; 195
   5349 C3                  106 	.db #0xc3	; 195
   534A C3                  107 	.db #0xc3	; 195
   534B C3                  108 	.db #0xc3	; 195
   534C C3                  109 	.db #0xc3	; 195
   534D C3                  110 	.db #0xc3	; 195
   534E C3                  111 	.db #0xc3	; 195
   534F C3                  112 	.db #0xc3	; 195
   5350 C3                  113 	.db #0xc3	; 195
   5351 C3                  114 	.db #0xc3	; 195
   5352 C3                  115 	.db #0xc3	; 195
   5353 43                  116 	.db #0x43	; 67	'C'
   5354 C3                  117 	.db #0xc3	; 195
   5355 C3                  118 	.db #0xc3	; 195
   5356 C3                  119 	.db #0xc3	; 195
   5357 43                  120 	.db #0x43	; 67	'C'
   5358 C3                  121 	.db #0xc3	; 195
   5359 C3                  122 	.db #0xc3	; 195
   535A C3                  123 	.db #0xc3	; 195
   535B C3                  124 	.db #0xc3	; 195
   535C C3                  125 	.db #0xc3	; 195
   535D C3                  126 	.db #0xc3	; 195
   535E C3                  127 	.db #0xc3	; 195
   535F C3                  128 	.db #0xc3	; 195
   5360 C3                  129 	.db #0xc3	; 195
   5361 C3                  130 	.db #0xc3	; 195
   5362 C3                  131 	.db #0xc3	; 195
                            132 	.area _INITIALIZER
                            133 	.area _CABS (ABS)
