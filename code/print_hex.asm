print_hex:
; dx: The orignal hex value

pusha
mov ax, dx
mov bx, HEX_ADDRESS
add bx, 5
mov cx, 0

convert:
    mov dx,ax
    and dx, 0x000f
    call bin_to_ascii
    mov byte [bx], dl
    dec bx
    shr ax, 4
    add cx, 1
    cmp ax, 0
    jne convert
    
jmp print_h

bin_to_ascii:
    cmp dl, 0x0a
    jl to_num
    jmp to_lower

to_num:
    add dl, 48
    ret
to_lower:
    add dl, 87 
    ret

print_h:
    mov bx, HEX_ADDRESS
    call print_string
popa
ret

HEX_ADDRESS:
    db '0x1200'