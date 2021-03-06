; ******************************************************
; **       Librer�a de rutinas para Amstrad CPC       **
; **	   Ra�l Simarro, 	  Artaburu 2007       **
; ******************************************************

XLIB cpc_TestKey

LIB cpc_TestKeyboard
;XREF linea_a_buscar

LIB cpc_KeysData
XREF  tabla_teclas

.cpc_TestKey
	;ld hl,2
    ;add hl,sp	
    ;ld a,(hl)
    ;* ld a,l
; En A se tiene el valor de la tecla seleccionada a comprobar [0..11]
	;A*2
	;* add a
	SLA L
	inc l
	ld h,0
	ld de,tabla_teclas+cpc_KeysData
	;* ld d,0
	;* ld e,l
	;* inc e	
	;* ld hl,cpc_TestKeyboard+tabla_teclas
	add hl,de
	
	ld a,(HL)
	;ld (cpc_TestKeyboard+linea_a_buscar+1),a		;cambia la l�nea a explorar
	;XOR A
	call cpc_TestKeyboard		; esta rutina lee la l�nea del teclado correspondiente 
	DEC hl						; pero s�lo nos interesa una de las teclas.
	and (HL) ;para filtrar por el bit de la tecla (puede haber varias pulsadas)
	;xor a
	CP (hl)	;comprueba si el byte coincide
	ld h,0
	jp z,pulsado
	ld l,h
	ret
.pulsado
	ld l,1
	ret
	
	