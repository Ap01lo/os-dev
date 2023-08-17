# GDB Debugger

## What is GDB 

程序的调试工具，支持跨平台，多种语言

## Instructions

+ `run、r` ：Run the prog.
+ `break、b` : Add break point
  + `b main`: Add break point at main function entry.
  
  + `b 9` : Add break point at line 9 in prog.
+ `list` : Check the prog.
+ `next、n` : Run the prog to the next break point.
+ `quit`：Exit GDB
+ `info b` : Check status of break points.

## Remote Debugging

1. Use `target remote localhost:1234` to connect to the qemu emulator.

2. Use `si` to run the program step by step.

3. Use `info registers` to check the status of all the registers.

4. Use `x <address> `to check the value in <address>.

5. Use `break` or `b` to add break point for debugging.

6. Use `display <address>` to dynamically monitor the value in <address> when using `si`

7.  We can also use `define` function to modify our own instructions as follows:

	```gdb
	define disp_reg
	printf "ax = 0x%04x",$ax
	end
	```

	The code above shows the syntax  of `define` function. And we can see that, c syntax is also supported here.

8. Use `run` or `r` to run the program. But it's not for remote debugger.

9. Use `x/i` to check info about instruction. 

10. `x/i $eip-1` to check the address of last instruction.

	




