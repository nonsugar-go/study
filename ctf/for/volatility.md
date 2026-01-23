# Volatility

- https://volatilityfoundation.org/announcing-the-official-parity-release-of-volatility-3/
- https://github.com/volatilityfoundation/volatility3
- https://github.com/volatilityfoundation/volatility/wiki/Command-Reference
- https://blog.onfvp.com/post/volatility-cheatsheet/
- [メモリフォレンジックCTF「MemLabs」Lab3にVolatility3で挑戦してみた #Security - Qiita](https://qiita.com/kzzzkr23/items/618a226028bcddc7d495)
- [メモリフォレンジックCTF「MemLabs」Lab1のWriteUp: NECセキュリティブログ | NEC](https://jpn.nec.com/cybersecurity/blog/200131/index.html)
- [CTFのフォレンジックにおけるメモリフォレンジックまとめ [Volatility 3, Volatility 2] - はまやんはまやんはまやん](https://blog.hamayanhamayan.com/entry/2022/12/14/231806)

## Install on WSL2 (Ubuntu 22.04 LTS)

```zsh
sudo apt install python3-pip python3-yara python3-capstone python3-pycryptodome
sudo pip3 install -U pefile leechcorepyc gcsfs s3fs
git clone https://github.com/volatilityfoundation/volatility3.git
```

## Install

- https://github.com/volatilityfoundation/volatility/wiki/Installation

```zsh
pip3 install -U volatility3
```

## Usage

- https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#filescan
- https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#dumpfiles
- https://github.com/volatilityfoundation/volatility/wiki/Command-Reference#memmap

```zsh
vol --help|grep '^\s*windows'
vol -f memdump.mem windows.info
vol -f memdump.mem windows.pstree
vol -f memdump.mem windows.cmdscan
vol -f memdump.mem windows.consoles
vol -f memdump.mem windows.cmdline
vol -f memdump.mem windows.filescan
vol -f memdump.mem windows.netstat
vol -f memdump.mem windows.netscan
mkdir files
vol -f memdump.mem -o files windows.dumpfiles --pid PID
```
