# Heap
# glibc
```bash
$(ldd /bin/ls|grep libc.so|cut -d' ' -f3)
```
# pwndbg
```
$ gdb -q ./a.out
pwndbg> set context-sections code
pwndbg> b main
pwndbg> r
pwndbg> vmmap
pwndbg> n
pwndbg> vis
pwndbg> context
```
