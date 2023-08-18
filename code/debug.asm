;
; 因为引导程序无法编译成可执行文件，所以使用gsb的单步调试很麻烦
; 故使用汇编写一个调试代码，用来打印各种状态下的寄存器信息
;

print_regs:
    pusha
    call print_ax
    call print_bx
    call print_cx
    call print_dx
    popa
    ret

print_ax:   
    push ax
    mov bx, ax_msg
    call print_string

    mov dx, ax
    call print_hex

    mov bx, change_line
    call print_string

    pop ax
    ret


print_bx:   
    push bx

    mov ax, bx,
    mov bx, bx_msg
    call print_string

    mov dx, ax
    call print_hex

    mov bx, change_line
    call print_string

    pop bx
    ret

print_cx:   
    push cx
    mov bx, cx_msg
    call print_string

    mov dx, cx
    call print_hex

    mov bx, change_line
    call print_string

    pop cx
    ret

print_dx:   
    push dx
    mov bx, dx_msg
    call print_string

    mov dx, dx
    call print_hex

    mov bx, change_line
    call print_string

    pop dx
    ret
ax_msg:
    db "ax = ",0
bx_msg:
    db "bx = ",0
cx_msg:
    db "cx = ",0
dx_msg:
    db "dx = ",0
change_line:
    dw 0x0a0d,0