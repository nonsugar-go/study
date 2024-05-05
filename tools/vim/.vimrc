set vb t_vb=
set fencs=ucs-bom,utf-8,cp932
set laststatus=2
set statusline=%F%r%h\ [%{&ff}\|%{&fenc}%{&bomb?':bom':''}]%y%=0x%.8B\ %03l,%03c\ %P
set incsearch
sy on
set hlsearch
set cursorline
let g:xml_syntax_folding=1
set foldmethod=syntax
colorscheme desert
" mkdir -p ~/.vim/autoload
" cd ~/.vim/autoload
" curl -LO https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'dhruvasagar/vim-table-mode'
Plug 'gyim/vim-boxdraw'
Plug 'mattn/vim-goimports'
call plug#end()
augroup vimrc
	au!
	au BufWritePre *.md :%s/\s\+$//e
	au BufRead,BufNewFile *.md setlocal virtualedit+=all
	au BufRead,BufNewFile *.ps1 setlocal expandtab
	au BufRead,BufNewFile *.ps1 setlocal tabstop=4 softtabstop=4 shiftwidth=4
	au BufRead,BufNewFile *.go setlocal number
	au BufRead,BufNewFile *.go setlocal keywordprg=:term\ /usr/local/bin/mygodoc
	au TerminalWinOpen,BufWinEnter * if &buftype == 'terminal'
		\ | setlocal keywordprg=:term++curwin\ /usr/local/bin/mygodoc
		\ | endif
augroup END
