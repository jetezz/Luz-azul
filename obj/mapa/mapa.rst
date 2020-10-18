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
   6BC9                      49 _crearMapa::
                             50 ;src/mapa/mapa.c:9: cpct_etm_setDrawTilemap4x8_ag(map_W, map_H, map_W, tiles_00);
   6BC9 21 AD 41      [10]   51 	ld	hl, #_tiles_00
   6BCC E5            [11]   52 	push	hl
   6BCD 21 11 00      [10]   53 	ld	hl, #0x0011
   6BD0 E5            [11]   54 	push	hl
   6BD1 26 12         [ 7]   55 	ld	h, #0x12
   6BD3 E5            [11]   56 	push	hl
   6BD4 CD C6 AA      [17]   57 	call	_cpct_etm_setDrawTilemap4x8_ag
                             58 ;src/mapa/mapa.c:10: cpct_etm_drawTilemap4x8_ag(Punto_Inicial_De_Pantalla, map);
   6BD7 21 00 40      [10]   59 	ld	hl, #_map
   6BDA E5            [11]   60 	push	hl
   6BDB 21 00 C0      [10]   61 	ld	hl, #0xc000
   6BDE E5            [11]   62 	push	hl
   6BDF CD D3 A8      [17]   63 	call	_cpct_etm_drawTilemap4x8_ag
   6BE2 C9            [10]   64 	ret
                             65 	.area _CODE
                             66 	.area _INITIALIZER
                             67 	.area _CABS (ABS)
