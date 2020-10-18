;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module dialogos
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_drawStringM0
	.globl _contadorDialogos
	.globl _dialogosTotales
	.globl _initDialogos
	.globl _managerDialogo
	.globl _anadirDialogo
	.globl _dialogosNivel0
	.globl _dialogo0
	.globl _dialogo1
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_dialogos:
	.ds 100
_dialogosTotales::
	.ds 150
_contadorDialogos::
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
;src/dialogos/dialogos.c:7: void initDialogos(){
;	---------------------------------
; Function initDialogos
; ---------------------------------
_initDialogos::
;src/dialogos/dialogos.c:8: dialogos[0]=dialogo0;
	ld	hl, #_dialogo0
	ld	(_dialogos), hl
;src/dialogos/dialogos.c:9: dialogos[1]=dialogo1;
	ld	hl, #_dialogo1
	ld	((_dialogos + 0x0002)), hl
;src/dialogos/dialogos.c:11: contadorDialogos=0;
	ld	hl,#_contadorDialogos + 0
	ld	(hl), #0x00
;src/dialogos/dialogos.c:12: dialogosNivel0();
	jp  _dialogosNivel0
;src/dialogos/dialogos.c:16: void managerDialogo(u8 nivel, u8 pasos){
;	---------------------------------
; Function managerDialogo
; ---------------------------------
_managerDialogo::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/dialogos/dialogos.c:17: for(u8 i=0;i<numDialogosTotales;i++){
	ld	c, #0x00
00107$:
	ld	a, c
	sub	a, #0x32
	jr	NC,00109$
;src/dialogos/dialogos.c:18: if(nivel==dialogosTotales[i].nivel){
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	ex	de,hl
	ld	hl, #_dialogosTotales
	add	hl,de
	ex	(sp), hl
	pop	hl
	push	hl
	inc	hl
	ld	a,4 (ix)
	sub	a,(hl)
	jr	NZ,00108$
;src/dialogos/dialogos.c:19: if(dialogosTotales[i].pasos==pasos){
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	a, 5 (ix)
	sub	a, b
	jr	NZ,00108$
;src/dialogos/dialogos.c:20: dialogos[dialogosTotales[i].id]();  
	pop	hl
	push	hl
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	ld	de, #_dialogos
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	bc
	call	___sdcc_call_hl
	pop	bc
00108$:
;src/dialogos/dialogos.c:17: for(u8 i=0;i<numDialogosTotales;i++){
	inc	c
	jr	00107$
00109$:
	ld	sp, ix
	pop	ix
	ret
;src/dialogos/dialogos.c:26: void anadirDialogo(u8 id, u8 nivel,u8 pasos){
;	---------------------------------
; Function anadirDialogo
; ---------------------------------
_anadirDialogo::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/dialogos/dialogos.c:27: dialogosTotales[contadorDialogos].id=id;
	ld	bc, #_dialogosTotales+0
	ld	de, (_contadorDialogos)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, bc
	ld	a, 4 (ix)
	ld	(hl), a
;src/dialogos/dialogos.c:28: dialogosTotales[contadorDialogos].nivel=nivel;
	ld	de, (_contadorDialogos)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	ld	a, 5 (ix)
	ld	(hl), a
;src/dialogos/dialogos.c:29: dialogosTotales[contadorDialogos].pasos=pasos;
	ld	de, (_contadorDialogos)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, bc
	inc	hl
	inc	hl
	ld	a, 6 (ix)
	ld	(hl), a
;src/dialogos/dialogos.c:30: contadorDialogos++;
	ld	hl, #_contadorDialogos+0
	inc	(hl)
	pop	ix
	ret
;src/dialogos/dialogos.c:32: void dialogosNivel0(){
;	---------------------------------
; Function dialogosNivel0
; ---------------------------------
_dialogosNivel0::
;src/dialogos/dialogos.c:33: anadirDialogo(0,nivel_01,5);
	ld	hl, #0x0501
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_anadirDialogo
;src/dialogos/dialogos.c:34: anadirDialogo(1,nivel_01,10);
	inc	sp
	ld	hl,#0x0a01
	ex	(sp),hl
	ld	a, #0x01
	push	af
	inc	sp
	call	_anadirDialogo
	pop	af
	inc	sp
	ret
;src/dialogos/dialogos.c:37: void dialogo0(){
;	---------------------------------
; Function dialogo0
; ---------------------------------
_dialogo0::
;src/dialogos/dialogos.c:38: cpct_drawStringM0("dialogo 5 pasos",PuntoEscribir);
	ld	hl, #0xf5a2
	push	hl
	ld	hl, #___str_0
	push	hl
	call	_cpct_drawStringM0
	ret
___str_0:
	.ascii "dialogo 5 pasos"
	.db 0x00
;src/dialogos/dialogos.c:40: void dialogo1(){
;	---------------------------------
; Function dialogo1
; ---------------------------------
_dialogo1::
;src/dialogos/dialogos.c:41: cpct_drawStringM0("dialogo 10 pasos",PuntoEscribir);
	ld	hl, #0xf5a2
	push	hl
	ld	hl, #___str_1
	push	hl
	call	_cpct_drawStringM0
	ret
___str_1:
	.ascii "dialogo 10 pasos"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
