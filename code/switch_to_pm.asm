[bits 16]
; 转换成保护模式

switch_to_pm:
; 我们必须停用所有中断，知道我们设置好了保护模式下的 
; 中断向量，否则中断会造成破坏

cli

; 加载 GDT ，里面定义了保护模式的段
lgdt [gdt_descriptor]

; 转换模式，需要将cr0寄存器的第一位置1
mov eax, cr0
or eax, 0x1
mov cr0, eax

; 跳转来刷新流水线
jmp CODE_SEG:init_pm


[bits 32]
; 32-bit 下的程序
; 初始化保护模式下寄存器和栈
init_pm:
; 寄存器
mov ax, DATA_SEG
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax

; 栈
mov ebp, 0x90000
mov esp, ebp

call BEGIN_PM
