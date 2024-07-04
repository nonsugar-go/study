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
