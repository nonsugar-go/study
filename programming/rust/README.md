# Rust
- https://doc.rust-lang.org/book/
- https://doc.rust-jp.rs/book-ja/
- https://play.rust-lang.org/
- https://www.tohoho-web.com/ex/rust.html
# Install for WSL2 (ubuntu)
```zsh
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
. "$HOME/.cargo/env"
```
# Install for Windows
- https://learn.microsoft.com/ja-jp/windows/dev-environment/rust/setup
<!--
1. Visual Studio をインストール
- [.NET デスクトップ開発]、[C++ によるデスクトップ開発]、および [ユニバーサル Windows プラットフォーム開発] を選択
-  Git for Windows もミックスに追加します (検索ボックスを使用して、名前でそれを検索します
2. https://www.rust-lang.org/tools/install
-->
# VSCode Extentions
- https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer
- https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb
# 所有権
- https://doc.rust-jp.rs/rust-nomicon-ja/ownership.html
# Crates (クレート)
- https://doc.rust-jp.rs/book-ja/ch07-01-packages-and-crates.html
- https://crates.io/
- https://crates.io/crates/rand
# Standard Library
- https://doc.rust-lang.org/stable/std/
# Docs
```zsh
cargo doc --no-deps --open
```
# リリース時のコンパイル
```zsh
cargo run --bin NAME --release
```
# テスト
- https://doc.rust-jp.rs/rust-by-example-ja/testing.html
# command line
- https://rust-cli.github.io/book/index.html
