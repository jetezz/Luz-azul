;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module gameObject
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
;src/gameObject/gameObject.c:8: if(objeto->sprite=sprite_Player){
	pop	de
	pop	bc
	push	bc
	push	de
	inc	bc
	inc	bc
	inc	bc
	ld	h, b
	ld	l, c
	ld	(hl), #0x00
;src/gameObject/gameObject.c:9: cpct_drawSprite(playerSprite, Punto_Inicial_De_Pantalla, 8, 8);   
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
