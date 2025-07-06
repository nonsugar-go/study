# Shellcode Basic

##  参考

- https://shell-storm.org/shellcode
- https://www.exploit-db.com/shellcodes

## 作成手順

1. C 言語で実装
2. strace で C で書かれたプロぐグラムを解析
3. 必要な syscall を確認 (rax)
4. syscall の引数を確認 (rdi   rsi   rdx   r10   r8    r9)
5. アセンブリ コードで実装
6. NULL バイトを避ける
7. ELF バイナリから シェルコードを抽出

```bash
find /usr/include -name 'unistd_64.h'
/usr/include/x86_64-linux-gnu/asm/unistd_64.h
grep exit /usr/include/x86_64-linux-gnu/asm/unistd_64.h
man 2 exit
man syscalls
man syscall
vi exit.nasm
nasm -o exit.o -f elf64 exit.nasm                                   │ indentation
ld -o exit exit.o
objdump -D -M intel exit
gdb -q exit
```
