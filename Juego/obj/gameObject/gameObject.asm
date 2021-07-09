;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module gameObject
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _comprobarColisiones1vs1
	.globl _calcularMaximosyMinimos
	.globl _calcularPosicionEnPantalla
	.globl _cpct_akp_SFXPlay
	.globl _cpct_drawSprite
	.globl _cpct_drawSolidBox
	.globl _initGameobjest
	.globl _dibujarGameObject
	.globl _dibujarGameObjectCol
	.globl _dibujarGameObjectColSprite
	.globl _limpiarRastro
	.globl _moverGameObject
	.globl _moverElEspejo
	.globl _cambiarPosicion
	.globl _moverYdibujar
	.globl _taparHole
	.globl _moverTipoPlayer
	.globl _moverTipoRoca
	.globl _mover1casilla
	.globl _movimientoLineal
	.globl _colisionesSiguientePosicion
	.globl _comprobarRocas
	.globl _comprobarPortales
	.globl _comprobarPuertas
	.globl _comprobarColeccionables
	.globl _comprobarEnemigos
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_P_portal:
	.ds 2
_P_puertas:
	.ds 2
_P_col:
	.ds 2
_P_luz:
	.ds 2
_P_fam:
	.ds 2
_P_ams:
	.ds 2
_P_colList:
	.ds 2
