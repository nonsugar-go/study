# Pwnable
```bash
$ readelf -x .data a.out
$ readelf -x .rodata a.out                    
$ readelf -x .text a.out
$ objdump -d -M intel a.out
```
# Memory Layout
## Binary File
| .data   | 10         |
| .rodata | "Hello"    |
| .text   | code       |
## Process
| .text   |
| .bas    |
| .rodata |
| .data   |
| Heap    |
| Unused  |
| Stack   |
