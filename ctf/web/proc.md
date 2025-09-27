# /proc でよく使われるパス一覧（CTF で役立つもの）

## 実行環境・プロセス情報

- /proc/self/: 「自分自身（現在のプロセス）」を参照するためのシンボリックリンク
- /proc/self/cmdline : 実行コマンドライン引数
- /proc/self/environ : 環境変数（PATH, SECRET_KEY, FLAG=... が埋まってる場合あり）
- /proc/self/cwd : 現在の作業ディレクトリ
- /proc/self/exe : 実行ファイル本体（バイナリをダウンロードできることがある）
- /proc/self/maps : メモリマップ（ライブラリのロード場所や ASLR 情報）
- /proc/self/mem : 実メモリ内容（権限次第でリーク可）
- /proc/self/status : プロセスの詳細情報（UID, Capabilities など）
- /proc/self/fd/ : 開いているファイルディスクリプタ（flag ファイルの FD が残っていることも）

## システム全体に関する情報

- /proc/cpuinfo : CPU の情報（環境調査）
- /proc/meminfo : メモリ量の情報
- /proc/uptime : 稼働時間
- /proc/version : カーネルのバージョン
- /proc/modules : ロード済みカーネルモジュール
- /proc/mounts : マウントされているファイルシステム一覧（flag のありかを推測できる）

## プロセス関連（他プロセスも見える場合）

- /proc/<PID>/cmdline : 他プロセスの実行引数
- /proc/<PID>/environ : 他プロセスの環境変数
- /proc/<PID>/cwd : そのプロセスの CWD
- /proc/<PID>/fd/ : そのプロセスが開いているファイル（権限次第で FLAG を読むトリックになる）

## CTF での典型的な利用例

- /proc/self/environ から FLAG が環境変数に入っているのを読む
- /proc/self/cmdline にコマンドライン引数の FLAG が残っている
- /proc/self/fd/ を漁って、flag ファイルの FD を open して読む
- /proc/self/exe を落としてリバースエンジニアリング
- /proc/mounts で /flag や /home/ctf/flag の存在を発見

## CTF で特に「攻撃ベクトルになる /proc」は

- /proc/self/environ
- /proc/self/cmdline
- /proc/self/exe
- /proc/self/fd/*
- /proc/self/maps
- /proc/mounts
