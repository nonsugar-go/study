# Forensics - Tools
- [Forensics入門（CTF） #CTF - Qiita](https://qiita.com/knqyf263/items/6ebf06e27be7c48aab2e)
- https://georgeom.net/StegOnline/checklist
## 7zip
```zsh
sudo apt install 7zip

7z e -pPASSWORD a.zip
```
## Binwalk
```zsh
sudo apt install binwalk
binwalk -e foo.jpg
```
## pngcheck
```zsh
sudo apt install pngcheck

pngcheck -v a.png
```
## Steghide
```zsh
sudo apt install steghide

steghide info foo.jpg
```
## John the Ripper
- https://www.openwall.com/john/doc/EXAMPLES.shtml
- [john the ripper メモ #JohntheRipper - Qiita](https://qiita.com/shorii-shelly/items/e259c609458e2402432b)
## Autopsy
- https://www.autopsy.com/
## Volatility3
- https://github.com/volatilityfoundation/volatility3
- https://blog.onfvp.com/post/volatility-cheatsheet/
- [メモリフォレンジックCTF「MemLabs」Lab3にVolatility3で挑戦してみた #Security - Qiita](https://qiita.com/kzzzkr23/items/618a226028bcddc7d495)
### Install on WSL2 (Ubuntu 22.04 LTS)
```zsh
sudo apt install python3-pip python3-yara python3-capstone python3-pycryptodome
sudo pip3 install -U pefile leechcorepyc gcsfs s3fs
git clone https://github.com/volatilityfoundation/volatility3.git
```
### Usage
```zsh
~/volatility3/vol.py -f memdump.mem windows.info
```
