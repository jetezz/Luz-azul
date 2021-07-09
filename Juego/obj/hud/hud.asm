;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module hud
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _dibujarGameObjectColSprite
	.globl _cpct_drawStringM0
	.globl _cpct_setDrawCharM0
	.globl _cpct_drawSolidBox
	.globl _contadorPasos
	.globl _contadorAmstr
	.globl _contadorFamilia
	.globl _contadorLuz
	.globl _asd
	.globl _initHud
	.globl _actualizarHud
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
_contadorLuz::
	.ds 1
_contadorFamilia::
	.ds 1
_contadorAmstr::
	.ds 1
_contadorPasos::
	.ds 1
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
;src/hud/hud.c:21: void asd(){
;	---------------------------------
; Function asd
; ---------------------------------
_asd::
;src/hud/hud.c:32: }
	ret
;src/hud/hud.c:33: void initHud(){
;	---------------------------------
; Function initHud
; ---------------------------------
_initHud::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/hud/hud.c:34: char text[] = "0";
	ld	hl, #0x0000
	add	hl, sp
	ld	c,l
	ld	b,h
	ld	(hl),#0x30
	ld	e, c
	ld	d, b
	inc	de
	xor	a, a
	ld	(de), a
;src/hud/hud.c:36: cpct_setDrawCharM0(1, 0);
	push	bc
	ld	hl, #0x0001
	push	hl
	call	_cpct_setDrawCharM0
	ld	hl, #0x0111
	push	hl
	ld	a, #0x25
	push	af
	inc	sp
	call	_dibujarGameObjectColSprite
	inc	sp
	ld	hl,#0x0311
	ex	(sp),hl
	ld	a, #0x27
	push	af
	inc	sp
	call	_dibujarGameObjectColSprite
	inc	sp
	ld	hl,#0x0511
	ex	(sp),hl
	ld	a, #0x2f
	push	af
	inc	sp
	call	_dibujarGameObjectColSprite
	pop	af
	inc	sp
	pop	bc
;src/hud/hud.c:42: cpct_drawStringM0(text,PuntoLuz);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0xe0ea
	push	hl
	push	de
	call	_cpct_drawStringM0
	pop	bc
;src/hud/hud.c:43: cpct_drawStringM0(text,PuntoFamilia);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0xe22a
	push	hl
	push	de
	call	_cpct_drawStringM0
	pop	bc
;src/hud/hud.c:44: cpct_drawStringM0(text,PuntoCartuchos);
	ld	hl, #0xe36a
	push	hl
	push	bc
	call	_cpct_drawStringM0
;src/hud/hud.c:47: contadorLuz=0;
	ld	hl,#_contadorLuz + 0
	ld	(hl), #0x00
;src/hud/hud.c:48: contadorFamilia=0;
	ld	hl,#_contadorFamilia + 0
	ld	(hl), #0x00
;src/hud/hud.c:49: contadorAmstr=0;
	ld	hl,#_contadorAmstr + 0
	ld	(hl), #0x00
;src/hud/hud.c:50: contadorPasos=0;
	ld	hl,#_contadorPasos + 0
	ld	(hl), #0x00
	ld	sp, ix
	pop	ix
	ret
;src/hud/hud.c:53: void actualizarHud(u8 luz, u8 familia,u8 amstr,u8 pasos){
;	---------------------------------
; Function actualizarHud
; ---------------------------------
_actualizarHud::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/hud/hud.c:54: char text[1] = "X";    
	ld	hl, #0x0000
	add	hl, sp
	ld	c,l
	ld	b,h
	ld	(hl),#0x58
;src/hud/hud.c:58: if(luz!=contadorLuz){
	ld	a, 4 (ix)
	ld	iy, #_contadorLuz
	sub	a, 0 (iy)
	jr	Z,00102$
;src/hud/hud.c:59: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 20),0x00,4,16);
	push	bc
	ld	hl, #0x1004
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xe0ea
	push	hl
	call	_cpct_drawSolidBox
	pop	bc
;src/hud/hud.c:60: text[0]=luz+'0';
	ld	a, 4 (ix)
	add	a, #0x30
	ld	(bc), a
;src/hud/hud.c:61: cpct_drawStringM0(text,PuntoLuz);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0xe0ea
	push	hl
	push	de
	call	_cpct_drawStringM0
	pop	bc
;src/hud/hud.c:62: contadorLuz=luz;
	ld	a, 4 (ix)
	ld	(#_contadorLuz + 0),a
00102$:
;src/hud/hud.c:64: if(familia!=contadorFamilia){
	ld	a, 5 (ix)
	ld	iy, #_contadorFamilia
	sub	a, 0 (iy)
	jr	Z,00104$
;src/hud/hud.c:65: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 52),0x00,4,16);
	push	bc
	ld	hl, #0x1004
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xe22a
	push	hl
	call	_cpct_drawSolidBox
	pop	bc
;src/hud/hud.c:66: text[0]=familia+'0';
	ld	a, 5 (ix)
	add	a, #0x30
	ld	(bc), a
;src/hud/hud.c:67: cpct_drawStringM0(text,PuntoFamilia);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0xe22a
	push	hl
	push	de
	call	_cpct_drawStringM0
	pop	bc
;src/hud/hud.c:68: contadorFamilia=familia;
	ld	a, 5 (ix)
	ld	(#_contadorFamilia + 0),a
00104$:
;src/hud/hud.c:70: if(amstr!=contadorAmstr){
	ld	a, 6 (ix)
	ld	iy, #_contadorAmstr
	sub	a, 0 (iy)
	jr	Z,00106$
;src/hud/hud.c:71: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 74, 84),0x00,4,16);
	push	bc
	ld	hl, #0x1004
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xe36a
	push	hl
	call	_cpct_drawSolidBox
	pop	bc
;src/hud/hud.c:72: text[0]=amstr+'0';
	ld	a, 6 (ix)
	add	a, #0x30
	ld	(bc), a
;src/hud/hud.c:73: cpct_drawStringM0(text,PuntoCartuchos);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0xe36a
	push	hl
	push	de
	call	_cpct_drawStringM0
	pop	bc
;src/hud/hud.c:74: contadorAmstr=amstr;
	ld	a, 6 (ix)
	ld	(#_contadorAmstr + 0),a
00106$:
;src/hud/hud.c:76: if(pasos!=contadorPasos){
	ld	a, 7 (ix)
	ld	iy, #_contadorPasos
	sub	a, 0 (iy)
	jr	Z,00109$
;src/hud/hud.c:77: cpct_drawSolidBox(cpctm_screenPtr(CPCT_VMEM_START, 72, 116),0x00,4,16);
	push	bc
	ld	hl, #0x1004
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xe4a8
	push	hl
	call	_cpct_drawSolidBox
	ld	a, #0x0a
	push	af
	inc	sp
	ld	a, 7 (ix)
	push	af
	inc	sp
	call	__divuchar
	pop	af
	pop	bc
	ld	h, #0x00
;src/hud/hud.c:79: unidades=pasos%10;       
	push	hl
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	ld	a, 7 (ix)
	push	af
	inc	sp
	call	__moduchar
	pop	af
	ld	e, l
	pop	bc
	pop	hl
	ld	d, #0x00
;src/hud/hud.c:80: text[0]=decimas+'0';
	ld	a, l
	add	a, #0x30
	ld	(bc), a
;src/hud/hud.c:81: cpct_drawStringM0(text,PuntoPasos);
	push	bc
	pop	iy
	push	bc
	push	de
	ld	hl, #0xe4a8
	push	hl
	push	iy
	call	_cpct_drawStringM0
	pop	de
	pop	bc
;src/hud/hud.c:82: text[0]=unidades +'0';
	ld	a, e
	add	a, #0x30
	ld	(bc), a
;src/hud/hud.c:83: cpct_drawStringM0(text,PuntoPasos2);       
	ld	hl, #0xe4ac
	push	hl
	push	bc
	call	_cpct_drawStringM0
;src/hud/hud.c:84: contadorPasos=pasos;
	ld	a, 7 (ix)
	ld	(#_contadorPasos + 0),a
00109$:
	inc	sp
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
