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
# Usage
```bash
$ gdb -q chall
pwndbg> cyclic 100
aaaaaaaabaaaaaaacaaaaaaadaaaaaaaeaaaaaaafaaaaaaagaaaaaaahaaaaaaaiaaaaaaajaaaaaaakaaaaaaalaaaaaaamaaa
pwndbg> r
  (snip)
input:aaaaaaaabaaaaaaacaaaaaaadaaaaaaaeaaaaaaafaaaaaaagaaaaaaahaaaaaaaiaaaaaaajaaaaaaakaaaaaaalaaaaaaamaaa
  (snip)
pwndbg> cyclic -l 0x6164616161616161  <-- ret の値を貼り付け
Finding cyclic pattern of 8 bytes: b'aaaaaada' (hex: 0x6161616161616461)
Found at offset 18
```
