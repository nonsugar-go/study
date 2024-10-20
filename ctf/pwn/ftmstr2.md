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

