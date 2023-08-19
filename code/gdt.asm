; GDT
gdt_start:

gdt_null:	; gdt 开始的空段描述符，8 bytes
dd 0x0		; 应该也能用 times 8 db 0x00
dd 0x0

gdt_code:	; gdt code 段描述符
; base = 0x0, limit = 0xfffff
; 1st flags: (present)1 (privilege)00 (type)1 -> 1001b
; type flags: (code)1 (conform)0 (accessed)0 --> 1010b
; 2nd flags: (granularity)1 (32-bit default)1 (64-bit seg)0 (AVL)0 -->1100b

dw 0xffff	; limit (bits 0-15)
dw 0x0		; Base (bits 0-15)
db 0x0		; Base (bits 16-23)
db 10011010b; 1st flags, type flags
db 11001111b; 2nd flags, Limit (bits 16-19)
db 0x0 		; Base(bits 24-31)

gdt_data:	; gdt data段描述符
; 与code段一致，除了type flags
; type flags:(code)0 (expand down)0 (writable)1 (accessed)0 --> 0010b

dw 0xffff	; limit (bits 0-15)
dw 0x0		; Base (bits 0-15)
db 0x0		; Base (bits 16-23)
db 10010010b; 1st flags, type flags
db 11001111b; 2nd flags, Limit (bits 16-19)
db 0x0 		; Base(bits 24-31)
gdt_end:

gdt_descriptor:
	; gdt 的大小，一般比实际少1
	dw gdt_end - gdt_start - 1
	
	; gdt 的开始地址
	dd gdt_start
	
; 定义一些常用的gdt段描述符的偏移地址
; 这些在保护模式中的段偏移量中时必须包含的
; 比如，当我们设置 DS= 0x10时，cpu就会知道
; 我们要使用偏移为0x10的段了，因为在我们的gdt中
; 0x10就是数据段
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start