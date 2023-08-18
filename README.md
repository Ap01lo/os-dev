# os-dev 项目日志

## 进度

+ **翻译:** 33/77
+ TODO
	- [ ] 将日志文档变成英文
	- [ ] 解决磁盘读取bug
	- [ ] 解决debug文件输出问题

---

---

## 8.18

+ 翻译 Chapter 3 Done(p31-p34)
+ 更新主要代码
	+ 增加对磁盘的读写函数 disk_print
	+ 增加update.asm文件实现对寄存器内容的输出调试

> **BUG：**
>
> + 磁盘加载的函数还有问题，无法成功调用中断，使用gdb单步调试太麻烦
> + 在dubug文件里写了寄存器输出函数但是目前输出的值与预期不符

## 8.17

+ 翻译 Chapter 3(p28-p30)
+ 更新 `boot_sect.asm`
	+ 增加十六进制数转换成对应ascii码
	+ 增加对特定内存数据的修改写入
	+ 增加print_hex可以直接将16进制地址打印出来

## 8.16

+ 研究GDB
	+ 使用GBD连接qemu调试

## 8.15

+ 翻译 Chapter3(p21-p27)

+ 更新 `boot_sect_asm` 文件

	+ 增加了栈的使用
	+ 增加了函数调用
	+ 增加了对外部文件的调用

## 8.14

+ 翻译 Chapter3(p11-p20)

+ 编写 `boot_sect.asm`文件，

	+ 汇编成 `boot_sect.bin`文件，使用qemu引导成功进入无限循环模式

	+ 加入 `0x10` 中断，在屏幕上输出hello字符

	+ 使用段标签对自定义字符寻址并输出

## 8.13

+ 翻译 Chapter1 Chapter 2 (p1-p10)

+ 配置windows环境
  
  > 别问为啥不在ubuntu上，问就是键盘失灵输不了密码进不去界面
  
  + qemu for windows
  
  + nasm for windos

+ 使用`winhex`编写`boot_sect.bin` 文件进入无限循环模式，使用qemu成功引导





