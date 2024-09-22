# IDA Free
# インストール
- https://hex-rays.com/ida-free/#download
## wsl2 (Ubuntu 22.04.5 LTS)
```bash
cull -LO https://out7.hex-rays.com/files/idafree84_linux.run
chmod +x idafree84_linux.run
./idafree84_linux.run
rm ./idafree84_linux.run

## メッセージを見て足りないライブラリをインストールする
QT_DEBUG_PLUGINS=1 ~/idafree-8.4/ida64
sudo apt install libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-render-util0 libxcb-xinerama0 libxcb-xkb1 libxkbcommon-x11-0

## 起動
~/id
```
# 設定
- Options > General...: Number of opcode bytes (non-graph): 6
# 構造体
- https://hex-rays.com/products/ida/support/tutorials/structs/
# 使い方
## Navigating
|IDA                                        |Ghidra                           |
|--|--|
|Alt + 1/2/3/...: タブの切り替え            |                                 |
|[space]: Text View <-> Graph View          |Window > Fnction Graph           |
|1: Zoom -> 100%                            |Zoom to Window                   |
|G: Jump to Address...                      |G: Navigation > Go to...         |
|Double Click (Enter): Enter a Func         |Double Click (Enter)             |
|Esc: Jump to previous position             |Alt + Left                       |
|X: xref                                    |Refereces > Show Refereces to ...|
|N: Rename                                  |L: Rename ...                    |
|Y: Set item type                           |Ctrl + L: Retype Return          |
|Shift + F12: View > Open subviews > Strings|Window > Defined Strings         |
## Exploring
|IDA                                 |Ghidra                           |
|--|--|
|H/B/R: Hex/Bin/Char                 |Convert                          |
** Commenting
|IDA                                 |Ghidra                           |h
|Ins (Shift + Ins): 前(後)にコメント |　  　　　　　　　　 　　　　　　|
| : インラインコメント               | ; コメント                      |
| ; リピータブルコメント             |                                 |
## Searching
|IDA                                 |Ghidra                           |
|--|--|
|ALt + B (Ctrl + B): Byte or "String" Search|S: Memory                 |
|Alt + T (Ctrl + T): Text Search     |S: Memory                        |
|Alt + I (Ctrl + I): Immediate Search|                                 |
## Exploring
|IDA                                  |Ghidra                           |
|--|--|
|C: Code                              |D: Disassemble                   |
|U: Undefine data                     |C: Clear Code Byte               |
|A: String                            |': Char->String->Unicode         |
|D: BYTE->WORD->DWORD->QWORD          |B: BYTE->WORD->DWORD->QWORD      |
|                                     |F: float->double                 |
|                                     |P: Pointer                       |
|                                     |[: Create Array                  |
|P: Create function                   |F: Create Function               |
|Ins: Crate Struct                    |{: Create Struct                 |
|T: Assembly ViewでStructを使用       |                                 |
|Y: Decompiler ViewでStructを使用     |                                 |
## Structures
|IDA                                  |Ghidra                           |
|--|--|
|Ins: Add Struct type...              |                                 |
|Del: Delete Struct type...           |                                 |
|D: Data                              |                                 |
|S: String                            |                                 |
|N: Rename                            |                                 |
** Debugging
|IDA                                 |Ghidra                           |h
|F2: Breakpoint                      |                                 |
|F9: Run / Continue                  |                                 |
|F8: Step Over                       |                                 |
|F7: Setp In                         |                                 |
|Ctrl + F7: Run until Return         |                                 |
## Patch
|IDA                                              |Ghidra                           |
|--|--|
|Edit > Pache program > Assemble                  |                                 |
|Edit > Pache program > Apply paches to input file|                                 |
|Edit > Pache program > Change bytes              |                                 |

- https://yaya.lsv.jp/multibyte-nop/ 参考: NOP 0x90
## Decompiling
|IDA                                      |Ghidra                           |
|--|--|
|F5: Decompile                            |Ctrl + E: Decompile              |
|Synchronize with > IDA View-A, Hex View-A|                                 |
** Save
|IDA                                         |Ghidra                           |h
|Ctrl + W: File > Save                       |                                 |
|Ctrl+Shift+T: View database snapshot manager|                                 |
|Ctrl+Z: Undo                                |                                 |
