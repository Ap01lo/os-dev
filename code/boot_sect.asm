mov bx, 50

cmp bx, 4
jle A

cmp bx, 40
jl B

mov al, 'C'
jmp the_end

A:
    mov al, 'A'
    jmp the_end

B:
    mov al, 'B'
    jmp the_end

the_end:
    mov ah, 0x0e
    int 0x10

    jmp $

times 510-($-$$) db 0
dw 0xaa55