                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module gameObject
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _dibujarGameObject
                             12 ;--------------------------------------------------------
                             13 ; special function registers
                             14 ;--------------------------------------------------------
                             15 ;--------------------------------------------------------
                             16 ; ram data
                             17 ;--------------------------------------------------------
                             18 	.area _DATA
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _INITIALIZED
                             23 ;--------------------------------------------------------
                             24 ; absolute external ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DABS (ABS)
                             27 ;--------------------------------------------------------
                             28 ; global & static initialisations
                             29 ;--------------------------------------------------------
                             30 	.area _HOME
                             31 	.area _GSINIT
                             32 	.area _GSFINAL
                             33 	.area _GSINIT
                             34 ;--------------------------------------------------------
                             35 ; Home
                             36 ;--------------------------------------------------------
                             37 	.area _HOME
                             38 	.area _HOME
                             39 ;--------------------------------------------------------
                             40 ; code
                             41 ;--------------------------------------------------------
                             42 	.area _CODE
                             43 ;src/gameObject/gameObject.c:7: void dibujarGameObject(TGameObject* objeto){
                             44 ;	---------------------------------
                             45 ; Function dibujarGameObject
                             46 ; ---------------------------------
   4DC7                      47 _dibujarGameObject::
                             48 ;src/gameObject/gameObject.c:8: if(objeto->sprite=sprite_Player){
   4DC7 D1            [10]   49 	pop	de
   4DC8 C1            [10]   50 	pop	bc
   4DC9 C5            [11]   51 	push	bc
   4DCA D5            [11]   52 	push	de
   4DCB 03            [ 6]   53 	inc	bc
   4DCC 03            [ 6]   54 	inc	bc
   4DCD 03            [ 6]   55 	inc	bc
   4DCE 60            [ 4]   56 	ld	h, b
   4DCF 69            [ 4]   57 	ld	l, c
   4DD0 36 00         [10]   58 	ld	(hl), #0x00
                             59 ;src/gameObject/gameObject.c:9: cpct_drawSprite(playerSprite, Punto_Inicial_De_Pantalla, 8, 8);   
   4DD2 C9            [10]   60 	ret
                             61 	.area _CODE
                             62 	.area _INITIALIZER
                             63 	.area _CABS (ABS)
