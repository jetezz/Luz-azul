                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module juego
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _keyFire
                             12 	.globl _scanKey
                             13 	.globl _cpct_etm_drawTilemap4x8_ag
                             14 	.globl _cpct_etm_setDrawTilemap4x8_ag
                             15 	.globl _cpct_setPALColour
                             16 	.globl _cpct_setPalette
                             17 	.globl _game
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
                             29 ;--------------------------------------------------------
                             30 ; absolute external ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DABS (ABS)
                             33 ;--------------------------------------------------------
                             34 ; global & static initialisations
                             35 ;--------------------------------------------------------
                             36 	.area _HOME
                             37 	.area _GSINIT
                             38 	.area _GSFINAL
                             39 	.area _GSINIT
                             40 ;--------------------------------------------------------
                             41 ; Home
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _HOME
                             45 ;--------------------------------------------------------
                             46 ; code
                             47 ;--------------------------------------------------------
                             48 	.area _CODE
                             49 ;src/juego/juego.c:13: void game(){
                             50 ;	---------------------------------
                             51 ; Function game
                             52 ; ---------------------------------
   4DDF                      53 _game::
                             54 ;src/juego/juego.c:14: cpct_setPalette(PALETTE2, 16);
   4DDF 21 10 00      [10]   55 	ld	hl, #0x0010
   4DE2 E5            [11]   56 	push	hl
   4DE3 21 8C 41      [10]   57 	ld	hl, #_PALETTE2
   4DE6 E5            [11]   58 	push	hl
   4DE7 CD EF 4E      [17]   59 	call	_cpct_setPalette
                             60 ;src/juego/juego.c:15: cpct_setBorder(HW_BLACK);        // Set border colour to black
   4DEA 21 10 14      [10]   61 	ld	hl, #0x1410
   4DED E5            [11]   62 	push	hl
   4DEE CD 06 4F      [17]   63 	call	_cpct_setPALColour
                             64 ;src/juego/juego.c:16: while(1){
   4DF1                      65 00104$:
                             66 ;src/juego/juego.c:17: scanKey();
   4DF1 CD 16 4E      [17]   67 	call	_scanKey
                             68 ;src/juego/juego.c:18: if(keyFire()){
   4DF4 CD 69 4E      [17]   69 	call	_keyFire
   4DF7 7D            [ 4]   70 	ld	a, l
   4DF8 B7            [ 4]   71 	or	a, a
   4DF9 28 F6         [12]   72 	jr	Z,00104$
                             73 ;src/juego/juego.c:23: cpct_etm_setDrawTilemap4x8_ag(g_level0_4bit_W, g_level0_4bit_H, g_level0_4bit_W, array_00);
   4DFB 21 4C 42      [10]   74 	ld	hl, #_array_00
   4DFE E5            [11]   75 	push	hl
   4DFF 21 12 00      [10]   76 	ld	hl, #0x0012
   4E02 E5            [11]   77 	push	hl
   4E03 26 16         [ 7]   78 	ld	h, #0x16
   4E05 E5            [11]   79 	push	hl
   4E06 CD E0 4F      [17]   80 	call	_cpct_etm_setDrawTilemap4x8_ag
                             81 ;src/juego/juego.c:24: cpct_etm_drawTilemap4x8_ag(TILEMAP_VMEM, g_level0_4bit);
   4E09 21 00 40      [10]   82 	ld	hl, #_g_level0_4bit
   4E0C E5            [11]   83 	push	hl
   4E0D 21 A4 C0      [10]   84 	ld	hl, #0xc0a4
   4E10 E5            [11]   85 	push	hl
   4E11 CD 12 4F      [17]   86 	call	_cpct_etm_drawTilemap4x8_ag
   4E14 18 DB         [12]   87 	jr	00104$
                             88 	.area _CODE
                             89 	.area _INITIALIZER
                             90 	.area _CABS (ABS)
