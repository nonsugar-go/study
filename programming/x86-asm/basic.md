# nasm
- https://www.nasm.us/doc/nasmdo10.html
# x86 アセンブリ言語の基礎
- https://en.wikipedia.org/wiki/X86_assembly_language
- https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux
- [呼出規約 - Wikipedia](https://ja.wikipedia.org/wiki/%E5%91%BC%E5%87%BA%E8%A6%8F%E7%B4%84#cdecl)
# syscall
```bash
$ locate unistd_32.h
$ grep exit /usr/include/x86_64-linux-gnu/asm/unistd_32.h
$ man 2 exit
$ man syscall
```
# nasm
```asm
; $ nasm -f elf32 shell.nasm && ld -m elf_i386 shell.o
; $ readelf -x .text a.out | grep -Eow '[0-9a-f]{2,8}' | tr -d '\n'
global  _start
_start:
        xor eax, eax
        xor ecx, ecx
        xor edx, edx
        mov al, 0xb
        push ecx ; "\0\0\0\0"
        push 0x68732f6e ; "n/sh"
        push 0x69622f2f ; "//bi"
        mov ebx, esp
        int 0x80
```

