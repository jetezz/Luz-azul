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
                             11 	.globl _cpct_drawSprite
                             12 	.globl _dibujarGameObject
                             13 ;--------------------------------------------------------
                             14 ; special function registers
                             15 ;--------------------------------------------------------
                             16 ;--------------------------------------------------------
                             17 ; ram data
                             18 ;--------------------------------------------------------
                             19 	.area _DATA
                             20 ;--------------------------------------------------------
                             21 ; ram data
                             22 ;--------------------------------------------------------
                             23 	.area _INITIALIZED
                             24 ;--------------------------------------------------------
                             25 ; absolute external ram data
                             26 ;--------------------------------------------------------
                             27 	.area _DABS (ABS)
                             28 ;--------------------------------------------------------
                             29 ; global & static initialisations
                             30 ;--------------------------------------------------------
                             31 	.area _HOME
                             32 	.area _GSINIT
                             33 	.area _GSFINAL
                             34 	.area _GSINIT
                             35 ;--------------------------------------------------------
                             36 ; Home
                             37 ;--------------------------------------------------------
                             38 	.area _HOME
                             39 	.area _HOME
                             40 ;--------------------------------------------------------
                             41 ; code
                             42 ;--------------------------------------------------------
                             43 	.area _CODE
                             44 ;src/gameObject/gameObject.c:7: void dibujarGameObject(TGameObject* objeto){
                             45 ;	---------------------------------
                             46 ; Function dibujarGameObject
                             47 ; ---------------------------------
   4DC7                      48 _dibujarGameObject::
                             49 ;src/gameObject/gameObject.c:8: if(objeto->sprite==sprite_Player){
   4DC7 C1            [10]   50 	pop	bc
   4DC8 E1            [10]   51 	pop	hl
   4DC9 E5            [11]   52 	push	hl
   4DCA C5            [11]   53 	push	bc
   4DCB 23            [ 6]   54 	inc	hl
   4DCC 23            [ 6]   55 	inc	hl
   4DCD 23            [ 6]   56 	inc	hl
   4DCE 7E            [ 7]   57 	ld	a, (hl)
   4DCF B7            [ 4]   58 	or	a, a
   4DD0 C0            [11]   59 	ret	NZ
                             60 ;src/gameObject/gameObject.c:9: cpct_drawSprite(playerSprite_0, Punto_Inicial_De_Pantalla, 4, 16);  
   4DD1 21 04 10      [10]   61 	ld	hl, #0x1004
   4DD4 E5            [11]   62 	push	hl
   4DD5 21 A4 C0      [10]   63 	ld	hl, #0xc0a4
   4DD8 E5            [11]   64 	push	hl
   4DD9 21 60 4D      [10]   65 	ld	hl, #_playerSprite_0
   4DDC E5            [11]   66 	push	hl
   4DDD CD 1B 4F      [17]   67 	call	_cpct_drawSprite
   4DE0 C9            [10]   68 	ret
                             69 	.area _CODE
                             70 	.area _INITIALIZER
                             71 	.area _CABS (ABS)
