# Heap Exploitation

- https://github.com/shellphish/how2heap
- https://zenn.dev/anko/articles/ctf-heap-exploits

## Layout

### Chunk layout 

```
 chunk ptr ---> |________|size____|
 mem ptr -----> |userdata_________|
                |userdata_________|

                |<-- 0x10 byte -->|
```

### Chunk layout (detail)

- size == next->prev_size: >= 0x20, 16 (0x10) バイト アラインメント
- P: PREV_INUSE ... prev chunk が利用中にセット。解法されても prev chunk が bins で管理されていない場合はセット。解法済みの chunk は連続して存在しないため、空きチャンクの PREV_INUSE は必ずセット。
- M: IS_MMAPPED ... ヒープ領域でなく、mmap() によって確保された領域上にある場合にセット。
- A: NON_MAIN_ARENA ... main_arena でない別のアリーナで管理されている場合にセット。

```
|解放済(空き)            |     |確保済 (利用中)         |

|___________|SIZE____AM1|     |prev_size__|SIZE____AMP| ---
|fd_________|bk_________|     |data_______|data_______|  |
|fd_nextsize|bk_nextsize|     |data_______|data_______| size
|___________|___________|     |data_______|data_______|  |
|___________|___________|     |data_______|data_______| ---

|(prev_size)|(size)     |     |data_______|(size)____1|
|~~~~~~~~~~~|~~~~~~~~~~~|     |~~~~~~~~~~~|~~~~~~~~~~~|

|<----- 0x10 byte ----->|     |<----- 0x10 byte ----->|
```

### Arena Layout

```
|<----------- 0x10 byte ------------>|
|0x4 byte|0x4 byte||0x4 byte|0x4 byte|
                                           |<-- 0x8 byte --->|     |<-- 0x8 byte --->|
|mutex___|flags___||havefastchunks|__|       
|0x20(fastbinY[0])||0x30(fastbinY[1])| --> |prev_size________|
|0x40(fastbinY[2])||0x50(fastbinY[3])|     |size (=0x30)__AMP|
|0x60(fastbinY[4])||0x70(fastbinY[5])|     |fd_______________| --> |prev_size________|
|0x80(fastbinY[6])||0x90(fastbinY[7])|     |~~~~~~~~~~~~~~~~~|     |size (=0x30)__AMP|
|0xa0(fastbinY[8])||0xb0(fastbinY[9])|                             |fd (=NULL)_______|
|top______________||last_remainder___|                             |~~~~~~~~~~~~~~~~~|
|unsortedbin fd___||unsorredbin bk___|     fastbin で管理されるチャンクの next chunk の
|0x20 fd__________||0x20 bk__________|     PREV_INUSE はセットされたまま
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|0x80000 fd_______||0x80000 bk_______|
|________|________||________|________|
|binmap[0|binmap[1||binmap[2|binmap[3|
|next_____________|next_free_________|
|attached_threads_|system_mem________|
|max_system_mem___|__________________|
```

- fastbinsY: fastbin をサイズ別に管理する単方向の線形リストの配列
- top: メモリプールの未使用領域の先頭を指す。以降の領域には、使用中解法済み問わずチャンクは存在しない。
- last_reminder: 既存の解法済みチャンクを分割した際、利用されなかった残りのチャンクの1つを保持
- bins: unsortedbin, smallbin, largebin を管理する双方向の循環リストの配列
- binmap: チャンクがつながっている bins のインデックスに対応するフラグが立つマップ
- system_mem: システムから確保したメモリプールの総量

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

```
pwndbg> vis
0x602000        0x0000000000000000      0x0000000000000021      ........!.......         <-- fastbins[0x20][1]
0x602010        0x0000000000000000      0x0000000000000000      ................
0x602020        0x0000000000000000      0x0000000000000021      ........!.......         <-- fastbins[0x20][0]
0x602030        0x0000000000602000      0x0000000000000000      . `.............
0x602040        0x0000000000000000      0x0000000000000021      ........!.......
0x602050        0x0000000000000000      0x0000000000000000      ................
0x602060        0x0000000000000000      0x0000000000020fa1      ................         <-- Top chunk
pwndbg> arenas
  arena type    arena address    heap address    map start    map end    perm    size    offset    file
------------  ---------------  --------------  -----------  ---------  ------  ------  --------  ------
  main_arena   0x7ffff7dd0b60        0x602000     0x602000   0x623000    rw-p   21000         0  [heap]
pwndbg> dq &main_arena
00007ffff7dd0b60     0000000000000000 0000000000000001
00007ffff7dd0b70     0000000000602020 0000000000000000
00007ffff7dd0b80     0000000000000000 0000000000000000
00007ffff7dd0b90     0000000000000000 0000000000000000
pwndbg> fastbins
fastbins
0x20: 0x602020 —▸ 0x602000 ◂— 0
```

```
gdb -q ./a.out
pwndbg> set context-sections code
pwndbg> b main
pwndbg> r
pwndbg> dq a-16
pwndbg> dq &main_arena
pwndbg> vmmap
pwndbg> vis
pwndbg> heap [heap address]
pwndbg> top-chunk [arena address]
pwndbg> malloc-chunk [chunk address]
pwndbg> vis-heap-chunks [count] [heap address]
pwndbg> tcache [tcache address]
pwndbg> mp  # mp_ struct's contents
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
