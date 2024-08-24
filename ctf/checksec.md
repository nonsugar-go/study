# checksec
```bash
$ gcc chall.c
$ checksec ./a.out
[*] '.../a.out'
    Arch:     amd64-64-little
    RELRO:    Full RELRO
    Stack:    No canary found
    NX:       NX enabled
    PIE:      PIE enabled
```
# gcc オプション
```bash
gcc -m32 -fno-stack-protector -D_FORTIFY_SOURCE=0       -z execstack -no-pie -Wl,-z,norelro -o chall chall.c
```

| checksec | gcc option	| desc |
| -------- | ---------- | -----|
| -	       | -m32       | 32bit (int, long, ポインターは 32bit) |
| -        | -m64       | 64bit (int は 32bit, long とポインターは 64bit) |
| CANARY   | -fno-stack-protector | スタックオーバーフローに対する防御 (Stack Smashing Protection、カナリア) の無効化 |
| FORTIFY  | -D_FORTIFY_SOURCE=0 | ソースコードのセキュリティチェックの無効化 |
| NX       | -z execstack | NX bit(No eXecute bit)、DEP(Data Execution Prevention) を無効化する。実行ファイルや共有ライブラリに実行可能なスタックを必要とすることをマーク。|
| PIE      | -no-pie    | PIE(Position Independent Executable)、実行ファイルを位置独立コード（PIC）として生成しないことを指定|
| RELRO    | -Wl,-z,norelro | RELRO(RELocation Read Only) を無効化。No RELROとPartial RELROの場合、GOT Overwrite攻撃が使える。|
# ASLR(Address Space Layout Randomize)
```bash
$ cat /proc/<pid>/maps                       ## メモリのアドレスを確認できる (ASLR 有効だと毎回変化する)
$ sudo sysctl kernel.randomize_va_space=0    ## 無効化
$ sudo sysctl kernel.randomize_va_space=2    ## 有効化
## もしくは以下のようにする
$ cat /proc/sys/kernel/randomize_va_space    ## 確認
2
$ sudo bash -c 'echo 0 >/proc/sys/kernel/randomize_va_space'    ## 無効化
```
# スタック配置 (SSP 有効時)
| stack |
| ----- |
| local variables |
| canary |
| saved rbp |
| ret addr |
| arg 1 |
| ... |
