# os-dev 项目日志

## 进度

+ **翻译:** 20/77

## 8.13

+ 翻译 Chapter1 Chapter 2 (p1-p10)

+ 配置windows环境
  
  > 别问为啥不在ubuntu上，问就是键盘失灵输不了密码进不去界面
  
  + qemu for windows
  
  + nasm for windos

+ 使用`winhex`编写`boot_sect.bin` 文件进入无限循环模式，使用qemu成功引导

## 8.14

+ 翻译 Chapter3(p11-p20)

+ 编写 `boot_sect.asm`文件，
  
  + 汇编成 `boot_sect.bin`文件，使用qemu引导成功进入无限循环模式
  
  + 加入 `0x10` 中断，在屏幕上输出hello字符
  
  + 使用段标签对自定义字符寻址并输出
