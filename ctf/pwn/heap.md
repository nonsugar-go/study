# Heap Exploitation

- https://github.com/shellphish/how2heap
- https://zenn.dev/anko/articles/ctf-heap-exploits

## Layout

### Chunk layout 

```
 malloc ptr --> |________|size____|
 program ptr -> |userdata_________|
                |userdata_________|
```

### Chunk layout (detail)

- size == next->prev_size: >= 0x20, n * 0x10
- P: PREV_INUSE
- M: IS_MMAPPED
- A: NON_MAIN_ARENA

```
|解放済(空き)            |   |確保済 (利用中)         |
|-----------|-----------|   |-----------|-----------| ---
|___________|SIZE____AM1|   |prev_size__|SIZE____AMP|  |
|fd_________|bk_________|   |data_______|data_______|  |
|fd_nextsize|bk_nextsize|   |data_______|data_______|  |
|___________|___________|   |data_______|data_______| size
|___________|___________|   |data_______|data_______|  |
|-----------|-----------|   |-----------|-----------| ---
|(prev_size)|(size)     |   |data_______|(size)____1|
|<------0x10 byte------>|   |<------0x10 byte------>|
```

### Arena Layout

```
|<------------0x10 byte ------------>|
|________|________||________|________|
|mutex___|flags___||havefastchunks|__|
|0x20_____________||0x30_____________|
|0x40_____________||0x50_____________|
|0x60_____________||0x70_____________|
|0x80_____________||0x90_____________|
|0xa0_____________||0xb0_____________|
|top______________||last_remainder___|
|unsortedbin fd___||unsorredbin bk___|
|0x20 fd__________||0x20 bk__________|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|0x80000 fd_______||0x80000 bk_______|
|________|________||________|________|
|binmap[0|binmap[1||binmap[2|binmap[3|
|next_____________|next_free_________|
|attached_threads_|system_mem________|
|max_system_mem___|__________________|
```

## GLIBC functions

### malloc functions

- void* malloc (size_t bytes)
- void* calloc (size_t n, size_t elem_size)
- void* realloc (void* oldmem, size_t bytes)
- void free (void* mem)

### malloc hooks 

- __after_morecore_hook 
- __free_hook 
- __malloc_hook 
- __malloc_initialize_hook 
- __memalign_hook 
- __realloc_hook 

## tools

### gdb + pwndbg

```c
char* a = malloc(0x1);
memset(a, 'a', 0x1);
```

```
pwndbg> vis```
 (snip)
0x555555559290  0x0000000000000000      0x0000000000000021      ........!.......
0x5555555592a0  0x0000000000000061      0x0000000000000000      a...............
0x5555555592b0  0x0000000000000000      0x0000000000000411      ................
 (snip)
```

```
gdb -q ./a.out
pwndbg> set context-sections code
pwndbg> b main
pwndbg> r
pwndbg> dq a-16
pwndbg> vmmap
pwndbg> vis
pwndbg> heap [heap address]
pwndbg> top-chunk [arena address]
pwndbg> malloc-chunk [chunk address]
pwndbg> vis-heap-chunks [count] [heap address]
pwndbg> tcache [tcache address]
ppwndbg> mp
pwndbg> arenas [arena address]
pwndbg> bins [arena address] [tcache address] 
pwndbg> fastbins [arena address]
pwndbg> smallbins [arena address]
pwndbg> largebins [arena address]
pwndbg> unsortedbin [arena address]
pwndbg> tcachebins [tcache address]
```

### pwntools

```python
elf.sym.main
libc.sym.system
p64(libc.sym.main_arena)
p32(0xdeadbeef)
p8(0)
u64(“\xef\xbe\xad\xde\xff\x7f\x00\x00)
```

```zsh
./solver.py GDB
./solver.py GDB NOASLR
./solver.py DEBUG
./solver.py
```

### one_gadget

```zsh
one_gadget $(ldd <target program> | grep libc.so | cut -d’ ’ -f3)
```

## 攻撃手法

### House of Force

- https://github.com/shellphish/how2heap/blob/master/glibc_2.27/house_of_force.c
- https://hacktricks.wiki/ja/binary-exploitation/libc-heap/house-of-force.html

#### 前提条件
  - GLIBC versions < 2.29
  - Top Chunk のサイズ制御: ヒープの末尾にある Top Chunk のサイズ（size field）を、非常に大きな値（例: -1 や 0xffffffffffffffff）に書き換えられること。
  - malloc() の呼び出し制御: 攻撃者が任意のサイズで malloc() を複数回呼び出せること。

### Fastbin Dup

- https://zenn.dev/anko/articles/ctf-heap-exploits#fastbins

#### 前提条件

- Fastbin のサイズカテゴリに属するチャンクであること
- 二重解放（Double Free）の脆弱性、または不正な書き換えができる脆弱性があること
- 近年の glibc（glibc 2.27以降など）における保護機構の回避

### Unsafe Unlink

### Safe Unlink

### Unsortedbin Attack

### House of Orange

### House of Spirit

### House of Lore

### House of Einherjar

### House of Rabbit

### Poison Null Byte

### House of Corrosion

### Tcache Dup
