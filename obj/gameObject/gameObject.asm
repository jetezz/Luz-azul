;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module gameObject
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_drawSprite
	.globl _dibujarGameObject
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
;src/gameObject/gameObject.c:7: void dibujarGameObject(TGameObject* objeto){
;	---------------------------------
; Function dibujarGameObject
; ---------------------------------
_dibujarGameObject::
;src/gameObject/gameObject.c:8: if(objeto->sprite==sprite_Player){
	pop	bc
	pop	hl
	push	hl
	push	bc
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	or	a, a
	ret	NZ
;src/gameObject/gameObject.c:9: cpct_drawSprite(playerSprite_0, Punto_Inicial_De_Pantalla, 4, 16);  
	ld	hl, #0x1004
	push	hl
	ld	hl, #0xc0a4
	push	hl
	ld	hl, #_playerSprite_0
	push	hl
	call	_cpct_drawSprite
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
