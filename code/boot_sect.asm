org 0x7c00

mov dx, 0x1f2d
mov bx, HEX
call print_hex

jmp $

%include "print_string.asm"
%include "print_hex.asm"

HEX:
dw "0x0000",0

times 510-($-$$) db 0
dw 0xaa55