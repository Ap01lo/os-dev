print_string:
;
; bx: the start address of string
;
    pusha
    mov ah, 0x0e
loop:
    call print_char
    add bx, 1
    mov cl, [bx]
    cmp cl, 0
    jg loop
    jmp the_end

print_char:
    mov al, [bx]
    int 0x10
    ret

the_end:
    popa
    ret