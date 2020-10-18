                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module dialogos
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_drawStringM0
                             12 	.globl _contadorDialogos
                             13 	.globl _dialogosTotales
                             14 	.globl _initDialogos
                             15 	.globl _managerDialogo
                             16 	.globl _anadirDialogo
                             17 	.globl _dialogosNivel0
                             18 	.globl _dialogo0
                             19 	.globl _dialogo1
                             20 ;--------------------------------------------------------
                             21 ; special function registers
                             22 ;--------------------------------------------------------
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _DATA
   B0BC                      27 _dialogos:
   B0BC                      28 	.ds 100
   B120                      29 _dialogosTotales::
   B120                      30 	.ds 150
   B1B6                      31 _contadorDialogos::
   B1B6                      32 	.ds 1
                             33 ;--------------------------------------------------------
                             34 ; ram data
                             35 ;--------------------------------------------------------
                             36 	.area _INITIALIZED
                             37 ;--------------------------------------------------------
                             38 ; absolute external ram data
                             39 ;--------------------------------------------------------
                             40 	.area _DABS (ABS)
                             41 ;--------------------------------------------------------
                             42 ; global & static initialisations
                             43 ;--------------------------------------------------------
                             44 	.area _HOME
                             45 	.area _GSINIT
                             46 	.area _GSFINAL
                             47 	.area _GSINIT
                             48 ;--------------------------------------------------------
                             49 ; Home
                             50 ;--------------------------------------------------------
                             51 	.area _HOME
                             52 	.area _HOME
                             53 ;--------------------------------------------------------
                             54 ; code
                             55 ;--------------------------------------------------------
                             56 	.area _CODE
                             57 ;src/dialogos/dialogos.c:7: void initDialogos(){
                             58 ;	---------------------------------
                             59 ; Function initDialogos
                             60 ; ---------------------------------
   9B33                      61 _initDialogos::
                             62 ;src/dialogos/dialogos.c:8: dialogos[0]=dialogo0;
   9B33 21 ED 9B      [10]   63 	ld	hl, #_dialogo0
   9B36 22 BC B0      [16]   64 	ld	(_dialogos), hl
                             65 ;src/dialogos/dialogos.c:9: dialogos[1]=dialogo1;
   9B39 21 09 9C      [10]   66 	ld	hl, #_dialogo1
   9B3C 22 BE B0      [16]   67 	ld	((_dialogos + 0x0002)), hl
                             68 ;src/dialogos/dialogos.c:11: contadorDialogos=0;
   9B3F 21 B6 B1      [10]   69 	ld	hl,#_contadorDialogos + 0
   9B42 36 00         [10]   70 	ld	(hl), #0x00
                             71 ;src/dialogos/dialogos.c:12: dialogosNivel0();
   9B44 C3 D4 9B      [10]   72 	jp  _dialogosNivel0
                             73 ;src/dialogos/dialogos.c:16: void managerDialogo(u8 nivel, u8 pasos){
                             74 ;	---------------------------------
                             75 ; Function managerDialogo
                             76 ; ---------------------------------
   9B47                      77 _managerDialogo::
   9B47 DD E5         [15]   78 	push	ix
   9B49 DD 21 00 00   [14]   79 	ld	ix,#0
   9B4D DD 39         [15]   80 	add	ix,sp
   9B4F F5            [11]   81 	push	af
                             82 ;src/dialogos/dialogos.c:17: for(u8 i=0;i<numDialogosTotales;i++){
   9B50 0E 00         [ 7]   83 	ld	c, #0x00
   9B52                      84 00107$:
   9B52 79            [ 4]   85 	ld	a, c
   9B53 D6 32         [ 7]   86 	sub	a, #0x32
   9B55 30 36         [12]   87 	jr	NC,00109$
                             88 ;src/dialogos/dialogos.c:18: if(nivel==dialogosTotales[i].nivel){
   9B57 06 00         [ 7]   89 	ld	b,#0x00
   9B59 69            [ 4]   90 	ld	l, c
   9B5A 60            [ 4]   91 	ld	h, b
   9B5B 29            [11]   92 	add	hl, hl
   9B5C 09            [11]   93 	add	hl, bc
   9B5D EB            [ 4]   94 	ex	de,hl
   9B5E 21 20 B1      [10]   95 	ld	hl, #_dialogosTotales
   9B61 19            [11]   96 	add	hl,de
   9B62 E3            [19]   97 	ex	(sp), hl
   9B63 E1            [10]   98 	pop	hl
   9B64 E5            [11]   99 	push	hl
   9B65 23            [ 6]  100 	inc	hl
   9B66 DD 7E 04      [19]  101 	ld	a,4 (ix)
   9B69 96            [ 7]  102 	sub	a,(hl)
   9B6A 20 1E         [12]  103 	jr	NZ,00108$
                            104 ;src/dialogos/dialogos.c:19: if(dialogosTotales[i].pasos==pasos){
   9B6C E1            [10]  105 	pop	hl
   9B6D E5            [11]  106 	push	hl
   9B6E 23            [ 6]  107 	inc	hl
   9B6F 23            [ 6]  108 	inc	hl
   9B70 46            [ 7]  109 	ld	b, (hl)
   9B71 DD 7E 05      [19]  110 	ld	a, 5 (ix)
   9B74 90            [ 4]  111 	sub	a, b
   9B75 20 13         [12]  112 	jr	NZ,00108$
                            113 ;src/dialogos/dialogos.c:20: dialogos[dialogosTotales[i].id]();  
   9B77 E1            [10]  114 	pop	hl
   9B78 E5            [11]  115 	push	hl
   9B79 6E            [ 7]  116 	ld	l, (hl)
   9B7A 26 00         [ 7]  117 	ld	h, #0x00
   9B7C 29            [11]  118 	add	hl, hl
   9B7D 11 BC B0      [10]  119 	ld	de, #_dialogos
   9B80 19            [11]  120 	add	hl, de
   9B81 7E            [ 7]  121 	ld	a, (hl)
   9B82 23            [ 6]  122 	inc	hl
   9B83 66            [ 7]  123 	ld	h, (hl)
   9B84 6F            [ 4]  124 	ld	l, a
   9B85 C5            [11]  125 	push	bc
   9B86 CD CF A9      [17]  126 	call	___sdcc_call_hl
   9B89 C1            [10]  127 	pop	bc
   9B8A                     128 00108$:
                            129 ;src/dialogos/dialogos.c:17: for(u8 i=0;i<numDialogosTotales;i++){
   9B8A 0C            [ 4]  130 	inc	c
   9B8B 18 C5         [12]  131 	jr	00107$
   9B8D                     132 00109$:
   9B8D DD F9         [10]  133 	ld	sp, ix
   9B8F DD E1         [14]  134 	pop	ix
   9B91 C9            [10]  135 	ret
                            136 ;src/dialogos/dialogos.c:26: void anadirDialogo(u8 id, u8 nivel,u8 pasos){
                            137 ;	---------------------------------
                            138 ; Function anadirDialogo
                            139 ; ---------------------------------
   9B92                     140 _anadirDialogo::
   9B92 DD E5         [15]  141 	push	ix
   9B94 DD 21 00 00   [14]  142 	ld	ix,#0
   9B98 DD 39         [15]  143 	add	ix,sp
                            144 ;src/dialogos/dialogos.c:27: dialogosTotales[contadorDialogos].id=id;
   9B9A 01 20 B1      [10]  145 	ld	bc, #_dialogosTotales+0
   9B9D ED 5B B6 B1   [20]  146 	ld	de, (_contadorDialogos)
   9BA1 16 00         [ 7]  147 	ld	d, #0x00
   9BA3 6B            [ 4]  148 	ld	l, e
   9BA4 62            [ 4]  149 	ld	h, d
   9BA5 29            [11]  150 	add	hl, hl
   9BA6 19            [11]  151 	add	hl, de
   9BA7 09            [11]  152 	add	hl, bc
   9BA8 DD 7E 04      [19]  153 	ld	a, 4 (ix)
   9BAB 77            [ 7]  154 	ld	(hl), a
                            155 ;src/dialogos/dialogos.c:28: dialogosTotales[contadorDialogos].nivel=nivel;
   9BAC ED 5B B6 B1   [20]  156 	ld	de, (_contadorDialogos)
   9BB0 16 00         [ 7]  157 	ld	d, #0x00
   9BB2 6B            [ 4]  158 	ld	l, e
   9BB3 62            [ 4]  159 	ld	h, d
   9BB4 29            [11]  160 	add	hl, hl
   9BB5 19            [11]  161 	add	hl, de
   9BB6 09            [11]  162 	add	hl, bc
   9BB7 23            [ 6]  163 	inc	hl
   9BB8 DD 7E 05      [19]  164 	ld	a, 5 (ix)
   9BBB 77            [ 7]  165 	ld	(hl), a
                            166 ;src/dialogos/dialogos.c:29: dialogosTotales[contadorDialogos].pasos=pasos;
   9BBC ED 5B B6 B1   [20]  167 	ld	de, (_contadorDialogos)
   9BC0 16 00         [ 7]  168 	ld	d, #0x00
   9BC2 6B            [ 4]  169 	ld	l, e
   9BC3 62            [ 4]  170 	ld	h, d
   9BC4 29            [11]  171 	add	hl, hl
   9BC5 19            [11]  172 	add	hl, de
   9BC6 09            [11]  173 	add	hl, bc
   9BC7 23            [ 6]  174 	inc	hl
   9BC8 23            [ 6]  175 	inc	hl
   9BC9 DD 7E 06      [19]  176 	ld	a, 6 (ix)
   9BCC 77            [ 7]  177 	ld	(hl), a
                            178 ;src/dialogos/dialogos.c:30: contadorDialogos++;
   9BCD 21 B6 B1      [10]  179 	ld	hl, #_contadorDialogos+0
   9BD0 34            [11]  180 	inc	(hl)
   9BD1 DD E1         [14]  181 	pop	ix
   9BD3 C9            [10]  182 	ret
                            183 ;src/dialogos/dialogos.c:32: void dialogosNivel0(){
                            184 ;	---------------------------------
                            185 ; Function dialogosNivel0
                            186 ; ---------------------------------
   9BD4                     187 _dialogosNivel0::
                            188 ;src/dialogos/dialogos.c:33: anadirDialogo(0,nivel_01,5);
   9BD4 21 01 05      [10]  189 	ld	hl, #0x0501
   9BD7 E5            [11]  190 	push	hl
   9BD8 AF            [ 4]  191 	xor	a, a
   9BD9 F5            [11]  192 	push	af
   9BDA 33            [ 6]  193 	inc	sp
   9BDB CD 92 9B      [17]  194 	call	_anadirDialogo
                            195 ;src/dialogos/dialogos.c:34: anadirDialogo(1,nivel_01,10);
   9BDE 33            [ 6]  196 	inc	sp
   9BDF 21 01 0A      [10]  197 	ld	hl,#0x0a01
   9BE2 E3            [19]  198 	ex	(sp),hl
   9BE3 3E 01         [ 7]  199 	ld	a, #0x01
   9BE5 F5            [11]  200 	push	af
   9BE6 33            [ 6]  201 	inc	sp
   9BE7 CD 92 9B      [17]  202 	call	_anadirDialogo
   9BEA F1            [10]  203 	pop	af
   9BEB 33            [ 6]  204 	inc	sp
   9BEC C9            [10]  205 	ret
                            206 ;src/dialogos/dialogos.c:37: void dialogo0(){
                            207 ;	---------------------------------
                            208 ; Function dialogo0
                            209 ; ---------------------------------
   9BED                     210 _dialogo0::
                            211 ;src/dialogos/dialogos.c:38: cpct_drawStringM0("dialogo 5 pasos",PuntoEscribir);
   9BED 21 A2 F5      [10]  212 	ld	hl, #0xf5a2
   9BF0 E5            [11]  213 	push	hl
   9BF1 21 F9 9B      [10]  214 	ld	hl, #___str_0
   9BF4 E5            [11]  215 	push	hl
   9BF5 CD 79 A7      [17]  216 	call	_cpct_drawStringM0
   9BF8 C9            [10]  217 	ret
   9BF9                     218 ___str_0:
   9BF9 64 69 61 6C 6F 67   219 	.ascii "dialogo 5 pasos"
        6F 20 35 20 70 61
        73 6F 73
   9C08 00                  220 	.db 0x00
                            221 ;src/dialogos/dialogos.c:40: void dialogo1(){
                            222 ;	---------------------------------
                            223 ; Function dialogo1
                            224 ; ---------------------------------
   9C09                     225 _dialogo1::
                            226 ;src/dialogos/dialogos.c:41: cpct_drawStringM0("dialogo 10 pasos",PuntoEscribir);
   9C09 21 A2 F5      [10]  227 	ld	hl, #0xf5a2
   9C0C E5            [11]  228 	push	hl
   9C0D 21 15 9C      [10]  229 	ld	hl, #___str_1
   9C10 E5            [11]  230 	push	hl
   9C11 CD 79 A7      [17]  231 	call	_cpct_drawStringM0
   9C14 C9            [10]  232 	ret
   9C15                     233 ___str_1:
   9C15 64 69 61 6C 6F 67   234 	.ascii "dialogo 10 pasos"
        6F 20 31 30 20 70
        61 73 6F 73
   9C25 00                  235 	.db 0x00
                            236 	.area _CODE
                            237 	.area _INITIALIZER
                            238 	.area _CABS (ABS)
