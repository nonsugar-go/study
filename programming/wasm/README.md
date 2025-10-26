# WebAssembly

- https://developer.mozilla.org/ja/docs/WebAssembly/Guides/Understanding_the_text_format
- https://qiita.com/taskooh/items/5915cdd9b9397f7053aa

## WAT モジュールの全体構造

```wat
(module
  ;; 1. 型定義（Type Section）
  (type (func (param i32) (result i32)))   ;; 関数型を定義

  ;; 2. インポート（Import Section）
  (import "env" "memory" (memory 1))       ;; 外部メモリや関数を読み込む

  ;; 3. グローバル変数（Global Section）
  (global $g0 (mut i32) (i32.const 0))     ;; mutable i32 グローバル変数

  ;; 4. 関数定義（Function Section + Code Section）
  (func $double (type 0) (param i32) (result i32)
    local.get 0
    i32.const 2
    i32.mul
  )

  ;; 5. エクスポート（Export Section）
  (export "double" (func $double))
  (export "g0" (global $g0))

  ;; 6. テーブル（Table Section）
  (table 0 funcref)

  ;; 7. メモリ（Memory Section）
  (memory 1)  ;; ページ単位（64KiB）

  ;; 8. 要素（Element Section）
  (elem (i32.const 0) $double)

  ;; 9. データ（Data Section）
  (data (i32.const 0) "Hello")
)
```

| セクション    | WAT 記述例                                | 説明                      |
| -------- | -------------------------------------- | ----------------------- |
| Type     | `(type (func ...))`                    | 関数の型定義（引数・戻り値）          |
| Import   | `(import "env" "func" (func ...))`     | 外部から関数・メモリ・グローバルを読み込む   |
| Global   | `(global $g0 (mut i32) (i32.const 0))` | グローバル変数（定数・mutable）     |
| Function | `(func $f ...)`                        | 関数本体の定義。`type` を参照      |
| Export   | `(export "name" (func $f))`            | 外部からアクセスできる関数・メモリ・グローバル |
| Table    | `(table 0 funcref)`                    | 関数テーブル（間接呼び出し用）         |
| Memory   | `(memory 1)`                           | モジュールの線形メモリ             |
| Element  | `(elem (i32.const 0) $f)`              | 関数テーブル初期化               |
| Data     | `(data (i32.const 0) "Hello")`         | メモリ初期化データ               |

## WABT (pronounced: "wabbit")

```zsh
## インストール
sudo apt install wabt

## テキスト形式で確認
wasm2wat chall.wasm -o chall.wat

## Wasm -> C
wasm2c chall.wasm -o chall.c

## Export を確認
wasm-objdump -x chall.wasm

## エクスポート関数を試す
wasm-interp chall.wasm -r func1

## wat -> wasm
wat2wasm chall.wat
```
