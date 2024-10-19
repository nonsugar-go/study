# ROP
- https://tc.gts3.org/cs6265/tut/tut06-01-rop.html
- https://github.com/pwndbg/pwndbg/blob/dev/FEATURES.md#rop-gadgets
# example
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
```
