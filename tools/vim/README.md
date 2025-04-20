# Tools/Vim
- https://vimhelp.org/
- [NeoVim](neovim.md)
# 操作
## ノーマル モード
### 編集
| KEY | DESC |
| --- | ---- |
| u \| C-r | Undo \| Redo |
| cw \| ciw | カーソル位置から単語末尾まで変更 \| 単語を変更 |
| Y \| yy | カーソル位置から末尾までヤンク \| 1行ヤンク |
| D \| dd | カーソル位置から末尾まで削除 \| 1行削除 |
| C \| cc | カーソル位置から末尾まで変更 \| 1行変更 |
| g\~w \| g\~$ \| g\~\~ | 単語の大文字・小文字を入れ替える \| 末尾まで大文字・小文字を入れ替える \| 1行大文字・小文字を入れ替える|
| gUw \| gU$ \| gUU | 単語を大文字にする \| 末尾まで大文字にする \| 1行大文字にする |
| guw \| gu$ \| guu | 単語を小文字にする \| 末尾まで小文字にする \| 1行小文字にする |
| J \| gJ | 2行を結合 (1つの空白で区切る) | 2行を結合 (空白無しで結合) |
### 移動
| KEY | DESC |
| --- | ---- |
| gg \| G | 先頭へ \| 末尾へ |
| [[ \| ]] | セクションへ移動 |
| { \| } | 段落へ移動 |
| C-o \| C-i | ジャンプリストを古い方へ移動 (新しい方へ移動) |
| H \| M \| L | カーソルを画面の先頭 (中央・最終) 行へ移動 |
| z<CR> | カーソルの位置をトップの先頭列へ |
| zt \| zz \| zb | カーソル位置をトップ \| センター \| ボトム |
### 同一行の検索
| KEY | DESC |
| --- | ---- |
| f{char} \| F{char} | {char} へ前方 (後方) 検索 |
| t{char} \| T{char} | {char} まで前方 (後方) 検索 |
| ; \| , | f, t, F, T を同じ方向 (逆方向) へ繰り返す |
## 複数行に渡る検索
| KEY | DESC |
| --- | ---- |
| /{pattern} \| ?{pattern} | 前方 (後方) 検索 |
| n \| N | /, ? を同じ方向 (逆方向) へ繰り返す |
| * \| # | 単語の前方 (後方) 検索 |
## コマンド モード
| command | desc |
| ------- | ---- |
| :noh | 検索のハイライトを消す |
| :set nu \| :set nonu | 行番号表示の ON / OFF |
| :paste | 貼り付け時に使用(オートインデント抑制) |
### 置換
| %s/old/new/g \| .,$s/old/new/g | ファイル全体 (現在行～末尾まで) old を new に置換 |
| /pattern1/,/pattern2/s/old/new/g | pattern1 ～ pattern2 まで old を new に置換 |
# レジスタ
| KEY | DESC |
| -- | -- |
| :reg | numberd and named register の一覧 |
| "0P | ヤンクされた内容を貼り付け |
| "1P | 削除された内容を貼り付け |
| "jyy | j レジスタに一行ヤンク |
| "Jyy | j レジスタに1行追加でヤンク |
| "acw | a レジスタに可能し、単語を変更 |
# コマンド オプション
```bash
$ view FILE  ## FILE を読み取り専用で開く
$ vim FILE  ## FILE を開く
$ vim +5 FILE  ## FILE を開き、5行目に移動
$ vim +/WORD FILE  ## FILE を開き、WORD にマッチする行に移動
$ vim [-p|-o|-O] FILE1 FILE2 ...  ## 複数ファイルを開く (-p…タブページ、-o …水平分割、-O…垂直分割)
```

# .vimrc
- [./.vimrc]

```vim
set vb t_vb=
set fencs=ucs-bom,utf-8,cp932
set laststatus=2
set statusline=%F%r%h\ [%{&ff}\|%{&fenc}%{&bomb?':bom':''}]%y%=0x%.8B\ %03l,%03c\ %P
set nu
set incsearch
sy on
set nohlsearch
set cursorline
let g:xml_syntax_folding=1
set foldmethod=syntax
```

