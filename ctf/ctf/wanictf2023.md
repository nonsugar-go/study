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

- https://github.com/wani-hackase/wanictf2023-writeup/tree/main/

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
