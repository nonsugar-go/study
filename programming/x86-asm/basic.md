# x86 アセンブリ言語の基礎
- https://en.wikipedia.org/wiki/X86_assembly_language
- https://en.wikibooks.org/wiki/X86_Assembly/Interfacing_with_Linux
# syscall
```bash
$ locate unistd_32.h
$ grep exit /usr/include/x86_64-linux-gnu/asm/unistd_32.h
$ man 2 exit
$ man syscall
```
# nasm
```bash
$ nasm -f elf32 -o chall.o chall.nasm
$ ld -m elf_i386 -o a.out chall.o
```
