# pwntools の例
```c
// gcc -m32 -o vuln -D_FORTIFY_SOURCE=0 -fno-stack-protector -no-pie -z execstack vuln.c
// gcc -o vuln -D_FORTIFY_SOURCE=0 -fno-stack-protector -no-pie -z execstack vuln.c
#include <stdio.h>

int main(int argc, char *argv[]) {
    char buffer[256];
    printf(argv[1]);
    printf("\n");
    gets(buffer);
    return 0;
}
```
# 解法
```zsh
pwn template ./vuln >a.py
```

TODO:
