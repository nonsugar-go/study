# C# の基礎
# ドキュメント
- https://dotnet.microsoft.com/ja-jp/languages/csharp
- https://learn.microsoft.com/ja-jp/dotnet/csharp/tour-of-csharp/overview
- https://www.tohoho-web.com/ex/c-sharp.html
# インストール
1. https://visualstudio.microsoft.com/ja/downloads/ から Visual Studio Community Ed. をダウンロードしてインストール
2. **.NET デスクトップ開発** をインストールします。
3. Cygwin でパスに追加 **~/.bash_profile**

```bash
export PATH="${PATH}:$(cygpath ${GOPATH}\\bin):/cygdrive/e/Program Files/Microsoft Visual Studio/2022/Community/MSBuild/Current/Bin/Roslyn"
```
## Visual Stadio
1. ファイル > 新規作成 > プロジェクト
2. 以下のどちらかを選択
   - **Windows フォーム アプリケーション (.NET Framework) C#**
   - **コンソール アプリ (.NET Framework) C#**
3. **新しいプロジェクトを作成します**
   - プロジェクト名: Tomato.UI
   - 場所: (任意の場所)
   - ソリューション名: Tomato

- ツール > オプション
  - デバッグ/全般/デバッグの停止時に自動的に閉じる: [x]

> [!TIP]
> コンソール アプリの場合、自動で画面が閉じるようになるので、`Console.ReadKey();` を入れる

## その他
- **ビルド > ソリューションのクリーン** でデバッグ時に作成したファイルを削除
- https://learn.microsoft.com/ja-jp/visualstudio/ide/visual-csharp-code-snippets?view=vs-2022

## Hello, World!
- https://learn.microsoft.com/ja-jp/dotnet/csharp/fundamentals/program-structure/main-command-line

```cs
using System;

class TestClass
{
    public static void Main(string[] args)
    {
        foreach (var arg in args)
        {
            Console.WriteLine($"arg: {arg}");
        }
        Console.WriteLine("Hello, World!");
    }
}
```

## コンパイル
```bash
$ csc Hello.cs
$ ./Hello
```
