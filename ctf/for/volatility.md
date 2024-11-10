# Volatility
- [メモリフォレンジックCTF「MemLabs」Lab1のWriteUp: NECセキュリティブログ | NEC](https://jpn.nec.com/cybersecurity/blog/200131/index.html)
- [CTFのフォレンジックにおけるメモリフォレンジックまとめ [Volatility 3, Volatility 2] - はまやんはまやんはまやん](https://blog.hamayanhamayan.com/entry/2022/12/14/231806)
- https://github.com/volatilityfoundation/volatility/wiki/Command-Reference
# Usage
```zsh
~/volatility3/vol.py -f memdump.mem windows.info
~/volatility3/vol.py -f memdump.mem windows.pstree
~/volatility3/vol.py -f memdump.mem windows.cmdscan
~/volatility3/vol.py -f memdump.mem windows.consoles
~/volatility3/vol.py -f memdump.mem windows.cmdline
~/volatility3/vol.py -f memdump.mem windows.filescan
~/volatility3/vol.py -f memdump.mem windows.netstat
~/volatility3/vol.py -f memdump.mem windows.netscan
~/volatility3/vol.py -f memdump.mem windows.dumpfiles --pid PID
```
