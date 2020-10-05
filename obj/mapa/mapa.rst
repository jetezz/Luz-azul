                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module mapa
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_etm_drawTilemap4x8_ag
                             12 	.globl _cpct_etm_setDrawTilemap4x8_ag
                             13 	.globl _crearMapa
                             14 ;--------------------------------------------------------
                             15 ; special function registers
                             16 ;--------------------------------------------------------
                             17 ;--------------------------------------------------------
                             18 ; ram data
                             19 ;--------------------------------------------------------
                             20 	.area _DATA
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _INITIALIZED
                             25 ;--------------------------------------------------------
                             26 ; absolute external ram data
                             27 ;--------------------------------------------------------
                             28 	.area _DABS (ABS)
                             29 ;--------------------------------------------------------
                             30 ; global & static initialisations
                             31 ;--------------------------------------------------------
                             32 	.area _HOME
                             33 	.area _GSINIT
                             34 	.area _GSFINAL
                             35 	.area _GSINIT
                             36 ;--------------------------------------------------------
                             37 ; Home
                             38 ;--------------------------------------------------------
                             39 	.area _HOME
                             40 	.area _HOME
                             41 ;--------------------------------------------------------
                             42 ; code
                             43 ;--------------------------------------------------------
                             44 	.area _CODE
                             45 ;src/mapa/mapa.c:7: void crearMapa(u8 id){
                             46 ;	---------------------------------
                             47 ; Function crearMapa
                             48 ; ---------------------------------
   5218                      49 _crearMapa::
                             50 ;src/mapa/mapa.c:9: cpct_etm_setDrawTilemap4x8_ag(map_W, map_H, map_W, tiles_00);
   5218 21 4C 42      [10]   51 	ld	hl, #_tiles_00
   521B E5            [11]   52 	push	hl
   521C 21 12 00      [10]   53 	ld	hl, #0x0012
   521F E5            [11]   54 	push	hl
   5220 26 16         [ 7]   55 	ld	h, #0x16
   5222 E5            [11]   56 	push	hl
   5223 CD B7 57      [17]   57 	call	_cpct_etm_setDrawTilemap4x8_ag
                             58 ;src/mapa/mapa.c:10: cpct_etm_drawTilemap4x8_ag(Punto_Inicial_De_Pantalla, map);
   5226 21 00 40      [10]   59 	ld	hl, #_map
   5229 E5            [11]   60 	push	hl
   522A 21 00 C0      [10]   61 	ld	hl, #0xc000
   522D E5            [11]   62 	push	hl
   522E CD 3F 56      [17]   63 	call	_cpct_etm_drawTilemap4x8_ag
   5231 C9            [10]   64 	ret
                             65 	.area _CODE
                             66 	.area _INITIALIZER
                             67 	.area _CABS (ABS)
