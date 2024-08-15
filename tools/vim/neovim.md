# NeoVim
# Vim vs NeoVim
| item | Vim | NeoVim |
| ---- | --- | ------ |
| Config | ~/.vimrc | ~/.config/nvim/init.vim |
| command | vim | nvim |
| View mode | view | nvim -R |
# ~/.config/nvim/init.vim
```zsh
% mkdir -p ~/.config/nvim
% nvim ~/.config/nvim/init.vim
```

```
set shell=/bin/zsh
set shiftwidth=4
set tabstop=4
set expandtab
set textwidth=0
set autoindent
set hlsearch
set clipboard+=unnamedplus
syntax on
```
# Plugin
- [にわか管理者のためのLinux運用入門(234) Vimを使う - 開発者向けプラグイン「vim-commentary」「vim-fugitive」 | TECH+（テックプラス）](https://news.mynavi.jp/techplus/article/techp4993/)
## vim-plug
- https://github.com/junegunn/vim-plug
## vim-maketable
- https://github.com/mattn/vim-maketable
## vim-visual-multi
- https://github.com/mg979/vim-visual-multi
## vim-horizon
- https://github.com/ntk148v/vim-horizon/
## NERDTree
- https://github.com/preservim/nerdtree
## FuzzyFinder
- https://github.com/junegunn/fzf
## vim-fugitive
- https://github.com/tpope/vim-fugitive
## vim-gitgutter
- https://github.com/airblade/vim-gitgutter
## vim-commentary
- https://github.com/tpope/vim-commentary
## vim-polyglot
- https://github.com/sheerun/vim-polyglot
## coc.nvim
- https://github.com/neoclide/coc.nvim
- https://learn.microsoft.com/ja-jp/windows/dev-environment/javascript/nodejs-on-wsl

1. nvm をインストール
```zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash 
```


## vim-go
https://github.com/fatih/vim-go
