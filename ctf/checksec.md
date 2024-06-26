# checksec
```bash
$ gcc chall.c
$ checksec ./a.out
[*] '.../a.out'
    Arch:     amd64-64-little
    RELRO:    Full RELRO
    Stack:    No canary found
    NX:       NX enabled
    PIE:      PIE enabled
```
