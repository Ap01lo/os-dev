;
; ebx: the massage address you want to print
;
[bits 32]
VEDEO_MEMORY equ 0xb8000                 ; VGA显存起始地址
WHITE_ON_BLACK equ 0x0f                  ; 白字黑底属性

print_string_pm:
    pusha
    mov edx, VEDEO_MEMORY                ; 将显存入口地址存到edx


print_string_pm_loop:
    mov al, [ebx]                        ; 将字符和属性存到ax
    mov ah, WHITE_ON_BLACK

    cmp al, 0
    je print_string_pm_done              ; 检测是否空字符，若空，则结束

    mov [edx], ax                        ; 将ax 中的字符和属性传到显存位置
    add ebx, 1                           ; ebx指向下一个字符地址
    add edx, 2                           ; edx走到下一个显存字符地址

    jmp print_string_pm_loop

; test:
;     mov ecx, 0x12345678
;     jmp test


print_string_pm_done:
    popa
    ret