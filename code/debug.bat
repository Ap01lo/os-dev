nasm -f bin -o %1.bin %1.asm
qemu-system-i386.exe -drive format=raw,file=%1.bin -s -S
