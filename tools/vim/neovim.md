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
## vim-go
https://github.com/fatih/vim-go
