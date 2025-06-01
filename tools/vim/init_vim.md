# ~/.config/nvim/init.vim

```
set number
set colorcolumn=80
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif

call plug#begin()
Plug 'mattn/vim-goimports'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-maketable'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'rhysd/vim-go-impl'
Plug 'tpope/vim-commentary'
call plug#end()

function! s:on_lsp_buffer_enabled() abort
	if &buftype ==# 'nofile' || &filetype =~# '^\(quickrun\)' || getcmdwintype() ==# ':'
		return
	endif
	setlocal omnifunc=lsp#complete
	setlocal signcolumn=yes
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gs <plug>(lsp-document-symbol-search)
	nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	"nmap <buffer> gt <plug>(lsp-type-definition)
	"nmap <buffer> <leader>rn <plug>(lsp-rename)
	nnoremap <buffer> <f2> <plug>(lsp-rename)
	nmap <buffer> [g <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <plug>(lsp-next-diagnostic)
	"nmap <buffer> K <plug>(lsp-hover)
	nmap <buffer> gh <plug>(lsp-hover)
	nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
	nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

	nmap <buffer> <f3> <plug>(lsp-code-action)

	let g:lsp_format_sync_timeout = 1000
	autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

aug vimrc_lsp_install
	au!
	au User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
aug END

aug filetype_go
	au!
	au FileType go setlocal tabstop=4 shiftwidth=4 expandtab
	au FileType go nnoremap <F5> :w<CR>:!go run %<CR>
	au FileType go inoremap <F5> <Esc>:w<CR>:!go run %<CR>
	au FileType go ia _las http.ListenAndServe(":8080", nil)
	au FileType go ia _wr w http.ResponseWriter, r *http.Request
	au FileType go ia iferr if err != nil {<CR>return nil, err<CR>}
	au FileType go ia pkgm //go:build ignore<CR><CR>package main<CR><CR>func main() {<CR>}<C-o>O
aug END

aug filetype_c_cpp
	au!
	au FileType c,cpp setlocal tabstop=2 shiftwidth=2 expandtab
	au FileType c,cpp nnoremap <F5> :w<CR>:make SRC=%<CR>
	au FileType c,cpp inoremap <F5> <Esc>:w<CR>:make SRC=%<CR>
aug END

aug filetype_python
	au!
	au FileType python nnoremap <F5> :w<CR>:!python3 %<CR>
	au FileType python inoremap <F5> <Esc>:w<CR>:!python3 %<CR>
aug END

aug filetype_html
	au!
	au FileType html setlocal tabstop=4 shiftwidth=4 expandtab
aug END
```
