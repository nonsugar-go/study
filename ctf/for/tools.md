# Forensics - Tools

- [Forensics入門（CTF） #CTF - Qiita](https://qiita.com/knqyf263/items/6ebf06e27be7c48aab2e)
- https://georgeom.net/StegOnline/checklist

## URL のチェック

- https://urlscan.io/

## Hayabusa (イベントビューアの解析)

- https://github.com/Yamato-Security/hayabusa
- https://github.com/Yamato-Security/hayabusa/blob/main/README-Japanese.md#%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E4%BD%BF%E7%94%A8%E6%96%B9%E6%B3%95
- https://github.com/Yamato-Security/hayabusa/blob/main/doc/TimelineExplorerAnalysis/TimelineExplorerAnalysis-Japanese.md
- https://attack.mitre.org/techniques/T1033/
- https://attack.mitre.org/techniques/T1016/
- https://attack.mitre.org/techniques/T1082/
- https://attack.mitre.org/techniques/T1547/001/

```console
hayabusa-x.x.x-win-x64.exe help
hayabusa-x.x.x-win-x64.exe eid-metrics -d C:\Logs
hayabusa-x.x.x-win-x64.exe csv-timeline -d C:\Logs -o result.csv -p all-field-info
hayabusa-x.x.x-win-x64.exe search -d C:\Logs -o result.csv -k "10.10.10.10"
```

## イベントビューアの解析 (Eric Zimmerman's EvtxECmd)

- https://github.com/EricZimmerman/evtx

```console
EvtxECmd.exe -d C:\Evtx --csv C:\CSV
```

> [!NOTE]
> **Security**
> - Event ID 4624: Successful logon
> - Event ID 4624: An account was loged off
>
> **Microsoft-Windows-PowerShell/Operational**
> - Event ID 4104: PowerShell が実行したスクリプトの「中身そのもの」を記録したログ

## MFT, Prefetch, レジストリ, Chrome の履歴の調査

1. cdir-collector で収集
   - https://github.com/CyberDefenseInstitute/CDIR
2. Eric Zimmerman’s Tools (MFTECmd) で MFT を CSV に抽出
   ```console
   MFTECmd.exe -f C_$MFT --csv C:\CSV
   ```
   - https://ericzimmerman.github.io/#!index.md
3. Eric Zimmerman’s Tools (Timeline Explorer) で 出力された CSV ファイルを閲覧
4. Eric Zimmerman’s Tools (PECmd.exe) で Prefetch の解析を CSV に抽出
5. Eric Zimmerman’s Tools (Timeline Explorer) で 出力された CSV ファイルを閲覧
6. Eric Zimmerman’s Tools (RegistryExplorer.exe) でレジストリを調査
   > HKLM:\Software\Microsoft\Windows\CurrentVersion\Run
7. ChromeHistoryView で Chrome の履歴を調査 (Options > Advanced Options で指定)
   - https://www.nirsoft.net/utils/chrome_history_view.html
   - https://www.nirsoft.net/utils/browsing_history_view.html

## メモリ解析

### メモリダンプ取得ツール

- https://github.com/Velocidex/WinPmem
  ```zsh
  winpmem_mini_x64_rc2.exe memdump.mem
  ```
- https://www.exterro.com/digital-forensics-software/ftk-imager

### メモリ解析ツール

- https://github.com/ufrisk/MemProcFS
- https://github.com/volatilityfoundation

## Autopsy

- https://www.autopsy.com/

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

## poppler-utils

```zsh
pdfinfo file.pdf
pdftotext file.pdf
pdfimages -all file.pdf img
```

## Steghide

```zsh
sudo apt install steghide

steghide info foo.jpg
```

## hashcat

- https://github.com/hashcat/hashcat
- https://github.com/zacheller/rockyou

```zsh
$ hashcat hash.txt /usr/share/wordlists/rockyou.txt
 (snip)
  34600 | MD6 (256)                                                  | Raw Hash
   1400 | SHA2-256                                                   | Raw Hash
  17400 | SHA3-256                                                   | Raw Hash
 (snip)
```

```zsh
$ hashcat hash.txt /usr/share/wordlists/rockyou.txt -m 1400
```

## John the Ripper

- https://www.openwall.com/john/doc/EXAMPLES.shtml
- [john the ripper メモ #JohntheRipper - Qiita](https://qiita.com/shorii-shelly/items/e259c609458e2402432b)

## pkcrack

- https://github.com/keyunluo/pkcrack
- [【CTF】 SECCON 2015 online「Unzip the file」解説](https://zenn.dev/mattsunkun/articles/9a4165634a4f9a)
- [PkCrack は -d を付けないと処理が終わらない #CTF - Qiita](https://qiita.com/tomii9273/items/e78918b8d72802968e34)

```zsh
git clone https://github.com/keyunluo/pkcrack
chmod +x ~/pkcrack/bin/pkcrack
```

```zsh
pkcrack -C encrypted-ZIP -c ciphertextname -P plaintext-ZIP
      -p plaintextname -d decrypted_file -a
```

## bkcrack

```zsh
cd ~/CTF
curl -LO https://github.com/kimci86/bkcrack/releases/download/v1.8.1/bkcrack-1.8.1-Linux-x86_64.tar.gz
tar xvzf bkcrack-1.8.1-Linux-x86_64.tar.gz
ln -s ~/CTF/bkcrack-1.8.1-Linux-x86_64/bkcrack ~/CTF/bin
```

**既知平文攻撃の条件**

- 暗号化ZIPファイルの暗号化方式がZipCrypto
- 暗号化ZIPファイと、暗号化ZIPファイルに含まれる1つのファイルの平文

```
$ ls
chall.zip  plain.txt

$ bkcrack -L chall.zip
bkcrack 1.8.1 - 2025-10-25
Archive: chall.zip
Index Encryption Compression CRC32    Uncompressed  Packed size Name
----- ---------- ----------- -------- ------------ ------------ ----------------
    0 ZipCrypto  Store       bcf5d041           12           24 flag.txt
    1 ZipCrypto  Deflate     f5db05a6        16628         6661 plain.txt

## 圧縮率が違うと成功しないので、成功するまで圧縮率を変えて試してみる
$ zip -9 plain.zip plain.txt
updating: plain.txt (deflated 60%)

$ bkcrack -L plain.zip
bkcrack 1.8.1 - 2025-10-25
Archive: plain.zip
Index Encryption Compression CRC32    Uncompressed  Packed size Name
----- ---------- ----------- -------- ------------ ------------ ----------------
    0 None       Deflate     f5db05a6        16628         6649 plain.txt

$ bkcrack -C chall.zip -c plain.txt -P plain.zip -p plain.txt
bkcrack 1.8.1 - 2025-10-25
[20:30:01] Z reduction using 6642 bytes of known plaintext
100.0 % (6642 / 6642)
[20:30:02] Attack on 316 Z values at index 191
Keys: b8781947 b53b81ae 6f4c1727
27.5 % (87 / 316)
Found a solution. Stopping.
You may resume the attack with the option: --continue-attack 87
[20:30:02] Keys
b8781947 b53b81ae 6f4c1727

$ bkcrack -C chall.zip -c flag.txt -k b8781947 b53b81ae 6f4c1727 -d flag.txt
bkcrack 1.8.1 - 2025-10-25
[20:32:19] Writing deciphered data flag.txt
Wrote deciphered data (not compressed).

$ cat flag.txt
flag{dummy}
```
