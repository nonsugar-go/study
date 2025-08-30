# Tools

```zsh
T=./chall
file $T
strings -n 10 $T|sort -u
strings -n 10 -el $T|sort -u
checksec $T
objdump -d -M intel $T >objdump.output
readelf -SW $T >sections.output
readelf -s $T >syms.output
hexdump -C $T >hexdump.output
```

```zsh
ltrace $T
```
