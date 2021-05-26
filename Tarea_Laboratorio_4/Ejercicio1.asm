org     100h

section .text

XOR SI, SI                          
XOR DI, DI
XOR BX, BX
XOR CX, CX
XOR DX, DX
XOR AX, AX

MOV     BP, array     
CALL    datos        

int     20h

section .data

array db 01,02,03,04,05,06,07,08,09,10 ;datos que estan dentro del arreglo   
largo equ $-array ;tamaño del arreglo   
dividir equ 02 ;dividimos entre 2 para saber si es par o impar

datos:
    MOV     BL, dividir

for:
    CMP     SI, largo
    JE      end

    MOV     AL, [BP+SI]
    MOV     BH,AL
    DIV     BL
    INC     SI

    CMP     AH, 0
    JE      es_par
    JNE     es_impar
        
es_par:
    MOV     DI, CX
    MOV     [300h+ DI], BH
    INC     DI
    MOV     CX, DI
    jmp     for

es_impar:
    MOV     DI, DX
    MOV     [320h+DI], BH
    INC     DI
    MOV     DX, DI
    jmp     for

end:
    ret