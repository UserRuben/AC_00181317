	org 	100h

section .text

	CALL 	texto	
	CALL 	cursor
	CALL 	frase

	int 	20h

texto:	
    MOV 	AH, 00h
	MOV	    AL, 03h
	INT 	10h
	RET

cursor: 
    MOV	    AH, 01h
	MOV 	CH, 0
	MOV 	CL, 7
	INT 	10h
	RET

char:	
    MOV 	AH, 09h
	MOV 	AL, CL
	MOV 	BH, 0h
	MOV 	BL, 00001111b ;atributo
	MOV 	CX, 1h
	INT 	10h
	RET

m_cursor:
    MOV 	AH, 02h
	MOV 	DX, DI  ; guardará la posición de las columnas
	MOV 	DH, CH  ; guardará la posición de las filas
	MOV 	BH, 0h
	INT 	10h
	RET


frase:	
    MOV 	DI, 10d

text1:	
    MOV 	CL, [msg1+DI-10d]
    MOV     CH, 1d
	CALL    m_cursor
	CALL 	char
	INC	    DI
	CMP 	DI, len1
	JB	    text1
    MOV     DI, 10d
	    

text2:	
    MOV 	CL, [msg2+DI-10d]
    MOV     CH, 2d
	CALL    m_cursor
	CALL 	char
	INC	    DI
	CMP 	DI, len2
	JB	    text2
    MOV     DI, 10d

text3:	
    MOV 	CL, [msg3+DI-10d]
    MOV     CH, 3d
	CALL    m_cursor
	CALL 	char
	INC	    DI
	CMP 	DI, len3
	JB	    text3
    MOV     DI, 10d

text4:	
    MOV 	CL, [msg4+DI-10d]
    MOV     CH, 4d
	CALL    m_cursor
	CALL 	char
	INC	    DI
	CMP 	DI, len4
	JB	    text4
	RET

;Distintos mensajes
section .data
msg1	db 	"Ruben"
len1 	equ	$-msg1+10d

msg2	db 	"Aristides"
len2 	equ	$-msg2+10d

msg3	db 	"Valencia"
len3 	equ	$-msg3+10d

msg4	db 	"Alvarado"
len4 	equ	$-msg4+10d