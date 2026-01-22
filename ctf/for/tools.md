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
## pkcrack
- https://github.com/keyunluo/pkcrack
- [【CTF】 SECCON 2015 online「Unzip the file」解説](https://zenn.dev/mattsunkun/articles/9a4165634a4f9a)
- [PkCrack は -d を付けないと処理が終わらない #CTF - Qiita](https://qiita.com/tomii9273/items/e78918b8d72802968e34)
### Install
```zsh
git clone https://github.com/keyunluo/pkcrack
chmod +x ~/pkcrack/bin/pkcrack
```
### Usage
```zsh
pkcrack -C encrypted-ZIP -c ciphertextname -P plaintext-ZIP
      -p plaintextname -d decrypted_file -a
```
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

## Hayabusa
- https://github.com/Yamato-Security/hayabusa
- https://github.com/Yamato-Security/hayabusa/blob/main/README-Japanese.md#%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95
- https://github.com/Yamato-Security/hayabusa/blob/main/doc/TimelineExplorerAnalysis/TimelineExplorerAnalysis-Japanese.md

## MFT, Prefetch, レジストリの調査

1. cdir-collector で収集
   - https://github.com/CyberDefenseInstitute/CDIR
2. Eric Zimmerman’s Tools (MFTECmd) で MFT を CSV に抽出 
   - https://ericzimmerman.github.io/#!index.md
3. Eric Zimmerman’s Tools (Timeline Explorer) で 出力された CSV ファイルを閲覧
4. Eric Zimmerman’s Tools (PECmd.exe) で Prefetch の解析を CSV に抽出
5. Eric Zimmerman’s Tools (Timeline Explorer) で 出力された CSV ファイルを閲覧
6. Eric Zimmerman’s Tools (RegistryExplorer.exe) でレジストリを調査
