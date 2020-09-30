;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module juego
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _keyFire
	.globl _scanKey
	.globl _cpct_etm_drawTilemap4x8_ag
	.globl _cpct_etm_setDrawTilemap4x8_ag
	.globl _cpct_setPALColour
	.globl _cpct_setPalette
	.globl _game
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/juego/juego.c:13: void game(){
;	---------------------------------
; Function game
; ---------------------------------
_game::
;src/juego/juego.c:14: cpct_setPalette(PALETTE2, 16);
	ld	hl, #0x0010
	push	hl
	ld	hl, #_PALETTE2
	push	hl
	call	_cpct_setPalette
;src/juego/juego.c:15: cpct_setBorder(HW_BLACK);        // Set border colour to black
	ld	hl, #0x1410
	push	hl
	call	_cpct_setPALColour
;src/juego/juego.c:16: while(1){
00104$:
;src/juego/juego.c:17: scanKey();
	call	_scanKey
;src/juego/juego.c:18: if(keyFire()){
	call	_keyFire
	ld	a, l
	or	a, a
	jr	Z,00104$
;src/juego/juego.c:23: cpct_etm_setDrawTilemap4x8_ag(g_level0_4bit_W, g_level0_4bit_H, g_level0_4bit_W, array_00);
	ld	hl, #_array_00
	push	hl
	ld	hl, #0x0012
	push	hl
	ld	h, #0x16
	push	hl
	call	_cpct_etm_setDrawTilemap4x8_ag
;src/juego/juego.c:24: cpct_etm_drawTilemap4x8_ag(TILEMAP_VMEM, g_level0_4bit);
	ld	hl, #_g_level0_4bit
	push	hl
	ld	hl, #0xc0a4
	push	hl
	call	_cpct_etm_drawTilemap4x8_ag
	jr	00104$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
