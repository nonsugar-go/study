# Pwnable

```bash
$ readelf -x .data a.out
$ readelf -x .rodata a.out                    
$ readelf -x .text a.out
$ objdump -d -M intel a.out
```

## ELF format

| ELF               | command                 |
| ----------------- | ----------------------- |
| Executable Header | readelf -h ./a.out      |
| Program Headers   | readelf --wide -l a.out |
| Sections          | readelf --wide -S a.out |
| Section Headers   |         |

# Memory Layout
## Binary File
| Section | Desc       |
| ------- | ---------- |
| .data   | 10         |
| .rodata | "Hello"    |
| .text   | code       |

## Process

| Section |
| ------- |
| .text   |
| .bas    |
| .rodata |
| .data   |
| Heap    |
| Unused  |
| Stack   |

## Stack

| Stack     |
| --------- |
| var1      |
| ...       |
| saved EBP |
| ret addr  |
| argc      |
| **argv    |

## シンボルテーブルの確認

```bash
$ objdump --wide -t a.out
```

## セクション ヘッダの確認

```bash
$ readelf --wide -S helloworld
```

- [.got](https://en.wikipedia.org/wiki/Global_Offset_Table)
- .plt (Procedure Linkage Tables)

## BOF

| 危険な関数 | 代替の関数 |
|-----------|-----------|
| getpw     | getpwuid  |
| gets      | fgets     |
| sprintf   | snprintf  |
| strcat    | strncap   |
| strcpy    | strncpy   |
| vsprintf  | vsnprintf |
