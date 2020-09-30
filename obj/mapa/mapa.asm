;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module mapa
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_etm_drawTilemap4x8_ag
	.globl _cpct_etm_setDrawTilemap4x8_ag
	.globl _crearMapa
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
;src/mapa/mapa.c:7: void crearMapa(u8 id){
;	---------------------------------
; Function crearMapa
; ---------------------------------
_crearMapa::
;src/mapa/mapa.c:9: cpct_etm_setDrawTilemap4x8_ag(map_W, map_H, map_W, array_00);
	ld	hl, #_array_00
	push	hl
	ld	hl, #0x0012
	push	hl
	ld	h, #0x16
	push	hl
	call	_cpct_etm_setDrawTilemap4x8_ag
;src/mapa/mapa.c:10: cpct_etm_drawTilemap4x8_ag(Punto_Inicial_De_Pantalla, map);
	ld	hl, #_map
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_etm_drawTilemap4x8_ag
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
