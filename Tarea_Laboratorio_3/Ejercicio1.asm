org 100h

section .text

    XOR AX, AX
    XOR BX, BX
    MOV word CX, 6d
    JMP sumatoria;Salta incondicionalmente a una dirección

sumatoria:
    MOV byte BL,[numeros+DI]
    ADD AL,BL; Sumamos AL con BL y AL guarda el dato
    INC DI; Incrementando en 1 el indice
    LOOP sumatoria;loop para repetirlo 6 veces
total:
    XOR BX, BX  
    MOV BX, 8d
    DIV BX
    MOV byte [20Ah], AL

exit:
    int 30h

section .data

numeros DB 1,8,1,3,1,7