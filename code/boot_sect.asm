org 0x7c00

mov [BOOT_DRIVE], dl
; 将栈区设置远离代码区
mov bp, 0x8000
mov sp, bp

; 读取磁盘数据至 [0x0000:0x9000]
mov bx, 0x9000
mov dh, 0x02
mov dl, [BOOT_DRIVE]
; call print_regs
call disk_load

; 查看读取结果 使用print_hex查看内容
mov dx, [0x9000]
call print_hex

mov dx, [0x9000+512]
call print_hex

jmp $

BOOT_DRIVE:
    db 0x00

%include "print_hex.asm"
%include "print_string.asm"
%include "disk_load.asm"
%include "debug.asm"

times 510-($-$$) db 0
dw 0xaa55

; set following 2 sectors
times 256 dw 0xdada                 ; sector2
times 256 dw 0xface                 ; sector3

