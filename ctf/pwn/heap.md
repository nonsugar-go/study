# Heap Exploitation

- https://github.com/shellphish/how2heap
- https://zenn.dev/anko/articles/ctf-heap-exploits

## Layout

### Chunk layout

```
*********** 解放済(空き) *************              ********** 確保済(利用中) ************

|.................||SIZE__________AM1| chunk ----->|prev_size........||SIZE__________AMP| ---
|fd_______________||bk_______________|   mem ----->|data_____________||data_____________|  |
|fd_nextsize______||bk_nextsize______|             |data_____________||data_____________| size
|_________________||_________________|             |data_____________||data_____________|  |
|_________________||_________________|             |data_____________||data_____________| ---

|(prev_size)______||(size)..........0|             |data_____________||(size)..........1|
|.................||.................|             |.................||.................|
|.................||.................|             |.................||.................|
|.................||.................|             |.................||.................|
|.................||.................|             |.................||.................|

|<----------- 0x10 byte ------------>|             |<----------- 0x10 byte ------------>|
```

- size == next->prev_size: >= 0x20, 16 (0x10) バイト アラインメント
- P: PREV_INUSE ... prev chunk が利用中にセット。解法されても prev chunk が bins で管理されていない場合はセット。解法済みの chunk は連続して存在しないため、空きチャンクの PREV_INUSE は必ずセット。
- M: IS_MMAPPED ... ヒープ領域でなく、mmap() によって確保された領域上にある場合にセット。
- A: NON_MAIN_ARENA ... main_arena でない別のアリーナで管理されている場合にセット。

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

### Tcache (thread cache) Layout

```
|<----------- 0x10 byte ------------>|
                                           (凡例)
|c[0]|c[1|c[2]|c[3||c[4]|c[5|c[6]|c[7|     c[0] ... counts[0]
|c[8]|c[9|c[10|c11||c[12|c13|c[14|c15|     c[1] ... counts[1]
|c[16|c17|c[18|c19||c[20|c21|c[22|c23|     c[n] ... counts[n]
|c[24|c25|c[26|c27||c[28|c29|c[30|c31|
|c[32|c33|c[34|c35||c[36|c37|c[38|c39|     |<-- 0x8 byte --->|     |<-- 0x8 byte --->|
|c[40|c41|c[42|c43||c[44|c45|c[46|c47|
|c[48|c49|c[50|c51||c[52|c53|c[54|c55|     |prev_size________|     |prev_size________| 
|c[56|c57|c[58|c59||c[60|c61|c[62|c63|     |size (=0x30)__AMP|     |size (=0x30)__AMP|
|0x20 (entries[0])||0x30 (entries[1])| --> |next_____________| --> |next (=NULL)_____|
|0x40 (entries[2])||0x50 (entries[3])|     |key______________|     |key______________|
|0x60 (entries[4])||0x70 (entries[5])|     |~~~~~~~~~~~~~~~~~|     |~~~~~~~~~~~~~~~~~|     
|0x80 (entries[6])||0x90 (entries[7])|
|0xa0 (entries[8])||0xb0 (entries[9])|     tcache では bins と違いチャンクの先頭から x010
|0xc0(entries[10])||0xd0(entries[11])|     オフセットした位置を指してるので注意
|0xe0(entries[11])||0xf0(entries[12])|
|0x100(entries[13]||0x110(entries[14]|     tcache で管理されるチャンクの next chunk の
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|     PREV_INUSE はセットされたまま
|0x330(entries[60]||0x3f0(entries[61]|
|0x400(entries[62]||0x410(entries[63]|
```

- GLIBC versions >= 2.26
- TCACHE_MAX_BINS = 64 と定義されているので、counts および entries は共に 64 個の要素を持つ配列

### 解法されたチャックの管理機構

```
 | 0x20 - 0x80 | 0x90 - 0x3f0 | 0x400 | 0x410 | 0x420 - |
-+-------------+--------------+-------+-------+---------+
 |<--------------- tcache ------------------->|         |
 |<- fastbin ->|              |       |       |         |
 |<----------------------- unsortedbin ---------------->|
 |<------- smallbin --------->|       |       |         |
 |                            |<------- largebin ------>|
```

## GLIBC functions

### malloc functions

- void* malloc (size_t bytes)
- void* calloc (size_t n, size_t elem_size)
- void* realloc (void* oldmem, size_t bytes)
- void free (void* mem)

### malloc hooks 

- void *(*volatile __malloc_hook)(size_t size, const void *caller);
- void *(*volatile __realloc_hook)(void *ptr, size_t size, const void *caller);
- void *(*volatile __memalign_hook)(size_t alignment, size_t size, const void *caller);
- void (*volatile __free_hook)(void *ptr, const void *caller);
- void (*__malloc_initialize_hook)(void);
- void (*volatile __after_morecore_hook)(void);

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
pwndbg> dq &main_arena 20
00007ffff7dd0b60     0000000000000000 0000000000000001
00007ffff7dd0b70     0000000000602020 0000000000000000
00007ffff7dd0b80     0000000000000000 0000000000000000
00007ffff7dd0b90     0000000000000000 0000000000000000
00007ffff7dd0ba0     0000000000000000 0000000000000000
00007ffff7dd0bb0     0000000000000000 0000000000000000
00007ffff7dd0bc0     0000000000602060 0000000000000000
00007ffff7dd0bd0     00007ffff7dd0bc0 00007ffff7dd0bc0
00007ffff7dd0be0     00007ffff7dd0bd0 00007ffff7dd0bd0
00007ffff7dd0bf0     00007ffff7dd0be0 00007ffff7dd0be0
ppwndbg> fastbins
fastbins
0x20: 0x602020 —▸ 0x602000 ◂— 0
pwndbg> top-chunk
Top chunk | PREV_INUSE
Addr: 0x602060
Size: 0x20fa0 (with flag bits: 0x20fa1)
```

```
pwndbg> find-fake-fast &__malloc_hook
Searching for fastbin size fields up to 0x80, starting at 0x7ffff7dd0ad8 resulting in an overlap of 0x7ffff7dd0b50
FAKE CHUNKS
Fake chunk | PREV_INUSE | IS_MMAPED | NON_MAIN_ARENA
Addr: 0x7ffff7dd0b2d
prev_size: 0xfff7dccee0000000
size: 0x78 (with flag bits: 0x7f)
fd: 0xfff7a9fa10000000
bk: 0xfff7a9fed000007f
fd_nextsize: 0x7f
bk_nextsize: 0x00
pwndbg> p/x (void*)&__malloc_hook - 0x7ffff7dd0b2d
$13 = 0x23
pwndbg> dq (void*)&__malloc_hook-0x23
00007ffff7dd0b2d     fff7dccee0000000 000000000000007f
00007ffff7dd0b3d     fff7a9fa10000000 fff7a9fed000007f
00007ffff7dd0b4d     000000000000007f 0000000000000000
00007ffff7dd0b5d     0000000000000000 0000000001000000
```

```
gdb -q ./a.out
pwndbg> set context-sections code
pwndbg> b main
pwndbg> r
pwndbg> dq a-16
pwndbg> dq &main_arena 20
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
pwndbg> find-fake-fast &__malloc_hook
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
- https://kyuri.hatenablog.jp/entry/2017/03/31/194025

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
