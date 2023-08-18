; 加载硬盘数据函数
; disk_load函数参数：
;   bx: 数据读取后加载的内存位置
;   dh: 区块的数量
;   dl: 读取的磁盘号
; 
; int 0x13号中断要求的参数：
;   ah: 0x02 中断功能号
;   al: 读取块数
;   ch: 磁道号 从0开始
;   dh：磁头 从0开始
;   cl: 第几块 从1开始

disk_load:
    push dx                 ; 将dx数据压栈，后面需要用来与al的值比较
    mov ah, 0x02            ; 设置BIOS的功能号

    mov al, dh              ; 将想要读取的区块数量存到al中
    mov ch, 0x00            ; 第0个磁道
    mov dh, 0x00            ; 磁头
    mov cl, 0x02            ; 第二块
    int 0x13                ; 执行中断命令读取磁盘数据

    jc DISK_ERROR           ; 当标志寄存器cf置位时，说明没有成功加载，跳到报错
    
    cmp al, dh
    jne DISK_ERROR          ; 当al的数量和之前传入的dh不一致时，说明读取出错了。
    ret

DISK_ERROR:
    mov bx, DISK_ERROR_MSG
    call print_string

DISK_ERROR_MSG:
    db "Disk read error!",0
