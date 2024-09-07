# mygodoc
# Makefile
```makefile
BINARY_NAME := mygodoc
ifeq (${OS},Windows_NT)
	BINARY_NAME := ${BINARY_NAME}.exe
else
	SUDO := sudo
endif
.PHONY: all init clean install

all: ${BINARY_NAME}

init:
	rm -f go.mod go.sum
	go mod init example/mygodoc
	go mod tidy

clean:
	go clean

install:
	${SUDO} cp -f ${BINARY_NAME} /usr/local/bin

${BINARY_NAME}: main.go
	goimports -w $<
	staticcheck $<
	go vet $<
	go build -o $@ $<
```
# main.go
```go
package main
 
import (
 	"fmt"
 	"go/parser"
 	"go/token"
 	"log"
 	"os"
 	"os/exec"
 	"path/filepath"
 	"sort"
 	"strconv"
 	"strings"
)

func main() {
 	option := "-all"
 	found := false
 	if len(os.Args) < 2 {
 		usageAndExit()
 	}
 	sym := strings.TrimSpace(os.Args[1])
 	if isNumber(sym) {
 		option = "-src"
 		if len(os.Args) < 3 {
 			usageAndExit()
 		}
 		sym = strings.TrimSpace(os.Args[2])
 	}
 	imports, err := importsList()
 	if err != nil {
 		log.Fatal(err)
 	}
 	for _, imp := range imports {
 		msg, err := godoc(option, imp, sym)
 		if err == nil {
 			found = true
 			fmt.Println(msg)
 		}
 	}
 	if !found {
 		fmt.Printf("not found: %s\n", sym)
 		os.Exit(1)
 	}
}
 
func usageAndExit() {
 	fmt.Fprintf(os.Stderr, "Usage: %s [#] SYMBOL\n",
 		filepath.Base(os.Args[0]))
 	fmt.Fprintln(os.Stderr, "\t1 ... go doc option is a \"-src\".")
 	os.Exit(1)
}
 
func isNumber(s string) bool {
 	for _, r := range s {
 		if r < '0' || r > '9' {
 			return false
 		}
 	}
 	return true
}
 
func importsList() ([]string, error) {
 	files, err := filepath.Glob("*.go")
 	if err != nil {
 		return []string{}, err
 	}
 	imports := map[string]struct{}{}
 
 	for _, file := range files {
 		src, err := os.ReadFile(file)
 		if err != nil {
 			return []string{}, err
 		}
 		fset := token.NewFileSet()
 		f, err := parser.ParseFile(fset, "", src, parser.ImportsOnly)
 		if err != nil {
 			return []string{}, err
 		}
 		for _, s := range f.Imports {
 			imports[s.Path.Value] = struct{}{}
 		}
 	}
 
 	keys := make([]string, 0, len(imports)+1)
 	keys = append(keys, "")
 	for k := range imports {
 		s, err := strconv.Unquote(k)
 		if err != nil {
 			return []string{}, err
 		}
 		keys = append(keys, s)
 	}
 	sort.Strings(keys)
 	return keys, nil
}

func godoc(option, pkg, sym string) (string, error) {
 	var cmd *exec.Cmd
 	if pkg == "" {
 		cmd = exec.Command("go", "doc", option, sym)
 	} else {
 		cmd = exec.Command("go", "doc", option, pkg, sym)
 	}
 	stdoutStderr, err := cmd.CombinedOutput()
 	if err != nil {
 		return "", err
 	} else {
 		return string(stdoutStderr), nil
 	}
}
```
# ~/.vimrc
```vimrc
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
Plug 'mattn/vim-goimports'
call plug#end()
augroup vimrc
	au!
 	au BufRead,BufNewFile *.ps1 setlocal expandtab
 	au BufRead,BufNewFile *.ps1 setlocal tabstop=4 softtabstop=4 shiftwidth=4
 	au BufRead,BufNewFile *.go setlocal number
 	au BufRead,BufNewFile *.go setlocal keywordprg=:term\ /usr/local/bin/mygodoc
 	au TerminalWinOpen,BufWinEnter * if &buftype == 'terminal'
 		\ | setlocal keywordprg=:term++curwin\ /usr/local/bin/mygodoc
 		\ | endif
 augroup END
```
