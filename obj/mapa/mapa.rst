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
   6259                      49 _crearMapa::
                             50 ;src/mapa/mapa.c:9: cpct_etm_setDrawTilemap4x8_ag(map_W, map_H, map_W, tiles_00);
   6259 21 AB 41      [10]   51 	ld	hl, #_tiles_00
   625C E5            [11]   52 	push	hl
   625D 21 11 00      [10]   53 	ld	hl, #0x0011
   6260 E5            [11]   54 	push	hl
   6261 26 12         [ 7]   55 	ld	h, #0x12
   6263 E5            [11]   56 	push	hl
   6264 CD AC 76      [17]   57 	call	_cpct_etm_setDrawTilemap4x8_ag
                             58 ;src/mapa/mapa.c:10: cpct_etm_drawTilemap4x8_ag(Punto_Inicial_De_Pantalla, map);
   6267 21 00 40      [10]   59 	ld	hl, #_map
   626A E5            [11]   60 	push	hl
   626B 21 00 C0      [10]   61 	ld	hl, #0xc000
   626E E5            [11]   62 	push	hl
   626F CD C5 74      [17]   63 	call	_cpct_etm_drawTilemap4x8_ag
   6272 C9            [10]   64 	ret
                             65 	.area _CODE
                             66 	.area _INITIALIZER
                             67 	.area _CABS (ABS)
