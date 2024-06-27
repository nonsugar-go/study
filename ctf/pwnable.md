# Pwnable
```bash
$ readelf -x .data a.out
$ readelf -x .rodata a.out                    
$ readelf -x .text a.out
$ objdump -d -M intel a.out
```
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
