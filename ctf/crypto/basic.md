# Crypto - Basic

- https://zenn.dev/anko/articles/ctf-crypto-rsa

## Tools

- https://gchq.github.io/CyberChef/
- https://sagecell.sagemath.org/
- https://factordb.com/

## PyCrypto -> PyCryptodome
```bash
$ sudo apt install python3-pycryptodome
```

```diff
< from Crypto.Util.number import getPrime, isPrime
---
> from Cryptodome.Util.number import getPrime, isPrime
```

- https://stackoverflow.com/questions/58569361/attributeerror-module-time-has-no-attribute-clock-in-python-3-8
