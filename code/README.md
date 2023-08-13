## 8.13

1. 安装qemu for windows ，官网下载

2. 在cmd里面使用 `qemu-system-i386.exe` 命令可以打开qemu模拟器并且模拟x86cpu

（别问我为啥不在ubuntu环境下整，问就是键盘失灵了）

3. 使用winhex编写`boot_sect.bin`文件，使用下面的命令运行模拟器
   
   ```shell
   qemu-system-i386.exe ./boot_sect
   ```

---


