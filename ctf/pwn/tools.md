# Tools

```zsh
#!/bin/bash
T="${1:-chall}"
file $T
strings -n 10 $T | sort -u >strings.output
strings -n 10 -el $T | sort -u >>strings.output
checksec $T 2>checksec.output
objdump -d -M intel $T >objdump.output
readelf -SW $T >sections.output
readelf -s $T >syms.output
hexdump -C $T >hexdump.output
pwn template $T >solver.py
```

```zsh
ltrace $T
```
