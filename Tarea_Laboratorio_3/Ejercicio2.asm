org 100h

section .text
        XOR AX, AX; limpiamos AX
        XOR CX, CX; limpiamos CX
        MOV AX, 1d; 1 decimal
        MOV word CX, 5d ;5 decimal en CX
        JMP factorial ;Salta incondicionalmente a una dirección
factorial:
        MUL CX
        LOOP factorial;repetimos el loop 5 veces
total:
        
        MOV word [20Bh], AX         
exit:
        int 20h