> [!NOTE] filetype を認識させるために、以下のようにコメントに書くと良い。
> (例) Markdown 形式のテキストの最終行にコメントを入れる。
> `<!-- vim: set ft=markdown ts=4: -->`

# 矩形モードで便利
- https://vim-jp.org/vim-users-jp/2010/02/17/Hack-125.html

```vim
:set virtualedit+=block
```

# タブストップの設定
command | desc
--|--
:set sw=4 ts=4 et|インデント幅、タブ幅を4文字、タブを空白に変換

```vim
 <!-- vim: set sw=4 ts=4 et tw=80 : -->
```

```vim
 /* vim: set sw=4 ts=4 et tw=80 : */
```

# 基本
- 行番号の(非)表示 (:set [no]number)
- 行末・タブの(非)表示 (:set [no]list)
- 行の折り返し(をしない) (:set [no]wrap)
- 検索時に大文字・小文字を無視する(しない) (:set [no]ignorecase)
- 色が付くのを抑制: (:sy off)
- 行末の空白を削除 (:%s/\s*$//)
- 行頭の空白を削除 (:%s/^\s*//)
- 色の変更 (:colorscheme elflord など)
- space -> TAB 変換 (:ret!)
- TAB 入力時 speace に変換 (:set expandtab, set et)
- 読み取り専用 (:set readonly, :set ro)
- インデント: >, >>, <, <<
- 繰り返しが可能なコマンド
|DO|操作|繰り返し|逆方向の繰り返し|h
|変更|{edit}|.|u|
|行内前方検索|f{char} / t{char}|;|,|
|行内後方検索|F{char} / T{char}|;|,|
|文章内前方検索|/pattern<CR>|n|N|
|文章内広報検索|?pattern<CR>|n|N|
|置換|:s/target/replacement|&|u|
|一連の変更|qx{changes}q|@x|u|
- 複合コマンド
|コマンド|複合コマンド|h
|C|c$|
|s|cl|
|S|^C|
|I|^i|
|A|$a|
|o|A<CR>|
|O|ko|

# ヘルプの参照
- '':help {subject}''
-- (例) '':help regexp'' -- 正規表現のヘルプ
-- (例) '':help m'' -- ''m'' キーのヘルプ
-- (例) '':help CTRL-O'' -- ''CTRL-O'' キーのヘルプ
-- (例) '':help i_CTRL-N'' -- Insert モード時の、''CTRL-N'' キーのヘルプ

# マクロ (操作の記録)
- 操作の記録を開始する。記録は ''q'' で終了。 (q{a-zA-Z})
- 記録した操作をN回再現する ([N]@{a-zA-Z})
- 直前の操作の再現を繰り返す (@@)

# マーク
- カーソルの位置をマークする (m{a-zA-Z})
-- a-z … バッファ内で有効、A-Z … ファイル間で有効
- マークした位置に移動 (`{a-zA-Z})
- マークした行の先頭に移動 ('{a-zA-Z})
- 最後にジャンプしたまたは最後にマークした{位置/行の先頭}に移動 (`` '')
- マークの一覧 (:marks)

# バッファ
- バッファの一覧 (ls)
- N 番のバッファへ切り替え (:b[uffer] N)
- ''<TAB>'' 補完でバッファを切り替え (:b <TAB>)

# ウインドウ (画面) の分割
- N行のウインドウを水平分割で開く (:[N]sp[lit] [FILE])
-- (例) :5sp +/NOTE readme.txt (readme.txt を5行のウインドウを水平分割で開き、NOTE の位置へ移動)
- N列のウインドウ垂直分割で開く (:[N]vs[plit] [FILE])
-- (例) :vs . (垂直分割した新ウインドウでカレントディレクトリからファイルを選択し開く)
- 次のウインドウに移動 (CTRL-W CTRL-W)
- ウインドウを上/下/左/右に移動 (CTRL-W_k, CTRL-W_j, CTRL-W_h, CTRL-W_l)
- 現在のウインドウを閉じる (CTRL-W_c)
- 現在のウインドウ以外を閉じる (CTRL-W_CTRL-O)
- ウインドウを回転 (CTRL-W_r)
- ウインドウの高さをN行増減 ([N]CTRL-W_+, [N]CTRL-W_-)
- ウインドウの幅をN行増減 ([N]CTRL-W_>, [N]CTRL-W_<)
- ウインドウのサイズを揃える (CTRL-W_=)
- 全てのウインドウを閉じて vim を終了 ([w]qa[!])

# タブページ
- 新しい画面で diff を表示 (:diffs[plit] FILE)
- タブページを開く (:tabe[dit] [FILE])
- 次/前のタブページへ移動 (gt, gT)
- 現在のタブページを閉じる (:tabc :tabclose)
- 現在のタブページ以外を全て閉じる (:tabo :tabonly)
- タブページで KEYWORD のヘルプを開く (:tab help KEYWORD)
- タブの移動 (:tabm[ove])
- タブページの一覧 (:tabs)

# vimdiff (:diffsplit)
diff が色付きで表示されます。(:sy off をした方が見やすいかも)
 $ vimdiff -o FILE1 FILE2
- ''-o'' で水平分割。通常は、垂直分割になります。
- 次のウインドウの移動 (CTRL-W_CTRL-W)
- 次/前の変更箇所へ移動 (]_c, [_c)

# :vimgrep
- grep の結果を quickfix ウインドウに表示する (:vim[grep] PATTERN FILE... | cw )
- quickfix ウインドウと元のウインドウ間を移動 (CTRL-W_CTRL-W)
- 次/前の検索結果に移動 (:cn, :cp)

# 開く/閉じる (xml ファイルなど)
- zo … 開く
- zO … 全て開く
- zc … 閉じる
- zC … 全て閉じる

# 補完
- ''i_CTRL-N'' -- Insert モード時に、''CTRL-N'' を押下することにより、文字列を補完する。(次にマッチ)
- ''i_CTRL-P'' -- Insert モード時に、''CTRL-N'' を押下することにより、文字列を補完する。(前にマッチ)
- ''i_CTRL-X_CTRL-F'' -- Insert モード時に、''CTRL-X CTRL-F'''' を押下することにより、文字列にマッチするファイル名を補完する。

# C 言語のプログラミング
 $ vi example.c

## vi 上で、make
- '':make''
-- (例) '':make clean''
- '':cw'' で別ウインドウでエラーを表示。(''CTRL-W W'' でウインドウ間の移動)
- '':cc'', '':cp'', '':cn'' でエラー行の移動。

- :cnext(次の要素), :cprev(前の要素), :cfirst, :clast
- :cnfile(次のファイルの最初の要素), :cpfile(前のファイルの最初の要素), :cc N(N番目の要素)
- :copen(qucikfix ウィンドウをオープン)、:cclose

## vi 上で grep
- '':grep [arguments]''
-- (例) '':grep setsockopt *.c''
-- (例) '':grep -r malloc /usr/include/''
- '':cw'' で別ウインドウで検索結果を表示。(''CTRL-W W'' でウインドウ間の移動)
- '':cc'', '':cp'', '':cn'' で検索結果を移動。

## ctags
予め ''/usr/include'' 以下のヘッダについてタグファイルを生成
 $ ctags -f ~/tags -R /usr/include

 $ cd src
 #--- ソースのあるディレクトリに移動
 $ ctags -R .
 #--- ''./tags'' ファイルの生成

- 関数名の上で、''CTRL-]'' で関数定義にジャンプ。(戻るときは、''CTRL-O'')
- 定義 (define) の上で、''[d'' で #define 行を表示。
- 定義 (define) の上で、''[ CTRL-D'' で #define 行にジャンプ。

## man (オンライン マニュアル検索)
- '':!man {keyword}''
-- (例) ''!man fgets''
- ''K'' で、カーソル上のキーワードのマニュアル検索。

## その他
- ''%'' カーソル上の括弧に対応する括弧にジャンプ。

# ターミナルモード
- https://vim-jp.org/vimdoc-ja/terminal.html#Terminal-mode

# 検索
- ''*'' 現在のカーソル上のキーワードを検索条件に検索。

# 拡張子別設定 (マニュアル設定、タブ -> 空白の設定)
- [[ファイルの拡張子によって、vimに自動でインデント幅を変えてもらおう！ - Qiita>https://qiita.com/mitsuru793/items/2d464f30bd091f5d0fef]]

 augroup vimrc
         autocmd!
         autocmd BufRead,BufNewFile *.go setlocal keywordprg=/usr/local/bin/mygodoc.sh
         autocmd BufRead,BufNewFile *.go setlocal iskeyword+=.
         autocmd BufRead,BufNewFile *.ps1 setlocal expandtab
         autocmd BufRead,BufNewFile *.ps1 setlocal tabstop=4 softtabstop=4 shiftwidth=4
 augroup END

# 参考
- https://linuxhandbook.com/pro-vim-tips/
- https://pragprog.com/titles/dnvim2/practical-vim-second-edition/
- http://www.vim.org/
- http://www.kaoriya.net/#VIM
- http://www002.upp.so-net.ne.jp/janus/vim.html
- http://www.kaoriya.net/vimdoc_j/index.html
- http://pcmania.jp/~moraz/index.html
- http://pcmania.jp/~moraz/tools/ctags.html
- http://www.linux.or.jp/JF/JFdocs/C-editing-with-VIM-HOWTO/index.html
- http://www.geocities.co.jp/SiliconValley-SantaClara/1183/vim.html
- http://www.linux.or.jp/JF/JFdocs/vi-user-usage.html
- http://nanasi.jp/
- http://www.redout.net/data/vi.html
- http://ogawa.s18.xrea.com/fswiki/wiki.cgi?page=Vim%A4%CE%A5%E1%A5%E2
- http://blog.remora.cx/2011/04/show-invisible-spaces-in-vim.html
- http://d.hatena.ne.jp/potappo2/20061107/1162862536
- http://www.atmarkit.co.jp/flinux/index/indexfiles/vim.html
- http://krakenbeal.blogspot.jp/2011/02/vi.html
- http://d.hatena.ne.jp/sogolosphere/20080801/1217606720
- http://mattn.kaoriya.net/software/vim/20110902125512.htm
- http://ogawa.s18.xrea.com/fswiki/wiki.cgi?page=Vim%A4%CE%A5%E1%A5%E2
- http://advweb.seesaa.net/article/3074705.html
- http://www.ksknet.net/vim/
- http://cohama.hateblo.jp/entry/20121023/1351003586
- http://php-web.net/vim/vim.html
- https://ja.wikipedia.org/wiki/Vim
- http://qiita.com/okamos/items/c97970ab34ff55ff3167
- http://qiita.com/advent-calendar/2014/vim
- http://qiita.com/okuramasafumi/items/50c64825cf365e8f6e78
- http://nanasi.jp/articles/howto/editing/blockwise-operation.html
- http://www.atmarkit.co.jp/flinux/index/indexfiles/vim.html
- http://qiita.com/tekkoc/items/98adcadfa4bdc8b5a6ca
- http://nanasi.jp/articles/howto/file/modeline.html
- http://nanasi.jp/articles/howto/editing/blockwise-operation.html
- http://nanasi.jp/articles/howto/file/modeline.html
- http://nanasi.jp/articles/howto/file/modeline.html
- http://d.hatena.ne.jp/mickey24/20080815/1218797020
- http://qiita.com/yuku_t/items/0c1aff03949cb1b8fe6b
- http://qiita.com/qtamaki/items/4da4ead3f2f9a525591a
- http://d.hatena.ne.jp/mickey24/20080815/1218797020
- http://d.hatena.ne.jp/mickey24/searchdiary?of=5&word=%2A%5BVim%B4%B0%C1%B4%A5%D0%A5%A4%A5%D6%A5%EB%5D
- http://vim.rtorr.com/lang/ja/
- https://qiita.com/uryaryadumpty/items/349f3fbc64954542484d
- https://www.youtube.com/watch?v=aHm36-na4-4
