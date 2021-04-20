    org	100h

	section	.text

    xor AX,AX
    xor BX,BX
    xor CX,CX
    xor DX,DX

    ;Copiar el valor de 200h a AX usando direccionamiento directo.

    xor AX,AX
    mov	byte [200h], 52h
    mov	AX, [200h]

    ;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
    
    xor BX,BX
    mov	byte [201h], 41h
    mov BX, 201h
    mov	CX,[BX]

    ;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice

    xor BX,BX
    mov	byte [202h], 56h
    mov BX, 202h
    mov DX, [BX+SI]

    ;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.

    mov	byte [203h], 41h
    mov SI, 200h    
	mov	DI, [SI+3h]

    	
    int	20h