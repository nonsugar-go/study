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
for m in range(1, 0xffffff):
    c = pow(m, e, n)
    if c == 10:
        break
print(f"{m=}")

phi = (p-1)*(q-1)
d = pow(e, -1, phi)
m2 = pow(c, d, n)
print(f"{m2=}")
```
