# Visual Stadio Code
- [Insider.NET 全記事一覧 - ＠IT](https://atmarkit.itmedia.co.jp/ait/subtop/features/dotnet/all.html#xe789b9e99b86efbc9aVisualStudioCodee38292e4bdbfe38184e38193e381aae3819de38186)
# Install
- https://code.visualstudio.com/download
# ショートカット キー
- ショートカットキーの編集 (Ctrl+K, Ctrl+S)
  - 最大化されるパネルの切り替え > 既定でないので Ctrl + Alt + @ に割り当て
- [VSCodeの選択の便利機能紹介](https://zenn.dev/suba/articles/074b12d4e9c0df)

| 機能 | ショートカット キー |
| ---- | ------------------- |
| コマンド パレット | Ctrl + Shift + P |
| 配色変更 | Ctrl + K, Ctrl + T |
| 全画面 | F11 |
| サイドバーを閉じる | Ctrl + B |
| エクスプローラー | Ctrl + Shift + E |
| 行頭移動・行末移動 | Home \| End |
| 行頭移動・行末移動 | Ctrl + L, ← \| Ctrl + L, →, ← |
| 選択範囲の拡大・縮小 | Alt + Shift + → \| Alt + Shift + ← |
| 単語選択 | Ctrl + D (繰り返すことにより複数選択) |
| 一度に単語選択 | Ctrl + Shift + L |
| 矩形選択 | Shift + Alt + ドラッグ |
| 行選択 | Ctrl + L (繰り返すことにより複数行選択) |
| 行削除 | (選択せずに) Ctrl + X |
| 行単位の移動 | Alt + ↓(↑) (複数行選択状態で行えば複数行同時に移動) |
| 行の複製 | Shift + Alt + ↓(↑) |
| コメント化(トグル) | Ctrl + / |
| ブロックコメント化(トグル)| Shift + Alt + A |
| 複数個所選択 | Ctrl + D |
| フォーマット | Shift + Alt + F |
| 行末の空白削除 | Ctrl + K, Ctrl + X |
| すべてたたむ | Ctrl + K, Ctrl + 0 |
| すべて展開 | Ctrl + K, Ctrl + J |
| 再帰的にたたむ | Ctrl + K, Ctrl + [ |
| 再帰手に展開 | Ctrl + K, Ctrl + ] |
## Visual Studio
Visual Studio で VSCode のショートカット キーを使用するには、「メニュー > ツール > オプション > 環境 > キーボード」、「次の追加キーボードマップ スキームを適用」: Visual Studio Code にする。
# Extensions (Ctrl+Shift+X)
## 初期設定
- Japanese Language Pack for VS Code
  - コマンド パレット (Ctrl+Shift+P): Configure Display Language > 日本語 (ja)
- MSYS2/Cygwin/MinGW/Clang support
  - https://iww.hateblo.jp/entry/20240220/cygwin
    - **規定のプロファイルの選択**で Cygwin を追加
    - コマンド パレット (Ctrl+Shift+P): Open User Settings JSON
    ```json
    "Cygwin": {
      "path": "C:\\cygwin64\\bin\\bash.exe",
      "args": [
         "--login"
      ]
      "env": {"CHERE_INVOKING": "1"},
    }
    ```
## Vim
- https://marketplace.visualstudio.com/items?itemName=vscodevim.vim
<!-- - https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim -->
## WSL
- https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl
## Markdown
- https://dev.classmethod.jp/articles/non-97-operation-manual/
  - 拡張: Markdown Preview Enhanced
  - 拡張: Markdown All in One
  - 拡張: Excel to Markdown table
## Golang
- [Go (go.dev)](https://marketplace.visualstudio.com/items?itemName=golang.go)
  - Ctrl + Shift + P > Go: Install/Update Tools > 全てチェック
- [gotemplate-syntax](https://github.com/casualjim/vscode-gotemplate) `html:5<tab>`
- https://zenn.dev/ikoba/articles/vscode-golang-snippets
- [VSCode の Go extension でよく利用するコマンド 7選 | フューチャー技術ブログ](https://future-architect.github.io/articles/20200707/)
- [意外と知らないVSCode上でGoを爆速開発するためのTips5選 #Go - Qiita](https://qiita.com/yagi_eng/items/9e599913605625809d9c)
## C/C++
- C/C++ Extension Pack (microsoft.com)
## C#
- C# Dev Kit (microsoft.com)
## Java
- Extension Pack for Java (microsoft.com)
## Python
- Python (microsoft.com)
- Black Formatter (microsoft.com)
  - settings.json
```json
    "[python]": {
        "editor.defaultFormatter": "ms-python.black-formatter"
    },
```
- https://takuma.tech/?post=20231009_Python_black_fomatter
- [Visual Studio Codeの設定「虎の巻」：Python編：特集：Visual Studio Codeを使いこなそう！（1/3 ページ） - ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/1711/24/news034.html)
## JavaScript
- ESLint
## HTML
- VS Code ES7+ React/Redux/React-Native/JS snippets
- CSS Peek
- HTML Boilerplate
- [Live Server](https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer)
## AWS
- https://docs.aws.amazon.com/ja_jp/toolkit-for-vscode/latest/userguide/setup-toolkit.html
## その他
- Path Intellisense
- Prettier - Code formatter
# 参考
- [VS Codeのターミナルにcygwinを使用する - ICT Diary](https://ictdiary.hatenadiary.jp/entry/2022/12/26/VS_Code%E3%81%AE%E3%82%BF%E3%83%BC%E3%83%9F%E3%83%8A%E3%83%AB%E3%81%ABcygwin%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B)
- [Visual Studio Code TIPS - ＠IT](https://atmarkit.itmedia.co.jp/ait/series/9744/index.html)
- [VS Code の便利なショートカットキー #VSCode - Qiita](https://qiita.com/12345/items/64f4372fbca041e949d0)
- [【Windows版】VS Code キーボードショートカット一覧 （オススメ付き） #VSCode - Qiita](https://qiita.com/TakahiRoyte/items/cdab6fca64da386a690b)
- https://motamemo.com/vscode/vscode-tips/keyboard-shortcut-sidebar/
- [VS Codeで指定範囲をコメントにしたり戻したりするには](https://atmarkit.itmedia.co.jp/ait/articles/1806/22/news034.html)

