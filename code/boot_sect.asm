; 一个进入32-bit保护模式的引导程序
org 0x7c00

; 设置栈
mov bp, 0x9000
mov sp, bp

mov bx, MSG_REAL_MODE
call print_string

; 转换到32-bit保护模式,而且永远不再回来了
call switch_to_pm

jmp $

%include "print_string.asm"
%include "gdt.asm"
%include "print_string_pm.asm"
%include "switch_to_pm.asm"

; 我们转换模式后跳转到这里，并做一些初始化工作

BEGIN_PM:
[bits 32]

; mov ah, 0x0e
; mov al, 'p'
; int 0x10

mov ebx, MSG_PROT_MODE
; 调用32-bit的输出程序
call print_string_pm

a:
mov eax,0xaaaaaaaa
mov ebx,0xbbbbbbbb
mov ecx,0xcccccccc
mov edx,0xdddddddd
jmp a		; 一致挂载
	
; 全局变量
MSG_REAL_MODE db "Started in 16-bit Real Mode",0x0a,0x0d,0
MSG_PROT_MODE db "Successfully landed in 32 Protected Mode"0x0a,0x0d,0

times 510-($-$$) db 0
dw 0xaa55