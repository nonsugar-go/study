# C++
# ドキュメント
- [C++ - Wikipedia](https://ja.wikipedia.org/wiki/C%2B%2B)
- https://learn.microsoft.com/ja-jp/cpp/windows/overview-of-windows-programming-in-cpp
# インストール
## Visual Studio
1. https://visualstudio.microsoft.com/ja/downloads/ から Visual Studio Community Ed. をダウンロードしてインストール
2. **C++ によるデスクトップ開発** をインストールします。
3. **空のプロジェクト (C++)** を選択します。
4. **新しいプロジェクトを作成します**
   - プロジェクト名: HelloWorld
   - 場所: (任意の場所)
   - ソリューション名: CPP
## GCC
- Cygwin のパッケージ選択で、**gcc-g++** を選択する。
# Hello, World! (Main.cpp)
1. 追加 > 新しい項目... > C++ ファイル (.cpp): Main.cpp
```cpp
#include <iostream>

int main() {
	using namespace std;
	cout << "Hello, " << "World!" << endl;
	return 0;
}
```
3. メニュー > ビルド > ソリューションのビルド
4. ▶ローカル Windows デバッガー (**F5**)

