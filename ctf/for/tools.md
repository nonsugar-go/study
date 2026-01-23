# Forensics - Tools

- [Forensics入門（CTF） #CTF - Qiita](https://qiita.com/knqyf263/items/6ebf06e27be7c48aab2e)
- https://georgeom.net/StegOnline/checklist

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

## MFT, Prefetch, レジストリ, Chrome の履歴の調査

1. cdir-collector で収集
   - https://github.com/CyberDefenseInstitute/CDIR
2. Eric Zimmerman’s Tools (MFTECmd) で MFT を CSV に抽出 
   - https://ericzimmerman.github.io/#!index.md
3. Eric Zimmerman’s Tools (Timeline Explorer) で 出力された CSV ファイルを閲覧
4. Eric Zimmerman’s Tools (PECmd.exe) で Prefetch の解析を CSV に抽出
5. Eric Zimmerman’s Tools (Timeline Explorer) で 出力された CSV ファイルを閲覧
6. Eric Zimmerman’s Tools (RegistryExplorer.exe) でレジストリを調査
7. ChromeHistoryView で Chrome の履歴を調査 (Options > Advanced Options で指定)
   - https://www.nirsoft.net/utils/chrome_history_view.html

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
