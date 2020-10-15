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
   7B1F                      27 _dialogos:
   7B1F                      28 	.ds 100
   7B83                      29 _dialogosTotales::
   7B83                      30 	.ds 150
   7C19                      31 _contadorDialogos::
   7C19                      32 	.ds 1
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
   6F4E                      61 _initDialogos::
                             62 ;src/dialogos/dialogos.c:8: dialogos[0]=dialogo0;
   6F4E 21 08 70      [10]   63 	ld	hl, #_dialogo0
   6F51 22 1F 7B      [16]   64 	ld	(_dialogos), hl
                             65 ;src/dialogos/dialogos.c:9: dialogos[1]=dialogo1;
   6F54 21 24 70      [10]   66 	ld	hl, #_dialogo1
   6F57 22 21 7B      [16]   67 	ld	((_dialogos + 0x0002)), hl
                             68 ;src/dialogos/dialogos.c:11: contadorDialogos=0;
   6F5A 21 19 7C      [10]   69 	ld	hl,#_contadorDialogos + 0
   6F5D 36 00         [10]   70 	ld	(hl), #0x00
                             71 ;src/dialogos/dialogos.c:12: dialogosNivel0();
   6F5F C3 EF 6F      [10]   72 	jp  _dialogosNivel0
                             73 ;src/dialogos/dialogos.c:16: void managerDialogo(u8 nivel, u8 pasos){
                             74 ;	---------------------------------
                             75 ; Function managerDialogo
                             76 ; ---------------------------------
   6F62                      77 _managerDialogo::
   6F62 DD E5         [15]   78 	push	ix
   6F64 DD 21 00 00   [14]   79 	ld	ix,#0
   6F68 DD 39         [15]   80 	add	ix,sp
   6F6A F5            [11]   81 	push	af
                             82 ;src/dialogos/dialogos.c:17: for(u8 i=0;i<numDialogosTotales;i++){
   6F6B 0E 00         [ 7]   83 	ld	c, #0x00
   6F6D                      84 00107$:
   6F6D 79            [ 4]   85 	ld	a, c
   6F6E D6 32         [ 7]   86 	sub	a, #0x32
   6F70 30 36         [12]   87 	jr	NC,00109$
                             88 ;src/dialogos/dialogos.c:18: if(nivel==dialogosTotales[i].nivel){
   6F72 06 00         [ 7]   89 	ld	b,#0x00
   6F74 69            [ 4]   90 	ld	l, c
   6F75 60            [ 4]   91 	ld	h, b
   6F76 29            [11]   92 	add	hl, hl
   6F77 09            [11]   93 	add	hl, bc
   6F78 EB            [ 4]   94 	ex	de,hl
   6F79 21 83 7B      [10]   95 	ld	hl, #_dialogosTotales
   6F7C 19            [11]   96 	add	hl,de
   6F7D E3            [19]   97 	ex	(sp), hl
   6F7E E1            [10]   98 	pop	hl
   6F7F E5            [11]   99 	push	hl
   6F80 23            [ 6]  100 	inc	hl
   6F81 DD 7E 04      [19]  101 	ld	a,4 (ix)
   6F84 96            [ 7]  102 	sub	a,(hl)
   6F85 20 1E         [12]  103 	jr	NZ,00108$
                            104 ;src/dialogos/dialogos.c:19: if(dialogosTotales[i].pasos==pasos){
   6F87 E1            [10]  105 	pop	hl
   6F88 E5            [11]  106 	push	hl
   6F89 23            [ 6]  107 	inc	hl
   6F8A 23            [ 6]  108 	inc	hl
   6F8B 46            [ 7]  109 	ld	b, (hl)
   6F8C DD 7E 05      [19]  110 	ld	a, 5 (ix)
   6F8F 90            [ 4]  111 	sub	a, b
   6F90 20 13         [12]  112 	jr	NZ,00108$
                            113 ;src/dialogos/dialogos.c:20: dialogos[dialogosTotales[i].id]();  
   6F92 E1            [10]  114 	pop	hl
   6F93 E5            [11]  115 	push	hl
   6F94 6E            [ 7]  116 	ld	l, (hl)
   6F95 26 00         [ 7]  117 	ld	h, #0x00
   6F97 29            [11]  118 	add	hl, hl
   6F98 11 1F 7B      [10]  119 	ld	de, #_dialogos
   6F9B 19            [11]  120 	add	hl, de
   6F9C 7E            [ 7]  121 	ld	a, (hl)
   6F9D 23            [ 6]  122 	inc	hl
   6F9E 66            [ 7]  123 	ld	h, (hl)
   6F9F 6F            [ 4]  124 	ld	l, a
   6FA0 C5            [11]  125 	push	bc
   6FA1 CD B5 75      [17]  126 	call	___sdcc_call_hl
   6FA4 C1            [10]  127 	pop	bc
   6FA5                     128 00108$:
                            129 ;src/dialogos/dialogos.c:17: for(u8 i=0;i<numDialogosTotales;i++){
   6FA5 0C            [ 4]  130 	inc	c
   6FA6 18 C5         [12]  131 	jr	00107$
   6FA8                     132 00109$:
   6FA8 DD F9         [10]  133 	ld	sp, ix
   6FAA DD E1         [14]  134 	pop	ix
   6FAC C9            [10]  135 	ret
                            136 ;src/dialogos/dialogos.c:26: void anadirDialogo(u8 id, u8 nivel,u8 pasos){
                            137 ;	---------------------------------
                            138 ; Function anadirDialogo
                            139 ; ---------------------------------
   6FAD                     140 _anadirDialogo::
   6FAD DD E5         [15]  141 	push	ix
   6FAF DD 21 00 00   [14]  142 	ld	ix,#0
   6FB3 DD 39         [15]  143 	add	ix,sp
                            144 ;src/dialogos/dialogos.c:27: dialogosTotales[contadorDialogos].id=id;
   6FB5 01 83 7B      [10]  145 	ld	bc, #_dialogosTotales+0
   6FB8 ED 5B 19 7C   [20]  146 	ld	de, (_contadorDialogos)
   6FBC 16 00         [ 7]  147 	ld	d, #0x00
   6FBE 6B            [ 4]  148 	ld	l, e
   6FBF 62            [ 4]  149 	ld	h, d
   6FC0 29            [11]  150 	add	hl, hl
   6FC1 19            [11]  151 	add	hl, de
   6FC2 09            [11]  152 	add	hl, bc
   6FC3 DD 7E 04      [19]  153 	ld	a, 4 (ix)
   6FC6 77            [ 7]  154 	ld	(hl), a
                            155 ;src/dialogos/dialogos.c:28: dialogosTotales[contadorDialogos].nivel=nivel;
   6FC7 ED 5B 19 7C   [20]  156 	ld	de, (_contadorDialogos)
   6FCB 16 00         [ 7]  157 	ld	d, #0x00
   6FCD 6B            [ 4]  158 	ld	l, e
   6FCE 62            [ 4]  159 	ld	h, d
   6FCF 29            [11]  160 	add	hl, hl
   6FD0 19            [11]  161 	add	hl, de
   6FD1 09            [11]  162 	add	hl, bc
   6FD2 23            [ 6]  163 	inc	hl
   6FD3 DD 7E 05      [19]  164 	ld	a, 5 (ix)
   6FD6 77            [ 7]  165 	ld	(hl), a
                            166 ;src/dialogos/dialogos.c:29: dialogosTotales[contadorDialogos].pasos=pasos;
   6FD7 ED 5B 19 7C   [20]  167 	ld	de, (_contadorDialogos)
   6FDB 16 00         [ 7]  168 	ld	d, #0x00
   6FDD 6B            [ 4]  169 	ld	l, e
   6FDE 62            [ 4]  170 	ld	h, d
   6FDF 29            [11]  171 	add	hl, hl
   6FE0 19            [11]  172 	add	hl, de
   6FE1 09            [11]  173 	add	hl, bc
   6FE2 23            [ 6]  174 	inc	hl
   6FE3 23            [ 6]  175 	inc	hl
   6FE4 DD 7E 06      [19]  176 	ld	a, 6 (ix)
   6FE7 77            [ 7]  177 	ld	(hl), a
                            178 ;src/dialogos/dialogos.c:30: contadorDialogos++;
   6FE8 21 19 7C      [10]  179 	ld	hl, #_contadorDialogos+0
   6FEB 34            [11]  180 	inc	(hl)
   6FEC DD E1         [14]  181 	pop	ix
   6FEE C9            [10]  182 	ret
                            183 ;src/dialogos/dialogos.c:32: void dialogosNivel0(){
                            184 ;	---------------------------------
                            185 ; Function dialogosNivel0
                            186 ; ---------------------------------
   6FEF                     187 _dialogosNivel0::
                            188 ;src/dialogos/dialogos.c:33: anadirDialogo(0,nivel_0,5);
   6FEF 21 01 05      [10]  189 	ld	hl, #0x0501
   6FF2 E5            [11]  190 	push	hl
   6FF3 AF            [ 4]  191 	xor	a, a
   6FF4 F5            [11]  192 	push	af
   6FF5 33            [ 6]  193 	inc	sp
   6FF6 CD AD 6F      [17]  194 	call	_anadirDialogo
                            195 ;src/dialogos/dialogos.c:34: anadirDialogo(1,nivel_0,10);
   6FF9 33            [ 6]  196 	inc	sp
   6FFA 21 01 0A      [10]  197 	ld	hl,#0x0a01
   6FFD E3            [19]  198 	ex	(sp),hl
   6FFE 3E 01         [ 7]  199 	ld	a, #0x01
   7000 F5            [11]  200 	push	af
   7001 33            [ 6]  201 	inc	sp
   7002 CD AD 6F      [17]  202 	call	_anadirDialogo
   7005 F1            [10]  203 	pop	af
   7006 33            [ 6]  204 	inc	sp
   7007 C9            [10]  205 	ret
                            206 ;src/dialogos/dialogos.c:37: void dialogo0(){
                            207 ;	---------------------------------
                            208 ; Function dialogo0
                            209 ; ---------------------------------
   7008                     210 _dialogo0::
                            211 ;src/dialogos/dialogos.c:38: cpct_drawStringM0("dialogo 5 pasos",PuntoEscribir);
   7008 21 A2 F5      [10]  212 	ld	hl, #0xf5a2
   700B E5            [11]  213 	push	hl
   700C 21 14 70      [10]  214 	ld	hl, #___str_0
   700F E5            [11]  215 	push	hl
   7010 CD 6B 73      [17]  216 	call	_cpct_drawStringM0
   7013 C9            [10]  217 	ret
   7014                     218 ___str_0:
   7014 64 69 61 6C 6F 67   219 	.ascii "dialogo 5 pasos"
        6F 20 35 20 70 61
        73 6F 73
   7023 00                  220 	.db 0x00
                            221 ;src/dialogos/dialogos.c:40: void dialogo1(){
                            222 ;	---------------------------------
                            223 ; Function dialogo1
                            224 ; ---------------------------------
   7024                     225 _dialogo1::
                            226 ;src/dialogos/dialogos.c:41: cpct_drawStringM0("dialogo 10 pasos",PuntoEscribir);
   7024 21 A2 F5      [10]  227 	ld	hl, #0xf5a2
   7027 E5            [11]  228 	push	hl
   7028 21 30 70      [10]  229 	ld	hl, #___str_1
   702B E5            [11]  230 	push	hl
   702C CD 6B 73      [17]  231 	call	_cpct_drawStringM0
   702F C9            [10]  232 	ret
   7030                     233 ___str_1:
   7030 64 69 61 6C 6F 67   234 	.ascii "dialogo 10 pasos"
        6F 20 31 30 20 70
        61 73 6F 73
   7040 00                  235 	.db 0x00
                            236 	.area _CODE
                            237 	.area _INITIALIZER
                            238 	.area _CABS (ABS)
