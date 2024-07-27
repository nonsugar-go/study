# C# の基礎
# ドキュメント
- https://dotnet.microsoft.com/ja-jp/languages/csharp
- https://learn.microsoft.com/ja-jp/dotnet/csharp/tour-of-csharp/overview
- https://www.tohoho-web.com/ex/c-sharp.html
# インストール
1. https://visualstudio.microsoft.com/ja/downloads/ から Visual Studio Community Ed. をダウンロードしてインストール
2. **.NET デスクトップ開発** をインストールします。
3. 以下のどちらかを選択
   - **Windows フォーム アプリケーション (.NET Framework) C#**
   - **コンソール アプリ**
5. **新しいプロジェクトを作成します**
   - プロジェクト名: Tomato.UI
   - 場所: (任意の場所)
   - ソリューション名: Tomato
## Visual Stadio
- https://learn.microsoft.com/en-us/visualstudio/ide/visual-csharp-code-snippets?view=vs-2022
# Hello, World!
- https://learn.microsoft.com/ja-jp/dotnet/csharp/fundamentals/program-structure/main-command-line

Cygwin でパスに追加 **~/.bash_profile**

```bash
export PATH="${PATH}:$(cygpath ${GOPATH}\\bin):/cygdrive/e/Program Files/Microsoft Visual Studio/2022/Community/MSBuild/Current/Bin/Roslyn"
```

コンパイル

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

```bash
$ csc Hello.cs
$ ./Hello
```
