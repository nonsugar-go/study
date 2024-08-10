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
- https://github.com/junegunn/vim-plug
## vim-horizon
- https://github.com/ntk148v/vim-horizon/
## NERDTree
- https://github.com/preservim/nerdtree
## FuzzyFinder
- https://github.com/junegunn/fzf
