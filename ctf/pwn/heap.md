# Heap Exploitation

- https://github.com/shellphish/how2heap
- https://zenn.dev/anko/articles/ctf-heap-exploits

## ヒープチャンク

- size == next->prev_size
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

## gdb

```
gdb -q ./a.out
pwndbg> set context-sections code
pwndbg> b main
pwndbg> r
pwndbg> vmmap
pwndbg> heap
pwndbg> vis
```

## Malloc Hooks 

- __after_morecore_hook 
- __free_hook 
- __malloc_hook 
- __malloc_initialize_hook 
- __memalign_hook 
- __realloc_hook 

## 攻撃手法

### House of Force

- 前提条件（脆弱性の要件）
  - GLIBC versions < 2.29
  - Top Chunk のサイズ制御: ヒープの末尾にある Top Chunk のサイズ（size field）を、非常に大きな値（例: -1 や 0xffffffffffffffff）に書き換えられること。
  - malloc() の呼び出し制御: 攻撃者が任意のサイズで malloc() を複数回呼び出せること。
