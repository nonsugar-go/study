# Volatility

- [メモリフォレンジックCTF「MemLabs」Lab1のWriteUp: NECセキュリティブログ | NEC](https://jpn.nec.com/cybersecurity/blog/200131/index.html)
- [CTFのフォレンジックにおけるメモリフォレンジックまとめ [Volatility 3, Volatility 2] - はまやんはまやんはまやん](https://blog.hamayanhamayan.com/entry/2022/12/14/231806)
- https://github.com/volatilityfoundation/volatility/wiki/Command-Reference

# Install

- https://github.com/volatilityfoundation/volatility/wiki/Installation

```zsh
pip3 install -U volatility
```

# Usage

- https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#filescan
- https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#dumpfiles

```zsh
vol -f memdump.mem windows.info
vol -f memdump.mem windows.pstree
vol -f memdump.mem windows.cmdscan
vol -f memdump.mem windows.consoles
vol -f memdump.mem windows.cmdline
vol -f memdump.mem windows.filescan
vol -f memdump.mem windows.netstat
vol -f memdump.mem windows.netscan
vol -f memdump.mem windows.dumpfiles --pid PID
```
