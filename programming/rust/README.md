# Rust
- https://rust-lang.org/ja/tools/install/
- https://rust-analyzer.github.io/book/installation.html
- https://rust-analyzer.github.io/book/rust_analyzer_binary.html
- https://rust-analyzer.github.io/book/other_editors.html#vim-lsp
- https://rust-analyzer.github.io/book/configuration.html#check.command
- https://rust-lang.github.io/rustfmt/?version=v1.8.0&search=#max_width
- https://doc.rust-lang.org/clippy/
- https://doc.rust-lang.org/book/
- https://doc.rust-jp.rs/book-ja/
- https://play.rust-lang.org/

# Install for WSL2 (ubuntu)

```zsh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
rustup update
mkdir -p ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
rustup component add rust-src
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

# Standard Library

- https://docs.rs/std
- https://doc.rust-lang.org/stable/std/

## Option & Result

- https://doc.rust-lang.org/stable/std/option/enum.Option.html
- https://doc.rust-lang.org/stable/std/result/enum.Result.html

# 所有権

- https://doc.rust-jp.rs/rust-nomicon-ja/ownership.html

# Crates (クレート)

- https://doc.rust-jp.rs/book-ja/ch07-01-packages-and-crates.html

## crates.io

- https://crates.io/crates/rand

# argo

## Docs

```zsh
cargo doc --no-deps --open
```

## リリース時のコンパイル

```zsh
cargo run --bin NAME --release
```

## ライブラリを作成

```zsh
cargo new --lib lib_demo
```

# テスト

- https://doc.rust-jp.rs/rust-by-example-ja/testing.html

# command line

- https://rust-cli.github.io/book/index.html