_creadorDeEnemigos:
	.ds 100
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
;src/gameObject/gameObject.c:72: void initGameobjest(TGameObject* portales,TGameObject* puertas,TGameObjectCol* colec,u8* colLuz,u8* colFam,u8* colAms,u8* colList){
;	---------------------------------
; Function initGameobjest
; ---------------------------------
_initGameobjest::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:73: P_portal=portales;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(_P_portal), hl
;src/gameObject/gameObject.c:74: P_puertas=puertas;
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	(_P_puertas), hl
;src/gameObject/gameObject.c:75: P_col=colec;
	ld	l,8 (ix)
	ld	h,9 (ix)
	ld	(_P_col), hl
;src/gameObject/gameObject.c:76: P_luz=colLuz;
	ld	l,10 (ix)
	ld	h,11 (ix)
	ld	(_P_luz), hl
;src/gameObject/gameObject.c:77: P_fam=colFam;
	ld	l,12 (ix)
	ld	h,13 (ix)
	ld	(_P_fam), hl
;src/gameObject/gameObject.c:78: P_ams=colAms;
	ld	l,14 (ix)
	ld	h,15 (ix)
	ld	(_P_ams), hl
;src/gameObject/gameObject.c:79: P_colList=colList;   
	ld	l,16 (ix)
	ld	h,17 (ix)
	ld	(_P_colList), hl
	pop	ix
	ret
;src/gameObject/gameObject.c:82: void dibujarGameObject(TGameObject* objeto){
;	---------------------------------
; Function dibujarGameObject
; ---------------------------------
_dibujarGameObject::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:83: if(objeto->posx!=0){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, a
	jp	Z, 00237$
;src/gameObject/gameObject.c:84: if(objeto->sprite==sprite_Player){
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
;src/gameObject/gameObject.c:85: cpct_drawSprite(Character_Principal_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
;src/gameObject/gameObject.c:84: if(objeto->sprite==sprite_Player){
	ld	a, e
	dec	a
	jr	NZ,00233$
;src/gameObject/gameObject.c:85: cpct_drawSprite(Character_Principal_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_Character_Principal_0
	push	hl
	call	_cpct_drawSprite
	jp	00237$
00233$:
;src/gameObject/gameObject.c:86: }else if(objeto->sprite==sprite_Rock_G){
	ld	a, e
	sub	a, #0x02
	jr	NZ,00230$
;src/gameObject/gameObject.c:87: cpct_drawSprite(Block_Move1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_Block_Move1_G_0
	push	hl
	call	_cpct_drawSprite
	jp	00237$
00230$:
;src/gameObject/gameObject.c:88: }else if(objeto->sprite==sprite_Rock_B){
	ld	a, e
	sub	a, #0x03
	jr	NZ,00227$
;src/gameObject/gameObject.c:89: cpct_drawSprite(Block_Move1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Move1_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00227$:
;src/gameObject/gameObject.c:90: }else if(objeto->sprite==sprite_Rock_nomove_B){
	ld	a, e
	sub	a, #0x04
	jr	NZ,00224$
;src/gameObject/gameObject.c:91: cpct_drawSprite(Block_Move0_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Move0_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00224$:
;src/gameObject/gameObject.c:92: }else if(objeto->sprite==sprite_RockInmovil1_G){
	ld	a, e
	sub	a, #0x07
	jr	NZ,00221$
;src/gameObject/gameObject.c:93: cpct_drawSprite(Block_Static1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static1_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00221$:
;src/gameObject/gameObject.c:94: }else if(objeto->sprite==sprite_RockInmovil1_B){
	ld	a, e
	sub	a, #0x08
	jr	NZ,00218$
;src/gameObject/gameObject.c:95: cpct_drawSprite(Block_Static1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static1_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00218$:
;src/gameObject/gameObject.c:96: }else if(objeto->sprite==sprite_RockInmovil2_G){
	ld	a, e
	sub	a, #0x09
	jr	NZ,00215$
;src/gameObject/gameObject.c:97: cpct_drawSprite(Block_Static2_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static2_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00215$:
;src/gameObject/gameObject.c:98: }else if(objeto->sprite==sprite_RockInmovil2_B){
	ld	a, e
	sub	a, #0x0a
	jr	NZ,00212$
;src/gameObject/gameObject.c:99: cpct_drawSprite(Block_Static2_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static2_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00212$:
;src/gameObject/gameObject.c:100: }else if(objeto->sprite==sprite_RockInmovil3_G){
	ld	a, e
	sub	a, #0x0b
	jr	NZ,00209$
;src/gameObject/gameObject.c:101: cpct_drawSprite(Block_Static3_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static3_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00209$:
;src/gameObject/gameObject.c:102: }else if(objeto->sprite==sprite_RockInmovil3_B){
	ld	a, e
	sub	a, #0x0c
	jr	NZ,00206$
;src/gameObject/gameObject.c:103: cpct_drawSprite(Block_Static3_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static3_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00206$:
;src/gameObject/gameObject.c:104: }else if(objeto->sprite==sprite_RockInmovil4_G){
	ld	a, e
	sub	a, #0x0d
	jr	NZ,00203$
;src/gameObject/gameObject.c:105: cpct_drawSprite(Block_Static4_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static4_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00203$:
;src/gameObject/gameObject.c:106: }else if(objeto->sprite==sprite_RockInmovil4_B){
	ld	a, e
	sub	a, #0x0e
	jr	NZ,00200$
;src/gameObject/gameObject.c:107: cpct_drawSprite(Block_Static4_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static4_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00200$:
;src/gameObject/gameObject.c:108: }else if(objeto->sprite==sprite_RockInmovil5_G){
	ld	a, e
	sub	a, #0x0f
	jr	NZ,00197$
;src/gameObject/gameObject.c:109: cpct_drawSprite(Block_Static5_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static5_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00197$:
;src/gameObject/gameObject.c:110: }else if(objeto->sprite==sprite_RockInmovil5_B){
	ld	a, e
	sub	a, #0x10
	jr	NZ,00194$
;src/gameObject/gameObject.c:111: cpct_drawSprite(Block_Static5_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static5_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00194$:
;src/gameObject/gameObject.c:112: }else if(objeto->sprite==sprite_RockInmovil6_G){
	ld	a, e
	sub	a, #0x11
	jr	NZ,00191$
;src/gameObject/gameObject.c:113: cpct_drawSprite(Block_Static6_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static6_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00191$:
;src/gameObject/gameObject.c:114: }else if(objeto->sprite==sprite_RockInmovil7_G){
	ld	a, e
	sub	a, #0x13
	jr	NZ,00188$
;src/gameObject/gameObject.c:115: cpct_drawSprite(Block_Static7_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static7_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00188$:
;src/gameObject/gameObject.c:116: }else if(objeto->sprite==sprite_RockInmovil7_B){
	ld	a, e
	sub	a, #0x14
	jr	NZ,00185$
;src/gameObject/gameObject.c:117: cpct_drawSprite(Block_Static7_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static7_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00185$:
;src/gameObject/gameObject.c:118: }else if(objeto->sprite==sprite_RockInmovil8_G){
	ld	a, e
	sub	a, #0x15
	jr	NZ,00182$
;src/gameObject/gameObject.c:119: cpct_drawSprite(Block_Static8_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static8_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00182$:
;src/gameObject/gameObject.c:120: }else if(objeto->sprite==sprite_RockInmovil8_B){
	ld	a, e
	sub	a, #0x16
	jr	NZ,00179$
;src/gameObject/gameObject.c:121: cpct_drawSprite(Block_Static8_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static8_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00179$:
;src/gameObject/gameObject.c:122: }else if(objeto->sprite==sprite_RockInmovil9_G){
	ld	a, e
	sub	a, #0x17
	jr	NZ,00176$
;src/gameObject/gameObject.c:123: cpct_drawSprite(Block_Static9_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static9_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00176$:
;src/gameObject/gameObject.c:124: }else if(objeto->sprite==sprite_RockInmovil9_B){
	ld	a, e
	sub	a, #0x18
	jr	NZ,00173$
;src/gameObject/gameObject.c:125: cpct_drawSprite(Block_Static9_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static9_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00173$:
;src/gameObject/gameObject.c:126: }else if(objeto->sprite==sprite_RockLineal1_G){
	ld	a, e
	sub	a, #0x05
	jr	NZ,00170$
;src/gameObject/gameObject.c:127: cpct_drawSprite(Block_Move2_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Move2_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00170$:
;src/gameObject/gameObject.c:128: }else if(objeto->sprite==sprite_RockLineal1_B){
	ld	a, e
	sub	a, #0x06
	jr	NZ,00167$
;src/gameObject/gameObject.c:129: cpct_drawSprite(Block_Move2_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Move2_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00167$:
;src/gameObject/gameObject.c:130: }else if(objeto->sprite==sprite_PortalMuro){
	ld	a, e
	sub	a, #0x19
	jr	NZ,00164$
;src/gameObject/gameObject.c:131: cpct_drawSprite(PortalWall_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_PortalWall_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00164$:
;src/gameObject/gameObject.c:132: }else if(objeto->sprite==sprite_PuertaPortal_G){
	ld	a, e
	sub	a, #0x1a
	jr	NZ,00161$
;src/gameObject/gameObject.c:133: cpct_drawSprite(PortalDoor_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_PortalDoor_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00161$:
;src/gameObject/gameObject.c:134: }else if(objeto->sprite==sprite_Muro_Solid1){
	ld	a, e
	sub	a, #0x1d
	jr	NZ,00158$
;src/gameObject/gameObject.c:135: cpct_drawSprite(Wall_Solid1_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Wall_Solid1_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00158$:
;src/gameObject/gameObject.c:136: }else if(objeto->sprite==sprite_Muro_Polvo1){
	ld	a, e
	sub	a, #0x1c
	jr	NZ,00155$
;src/gameObject/gameObject.c:137: cpct_drawSprite(Wall_Dust_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Wall_Dust_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00155$:
;src/gameObject/gameObject.c:138: }else if(objeto->sprite==sprite_PuertaPortal_B){
	ld	a, e
	sub	a, #0x1b
	jr	NZ,00152$
;src/gameObject/gameObject.c:139: cpct_drawSprite(PortalDoor_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_PortalDoor_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00152$:
;src/gameObject/gameObject.c:140: }else if(objeto->sprite==sprite_Puerta_G){
	ld	a, e
	sub	a, #0x1e
	jr	NZ,00149$
;src/gameObject/gameObject.c:141: cpct_drawSprite(Door_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Door_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00149$:
;src/gameObject/gameObject.c:142: }else if(objeto->sprite==sprite_Puerta_B){
	ld	a, e
	sub	a, #0x1f
	jr	NZ,00146$
;src/gameObject/gameObject.c:143: cpct_drawSprite(Door_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Door_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00146$:
;src/gameObject/gameObject.c:144: }else if(objeto->sprite==sprite_StairUp1_G){
	ld	a, e
	sub	a, #0x20
	jr	NZ,00143$
;src/gameObject/gameObject.c:145: cpct_drawSprite(StairUp1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_StairUp1_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00143$:
;src/gameObject/gameObject.c:146: }else if(objeto->sprite==sprite_StairUp1_B){
	ld	a, e
	sub	a, #0x21
	jr	NZ,00140$
;src/gameObject/gameObject.c:147: cpct_drawSprite(StairUp1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_StairUp1_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00140$:
;src/gameObject/gameObject.c:148: }else if(objeto->sprite==sprite_StairDown1_G){
	ld	a, e
	sub	a, #0x22
	jr	NZ,00137$
;src/gameObject/gameObject.c:149: cpct_drawSprite(StairDown1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_StairDown1_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00137$:
;src/gameObject/gameObject.c:150: }else if(objeto->sprite==sprite_StairDown1_B){
	ld	a, e
	sub	a, #0x23
	jr	NZ,00134$
;src/gameObject/gameObject.c:151: cpct_drawSprite(StairDown1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_StairDown1_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00134$:
;src/gameObject/gameObject.c:152: }else if(objeto->sprite==sprite_hole){
	ld	a, e
	sub	a, #0x24
	jr	NZ,00131$
;src/gameObject/gameObject.c:153: cpct_drawSprite(Block_Hole_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Hole_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00131$:
;src/gameObject/gameObject.c:154: }else if(objeto->sprite==sprite_amstrad){
	ld	a, e
	sub	a, #0x2e
	jr	NZ,00128$
;src/gameObject/gameObject.c:155: cpct_drawSprite(Amstrad_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Amstrad_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00128$:
;src/gameObject/gameObject.c:156: }else if(objeto->sprite==sprite_PrinceofPersia1_G){
	ld	a, e
	sub	a, #0x30
	jr	NZ,00125$
;src/gameObject/gameObject.c:157: cpct_drawSprite(PrinceOfPersia_PJ_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_PrinceOfPersia_PJ_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00125$:
;src/gameObject/gameObject.c:158: }else if(objeto->sprite==sprite_PrinceofPersia1_B){
	ld	a, e
	sub	a, #0x31
	jr	NZ,00122$
;src/gameObject/gameObject.c:159: cpct_drawSprite(PrinceOfPersia_PJ_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_PrinceOfPersia_PJ_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00122$:
;src/gameObject/gameObject.c:160: }else if(objeto->sprite==sprite_PrinceofPersia2_G){
	ld	a, e
	sub	a, #0x32
	jr	NZ,00119$
;src/gameObject/gameObject.c:161: cpct_drawSprite(PrinceOfPersia_ENE_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_PrinceOfPersia_ENE_G_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00119$:
;src/gameObject/gameObject.c:162: }else if(objeto->sprite==sprite_PrinceofPersia2_B){
	ld	a, e
	sub	a, #0x33
	jr	NZ,00116$
;src/gameObject/gameObject.c:163: cpct_drawSprite(PrinceOfPersia_ENE_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_PrinceOfPersia_ENE_B_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00237$
00116$:
;src/gameObject/gameObject.c:164: }else if(objeto->sprite==sprite_PrinceofPersia3){
	ld	a, e
	sub	a, #0x34
	jr	NZ,00113$
;src/gameObject/gameObject.c:165: cpct_drawSprite(PrinceOfPersia_COVER_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_PrinceOfPersia_COVER_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jr	00237$
00113$:
;src/gameObject/gameObject.c:166: }else if(objeto->sprite==sprite_enemigo1){
	ld	a, e
	sub	a, #0x2a
	jr	NZ,00110$
;src/gameObject/gameObject.c:167: cpct_drawSprite(Enemy_01_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Enemy_01_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jr	00237$
00110$:
;src/gameObject/gameObject.c:168: }else if(objeto->sprite==sprite_zul1_1){
	ld	a, e
	sub	a, #0x2c
	jr	NZ,00107$
;src/gameObject/gameObject.c:169: cpct_drawSprite(zul1_1_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_zul1_1_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jr	00237$
00107$:
;src/gameObject/gameObject.c:170: }else if(objeto->sprite==sprite_zul1_2){
	ld	a, e
	sub	a, #0x2d
	jr	NZ,00104$
;src/gameObject/gameObject.c:171: cpct_drawSprite(zul1_2_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_zul1_2_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jr	00237$
00104$:
;src/gameObject/gameObject.c:172: }else if(objeto->sprite==sprite_RockInmovil6_B){
	ld	a, e
	sub	a, #0x12
	jr	NZ,00237$
;src/gameObject/gameObject.c:173: cpct_drawSprite(Block_Static6_BB_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Static6_BB_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
00237$:
	pop	ix
	ret
;src/gameObject/gameObject.c:178: void dibujarGameObjectCol(TGameObjectCol* objeto){
;	---------------------------------
; Function dibujarGameObjectCol
; ---------------------------------
_dibujarGameObjectCol::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:179: if(objeto->posx!=0){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, a
	jp	Z, 00120$
;src/gameObject/gameObject.c:180: if(objeto->sprite==sprite_luz){
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
;src/gameObject/gameObject.c:181: cpct_drawSprite(LuzAzul_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
;src/gameObject/gameObject.c:180: if(objeto->sprite==sprite_luz){
	ld	a, e
	sub	a, #0x25
	jr	NZ,00116$
;src/gameObject/gameObject.c:181: cpct_drawSprite(LuzAzul_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_LuzAzul_0
	push	hl
	call	_cpct_drawSprite
	jp	00120$
00116$:
;src/gameObject/gameObject.c:182: }else if(objeto->sprite==sprite_familia1){
	ld	a, e
	sub	a, #0x26
	jr	NZ,00113$
;src/gameObject/gameObject.c:183: cpct_drawSprite(Character_Brother_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_Character_Brother_0
	push	hl
	call	_cpct_drawSprite
	jr	00120$
00113$:
;src/gameObject/gameObject.c:184: }else if(objeto->sprite==sprite_familia2){
	ld	a, e
	sub	a, #0x27
	jr	NZ,00110$
;src/gameObject/gameObject.c:185: cpct_drawSprite(Character_Sister_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Character_Sister_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jr	00120$
00110$:
;src/gameObject/gameObject.c:186: }else if(objeto->sprite==sprite_familia3){
	ld	a, e
	sub	a, #0x28
	jr	NZ,00107$
;src/gameObject/gameObject.c:187: cpct_drawSprite(Character_Mother_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Character_Mother_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jr	00120$
00107$:
;src/gameObject/gameObject.c:188: }else if(objeto->sprite==sprite_familia4){
	ld	a, e
	sub	a, #0x29
	jr	NZ,00104$
;src/gameObject/gameObject.c:189: cpct_drawSprite(Character_Father_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Character_Father_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jr	00120$
00104$:
;src/gameObject/gameObject.c:190: }else if(objeto->sprite==sprite_amstradTape){
	ld	a, e
	sub	a, #0x2f
	jr	NZ,00120$
;src/gameObject/gameObject.c:191: cpct_drawSprite(PrinceOfPersia_Tape_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_PrinceOfPersia_Tape_0+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
00120$:
	pop	ix
	ret
;src/gameObject/gameObject.c:195: void dibujarGameObjectColSprite(u8 sprite,u8 posx, u8 posy){
;	---------------------------------
; Function dibujarGameObjectColSprite
; ---------------------------------
_dibujarGameObjectColSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:197: cpct_drawSprite(LuzAzul_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);  
	ld	l, 6 (ix)
	ld	h, #0x00
	ld	e, 5 (ix)
	ld	d, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ex	de,hl
	add	hl, hl
	add	hl, hl
	ld	e, c
	ld	d, b
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, c
	and	a, #0x07
	ld	c, a
	inc	hl
	push	hl
	pop	iy
	ld	a, c
	rlca
	rlca
	rlca
	and	a, #0xf8
	ld	b, a
	ld	c, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #0xc000
	add	hl, de
	add	hl,bc
	ld	c, l
	ld	b, h
	add	iy, bc
	push	iy
	pop	bc
;src/gameObject/gameObject.c:196: if(sprite==sprite_luz){
	ld	a, 4 (ix)
	sub	a, #0x25
	jr	NZ,00116$
;src/gameObject/gameObject.c:197: cpct_drawSprite(LuzAzul_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);  
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_LuzAzul_0
	push	hl
	call	_cpct_drawSprite
	jr	00118$
00116$:
;src/gameObject/gameObject.c:198: }else if(sprite==sprite_familia1){
	ld	a, 4 (ix)
	sub	a, #0x26
	jr	NZ,00113$
;src/gameObject/gameObject.c:199: cpct_drawSprite(Character_Brother_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_Character_Brother_0
	push	hl
	call	_cpct_drawSprite
	jr	00118$
00113$:
;src/gameObject/gameObject.c:200: }else if(sprite==sprite_familia2){
	ld	a, 4 (ix)
	sub	a, #0x27
	jr	NZ,00110$
;src/gameObject/gameObject.c:201: cpct_drawSprite(Character_Sister_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_Character_Sister_0
	push	hl
	call	_cpct_drawSprite
	jr	00118$
00110$:
;src/gameObject/gameObject.c:202: }else if(sprite==sprite_familia3){
	ld	a, 4 (ix)
	sub	a, #0x28
	jr	NZ,00107$
;src/gameObject/gameObject.c:203: cpct_drawSprite(Character_Mother_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_Character_Mother_0
	push	hl
	call	_cpct_drawSprite
	jr	00118$
00107$:
;src/gameObject/gameObject.c:204: }else if(sprite==sprite_familia4){
	ld	a, 4 (ix)
	sub	a, #0x29
	jr	NZ,00104$
;src/gameObject/gameObject.c:205: cpct_drawSprite(Character_Father_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_Character_Father_0
	push	hl
	call	_cpct_drawSprite
	jr	00118$
00104$:
;src/gameObject/gameObject.c:206: }else if(sprite==sprite_amstradTape){        
	ld	a, 4 (ix)
	sub	a, #0x2f
	jr	NZ,00118$
;src/gameObject/gameObject.c:207: cpct_drawSprite(PrinceOfPersia_Tape_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_PrinceOfPersia_Tape_0
	push	hl
	call	_cpct_drawSprite
00118$:
	pop	ix
	ret
;src/gameObject/gameObject.c:212: void limpiarRastro(u8 posx, u8 posy){
;	---------------------------------
; Function limpiarRastro
; ---------------------------------
_limpiarRastro::
;src/gameObject/gameObject.c:213: cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #3+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #0x1004
	push	bc
	ld	bc, #0x0000
	push	bc
	push	hl
	call	_cpct_drawSolidBox
	ret
;src/gameObject/gameObject.c:215: u8 moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
;	---------------------------------
; Function moverGameObject
; ---------------------------------
_moverGameObject::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:216: if(objeto->sprite==sprite_Player){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	dec	e
	jr	NZ,00102$
;src/gameObject/gameObject.c:217: return moverTipoPlayer(objeto,movimiento,rocasCol,rocasEspejo,posicion);
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, 6 (ix)
	push	af
	inc	sp
	push	bc
	call	_moverTipoPlayer
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	jr	00104$
00102$:
;src/gameObject/gameObject.c:219: return moverTipoRoca(objeto,movimiento,rocasCol,rocasEspejo,posicion);
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, 6 (ix)
	push	af
	inc	sp
	push	bc
	call	_moverTipoRoca
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
00104$:
	pop	ix
	ret
;src/gameObject/gameObject.c:223: void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocasEspejo,u8 posicion,u8 numMovimientos){
;	---------------------------------
; Function moverElEspejo
; ---------------------------------
_moverElEspejo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-13
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:225: u8 nextMovimiento=movimiento;
	ld	c, 5 (ix)
;src/gameObject/gameObject.c:230: if(movimiento==mover_Izquierda){
	ld	a, c
	dec	a
	jr	NZ,00102$
;src/gameObject/gameObject.c:231: nextMovimiento=mover_Derecha;
	ld	c, #0x03
00102$:
;src/gameObject/gameObject.c:232: }if(movimiento==mover_Derecha){
	ld	a, 5 (ix)
	sub	a, #0x03
	jr	NZ,00104$
;src/gameObject/gameObject.c:233: nextMovimiento=mover_Izquierda;
	ld	c, #0x01
00104$:
;src/gameObject/gameObject.c:236: if(posicion==posicion_Izquieda){
	ld	a, 8 (ix)
	or	a, a
	jr	NZ,00106$
;src/gameObject/gameObject.c:237: posicion=posicion_Derecha;
	ld	8 (ix), #0x01
	jr	00145$
00106$:
;src/gameObject/gameObject.c:239: posicion=posicion_Izquieda;
	ld	8 (ix), #0x00
;src/gameObject/gameObject.c:242: for(u8 i=0;i<RocasMaximas;i++){
00145$:
	ld	b, #0x00
00128$:
	ld	a, b
	sub	a, #0x28
	jp	NC, 00130$
;src/gameObject/gameObject.c:243: if(rocasEspejo[i].num==num){
	ld	e,b
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ex	de,hl
	ld	a, 6 (ix)
	add	a, e
	ld	e, a
	ld	a, 7 (ix)
	adc	a, d
	ld	d, a
	ld	a, (de)
	ld	-5 (ix), a
	ld	a, 4 (ix)
	sub	a, -5 (ix)
	jp	NZ,00129$
;src/gameObject/gameObject.c:244: objetoEspejo=&rocasEspejo[i];              
;src/gameObject/gameObject.c:246: nextPosx=objetoEspejo->posx;
	ld	-9 (ix), e
	ld	-8 (ix), d
	inc	de
	ld	a, (de)
	ld	-5 (ix), a
	ld	-10 (ix), a
;src/gameObject/gameObject.c:247: nextPosy=objetoEspejo->posy;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
;src/gameObject/gameObject.c:248: if(objetoEspejo->posx!=0){
	ld	a, -5 (ix)
	or	a, a
	jp	Z, 00129$
;src/gameObject/gameObject.c:249: posicionObjeto=SinColision;
	ld	-12 (ix), #0x32
;src/gameObject/gameObject.c:250: for(u8 i=0;i<numMovimientos;i++){
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	-7 (ix), e
	ld	-6 (ix), d
	ld	-13 (ix), #0x00
00125$:
	ld	a, -13 (ix)
	sub	a, 9 (ix)
	jp	NC, 00129$
;src/gameObject/gameObject.c:251: if(posicionObjeto==SinColision){
	ld	a, -12 (ix)
	sub	a, #0x32
	jp	NZ,00126$
;src/gameObject/gameObject.c:252: nextMovimiento=calcularMaximosyMinimos(nextMovimiento,objetoEspejo->posx,objetoEspejo->posy,posicion);            
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e, (hl)
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	d, (hl)
	push	bc
	ld	a, 8 (ix)
	push	af
	inc	sp
	ld	a, e
	push	af
	inc	sp
	ld	e, c
	push	de
	call	_calcularMaximosyMinimos
	pop	af
	pop	af
	pop	bc
	ld	c, l
;src/gameObject/gameObject.c:253: if(nextMovimiento!=mover_SinMovimiento){
	ld	a, c
	or	a, a
	jp	Z, 00126$
;src/gameObject/gameObject.c:254: posicionObjeto=colisionesSiguientePosicion(objetoEspejo,objetoEspejo->posx,objetoEspejo->posy,nextMovimiento,rocasEspejo,posicion);                                          
	ld	a, 8 (ix)
	ld	-2 (ix), a
	ld	-1 (ix), #0x00
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e, (hl)
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	d, (hl)
	push	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	a, c
	push	af
	inc	sp
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_colisionesSiguientePosicion
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	bc
;src/gameObject/gameObject.c:251: if(posicionObjeto==SinColision){
	ld	-12 (ix), l
	ld	a, l
	sub	a, #0x32
	jr	NZ,00198$
	ld	a,#0x01
	jr	00199$
00198$:
	xor	a,a
00199$:
;src/gameObject/gameObject.c:255: if(posicionObjeto==SinColision){
	or	a, a
	jr	Z,00112$
;src/gameObject/gameObject.c:256: mover1casilla(&nextPosx,&nextPosy,nextMovimiento);                                                                                 
	ld	hl, #0x0002
	add	hl, sp
	ex	de,hl
	ld	hl, #0x0003
	add	hl, sp
	push	bc
	ld	a, c
	push	af
	inc	sp
	push	de
	push	hl
	call	_mover1casilla
	pop	af
	inc	sp
	ld	h, -11 (ix)
	ld	l, -10 (ix)
	ex	(sp),hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_moverYdibujar
	pop	af
	pop	af
	pop	bc
	jr	00126$
00112$:
;src/gameObject/gameObject.c:259: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
	or	a, a
	jr	NZ,00126$
	ld	a, -12 (ix)
	sub	a, #0x33
	jr	Z,00126$
;src/gameObject/gameObject.c:260: taparHole(objetoEspejo,&rocasEspejo[posicionObjeto]);                                
	ld	e,-12 (ix)
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ex	de,hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	add	hl, de
	push	bc
	push	hl
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	push	hl
	call	_taparHole
	pop	af
	pop	af
	pop	bc
00126$:
;src/gameObject/gameObject.c:250: for(u8 i=0;i<numMovimientos;i++){
	inc	-13 (ix)
	jp	00125$
00129$:
;src/gameObject/gameObject.c:242: for(u8 i=0;i<RocasMaximas;i++){
	inc	b
	jp	00128$
00130$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:272: void cambiarPosicion(u8* posicion){    
;	---------------------------------
; Function cambiarPosicion
; ---------------------------------
_cambiarPosicion::
;src/gameObject/gameObject.c:273: if(*posicion==posicion_Izquieda){
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, (hl)
	or	a, a
	jr	NZ,00102$
;src/gameObject/gameObject.c:274: *posicion=posicion_Derecha;        
	ld	(hl), #0x01
	ret
00102$:
;src/gameObject/gameObject.c:276: *posicion=posicion_Izquieda;       
	ld	(hl), #0x00
	ret
;src/gameObject/gameObject.c:281: void moverYdibujar(TGameObject* objeto,u8 posx,u8 posy){
;	---------------------------------
; Function moverYdibujar
; ---------------------------------
_moverYdibujar::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/gameObject/gameObject.c:282: limpiarRastro(objeto->posx,objeto->posy);    
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl, #0x0002
	add	hl,bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	e, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	ld	d, (hl)
	push	hl
	push	bc
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	call	_limpiarRastro
	pop	af
	pop	bc
	pop	hl
;src/gameObject/gameObject.c:283: objeto->posx=posx;
	ld	a, 6 (ix)
	ld	(hl), a
;src/gameObject/gameObject.c:284: objeto->posy=posy;
	pop	hl
	push	hl
	ld	a, 7 (ix)
	ld	(hl), a
;src/gameObject/gameObject.c:285: dibujarGameObject(objeto);
	push	bc
	call	_dibujarGameObject
	ld	sp,ix
	pop	ix
	ret
;src/gameObject/gameObject.c:287: void taparHole(TGameObject* roca,TGameObject* hole){
;	---------------------------------
; Function taparHole
; ---------------------------------
_taparHole::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-6
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:288: if(hole->sprite==sprite_hole){
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, #0x24
	jr	NZ,00103$
;src/gameObject/gameObject.c:289: limpiarRastro(roca->posx,roca->posy);
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	hl, #0x0002
	add	hl,de
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	de
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	l, e
	ld	h, d
	ld	d, (hl)
	push	bc
	ld	a, -2 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_limpiarRastro
	pop	af
	pop	bc
;src/gameObject/gameObject.c:290: limpiarRastro(hole->posx,hole->posy);
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	ld	-2 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-1 (ix), a
	push	bc
	push	de
	ld	h, -2 (ix)
	ld	l, -1 (ix)
	push	hl
	call	_limpiarRastro
	pop	af
	pop	de
	pop	bc
;src/gameObject/gameObject.c:291: roca->posx=0;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl), #0x00
;src/gameObject/gameObject.c:292: roca->posy=0;
	pop	hl
	push	hl
	ld	(hl), #0x00
;src/gameObject/gameObject.c:293: hole->posx=0;
	xor	a, a
	ld	(bc), a
;src/gameObject/gameObject.c:294: hole->posy=0;
	xor	a, a
	ld	(de), a
00103$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:304: u8 moverTipoPlayer(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
;	---------------------------------
; Function moverTipoPlayer
; ---------------------------------
_moverTipoPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-15
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:305: if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){           
	ld	a, 4 (ix)
	ld	-6 (ix), a
	ld	a, 5 (ix)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	add	a, #0x05
	ld	-3 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-2 (ix), a
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	Z,00117$
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	b, (hl)
	dec	b
	jp	Z,00118$
00117$:
;src/gameObject/gameObject.c:306: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);            
	ld	c,11 (ix)
	ld	b,12 (ix)
	ld	a, (bc)
	ld	-1 (ix), a
	ld	a, -6 (ix)
	add	a, #0x02
	ld	-8 (ix), a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a, (hl)
	ld	-4 (ix), a
	ld	e,-6 (ix)
	ld	d,-5 (ix)
	inc	de
	ld	a, (de)
	ld	-11 (ix), a
	push	bc
	push	de
	ld	h, -1 (ix)
	ld	l, -4 (ix)
	push	hl
	ld	h, -11 (ix)
	ld	l, 6 (ix)
	push	hl
	call	_calcularMaximosyMinimos
	pop	af
	pop	af
	ld	-11 (ix), l
	pop	de
	pop	bc
;src/gameObject/gameObject.c:307: if(movimiento!=mover_SinMovimiento){                  
	ld	a, -11 (ix)
	or	a, a
	jp	Z, 00119$
;src/gameObject/gameObject.c:308: u8 nextPosx=objeto->posx;
	ld	a, (de)
	ld	-14 (ix), a
;src/gameObject/gameObject.c:309: u8 nextPosy=objeto->posy;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a, (hl)
	ld	-15 (ix), a
;src/gameObject/gameObject.c:312: u8 moverRoca=mover_roca;
	ld	-12 (ix), #0x00
;src/gameObject/gameObject.c:317: mover1casilla(&nextPosx,&nextPosy,movimiento);            
	ld	hl, #0x0000
	add	hl, sp
	ld	-8 (ix), l
	ld	-7 (ix), h
	ex	de,hl
	ld	hl, #0x0001
	add	hl, sp
	ld	-10 (ix), l
	ld	-9 (ix), h
	push	hl
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
	pop	iy
	pop	hl
	push	bc
	ld	a, -11 (ix)
	push	af
	inc	sp
	push	de
	push	iy
	call	_mover1casilla
	pop	af
	inc	sp
	ld	h, -15 (ix)
	ld	l, -14 (ix)
	ex	(sp),hl
	call	_comprobarPuertas
	pop	af
	ld	e, l
	pop	bc
;src/gameObject/gameObject.c:320: if(colisionPuerta!=seguir_En_Nivel){
	ld	a, e
	or	a, a
	jr	Z,00102$
;src/gameObject/gameObject.c:321: return colisionPuerta;
	ld	l, e
	jp	00121$
00102$:
;src/gameObject/gameObject.c:323: comprobarColeccionables(nextPosx,nextPosy,sprite_Player);            
	push	bc
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	ld	h, -15 (ix)
	ld	l, -14 (ix)
	push	hl
	call	_comprobarColeccionables
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/gameObject/gameObject.c:324: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);            
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	pop	iy
	ld	d, -10 (ix)
	ld	l, -9 (ix)
	ld	-10 (ix), d
	ld	-9 (ix), l
	push	bc
	push	de
	push	bc
	ld	a, -11 (ix)
	push	af
	inc	sp
	push	iy
	ld	l,-10 (ix)
	ld	h,-9 (ix)
	push	hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_comprobarPortales
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	de
	pop	bc
	ld	d, l
;src/gameObject/gameObject.c:325: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);            
	push	bc
	push	de
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	h, -15 (ix)
	ld	l, -14 (ix)
	push	hl
	call	_comprobarRocas
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	-13 (ix), l
;src/gameObject/gameObject.c:326: if(colisionPortales==hay_Colision){
	dec	d
	jr	NZ,00107$
;src/gameObject/gameObject.c:327: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasEspejo);
	push	bc
	push	de
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	h, -15 (ix)
	ld	l, -14 (ix)
	push	hl
	call	_comprobarRocas
	pop	af
	pop	af
	pop	de
	pop	bc
;src/gameObject/gameObject.c:328: if(ObjetoColisionado!=SinColision){
	ld	-13 (ix), l
	ld	a, l
	sub	a, #0x32
	jr	Z,00104$
;src/gameObject/gameObject.c:329: moverRoca=no_mover_roca;
	ld	-12 (ix), #0x01
	jr	00107$
00104$:
;src/gameObject/gameObject.c:331: cambiarPosicion(posicion);                                   
	push	bc
	push	de
	push	bc
	call	_cambiarPosicion
	pop	af
	pop	de
	pop	bc
00107$:
;src/gameObject/gameObject.c:334: colisionEnemigo=comprobarEnemigos(nextPosx,nextPosy,*posicion);
	ld	a, (bc)
	ld	b, a
	push	de
	push	bc
	inc	sp
	ld	h, -15 (ix)
	ld	l, -14 (ix)
	push	hl
	call	_comprobarEnemigos
	pop	af
	inc	sp
	pop	de
;src/gameObject/gameObject.c:335: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision && colisionEnemigo==no_Hay_Colision){             
	ld	a, -13 (ix)
	sub	a,#0x32
	jr	NZ,00111$
	or	a,e
	jr	NZ,00111$
	or	a,l
	jr	NZ,00111$
;src/gameObject/gameObject.c:336: moverYdibujar(objeto,nextPosx,nextPosy);
	ld	h, -15 (ix)
	ld	l, -14 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverYdibujar
	pop	af
	pop	af
;src/gameObject/gameObject.c:337: objeto->pasos++;                           
	ld	a, -6 (ix)
	add	a, #0x06
	ld	c, a
	ld	a, -5 (ix)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	inc	a
	ld	(bc), a
;src/gameObject/gameObject.c:338: cpct_akp_SFXPlay(1,15,80,0,0,AY_CHANNEL_A);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #0x0000
	push	hl
	ld	l, #0x50
	push	hl
	ld	hl, #0x0f01
	push	hl
	call	_cpct_akp_SFXPlay
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:339: cpct_akp_SFXPlay(1,15,50,0,0,AY_CHANNEL_A);                                                 
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #0x0000
	push	hl
	ld	l, #0x32
	push	hl
	ld	hl, #0x0f01
	push	hl
	call	_cpct_akp_SFXPlay
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	jr	00112$
00111$:
;src/gameObject/gameObject.c:342: if(moverRoca==mover_roca)          
	ld	a, -12 (ix)
	or	a, a
	jr	NZ,00112$
;src/gameObject/gameObject.c:343: moverGameObject(&rocasCol[ObjetoColisionado],movimiento,rocasCol,rocasEspejo,posicion);                      
	ld	c,-13 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, 7 (ix)
	add	a, c
	ld	c, a
	ld	a, 8 (ix)
	adc	a, b
	ld	b, a
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, -11 (ix)
	push	af
	inc	sp
	push	bc
	call	_moverGameObject
	ld	hl, #9
	add	hl, sp
	ld	sp, hl
00112$:
;src/gameObject/gameObject.c:345: objeto->cronoMovimiento=retardoMovimiento;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl), #0x05
	jr	00119$
00118$:
;src/gameObject/gameObject.c:348: objeto->cronoMovimiento-=1;
	dec	c
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl), c
00119$:
;src/gameObject/gameObject.c:350: return seguir_En_Nivel;
	ld	l, #0x00
00121$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:352: u8 moverTipoRoca(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
;	---------------------------------
; Function moverTipoRoca
; ---------------------------------
_moverTipoRoca::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-13
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:354: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);
	ld	a, 11 (ix)
	ld	-4 (ix), a
	ld	a, 12 (ix)
	ld	-3 (ix), a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d, (hl)
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl, #0x0002
	add	hl,bc
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	e, (hl)
	ld	hl, #0x0001
	add	hl,bc
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	a, (hl)
	ld	-9 (ix), a
	push	bc
	push	de
	inc	sp
	ld	d, e
	ld	e, -9 (ix)
	push	de
	ld	a, 6 (ix)
	push	af
	inc	sp
	call	_calcularMaximosyMinimos
	pop	af
	pop	af
	ld	e, l
	pop	bc
;src/gameObject/gameObject.c:356: if(movimiento!=mover_SinMovimiento && objeto->movimiento != sin_Movimiento){                  
	ld	a, e
	or	a, a
	jp	Z, 00123$
	ld	hl, #0x0004
	add	hl,bc
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	d, (hl)
	ld	a, d
	or	a, a
	jp	Z, 00123$
;src/gameObject/gameObject.c:357: u8 nextPosx=objeto->posx;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a, (hl)
	ld	-12 (ix), a
;src/gameObject/gameObject.c:358: u8 nextPosy=objeto->posy;
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	ld	-13 (ix), a
;src/gameObject/gameObject.c:359: u8 numMovimientos=0;
	ld	-9 (ix), #0x00
;src/gameObject/gameObject.c:363: if(objeto->movimiento==mover_1){
	ld	a, d
	dec	a
	jr	NZ,00104$
;src/gameObject/gameObject.c:364: mover1casilla(&nextPosx,&nextPosy,movimiento);
	ld	hl, #0x0000
	add	hl, sp
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	iy,#0x0001
	add	iy,sp
	push	bc
	push	de
	ld	a, e
	push	af
	inc	sp
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	push	iy
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/gameObject/gameObject.c:365: numMovimientos=1;                 
	ld	-9 (ix), #0x01
	jr	00105$
00104$:
;src/gameObject/gameObject.c:366: }else if(objeto->movimiento==mover_Linea){
	ld	a, d
	sub	a, #0x02
	jr	NZ,00105$
;src/gameObject/gameObject.c:367: numMovimientos=movimientoLineal(objeto,&nextPosx,&nextPosy,movimiento,rocasCol,*posicion);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d, (hl)
	ld	hl, #0x0000
	add	hl, sp
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	iy,#0x0001
	add	iy,sp
	push	bc
	push	de
	push	de
	inc	sp
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, e
	push	af
	inc	sp
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	push	iy
	push	bc
	call	_movimientoLineal
	ld	iy, #10
	add	iy, sp
	ld	sp, iy
	pop	de
	pop	bc
	ld	-9 (ix), l
00105$:
;src/gameObject/gameObject.c:369: posicionObjeto=colisionesSiguientePosicion(objeto,objeto->posx,objeto->posy,movimiento,rocasCol,posicion);                                      
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	ld	-11 (ix), a
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	d, (hl)
	push	bc
	push	de
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, e
	push	af
	inc	sp
	ld	a, -11 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	push	bc
	call	_colisionesSiguientePosicion
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	de
	pop	bc
	ld	a, l
;src/gameObject/gameObject.c:370: if(posicionObjeto==SinColision){
	cp	a, #0x32
	jp	NZ,00120$
;src/gameObject/gameObject.c:371: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);             
	push	bc
	push	de
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	d, e
	ld	e, -13 (ix)
	push	de
	ld	a, -12 (ix)
	push	af
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_colisionesSiguientePosicion
	ld	hl, #9
	add	hl, sp
	ld	sp, hl
	ld	h, -13 (ix)
	ld	l, -12 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_moverYdibujar
	pop	af
	pop	af
	pop	de
	pop	bc
;src/gameObject/gameObject.c:373: moverElEspejo(objeto->num,movimiento,rocasEspejo,*posicion,numMovimientos);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	d, (hl)
	ld	a, (bc)
	ld	-11 (ix), a
	push	bc
	push	de
	ld	a, -9 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	d, e
	ld	e, -11 (ix)
	push	de
	call	_moverElEspejo
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;src/gameObject/gameObject.c:374: if(objeto->movimiento==mover_1){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	cp	a, #0x01
	jr	NZ,00115$
;src/gameObject/gameObject.c:375: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,mover_SinMovimiento,rocasCol,posicion);
	push	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	xor	a, a
	push	af
	inc	sp
	ld	h, -13 (ix)
	ld	l, -12 (ix)
	push	hl
	push	bc
	call	_colisionesSiguientePosicion
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	bc
	ld	a, l
;src/gameObject/gameObject.c:376: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
	cp	a, #0x32
	jp	Z,00123$
	cp	a, #0x33
	jp	Z,00123$
;src/gameObject/gameObject.c:377: taparHole(objeto,&rocasCol[posicionObjeto]);
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ex	de,hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	add	hl, de
	push	hl
	push	bc
	call	_taparHole
	pop	af
	pop	af
	jr	00123$
00115$:
;src/gameObject/gameObject.c:379: }else if(objeto->movimiento==mover_Linea){
	sub	a, #0x02
	jr	NZ,00123$
;src/gameObject/gameObject.c:380: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);
	push	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	d, e
	ld	e, -13 (ix)
	push	de
	ld	a, -12 (ix)
	push	af
	inc	sp
	push	bc
	call	_colisionesSiguientePosicion
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	bc
	ld	a, l
;src/gameObject/gameObject.c:381: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
	cp	a, #0x32
	jr	Z,00123$
	cp	a, #0x33
	jr	Z,00123$
;src/gameObject/gameObject.c:382: taparHole(objeto,&rocasCol[posicionObjeto]);
	ld	e,a
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ex	de,hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	add	hl, de
	push	hl
	push	bc
	call	_taparHole
	pop	af
	pop	af
	jr	00123$
00120$:
;src/gameObject/gameObject.c:386: if(posicionObjeto!=ColisionNoRocas){
	cp	a, #0x33
	jr	Z,00123$
;src/gameObject/gameObject.c:387: taparHole(objeto,&rocasCol[posicionObjeto]);
	ld	c,a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	l,7 (ix)
	ld	h,8 (ix)
	add	hl, bc
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_taparHole
	pop	af
	pop	af
00123$:
;src/gameObject/gameObject.c:393: return seguir_En_Nivel;
	ld	l, #0x00
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:401: void mover1casilla(u8* posx, u8* posy,u8 movimiento){
;	---------------------------------
; Function mover1casilla
; ---------------------------------
_mover1casilla::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:403: *posx-=1;
	ld	c,4 (ix)
	ld	b,5 (ix)
;src/gameObject/gameObject.c:402: if(movimiento==mover_Izquierda){
	ld	a, 8 (ix)
	dec	a
	jr	NZ,00110$
;src/gameObject/gameObject.c:403: *posx-=1;
	ld	a, (bc)
	add	a, #0xff
	ld	(bc), a
	jr	00112$
00110$:
;src/gameObject/gameObject.c:405: *posy-=1;
	ld	l,6 (ix)
	ld	h,7 (ix)
;src/gameObject/gameObject.c:404: }else if(movimiento==mover_Arriba){
	ld	a, 8 (ix)
	sub	a, #0x02
	jr	NZ,00107$
;src/gameObject/gameObject.c:405: *posy-=1;
	ld	c, (hl)
	dec	c
	ld	(hl), c
	jr	00112$
00107$:
;src/gameObject/gameObject.c:406: }else if(movimiento==mover_Derecha){
	ld	a, 8 (ix)
	sub	a, #0x03
	jr	NZ,00104$
;src/gameObject/gameObject.c:407: *posx+=1;
	ld	a, (bc)
	inc	a
	ld	(bc), a
	jr	00112$
00104$:
;src/gameObject/gameObject.c:408: }else if(movimiento==mover_Abajo){
	ld	a, 8 (ix)
	sub	a, #0x04
	jr	NZ,00112$
;src/gameObject/gameObject.c:409: *posy+=1;
	ld	c, (hl)
	inc	c
	ld	(hl), c
00112$:
	pop	ix
	ret
;src/gameObject/gameObject.c:413: u8 movimientoLineal(TGameObject* objeto,u8* posx, u8* posy,u8 movimiento,TGameObject* objetosCol,u8 posicion){    
;	---------------------------------
; Function movimientoLineal
; ---------------------------------
_movimientoLineal::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/gameObject/gameObject.c:416: while (colisionesSiguientePosicion(objeto,*posx,*posy,movimiento,objetosCol,posicion)==SinColision && movimiento!=mover_SinMovimiento)
	ld	a, 8 (ix)
	ld	-2 (ix), a
	ld	a, 9 (ix)
	ld	-1 (ix), a
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	-5 (ix), #0x00
00102$:
	ld	a, 13 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e, (hl)
	ld	a, (bc)
	ld	d, a
	push	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	a, 10 (ix)
	push	af
	inc	sp
	ld	a, e
	push	af
	inc	sp
	push	de
	inc	sp
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_colisionesSiguientePosicion
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	bc
	ld	a, l
	sub	a, #0x32
	jr	NZ,00104$
	ld	a, 10 (ix)
	or	a, a
	jr	Z,00104$
;src/gameObject/gameObject.c:418: movimiento=calcularMaximosyMinimos(movimiento,*posx,*posy,posicion);       
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d, (hl)
	ld	a, (bc)
	ld	e, a
	push	bc
	ld	a, 13 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	ld	d, e
	ld	e, 10 (ix)
	push	de
	call	_calcularMaximosyMinimos
	pop	af
	pop	af
	ld	d, l
	pop	bc
	ld	10 (ix), d
;src/gameObject/gameObject.c:419: mover1casilla(posx,posy,movimiento);
	push	bc
	push	de
	inc	sp
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	push	bc
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
	pop	bc
;src/gameObject/gameObject.c:420: contador++;                    
	inc	-5 (ix)
	jp	00102$
00104$:
;src/gameObject/gameObject.c:424: return contador;             
	ld	l, -5 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:432: u8 colisionesSiguientePosicion(TGameObject* objeto,u8 posx,u8 posy,u8 movimiento, TGameObject* rocasCol,u8* posicion){
;	---------------------------------
; Function colisionesSiguientePosicion
; ---------------------------------
_colisionesSiguientePosicion::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:433: u8 nextPosx=posx;
	ld	a, 6 (ix)
	ld	-6 (ix), a
;src/gameObject/gameObject.c:434: u8 nextPosy=posy;
	ld	a, 7 (ix)
	ld	-8 (ix), a
;src/gameObject/gameObject.c:441: mover1casilla(&nextPosx,&nextPosy,movimiento);
	ld	hl, #0x0000
	add	hl, sp
	ld	-5 (ix), l
	ld	-4 (ix), h
	ex	de,hl
	ld	hl, #0x0002
	add	hl, sp
	ld	-3 (ix), l
	ld	-2 (ix), h
	ld	c, l
	ld	b, h
	ld	a, 8 (ix)
	push	af
	inc	sp
	push	de
	push	bc
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
;src/gameObject/gameObject.c:442: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	h, -8 (ix)
	ld	l, -6 (ix)
	push	hl
	call	_comprobarRocas
	pop	af
	pop	af
;src/gameObject/gameObject.c:443: if(ObjetoColisionado!=SinColision){
	ld	a, l
	sub	a, #0x32
	jr	NZ,00135$
	ld	a,#0x01
	jr	00136$
00135$:
	xor	a,a
00136$:
	ld	-1 (ix), a
	bit	0, -1 (ix)
;src/gameObject/gameObject.c:444: return ObjetoColisionado;
	jp	Z,00109$
;src/gameObject/gameObject.c:446: colisionPuerta=comprobarPuertas(nextPosx,nextPosy);                      
	ld	h, -8 (ix)
	ld	l, -6 (ix)
	push	hl
	call	_comprobarPuertas
	pop	af
	ld	e, l
;src/gameObject/gameObject.c:447: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);                 
	ld	c,-5 (ix)
	ld	b,-4 (ix)
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	push	hl
	pop	iy
	push	de
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	a, 8 (ix)
	push	af
	inc	sp
	push	bc
	push	iy
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_comprobarPortales
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
;src/gameObject/gameObject.c:448: colisionColeccionable=comprobarColeccionables(nextPosx,nextPosy,sprite_Rock_B);
	ld	-7 (ix), l
	ld	a, #0x03
	push	af
	inc	sp
	ld	h, -8 (ix)
	ld	l, -6 (ix)
	push	hl
	call	_comprobarColeccionables
	pop	af
	inc	sp
	ld	c, l
	pop	de
;src/gameObject/gameObject.c:449: colisionEnemigos=comprobarEnemigos(nextPosx,nextPosy,*posicion);
	ld	l,11 (ix)
	ld	h,12 (ix)
	ld	b, (hl)
	push	bc
	push	de
	push	bc
	inc	sp
	ld	h, -8 (ix)
	ld	l, -6 (ix)
	push	hl
	call	_comprobarEnemigos
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/gameObject/gameObject.c:452: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision && colisionPortales==no_Hay_Colision && colisionColeccionable==no_Hay_Colision && colisionEnemigos==no_Hay_Colision){        
	bit	0, -1 (ix)
	jr	Z,00104$
	ld	a, e
	or	a, a
	jr	NZ,00104$
	ld	a, -7 (ix)
	or	a,a
	jr	NZ,00104$
	or	a,c
	jr	NZ,00104$
	or	a,l
	jr	NZ,00104$
;src/gameObject/gameObject.c:453: return SinColision;
	ld	l, #0x32
	jr	00109$
00104$:
;src/gameObject/gameObject.c:455: return ColisionNoRocas;
	ld	l, #0x33
00109$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:458: u8 comprobarRocas(u8 posx,u8 posy,TGameObject* rocas){
;	---------------------------------
; Function comprobarRocas
; ---------------------------------
_comprobarRocas::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:459: u8 colision=SinColision;   
;src/gameObject/gameObject.c:460: for(u8 i=0;i<RocasMaximas;i++){
	ld	bc,#0x0032
00107$:
	ld	a, b
	sub	a, #0x28
	jr	NC,00105$
;src/gameObject/gameObject.c:461: if(rocas[i].posx!=0){
	ld	e,b
	ld	d,#0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	ex	de,hl
	ld	a, 6 (ix)
	add	a, e
	ld	e, a
	ld	a, 7 (ix)
	adc	a, d
	ld	d, a
	ld	l, e
	ld	h, d
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	Z,00108$
;src/gameObject/gameObject.c:462: if(comprobarColisiones1vs1(posx,posy,rocas[i].posx,rocas[i].posy)==hay_Colision){                          
	ex	de,hl
	inc	hl
	inc	hl
	ld	d, (hl)
	push	bc
	ld	e, a
	push	de
	ld	h, 5 (ix)
	ld	l, 4 (ix)
	push	hl
	call	_comprobarColisiones1vs1
	pop	af
	pop	af
	pop	bc
	dec	l
	jr	NZ,00108$
;src/gameObject/gameObject.c:463: colision=i;
	ld	c, b
00108$:
;src/gameObject/gameObject.c:460: for(u8 i=0;i<RocasMaximas;i++){
	inc	b
	jr	00107$
00105$:
;src/gameObject/gameObject.c:467: return colision;
	ld	l, c
	pop	ix
	ret
;src/gameObject/gameObject.c:470: u8 comprobarPortales(TGameObject* objeto,u8* posx,u8* posy,u8 movimiento,u8* posicion){    
;	---------------------------------
; Function comprobarPortales
; ---------------------------------
_comprobarPortales::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-11
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:471: if(*posx==P_portal[0].posx ){
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	a, (bc)
	ld	-6 (ix), a
	ld	hl, (_P_portal)
	ex	(sp), hl
	pop	hl
	push	hl
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
;src/gameObject/gameObject.c:472: if(*posy==P_portal[0].posy ){
	ld	e,8 (ix)
	ld	d,9 (ix)
;src/gameObject/gameObject.c:473: if(objeto->sprite==sprite_Player){                
	ld	a, 4 (ix)
	ld	-9 (ix), a
	ld	a, 5 (ix)
	ld	-8 (ix), a
;src/gameObject/gameObject.c:474: *posx=P_portal[1].posx;
	ld	iy, #_P_portal
	ld	a, 0 (iy)
	add	a, #0x07
	ld	-4 (ix), a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	-3 (ix), a
;src/gameObject/gameObject.c:473: if(objeto->sprite==sprite_Player){                
	ld	a, -9 (ix)
	add	a, #0x03
	ld	-9 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
;src/gameObject/gameObject.c:474: *posx=P_portal[1].posx;
	ld	a, -4 (ix)
	add	a, #0x01
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
;src/gameObject/gameObject.c:471: if(*posx==P_portal[0].posx ){
	ld	a, -6 (ix)
	sub	a, -7 (ix)
	jr	NZ,00106$
;src/gameObject/gameObject.c:472: if(*posy==P_portal[0].posy ){
	ld	a, (de)
	ld	-5 (ix), a
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
	ld	a, -5 (ix)
	sub	a, -11 (ix)
	jr	NZ,00106$
;src/gameObject/gameObject.c:473: if(objeto->sprite==sprite_Player){                
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	l, (hl)
	dec	l
	jr	NZ,00102$
;src/gameObject/gameObject.c:474: *posx=P_portal[1].posx;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	ld	(bc), a
;src/gameObject/gameObject.c:475: *posy=P_portal[1].posy;
	ld	iy, #0x0007
	push	bc
	ld	bc, (_P_portal)
	add	iy, bc
	pop	bc
	ld	a, 2 (iy)
	ld	(de), a
;src/gameObject/gameObject.c:476: mover1casilla(posx,posy,movimiento);                
	ld	a, 10 (ix)
	push	af
	inc	sp
	push	de
	push	bc
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
00102$:
;src/gameObject/gameObject.c:478: return hay_Colision;               
	ld	l, #0x01
	jr	00113$
00106$:
;src/gameObject/gameObject.c:481: if(*posx==P_portal[1].posx){
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	sub	a, -5 (ix)
	jr	NZ,00112$
;src/gameObject/gameObject.c:482: if(*posy==P_portal[1].posy){
	ld	a, (de)
	ld	-5 (ix), a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	sub	a, -2 (ix)
	jr	NZ,00112$
;src/gameObject/gameObject.c:483: if(objeto->sprite==sprite_Player){
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	ld	l, (hl)
	dec	l
	jr	NZ,00108$
;src/gameObject/gameObject.c:484: *posx=P_portal[0].posx;
	ld	a, -7 (ix)
	ld	(bc), a
;src/gameObject/gameObject.c:485: *posy=P_portal[0].posy;
	ld	hl, (_P_portal)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(de), a
;src/gameObject/gameObject.c:486: mover1casilla(posx,posy,movimiento);                
	ld	a, 10 (ix)
	push	af
	inc	sp
	push	de
	push	bc
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
00108$:
;src/gameObject/gameObject.c:488: return hay_Colision;                   
	ld	l, #0x01
	jr	00113$
00112$:
;src/gameObject/gameObject.c:491: return no_Hay_Colision;        
	ld	l, #0x00
00113$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:493: u8 comprobarPuertas(u8 posx, u8 posy){
;	---------------------------------
; Function comprobarPuertas
; ---------------------------------
_comprobarPuertas::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:494: for(u8 i=0;i<PuertasMaximas;i++){
	ld	c, #0x00
00106$:
	ld	a, c
	sub	a, #0x06
	jr	NC,00104$
;src/gameObject/gameObject.c:495: if(posx==P_puertas[i].posx && posy==P_puertas[i].posy){
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	b, l
	ld	d, h
	ld	iy, #_P_puertas
	ld	a, 0 (iy)
	add	a, b
	ld	e, a
	ld	a, 1 (iy)
	adc	a, d
	ld	d, a
	ld	l, e
	ld	h, d
	inc	hl
	ld	a,4 (ix)
	sub	a,(hl)
	jr	NZ,00107$
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,5 (ix)
	sub	a,(hl)
	jr	NZ,00107$
;src/gameObject/gameObject.c:496: return P_puertas[i].num;
	ld	a, (de)
	ld	l, a
	jr	00108$
00107$:
;src/gameObject/gameObject.c:494: for(u8 i=0;i<PuertasMaximas;i++){
	inc	c
	jr	00106$
00104$:
;src/gameObject/gameObject.c:499: return seguir_En_Nivel;
	ld	l, #0x00
00108$:
	pop	ix
	ret
;src/gameObject/gameObject.c:501: u8 comprobarColeccionables(u8 posx, u8 posy ,u8 sprite){
;	---------------------------------
; Function comprobarColeccionables
; ---------------------------------
_comprobarColeccionables::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;src/gameObject/gameObject.c:502: for(u8 i=0;i<ColeccionablesMaximos;i++){
	ld	bc,#0x0000
00114$:
	ld	a, b
	sub	a, #0x03
	jp	NC, 00112$
;src/gameObject/gameObject.c:503: if(posx==P_col[i].posx && posy==P_col[i].posy){
	ld	l, b
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	iy, #_P_col
	ld	a, 0 (iy)
	add	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, 1 (iy)
	adc	a, -1 (ix)
	ld	-3 (ix), a
	pop	hl
	push	hl
	inc	hl
	ld	a,4 (ix)
	sub	a,(hl)
	jr	NZ,00115$
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	a,5 (ix)
	sub	a,(hl)
	jr	NZ,00115$
;src/gameObject/gameObject.c:504: if(sprite==sprite_Player){
	ld	a, 6 (ix)
	dec	a
	jr	NZ,00108$
;src/gameObject/gameObject.c:505: P_colList[P_col[i].num]=coleccionable_NOACTIVO;
	pop	hl
	push	hl
	ld	e, (hl)
	ld	iy, (_P_colList)
	ld	d,#0x00
	add	iy, de
	ld	0 (iy), #0x01
;src/gameObject/gameObject.c:506: if(P_col[i].sprite==sprite_luz){
	ld	iy, (_P_col)
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	add	iy, de
	ld	a, 3 (iy)
	cp	a, #0x25
	jr	NZ,00105$
;src/gameObject/gameObject.c:507: *P_luz=*P_luz+1;                                                             
	ld	hl, (_P_luz)
	ld	b, (hl)
	inc	b
	ld	(hl), b
	jr	00106$
00105$:
;src/gameObject/gameObject.c:508: }else if(P_col[i].sprite==sprite_amstradTape){                
	sub	a, #0x2f
	jr	NZ,00102$
;src/gameObject/gameObject.c:509: *P_ams=*P_ams+1;
	ld	hl, (_P_ams)
	ld	b, (hl)
	inc	b
	ld	(hl), b
	jr	00106$
00102$:
;src/gameObject/gameObject.c:511: *P_fam=*P_fam+1;
	ld	hl, (_P_fam)
	ld	b, (hl)
	inc	b
	ld	(hl), b
00106$:
;src/gameObject/gameObject.c:513: P_col[i].posx=0;
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	hl, (_P_col)
	add	hl, bc
	inc	hl
	ld	(hl), #0x00
00108$:
;src/gameObject/gameObject.c:515: return hay_Colision; 
	ld	l, #0x01
	jr	00116$
00115$:
;src/gameObject/gameObject.c:502: for(u8 i=0;i<ColeccionablesMaximos;i++){
	inc	b
	ld	c, b
	jp	00114$
00112$:
;src/gameObject/gameObject.c:518: return no_Hay_Colision;
	ld	l, #0x00
00116$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:521: u8 comprobarEnemigos(u8 posx,u8 posy ,u8 posicion){
;	---------------------------------
; Function comprobarEnemigos
; ---------------------------------
_comprobarEnemigos::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:522: if(posicion==posicion_Izquieda){
	ld	a, 6 (ix)
;src/gameObject/gameObject.c:523: for(u8 i=0;i<enemigosMaximos;i++){
	or	a,a
	jr	NZ,00128$
	ld	c,a
00113$:
	ld	a, c
	sub	a, #0x05
	jr	NC,00111$
;src/gameObject/gameObject.c:524: if(enemigosIzquierda[i].posx==posx && enemigosIzquierda[i].posy==posy){
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de, #_enemigosIzquierda
	add	hl, de
	ld	e,l
	ld	d,h
	inc	hl
	ld	a,4 (ix)
	sub	a,(hl)
	jr	NZ,00114$
	ex	de,hl
	inc	hl
	inc	hl
	ld	a,5 (ix)
	sub	a,(hl)
	jr	NZ,00114$
;src/gameObject/gameObject.c:525: return hay_Colision;
	ld	l, #0x01
	jr	00118$
00114$:
;src/gameObject/gameObject.c:523: for(u8 i=0;i<enemigosMaximos;i++){
	inc	c
	jr	00113$
;src/gameObject/gameObject.c:529: for(u8 i=0;i<enemigosMaximos;i++){
00128$:
	ld	c, #0x00
00116$:
	ld	a, c
	sub	a, #0x05
	jr	NC,00111$
;src/gameObject/gameObject.c:530: if(enemigosDerecha[i].posx==posx && enemigosDerecha[i].posy==posy){
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	de, #_enemigosDerecha
	add	hl, de
	ld	e,l
	ld	d,h
	inc	hl
	ld	a,4 (ix)
	sub	a,(hl)
	jr	NZ,00117$
	ex	de,hl
	inc	hl
	inc	hl
	ld	a,5 (ix)
	sub	a,(hl)
	jr	NZ,00117$
;src/gameObject/gameObject.c:531: return hay_Colision;
	ld	l, #0x01
	jr	00118$
00117$:
;src/gameObject/gameObject.c:529: for(u8 i=0;i<enemigosMaximos;i++){
	inc	c
	jr	00116$
00111$:
;src/gameObject/gameObject.c:535: return no_Hay_Colision;
	ld	l, #0x00
00118$:
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
