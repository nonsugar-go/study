# C# の基礎
# ドキュメント
- https://dotnet.microsoft.com/ja-jp/languages/csharp
- https://learn.microsoft.com/ja-jp/dotnet/csharp/tour-of-csharp/overview
- https://www.tohoho-web.com/ex/c-sharp.html
# インストール
1. https://visualstudio.microsoft.com/ja/downloads/ から Visual Studio Community Ed. をダウンロードしてインストール
2. **.NET デスクトップ開発** をインストールします。
3. **Windows フォーム アプリケーション (.NET Framework) C#** を選択します。
4. **新しいプロジェクトを作成します**
   - プロジェクト名: Tomato.UI
   - 場所: (任意の場所)
   - ソリューション名: Tomato
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

# 文法
## 書式指定
- [C#(.NET)の書式指定 #C# - Qiita](https://qiita.com/haruka_kotani/items/8d738e3fb76c6fdf0b3a)
## ref, out, in
- [C#のref・out・inの違いをまとめました #C# - Qiita](https://qiita.com/fksk36/items/dfa7e7e6ab40ecdd4ee8)
## オブジェクト指向
- https://kiironomidori.hatenablog.com/entry/unity_abstvirt
# 例
## ファイルへの書き込み
- https://johobase.com/streamwriter-class-writetext-csharp/
## LINQ
- https://learn.microsoft.com/ja-jp/dotnet/csharp/linq/
# Misc
## C# と Java
- [C#とJavaの書き方の違いをまとめる #Java - Qiita](https://qiita.com/yunomichawan/items/9c9e036383545a74ee6e)
## ソースコードの確認
- VS で関数上で [F12] で定義を確認する
- https://referencesource.microsoft.com/
