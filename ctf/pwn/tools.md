# Tools

```zsh
file ./chall
strings -n 10 ./chall
strings -n 10 -el ./ chall
checksec ./chall
objdump -d -M intel  ./chall
readelf -S ./chall
hexdump -C ./chall
```
