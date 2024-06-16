# pwndbg
- https://github.com/pwndbg/pwndbg
- https://qiita.com/0108mitaka/items/4e601fd4cb9837bba5f6
- https://shirataki64225.hatenablog.com/entry/2021/12/15/000141

# Install
```bash
$ git clone https://github.com/pwndbg/pwndbg
$ cd pwndbg
$ ./setup.sh
```

```bash
$ gdb ./a.out
  (snip)
FileNotFoundError: [Errno 2] No such file or directory: 'poetry'
  (snip)

## 上記エラーが出たので、-poetry をインストールする
$ sudo apt install python3-poetry
