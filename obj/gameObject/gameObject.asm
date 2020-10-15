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
	.globl _cpct_waitVSYNC
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
;src/gameObject/gameObject.c:50: void initGameobjest(TGameObject* portales,TGameObject* puertas,TGameObjectCol* colec,u8* colLuz,u8* colFam,u8* colAms,u8* colList){
;	---------------------------------
; Function initGameobjest
; ---------------------------------
_initGameobjest::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:51: P_portal=portales;
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	(_P_portal), hl
;src/gameObject/gameObject.c:52: P_puertas=puertas;
	ld	l,6 (ix)
	ld	h,7 (ix)
	ld	(_P_puertas), hl
;src/gameObject/gameObject.c:53: P_col=colec;
	ld	l,8 (ix)
	ld	h,9 (ix)
	ld	(_P_col), hl
;src/gameObject/gameObject.c:54: P_luz=colLuz;
	ld	l,10 (ix)
	ld	h,11 (ix)
	ld	(_P_luz), hl
;src/gameObject/gameObject.c:55: P_fam=colFam;
	ld	l,12 (ix)
	ld	h,13 (ix)
	ld	(_P_fam), hl
;src/gameObject/gameObject.c:56: P_ams=colAms;
	ld	l,14 (ix)
	ld	h,15 (ix)
	ld	(_P_ams), hl
;src/gameObject/gameObject.c:57: P_colList=colList;   
	ld	l,16 (ix)
	ld	h,17 (ix)
	ld	(_P_colList), hl
	pop	ix
	ret
;src/gameObject/gameObject.c:60: void dibujarGameObject(TGameObject* objeto){
;	---------------------------------
; Function dibujarGameObject
; ---------------------------------
_dibujarGameObject::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:61: if(objeto->posx!=0){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, a
	jp	Z, 00180$
;src/gameObject/gameObject.c:62: if(objeto->sprite==sprite_Player){
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
;src/gameObject/gameObject.c:63: cpct_drawSprite(Character_Principal_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
;src/gameObject/gameObject.c:62: if(objeto->sprite==sprite_Player){
	ld	a, e
	dec	a
	jr	NZ,00176$
;src/gameObject/gameObject.c:63: cpct_drawSprite(Character_Principal_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
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
	jp	00180$
00176$:
;src/gameObject/gameObject.c:64: }else if(objeto->sprite==sprite_Rock_G){
	ld	a, e
	sub	a, #0x02
	jr	NZ,00173$
;src/gameObject/gameObject.c:65: cpct_drawSprite(Block_Move1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00173$:
;src/gameObject/gameObject.c:66: }else if(objeto->sprite==sprite_Rock_B){
	ld	a, e
	sub	a, #0x03
	jr	NZ,00170$
;src/gameObject/gameObject.c:67: cpct_drawSprite(Block_Move1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00170$:
;src/gameObject/gameObject.c:68: }else if(objeto->sprite==sprite_Rock_nomove_B){
	ld	a, e
	sub	a, #0x04
	jr	NZ,00167$
;src/gameObject/gameObject.c:69: cpct_drawSprite(Block_Move0_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00167$:
;src/gameObject/gameObject.c:70: }else if(objeto->sprite==sprite_RockInmovil1_G){
	ld	a, e
	sub	a, #0x05
	jr	NZ,00164$
;src/gameObject/gameObject.c:71: cpct_drawSprite(Block_Static1_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00164$:
;src/gameObject/gameObject.c:72: }else if(objeto->sprite==sprite_RockInmovil1_B){
	ld	a, e
	sub	a, #0x06
	jr	NZ,00161$
;src/gameObject/gameObject.c:73: cpct_drawSprite(Block_Static1_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00161$:
;src/gameObject/gameObject.c:74: }else if(objeto->sprite==sprite_RockInmovil2_G){
	ld	a, e
	sub	a, #0x07
	jr	NZ,00158$
;src/gameObject/gameObject.c:75: cpct_drawSprite(Block_Static2_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00158$:
;src/gameObject/gameObject.c:76: }else if(objeto->sprite==sprite_RockInmovil2_B){
	ld	a, e
	sub	a, #0x08
	jr	NZ,00155$
;src/gameObject/gameObject.c:77: cpct_drawSprite(Block_Static2_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00155$:
;src/gameObject/gameObject.c:78: }else if(objeto->sprite==sprite_RockInmovil3_G){
	ld	a, e
	sub	a, #0x09
	jr	NZ,00152$
;src/gameObject/gameObject.c:79: cpct_drawSprite(Block_Static3_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00152$:
;src/gameObject/gameObject.c:80: }else if(objeto->sprite==sprite_RockInmovil3_B){
	ld	a, e
	sub	a, #0x0a
	jr	NZ,00149$
;src/gameObject/gameObject.c:81: cpct_drawSprite(Block_Static3_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00149$:
;src/gameObject/gameObject.c:82: }else if(objeto->sprite==sprite_RockInmovil4_G){
	ld	a, e
	sub	a, #0x0b
	jr	NZ,00146$
;src/gameObject/gameObject.c:83: cpct_drawSprite(Block_Static4_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00146$:
;src/gameObject/gameObject.c:84: }else if(objeto->sprite==sprite_RockInmovil4_B){
	ld	a, e
	sub	a, #0x0c
	jr	NZ,00143$
;src/gameObject/gameObject.c:85: cpct_drawSprite(Block_Static4_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00143$:
;src/gameObject/gameObject.c:86: }else if(objeto->sprite==sprite_RockLineal1_G){
	ld	a, e
	sub	a, #0x0d
	jr	NZ,00140$
;src/gameObject/gameObject.c:87: cpct_drawSprite(Block_Move2_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00140$:
;src/gameObject/gameObject.c:88: }else if(objeto->sprite==sprite_RockLineal1_B){
	ld	a, e
	sub	a, #0x0e
	jr	NZ,00137$
;src/gameObject/gameObject.c:89: cpct_drawSprite(Block_Move2_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00137$:
;src/gameObject/gameObject.c:90: }else if(objeto->sprite==sprite_PortalMuro){
	ld	a, e
	sub	a, #0x0f
	jr	NZ,00134$
;src/gameObject/gameObject.c:91: cpct_drawSprite(PortalWall_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00134$:
;src/gameObject/gameObject.c:92: }else if(objeto->sprite==sprite_PuertaPortal_G){
	ld	a, e
	sub	a, #0x10
	jr	NZ,00131$
;src/gameObject/gameObject.c:93: cpct_drawSprite(PortalDoor_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00131$:
;src/gameObject/gameObject.c:94: }else if(objeto->sprite==sprite_PuertaPortal_B){
	ld	a, e
	sub	a, #0x11
	jr	NZ,00128$
;src/gameObject/gameObject.c:95: cpct_drawSprite(PortalDoor_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00128$:
;src/gameObject/gameObject.c:96: }else if(objeto->sprite==sprite_Puerta_G){
	ld	a, e
	sub	a, #0x12
	jr	NZ,00125$
;src/gameObject/gameObject.c:97: cpct_drawSprite(Door_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00125$:
;src/gameObject/gameObject.c:98: }else if(objeto->sprite==sprite_Puerta_B){
	ld	a, e
	sub	a, #0x13
	jr	NZ,00122$
;src/gameObject/gameObject.c:99: cpct_drawSprite(Door_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00122$:
;src/gameObject/gameObject.c:100: }else if(objeto->sprite==sprite_hole){
	ld	a, e
	sub	a, #0x14
	jr	NZ,00119$
;src/gameObject/gameObject.c:101: cpct_drawSprite(Block_Hole, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
	ld	b, (hl)
	ld	c, d
	push	bc
	call	_calcularPosicionEnPantalla
	pop	af
	ld	bc, #_Block_Hole+0
	ld	de, #0x1004
	push	de
	push	hl
	push	bc
	call	_cpct_drawSprite
	jp	00180$
00119$:
;src/gameObject/gameObject.c:102: }else if(objeto->sprite==sprite_amstrad){
	ld	a, e
	sub	a, #0x1a
	jr	NZ,00116$
;src/gameObject/gameObject.c:103: cpct_drawSprite(Amstrad_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jp	00180$
00116$:
;src/gameObject/gameObject.c:104: }else if(objeto->sprite==sprite_PrinceofPersia1_G){
	ld	a, e
	sub	a, #0x1c
	jr	NZ,00113$
;src/gameObject/gameObject.c:105: cpct_drawSprite(PrinceOfPersia_PJ_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jr	00180$
00113$:
;src/gameObject/gameObject.c:106: }else if(objeto->sprite==sprite_PrinceofPersia1_B){
	ld	a, e
	sub	a, #0x1d
	jr	NZ,00110$
;src/gameObject/gameObject.c:107: cpct_drawSprite(PrinceOfPersia_PJ_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jr	00180$
00110$:
;src/gameObject/gameObject.c:108: }else if(objeto->sprite==sprite_PrinceofPersia2_G){
	ld	a, e
	sub	a, #0x1e
	jr	NZ,00107$
;src/gameObject/gameObject.c:109: cpct_drawSprite(PrinceOfPersia_ENE_G_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jr	00180$
00107$:
;src/gameObject/gameObject.c:110: }else if(objeto->sprite==sprite_PrinceofPersia2_B){
	ld	a, e
	sub	a, #0x1f
	jr	NZ,00104$
;src/gameObject/gameObject.c:111: cpct_drawSprite(PrinceOfPersia_ENE_B_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
	jr	00180$
00104$:
;src/gameObject/gameObject.c:112: }else if(objeto->sprite==sprite_PrinceofPersia3){
	ld	a, e
	sub	a, #0x20
	jr	NZ,00180$
;src/gameObject/gameObject.c:113: cpct_drawSprite(PrinceOfPersia_COVER_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
00180$:
	pop	ix
	ret
;src/gameObject/gameObject.c:118: void dibujarGameObjectCol(TGameObjectCol* objeto){
;	---------------------------------
; Function dibujarGameObjectCol
; ---------------------------------
_dibujarGameObjectCol::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:119: if(objeto->posx!=0){
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, a
	jp	Z, 00120$
;src/gameObject/gameObject.c:120: if(objeto->sprite==sprite_luz){
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
;src/gameObject/gameObject.c:121: cpct_drawSprite(LuzAzul_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
;src/gameObject/gameObject.c:120: if(objeto->sprite==sprite_luz){
	ld	a, e
	sub	a, #0x15
	jr	NZ,00116$
;src/gameObject/gameObject.c:121: cpct_drawSprite(LuzAzul_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);  
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
;src/gameObject/gameObject.c:122: }else if(objeto->sprite==sprite_familia1){
	ld	a, e
	sub	a, #0x16
	jr	NZ,00113$
;src/gameObject/gameObject.c:123: cpct_drawSprite(Character_Brother_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
;src/gameObject/gameObject.c:124: }else if(objeto->sprite==sprite_familia2){
	ld	a, e
	sub	a, #0x17
	jr	NZ,00110$
;src/gameObject/gameObject.c:125: cpct_drawSprite(Character_Sister_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
;src/gameObject/gameObject.c:126: }else if(objeto->sprite==sprite_familia3){
	ld	a, e
	sub	a, #0x18
	jr	NZ,00107$
;src/gameObject/gameObject.c:127: cpct_drawSprite(Character_Mother_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
;src/gameObject/gameObject.c:128: }else if(objeto->sprite==sprite_familia4){
	ld	a, e
	sub	a, #0x19
	jr	NZ,00104$
;src/gameObject/gameObject.c:129: cpct_drawSprite(Character_Father_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
;src/gameObject/gameObject.c:130: }else if(objeto->sprite==sprite_amstradTape){
	ld	a, e
	sub	a, #0x1b
	jr	NZ,00120$
;src/gameObject/gameObject.c:131: cpct_drawSprite(PrinceOfPersia_Tape_0, calcularPosicionEnPantalla(objeto->posx,objeto->posy), anchoSprite, altoSprite);
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
;src/gameObject/gameObject.c:135: void dibujarGameObjectColSprite(u8 sprite,u8 posx, u8 posy){
;	---------------------------------
; Function dibujarGameObjectColSprite
; ---------------------------------
_dibujarGameObjectColSprite::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:137: cpct_drawSprite(LuzAzul_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);  
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
;src/gameObject/gameObject.c:136: if(sprite==sprite_luz){
	ld	a, 4 (ix)
	sub	a, #0x15
	jr	NZ,00116$
;src/gameObject/gameObject.c:137: cpct_drawSprite(LuzAzul_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);  
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_LuzAzul_0
	push	hl
	call	_cpct_drawSprite
	jr	00118$
00116$:
;src/gameObject/gameObject.c:138: }else if(sprite==sprite_familia1){
	ld	a, 4 (ix)
	sub	a, #0x16
	jr	NZ,00113$
;src/gameObject/gameObject.c:139: cpct_drawSprite(Character_Brother_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_Character_Brother_0
	push	hl
	call	_cpct_drawSprite
	jr	00118$
00113$:
;src/gameObject/gameObject.c:140: }else if(sprite==sprite_familia2){
	ld	a, 4 (ix)
	sub	a, #0x17
	jr	NZ,00110$
;src/gameObject/gameObject.c:141: cpct_drawSprite(Character_Sister_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_Character_Sister_0
	push	hl
	call	_cpct_drawSprite
	jr	00118$
00110$:
;src/gameObject/gameObject.c:142: }else if(sprite==sprite_familia3){
	ld	a, 4 (ix)
	sub	a, #0x18
	jr	NZ,00107$
;src/gameObject/gameObject.c:143: cpct_drawSprite(Character_Mother_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_Character_Mother_0
	push	hl
	call	_cpct_drawSprite
	jr	00118$
00107$:
;src/gameObject/gameObject.c:144: }else if(sprite==sprite_familia4){
	ld	a, 4 (ix)
	sub	a, #0x19
	jr	NZ,00104$
;src/gameObject/gameObject.c:145: cpct_drawSprite(Character_Father_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_Character_Father_0
	push	hl
	call	_cpct_drawSprite
	jr	00118$
00104$:
;src/gameObject/gameObject.c:146: }else if(sprite==sprite_amstradTape){
	ld	a, 4 (ix)
	sub	a, #0x1b
	jr	NZ,00118$
;src/gameObject/gameObject.c:147: cpct_drawSprite(PrinceOfPersia_Tape_0, cpctm_screenPtr(CPCT_VMEM_START, posx*4 + 1, posy*16), anchoSprite, altoSprite);
	ld	hl, #0x1004
	push	hl
	push	bc
	ld	hl, #_PrinceOfPersia_Tape_0
	push	hl
	call	_cpct_drawSprite
00118$:
	pop	ix
	ret
;src/gameObject/gameObject.c:152: void limpiarRastro(u8 posx, u8 posy){
;	---------------------------------
; Function limpiarRastro
; ---------------------------------
_limpiarRastro::
;src/gameObject/gameObject.c:153: cpct_drawSolidBox(calcularPosicionEnPantalla(posx,posy),0x00,4,16);
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
;src/gameObject/gameObject.c:155: u8 moverGameObject(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
;	---------------------------------
; Function moverGameObject
; ---------------------------------
_moverGameObject::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:156: if(objeto->sprite==sprite_Player){
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
;src/gameObject/gameObject.c:157: return moverTipoPlayer(objeto,movimiento,rocasCol,rocasEspejo,posicion);
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
;src/gameObject/gameObject.c:159: return moverTipoRoca(objeto,movimiento,rocasCol,rocasEspejo,posicion);
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
;src/gameObject/gameObject.c:163: void moverElEspejo(u8 num,u8 movimiento,TGameObject* rocasEspejo,u8 posicion,u8 numMovimientos){
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
;src/gameObject/gameObject.c:165: u8 nextMovimiento=movimiento;
	ld	c, 5 (ix)
;src/gameObject/gameObject.c:170: if(movimiento==mover_Izquierda){
	ld	a, c
	dec	a
	jr	NZ,00102$
;src/gameObject/gameObject.c:171: nextMovimiento=mover_Derecha;
	ld	c, #0x03
00102$:
;src/gameObject/gameObject.c:172: }if(movimiento==mover_Derecha){
	ld	a, 5 (ix)
	sub	a, #0x03
	jr	NZ,00104$
;src/gameObject/gameObject.c:173: nextMovimiento=mover_Izquierda;
	ld	c, #0x01
00104$:
;src/gameObject/gameObject.c:176: if(posicion==posicion_Izquieda){
	ld	a, 8 (ix)
	or	a, a
	jr	NZ,00106$
;src/gameObject/gameObject.c:177: posicion=posicion_Derecha;
	ld	8 (ix), #0x01
	jr	00145$
00106$:
;src/gameObject/gameObject.c:179: posicion=posicion_Izquieda;
	ld	8 (ix), #0x00
;src/gameObject/gameObject.c:182: for(u8 i=0;i<RocasMaximas;i++){
00145$:
	ld	b, #0x00
00128$:
	ld	a, b
	sub	a, #0x28
	jp	NC, 00130$
;src/gameObject/gameObject.c:183: if(rocasEspejo[i].num==num){
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
;src/gameObject/gameObject.c:184: objetoEspejo=&rocasEspejo[i];              
;src/gameObject/gameObject.c:186: nextPosx=objetoEspejo->posx;
	ld	-9 (ix), e
	ld	-8 (ix), d
	inc	de
	ld	a, (de)
	ld	-5 (ix), a
	ld	-10 (ix), a
;src/gameObject/gameObject.c:187: nextPosy=objetoEspejo->posy;
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
;src/gameObject/gameObject.c:188: if(objetoEspejo->posx!=0){
	ld	a, -5 (ix)
	or	a, a
	jp	Z, 00129$
;src/gameObject/gameObject.c:189: posicionObjeto=SinColision;
	ld	-12 (ix), #0x32
;src/gameObject/gameObject.c:190: for(u8 i=0;i<numMovimientos;i++){
	ld	-7 (ix), l
	ld	-6 (ix), h
	ld	-2 (ix), e
	ld	-1 (ix), d
	ld	-13 (ix), #0x00
00125$:
	ld	a, -13 (ix)
	sub	a, 9 (ix)
	jp	NC, 00129$
;src/gameObject/gameObject.c:191: if(posicionObjeto==SinColision){
	ld	a, -12 (ix)
	sub	a, #0x32
	jp	NZ,00126$
;src/gameObject/gameObject.c:192: nextMovimiento=calcularMaximosyMinimos(nextMovimiento,objetoEspejo->posx,objetoEspejo->posy,posicion);            
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	e, (hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
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
;src/gameObject/gameObject.c:193: if(nextMovimiento!=mover_SinMovimiento){
	ld	a, c
	or	a, a
	jp	Z, 00126$
;src/gameObject/gameObject.c:194: posicionObjeto=colisionesSiguientePosicion(objetoEspejo,objetoEspejo->posx,objetoEspejo->posy,nextMovimiento,rocasEspejo,posicion);                                          
	ld	a, 8 (ix)
	ld	-4 (ix), a
	ld	-3 (ix), #0x00
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	ld	e, (hl)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d, (hl)
	push	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/gameObject/gameObject.c:191: if(posicionObjeto==SinColision){
	ld	-12 (ix), l
	ld	a, l
	sub	a, #0x32
	jr	NZ,00198$
	ld	a,#0x01
	jr	00199$
00198$:
	xor	a,a
00199$:
;src/gameObject/gameObject.c:195: if(posicionObjeto==SinColision){
	or	a, a
	jr	Z,00112$
;src/gameObject/gameObject.c:196: mover1casilla(&nextPosx,&nextPosy,nextMovimiento);                                                                                 
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
;src/gameObject/gameObject.c:199: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
	or	a, a
	jr	NZ,00126$
	ld	a, -12 (ix)
	sub	a, #0x33
	jr	Z,00126$
;src/gameObject/gameObject.c:200: taparHole(objetoEspejo,&rocasEspejo[posicionObjeto]);                                
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
;src/gameObject/gameObject.c:190: for(u8 i=0;i<numMovimientos;i++){
	inc	-13 (ix)
	jp	00125$
00129$:
;src/gameObject/gameObject.c:182: for(u8 i=0;i<RocasMaximas;i++){
	inc	b
	jp	00128$
00130$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:212: void cambiarPosicion(u8* posicion){    
;	---------------------------------
; Function cambiarPosicion
; ---------------------------------
_cambiarPosicion::
;src/gameObject/gameObject.c:213: if(*posicion==posicion_Izquieda){
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	a, (hl)
	or	a, a
	jr	NZ,00102$
;src/gameObject/gameObject.c:214: *posicion=posicion_Derecha;        
	ld	(hl), #0x01
	ret
00102$:
;src/gameObject/gameObject.c:216: *posicion=posicion_Izquieda;       
	ld	(hl), #0x00
	ret
;src/gameObject/gameObject.c:221: void moverYdibujar(TGameObject* objeto,u8 posx,u8 posy){
;	---------------------------------
; Function moverYdibujar
; ---------------------------------
_moverYdibujar::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/gameObject/gameObject.c:222: limpiarRastro(objeto->posx,objeto->posy);    
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
;src/gameObject/gameObject.c:223: objeto->posx=posx;
	ld	a, 6 (ix)
	ld	(hl), a
;src/gameObject/gameObject.c:224: objeto->posy=posy;
	pop	hl
	push	hl
	ld	a, 7 (ix)
	ld	(hl), a
;src/gameObject/gameObject.c:225: dibujarGameObject(objeto);
	push	bc
	call	_dibujarGameObject
	ld	sp,ix
	pop	ix
	ret
;src/gameObject/gameObject.c:227: void taparHole(TGameObject* roca,TGameObject* hole){
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
;src/gameObject/gameObject.c:228: if(hole->sprite==sprite_hole){
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	sub	a, #0x14
	jr	NZ,00103$
;src/gameObject/gameObject.c:229: limpiarRastro(roca->posx,roca->posy);
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	hl, #0x0002
	add	hl,de
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-1 (ix), a
	inc	de
	ld	-3 (ix), e
	ld	-2 (ix), d
	ld	l, e
	ld	h, d
	ld	d, (hl)
	push	bc
	ld	a, -1 (ix)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_limpiarRastro
	pop	af
	pop	bc
;src/gameObject/gameObject.c:230: limpiarRastro(hole->posx,hole->posy);
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	ld	-1 (ix), a
	inc	bc
	ld	a, (bc)
	ld	-4 (ix), a
	push	bc
	push	de
	ld	h, -1 (ix)
	ld	l, -4 (ix)
	push	hl
	call	_limpiarRastro
	pop	af
	pop	de
	pop	bc
;src/gameObject/gameObject.c:231: roca->posx=0;
	ld	l,-3 (ix)
	ld	h,-2 (ix)
	ld	(hl), #0x00
;src/gameObject/gameObject.c:232: roca->posy=0;
	pop	hl
	push	hl
	ld	(hl), #0x00
;src/gameObject/gameObject.c:233: hole->posx=0;
	xor	a, a
	ld	(bc), a
;src/gameObject/gameObject.c:234: hole->posy=0;
	xor	a, a
	ld	(de), a
00103$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:244: u8 moverTipoPlayer(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
;	---------------------------------
; Function moverTipoPlayer
; ---------------------------------
_moverTipoPlayer::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-16
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:245: if(objeto->cronoMovimiento==0 || objeto->sprite!=sprite_Player){
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	add	a, #0x05
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	c, (hl)
	ld	a, c
	or	a, a
	jr	Z,00116$
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	inc	hl
	ld	b, (hl)
	dec	b
	jp	Z,00117$
00116$:
;src/gameObject/gameObject.c:246: cpct_waitVSYNC();    
	call	_cpct_waitVSYNC
;src/gameObject/gameObject.c:247: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);            
	ld	a, 11 (ix)
	ld	-6 (ix), a
	ld	a, 12 (ix)
	ld	-5 (ix), a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	ld	-7 (ix), a
	ld	c,-2 (ix)
	ld	b,-1 (ix)
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	-8 (ix), a
	ld	e,-2 (ix)
	ld	d,-1 (ix)
	inc	de
	ld	a, (de)
	ld	-9 (ix), a
	push	bc
	push	de
	ld	h, -7 (ix)
	ld	l, -8 (ix)
	push	hl
	ld	h, -9 (ix)
	ld	l, 6 (ix)
	push	hl
	call	_calcularMaximosyMinimos
	pop	af
	pop	af
	ld	-9 (ix), l
	pop	de
	pop	bc
;src/gameObject/gameObject.c:248: if(movimiento!=mover_SinMovimiento){                  
	ld	a, -9 (ix)
	or	a, a
	jp	Z, 00118$
;src/gameObject/gameObject.c:249: u8 nextPosx=objeto->posx;
	ld	a, (de)
	ld	-15 (ix), a
;src/gameObject/gameObject.c:250: u8 nextPosy=objeto->posy;
	ld	a, (bc)
	ld	-16 (ix), a
;src/gameObject/gameObject.c:253: u8 moverRoca=mover_roca;
	ld	-14 (ix), #0x00
;src/gameObject/gameObject.c:257: mover1casilla(&nextPosx,&nextPosy,movimiento);            
	ld	hl, #0x0000
	add	hl, sp
	ld	-11 (ix), l
	ld	-10 (ix), h
	ex	de,hl
	ld	hl, #0x0001
	add	hl, sp
	ld	c, l
	ld	b, h
	push	bc
	pop	iy
	push	bc
	ld	a, -9 (ix)
	push	af
	inc	sp
	push	de
	push	iy
	call	_mover1casilla
	pop	af
	inc	sp
	ld	h, -16 (ix)
	ld	l, -15 (ix)
	ex	(sp),hl
	call	_comprobarPuertas
	pop	af
	pop	bc
;src/gameObject/gameObject.c:260: if(colisionPuerta!=seguir_En_Nivel){
	ld	-12 (ix), l
	ld	a, l
	or	a, a
	jr	Z,00102$
;src/gameObject/gameObject.c:261: return colisionPuerta;
	ld	l, -12 (ix)
	jp	00120$
00102$:
;src/gameObject/gameObject.c:263: comprobarColeccionables(nextPosx,nextPosy);            
	push	bc
	ld	h, -16 (ix)
	ld	l, -15 (ix)
	push	hl
	call	_comprobarColeccionables
	pop	af
	pop	bc
;src/gameObject/gameObject.c:264: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);            
	ld	e,-11 (ix)
	ld	d,-10 (ix)
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	a, -9 (ix)
	push	af
	inc	sp
	push	de
	push	bc
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_comprobarPortales
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	ld	c, l
;src/gameObject/gameObject.c:265: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);            
	push	bc
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	h, -16 (ix)
	ld	l, -15 (ix)
	push	hl
	call	_comprobarRocas
	pop	af
	pop	af
	pop	bc
	ld	-13 (ix), l
;src/gameObject/gameObject.c:266: if(colisionPortales==hay_Colision){
	dec	c
	jr	NZ,00107$
;src/gameObject/gameObject.c:267: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasEspejo);
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	h, -16 (ix)
	ld	l, -15 (ix)
	push	hl
	call	_comprobarRocas
	pop	af
	pop	af
;src/gameObject/gameObject.c:268: if(ObjetoColisionado!=SinColision){
	ld	-13 (ix), l
	ld	a, l
	sub	a, #0x32
	jr	Z,00104$
;src/gameObject/gameObject.c:269: moverRoca=no_mover_roca;
	ld	-14 (ix), #0x01
	jr	00107$
00104$:
;src/gameObject/gameObject.c:271: cambiarPosicion(posicion);
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	_cambiarPosicion
	pop	af
00107$:
;src/gameObject/gameObject.c:274: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision){             
	ld	a, -13 (ix)
	sub	a, #0x32
	jr	NZ,00111$
	ld	a, -12 (ix)
	or	a, a
	jr	NZ,00111$
;src/gameObject/gameObject.c:275: moverYdibujar(objeto,nextPosx,nextPosy);
	ld	h, -16 (ix)
	ld	l, -15 (ix)
	push	hl
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_moverYdibujar
	pop	af
	pop	af
;src/gameObject/gameObject.c:276: objeto->pasos++;                                              
	ld	a, -2 (ix)
	add	a, #0x06
	ld	-11 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a, (hl)
	ld	-8 (ix), a
	ld	c, a
	inc	c
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	(hl), c
	jr	00112$
00111$:
;src/gameObject/gameObject.c:278: if(moverRoca==mover_roca)          
	ld	a, -14 (ix)
	or	a, a
	jr	NZ,00112$
;src/gameObject/gameObject.c:279: moverGameObject(&rocasCol[ObjetoColisionado],movimiento,rocasCol,rocasEspejo,posicion);                      
	ld	c,-13 (ix)
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	a, 7 (ix)
	add	a, -11 (ix)
	ld	-11 (ix), a
	ld	a, 8 (ix)
	adc	a, -10 (ix)
	ld	-10 (ix), a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, -9 (ix)
	push	af
	inc	sp
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	push	hl
	call	_moverGameObject
	ld	hl, #9
	add	hl, sp
	ld	sp, hl
00112$:
;src/gameObject/gameObject.c:281: objeto->cronoMovimiento=retardoMovimiento;
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl), #0xff
	jr	00118$
00117$:
;src/gameObject/gameObject.c:284: objeto->cronoMovimiento-=1;
	dec	c
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl), c
00118$:
;src/gameObject/gameObject.c:286: return seguir_En_Nivel;
	ld	l, #0x00
00120$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:288: u8 moverTipoRoca(TGameObject* objeto,u8 movimiento, TGameObject* rocasCol,TGameObject* rocasEspejo,u8* posicion){
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
;src/gameObject/gameObject.c:290: movimiento=calcularMaximosyMinimos(movimiento,objeto->posx,objeto->posy,*posicion);
	ld	a, 11 (ix)
	ld	-6 (ix), a
	ld	a, 12 (ix)
	ld	-5 (ix), a
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	d, (hl)
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	hl, #0x0002
	add	hl,bc
	ld	-8 (ix), l
	ld	-7 (ix), h
	ld	e, (hl)
	ld	hl, #0x0001
	add	hl,bc
	ld	-2 (ix), l
	ld	-1 (ix), h
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
;src/gameObject/gameObject.c:292: if(movimiento!=mover_SinMovimiento && objeto->movimiento != sin_Movimiento){                  
	ld	a, e
	or	a, a
	jp	Z, 00123$
	ld	hl, #0x0004
	add	hl,bc
	ld	-11 (ix), l
	ld	-10 (ix), h
	ld	d, (hl)
	ld	a, d
	or	a, a
	jp	Z, 00123$
;src/gameObject/gameObject.c:293: u8 nextPosx=objeto->posx;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	a, (hl)
	ld	-12 (ix), a
;src/gameObject/gameObject.c:294: u8 nextPosy=objeto->posy;
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a, (hl)
	ld	-13 (ix), a
;src/gameObject/gameObject.c:295: u8 numMovimientos=0;
	ld	-9 (ix), #0x00
;src/gameObject/gameObject.c:299: if(objeto->movimiento==mover_1){
	ld	a, d
	dec	a
	jr	NZ,00104$
;src/gameObject/gameObject.c:300: mover1casilla(&nextPosx,&nextPosy,movimiento);
	ld	hl, #0x0000
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	iy,#0x0001
	add	iy,sp
	push	bc
	push	de
	ld	a, e
	push	af
	inc	sp
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	push	hl
	push	iy
	call	_mover1casilla
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/gameObject/gameObject.c:301: numMovimientos=1;                 
	ld	-9 (ix), #0x01
	jr	00105$
00104$:
;src/gameObject/gameObject.c:302: }else if(objeto->movimiento==mover_Linea){
	ld	a, d
	sub	a, #0x02
	jr	NZ,00105$
;src/gameObject/gameObject.c:303: numMovimientos=movimientoLineal(objeto,&nextPosx,&nextPosy,movimiento,rocasCol,*posicion);
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	d, (hl)
	ld	hl, #0x0000
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
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
	ld	l,-4 (ix)
	ld	h,-3 (ix)
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
;src/gameObject/gameObject.c:305: posicionObjeto=colisionesSiguientePosicion(objeto,objeto->posx,objeto->posy,movimiento,rocasCol,posicion);                                      
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	ld	a, (hl)
	ld	-4 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d, (hl)
	push	bc
	push	de
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	ld	l,7 (ix)
	ld	h,8 (ix)
	push	hl
	ld	a, e
	push	af
	inc	sp
	ld	a, -4 (ix)
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
;src/gameObject/gameObject.c:306: if(posicionObjeto==SinColision){
	cp	a, #0x32
	jp	NZ,00120$
;src/gameObject/gameObject.c:307: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);             
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
;src/gameObject/gameObject.c:309: moverElEspejo(objeto->num,movimiento,rocasEspejo,*posicion,numMovimientos);
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	d, (hl)
	ld	a, (bc)
	ld	-4 (ix), a
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
	ld	e, -4 (ix)
	push	de
	call	_moverElEspejo
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;src/gameObject/gameObject.c:310: if(objeto->movimiento==mover_1){
	ld	l,-11 (ix)
	ld	h,-10 (ix)
	ld	a, (hl)
	cp	a, #0x01
	jr	NZ,00115$
;src/gameObject/gameObject.c:311: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,mover_SinMovimiento,rocasCol,posicion);
	push	bc
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
;src/gameObject/gameObject.c:312: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
	cp	a, #0x32
	jp	Z,00123$
	cp	a, #0x33
	jp	Z,00123$
;src/gameObject/gameObject.c:313: taparHole(objeto,&rocasCol[posicionObjeto]);
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
;src/gameObject/gameObject.c:315: }else if(objeto->movimiento==mover_Linea){
	sub	a, #0x02
	jr	NZ,00123$
;src/gameObject/gameObject.c:316: posicionObjeto=colisionesSiguientePosicion(objeto,nextPosx,nextPosy,movimiento,rocasCol,posicion);
	push	bc
	ld	l,-6 (ix)
	ld	h,-5 (ix)
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
;src/gameObject/gameObject.c:317: if(posicionObjeto!=SinColision && posicionObjeto != ColisionNoRocas){
	cp	a, #0x32
	jr	Z,00123$
	cp	a, #0x33
	jr	Z,00123$
;src/gameObject/gameObject.c:318: taparHole(objeto,&rocasCol[posicionObjeto]);
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
;src/gameObject/gameObject.c:322: if(posicionObjeto!=ColisionNoRocas){
	cp	a, #0x33
	jr	Z,00123$
;src/gameObject/gameObject.c:323: taparHole(objeto,&rocasCol[posicionObjeto]);
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
;src/gameObject/gameObject.c:329: return seguir_En_Nivel;
	ld	l, #0x00
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:337: void mover1casilla(u8* posx, u8* posy,u8 movimiento){
;	---------------------------------
; Function mover1casilla
; ---------------------------------
_mover1casilla::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:339: *posx-=1;
	ld	c,4 (ix)
	ld	b,5 (ix)
;src/gameObject/gameObject.c:338: if(movimiento==mover_Izquierda){
	ld	a, 8 (ix)
	dec	a
	jr	NZ,00110$
;src/gameObject/gameObject.c:339: *posx-=1;
	ld	a, (bc)
	add	a, #0xff
	ld	(bc), a
	jr	00112$
00110$:
;src/gameObject/gameObject.c:341: *posy-=1;
	ld	l,6 (ix)
	ld	h,7 (ix)
;src/gameObject/gameObject.c:340: }else if(movimiento==mover_Arriba){
	ld	a, 8 (ix)
	sub	a, #0x02
	jr	NZ,00107$
;src/gameObject/gameObject.c:341: *posy-=1;
	ld	c, (hl)
	dec	c
	ld	(hl), c
	jr	00112$
00107$:
;src/gameObject/gameObject.c:342: }else if(movimiento==mover_Derecha){
	ld	a, 8 (ix)
	sub	a, #0x03
	jr	NZ,00104$
;src/gameObject/gameObject.c:343: *posx+=1;
	ld	a, (bc)
	inc	a
	ld	(bc), a
	jr	00112$
00104$:
;src/gameObject/gameObject.c:344: }else if(movimiento==mover_Abajo){
	ld	a, 8 (ix)
	sub	a, #0x04
	jr	NZ,00112$
;src/gameObject/gameObject.c:345: *posy+=1;
	ld	c, (hl)
	inc	c
	ld	(hl), c
00112$:
	pop	ix
	ret
;src/gameObject/gameObject.c:349: u8 movimientoLineal(TGameObject* objeto,u8* posx, u8* posy,u8 movimiento,TGameObject* objetosCol,u8 posicion){    
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
;src/gameObject/gameObject.c:352: while (colisionesSiguientePosicion(objeto,*posx,*posy,movimiento,objetosCol,posicion)==SinColision && movimiento!=mover_SinMovimiento)
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
;src/gameObject/gameObject.c:354: movimiento=calcularMaximosyMinimos(movimiento,*posx,*posy,posicion);       
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
;src/gameObject/gameObject.c:355: mover1casilla(posx,posy,movimiento);
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
;src/gameObject/gameObject.c:356: contador++;                    
	inc	-5 (ix)
	jp	00102$
00104$:
;src/gameObject/gameObject.c:360: return contador;             
	ld	l, -5 (ix)
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:368: u8 colisionesSiguientePosicion(TGameObject* objeto,u8 posx,u8 posy,u8 movimiento, TGameObject* rocasCol,u8* posicion){
;	---------------------------------
; Function colisionesSiguientePosicion
; ---------------------------------
_colisionesSiguientePosicion::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-7
	add	hl, sp
	ld	sp, hl
;src/gameObject/gameObject.c:369: u8 nextPosx=posx;
	ld	a, 6 (ix)
	ld	-6 (ix), a
;src/gameObject/gameObject.c:370: u8 nextPosy=posy;
	ld	a, 7 (ix)
	ld	-7 (ix), a
;src/gameObject/gameObject.c:375: mover1casilla(&nextPosx,&nextPosy,movimiento);
	ld	hl, #0x0000
	add	hl, sp
	ld	-5 (ix), l
	ld	-4 (ix), h
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #0x0001
	add	hl, sp
	ld	-2 (ix), l
	ld	-1 (ix), h
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
;src/gameObject/gameObject.c:376: ObjetoColisionado=comprobarRocas(nextPosx,nextPosy,rocasCol);
	ld	l,9 (ix)
	ld	h,10 (ix)
	push	hl
	ld	h, -7 (ix)
	ld	l, -6 (ix)
	push	hl
	call	_comprobarRocas
	pop	af
	pop	af
;src/gameObject/gameObject.c:377: if(ObjetoColisionado!=SinColision){
	ld	a, l
	sub	a, #0x32
	jr	NZ,00125$
	ld	a,#0x01
	jr	00126$
00125$:
	xor	a,a
00126$:
	ld	-3 (ix), a
	bit	0, -3 (ix)
;src/gameObject/gameObject.c:378: return ObjetoColisionado;
	jr	Z,00107$
;src/gameObject/gameObject.c:380: colisionPuerta=comprobarPuertas(nextPosx,nextPosy);                      
	ld	h, -7 (ix)
	ld	l, -6 (ix)
	push	hl
	call	_comprobarPuertas
	pop	af
	ld	c, l
;src/gameObject/gameObject.c:381: colisionPortales=comprobarPortales(objeto,&nextPosx,&nextPosy,movimiento,posicion);                 
	ld	e,-5 (ix)
	ld	d,-4 (ix)
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	pop	iy
	push	bc
	ld	l,11 (ix)
	ld	h,12 (ix)
	push	hl
	ld	a, 8 (ix)
	push	af
	inc	sp
	push	de
	push	iy
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_comprobarPortales
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	pop	bc
;src/gameObject/gameObject.c:385: if(ObjetoColisionado==SinColision && colisionPuerta==no_Hay_Colision && colisionPortales==no_Hay_Colision){        
	bit	0, -3 (ix)
	jr	Z,00104$
	ld	a, c
	or	a,a
	jr	NZ,00104$
	or	a,l
	jr	NZ,00104$
;src/gameObject/gameObject.c:386: return SinColision;
	ld	l, #0x32
	jr	00107$
00104$:
;src/gameObject/gameObject.c:388: return ColisionNoRocas;
	ld	l, #0x33
00107$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:391: u8 comprobarRocas(u8 posx,u8 posy,TGameObject* rocas){
;	---------------------------------
; Function comprobarRocas
; ---------------------------------
_comprobarRocas::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:392: u8 colision=SinColision;   
;src/gameObject/gameObject.c:393: for(u8 i=0;i<RocasMaximas;i++){
	ld	bc,#0x0032
00107$:
	ld	a, b
	sub	a, #0x28
	jr	NC,00105$
;src/gameObject/gameObject.c:394: if(rocas[i].posx!=0){
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
;src/gameObject/gameObject.c:395: if(comprobarColisiones1vs1(posx,posy,rocas[i].posx,rocas[i].posy)==hay_Colision){                          
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
;src/gameObject/gameObject.c:396: colision=i;
	ld	c, b
00108$:
;src/gameObject/gameObject.c:393: for(u8 i=0;i<RocasMaximas;i++){
	inc	b
	jr	00107$
00105$:
;src/gameObject/gameObject.c:400: return colision;
	ld	l, c
	pop	ix
	ret
;src/gameObject/gameObject.c:403: u8 comprobarPortales(TGameObject* objeto,u8* posx,u8* posy,u8 movimiento,u8* posicion){    
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
;src/gameObject/gameObject.c:404: if(*posx==P_portal[0].posx ){
	ld	c,6 (ix)
	ld	b,7 (ix)
	ld	a, (bc)
	ld	-2 (ix), a
	ld	hl, (_P_portal)
	ld	-7 (ix), l
	ld	-6 (ix), h
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
;src/gameObject/gameObject.c:405: if(*posy==P_portal[0].posy ){
	ld	e,8 (ix)
	ld	d,9 (ix)
;src/gameObject/gameObject.c:406: if(objeto->sprite==sprite_Player){                
	ld	a, 4 (ix)
	ld	-5 (ix), a
	ld	a, 5 (ix)
	ld	-4 (ix), a
;src/gameObject/gameObject.c:407: *posx=P_portal[1].posx;
	ld	iy, #_P_portal
	ld	a, 0 (iy)
	add	a, #0x07
	ld	-9 (ix), a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	-8 (ix), a
;src/gameObject/gameObject.c:406: if(objeto->sprite==sprite_Player){                
	ld	a, -5 (ix)
	add	a, #0x03
	ld	-5 (ix), a
	ld	a, -4 (ix)
	adc	a, #0x00
	ld	-4 (ix), a
;src/gameObject/gameObject.c:407: *posx=P_portal[1].posx;
	ld	a, -9 (ix)
	add	a, #0x01
	ld	-11 (ix), a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	-10 (ix), a
;src/gameObject/gameObject.c:404: if(*posx==P_portal[0].posx ){
	ld	a, -2 (ix)
	sub	a, -1 (ix)
	jr	NZ,00106$
;src/gameObject/gameObject.c:405: if(*posy==P_portal[0].posy ){
	ld	a, (de)
	ld	-3 (ix), a
	ld	l,-7 (ix)
	ld	h,-6 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	ld	a, -3 (ix)
	sub	a, -7 (ix)
	jr	NZ,00106$
;src/gameObject/gameObject.c:406: if(objeto->sprite==sprite_Player){                
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	l, (hl)
	dec	l
	jr	NZ,00102$
;src/gameObject/gameObject.c:407: *posx=P_portal[1].posx;
	pop	hl
	push	hl
	ld	a, (hl)
	ld	(bc), a
;src/gameObject/gameObject.c:408: *posy=P_portal[1].posy;
	ld	iy, #0x0007
	push	bc
	ld	bc, (_P_portal)
	add	iy, bc
	pop	bc
	ld	a, 2 (iy)
	ld	(de), a
;src/gameObject/gameObject.c:409: mover1casilla(posx,posy,movimiento);                
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
;src/gameObject/gameObject.c:411: return hay_Colision;               
	ld	l, #0x01
	jr	00113$
00106$:
;src/gameObject/gameObject.c:414: if(*posx==P_portal[1].posx){
	pop	hl
	push	hl
	ld	a, (hl)
	ld	-3 (ix), a
	ld	a, -2 (ix)
	sub	a, -3 (ix)
	jr	NZ,00112$
;src/gameObject/gameObject.c:415: if(*posy==P_portal[1].posy){
	ld	a, (de)
	ld	-3 (ix), a
	ld	l,-9 (ix)
	ld	h,-8 (ix)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-11 (ix), a
	ld	a, -3 (ix)
	sub	a, -11 (ix)
	jr	NZ,00112$
;src/gameObject/gameObject.c:416: if(objeto->sprite==sprite_Player){
	ld	l,-5 (ix)
	ld	h,-4 (ix)
	ld	l, (hl)
	dec	l
	jr	NZ,00108$
;src/gameObject/gameObject.c:417: *posx=P_portal[0].posx;
	ld	a, -1 (ix)
	ld	(bc), a
;src/gameObject/gameObject.c:418: *posy=P_portal[0].posy;
	ld	hl, (_P_portal)
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(de), a
;src/gameObject/gameObject.c:419: mover1casilla(posx,posy,movimiento);                
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
;src/gameObject/gameObject.c:421: return hay_Colision;                   
	ld	l, #0x01
	jr	00113$
00112$:
;src/gameObject/gameObject.c:424: return no_Hay_Colision;        
	ld	l, #0x00
00113$:
	ld	sp, ix
	pop	ix
	ret
;src/gameObject/gameObject.c:426: u8 comprobarPuertas(u8 posx, u8 posy){
;	---------------------------------
; Function comprobarPuertas
; ---------------------------------
_comprobarPuertas::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/gameObject/gameObject.c:427: for(u8 i=0;i<PuertasMaximas;i++){
	ld	c, #0x00
00106$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00104$
;src/gameObject/gameObject.c:428: if(posx==P_puertas[i].posx && posy==P_puertas[i].posy){
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
;src/gameObject/gameObject.c:429: return P_puertas[i].num;
	ld	a, (de)
	ld	l, a
	jr	00108$
00107$:
;src/gameObject/gameObject.c:427: for(u8 i=0;i<PuertasMaximas;i++){
	inc	c
	jr	00106$
00104$:
;src/gameObject/gameObject.c:432: return seguir_En_Nivel;
	ld	l, #0x00
00108$:
	pop	ix
	ret
;src/gameObject/gameObject.c:434: void comprobarColeccionables(u8 posx, u8 posy){
;	---------------------------------
; Function comprobarColeccionables
; ---------------------------------
_comprobarColeccionables::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/gameObject/gameObject.c:435: for(u8 i=0;i<ColeccionablesMaximos;i++){
	ld	c, #0x00
00112$:
	ld	a, c
	sub	a, #0x03
	jr	NC,00114$
;src/gameObject/gameObject.c:436: if(posx==P_col[i].posx && posy==P_col[i].posy){
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	iy, #_P_col
	ld	a, 0 (iy)
	add	a, e
	ld	-2 (ix), a
	ld	a, 1 (iy)
	adc	a, d
	ld	-1 (ix), a
	pop	hl
	push	hl
	inc	hl
	ld	a,4 (ix)
	sub	a,(hl)
	jr	NZ,00113$
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	a,5 (ix)
	sub	a,(hl)
	jr	NZ,00113$
;src/gameObject/gameObject.c:437: P_colList[P_col[i].num]=coleccionable_NOACTIVO;
	pop	hl
	push	hl
	ld	b, (hl)
	ld	iy, (_P_colList)
	push	bc
	ld	c,b
	ld	b,#0x00
	add	iy, bc
	pop	bc
	ld	0 (iy), #0x01
;src/gameObject/gameObject.c:438: if(P_col[i].sprite==sprite_luz){
	ld	iy, (_P_col)
	add	iy, de
	ld	a, 3 (iy)
	cp	a, #0x15
	jr	NZ,00105$
;src/gameObject/gameObject.c:439: *P_luz=*P_luz+1;                                                             
	ld	hl, (_P_luz)
	ld	b, (hl)
	inc	b
	ld	(hl), b
	jr	00106$
00105$:
;src/gameObject/gameObject.c:440: }else if(P_col[i].sprite==sprite_amstradTape){                
	sub	a, #0x1b
	jr	NZ,00102$
;src/gameObject/gameObject.c:441: *P_ams=*P_ams+1;
	ld	hl, (_P_ams)
	ld	b, (hl)
	inc	b
	ld	(hl), b
	jr	00106$
00102$:
;src/gameObject/gameObject.c:443: *P_fam=*P_fam+1;
	ld	hl, (_P_fam)
	ld	b, (hl)
	inc	b
	ld	(hl), b
00106$:
;src/gameObject/gameObject.c:445: P_col[i].posx=0; 
	ld	iy, (_P_col)
	add	iy, de
	inc	iy
	ld	0 (iy), #0x00
00113$:
;src/gameObject/gameObject.c:435: for(u8 i=0;i<ColeccionablesMaximos;i++){
	inc	c
	jr	00112$
00114$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
