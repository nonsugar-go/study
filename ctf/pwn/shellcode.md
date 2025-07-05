# Shell code

- https://shell-storm.org/shellcode/index.html

```Makefile
shellcode.o: shellcode.nasm
        nasm -o $@ $^ -f elf64

shellcode: shellcode.o
        ld -o $@ $^
```

