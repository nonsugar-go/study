# crypto

## basic_rsa

- https://github.com/wani-hackase/wanictf2020-writeup/tree/master/crypto/basic_rsa

# Writeup

```zsh
docker build -t basic_rsa .
docker run -itd --rm --name basic_rsa -p 50000:50000 basic_rsa
```

```zsh
docker stop basic_rsa
docker rmi basic_rsa
```

```ptyhon
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
