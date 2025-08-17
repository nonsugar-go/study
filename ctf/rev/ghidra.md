# Ghidra

- https://github.com/NationalSecurityAgency/ghidra
- https://github.com/NationalSecurityAgency/ghidra/releases
- https://static.grumpycoder.net/pixel/docs/CheatSheet.html
- https://github.com/AllsafeCyberSecurity/awesome-ghidra
- https://kashiwaba-yuki.com/ghidra-ghidrascript-tutorial

## Golang

- [Goの構造体をGhidraで逆アセンブルして静的解析する #assembly - Qiita](https://qiita.com/taaaaak/items/ee93c460e5dbc5c652ce)
- https://blogs.trellix.jp/feeding-gophers-to-ghidra
- https://github.com/ghidraninja/ghidra_scripts/blob/master/golang_renamer.py

## Install

```zsh
sudo apt install openjdk-21-jdk
curl -LO https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.4.1_build/ghidra_11.4.1_PUBLIC_20250731.zip
unzip ./ghidra_11.4.1_PUBLIC_20250731.zip
~/ghidra_11.4.1_PUBLIC/ghidraRun&
```
## Settings

- Edit > Tool Options > Listing Fields > Cursor Text Highlight > Mouse Button To Activate: MIDDLE -> LEFT
- Winodw > Bookmarks (Ctrl+B)
- Window > Bytes
- Window > Defined Strings
- Window > Function Call Graph
- Window > Function Graph

## 解析のアプローチ

### main 関数から解析する

#### PE フォーマットの実行ファイルの場合、main 関数を見つける方法

- Search > Search Memmory (S): 68 00 00 40 00 e8

```asm
68 00 00 40 00  PUSH IMAGE_DOS_HEADER_00400000
e8 ..           CALL
```

### インポート関数から解析する

Symbol Tree > Imports からヒントになりそうなインポート関数をクリックする

### 文字列から解析する

- Window > Defined Strings

## 構造体の自動定義

1. コード内の変数を右クリックして、Auto Create STrucute を実行
2. Data Type Manager 内の auto_structs に作成される
3. Data Type と Name を編集する

## 独自構造体の手動定義

1. Data Type Manager の `[実行ファイル名]` を右クリックして、New > Signature...

## Equate の適用

1. Listing の数値を選択し、型を設定 (コンテキストメニューの Data)
2. コンテキストメニューから Set Eauates (E) で適切な文字列を選択

## Script Manger

```zsh
mkdir ~/ghidra_scripts
```

1. Window > Script Manager
2. `Create New Script` ボタンをクリック
3. Jython を選択
4. スクリプト名を指定する
