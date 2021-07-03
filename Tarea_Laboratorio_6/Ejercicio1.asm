	org 	100h

	section	.text

	; print msg1
	mov 	DX, msg1
	
	; input frase
	mov 	BP, frase

	call  	EscribirCadena
	call  	LeerCadena
	;call 	Tamano

    ;call    Validar

	call 	EscribirCadena

	;call	EsperarTecla

	int 	20h

	section	.data

contra  db 	"00181317"
msg1	db	"Ingresa una contrasena: ", "$"
true 	db 	"BIENVENIDO"
flase 	db 	"INCORRECTO"
frase 	times 	20  	db	" " 	

; FUNCIONES

; Permite leer un carácter de la entrada estándar con echo
; Parámetros:   AH: 07h         
; Salida:       AL: caracter ASCII leído
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

Tamano:
		cmp DI, 8d
		je Validar
		jne Incorrecto

; Leer cadena de texto desde el teclado
; Salida:       SI: longitud de la cadena 		BP: direccion de guardado
LeerCadena:
        xor     DI, DI          ; DI = 0
while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit            ; si AL == EnterKey, saltar a exit
        mov     [BP+DI], AL   	; guardar caracter en memoria
        inc     DI              ; SI++
        jmp     Validar           ; saltar a while
;Funciones Contraseña
Validar:
			cmp DI, Tamano
            je Correcto
			mov AL,[contra + DI]
			cmp [BP + DI], AL
			jne Incorrecto
			inc DI
			jmp Validar 
Correcto:
            MOV DX, true
		    JMP while

Incorrecto:
		    MOV DX, flase
		    JMP while
exit:
	    mov 	byte [BP+DI], "$"	; agregar $ al final de la cadena
        ret

; Permite escribir en la salida estándar una cadena de caracteres o string, este
; debe tener como terminación el carácter “$”
; Parámetros:	AH: 09h 	DX: dirección de la celda de memoria inicial de la cadena
EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret