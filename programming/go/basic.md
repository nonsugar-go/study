# Basic
# 格言
- [Gopherfest 2015 | Go Proverbs with Rob Pike](https://www.youtube.com/watch?v=PAAkCSZUG1c)
# プロジェクトの構造
- https://github.com/golang-standards/project-layout/blob/master/README_ja.md
# インストール
- https://go.dev/doc/install
- https://pkg.go.dev/golang.org/x/tools
- https://pkg.go.dev/golang.org/x/tools/cmd
- https://github.com/x-motemen/gore
- https://pkg.go.dev/github.com/lifeibo/gotags#section-readme
- https://pkg.go.dev/github.com/josharian/impl#section-readme

- https://staticcheck.io/docs/getting-started/
- [【Go】デファクトなlinter staticcheckの設定方法 - Qiita](https://qiita.com/yagi_eng/items/1c34f9691128c51846e7)

1. MSI のインストーラーでインストールします。
2. ~/.bash_profile に追加します
```bash
vim ~/.bash_profile
```
## 追加します
```bash
export GOPATH="$(cygpath -w ${HOME}/go)"
export PATH="${PATH}:$(cygpath ${GOPATH}\\bin)"
```
1. バージョン、環境確認とツールのインストール
```bash
$ go version
go version go1.20.4 windows/amd64

$ go env
$ vim ~/work/go/go_setup.sh
```

```bash
#! /bin/bash
set -x

go install github.com/akavel/rsrc@latest
go install github.com/cweill/gotests/gotests@latest
go install github.com/fatih/gomodifytags@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/haya14busa/goplay/cmd/goplay@latest
go install github.com/josharian/impl@latest
go install github.com/jstemmer/gotags@latest
go install github.com/x-motemen/gore/cmd/gore@latest
go install golang.org/x/lint/golint@latest
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/goyacc@latest
go install golang.org/x/tools/gopls@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
```
$ ~/work/go/go_setup.sh
## リンター
- https://golang.org/cmd/vet/
- https://golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow
- https://github.com/kisielk/errcheck
- https://github.com/fzipp/gocyclo
- https://github.com/jgautheron/goconst
- https://github.com/golangci/golangci-lint
## フォーマッター
- https://golang.org/cmd/gofmt/
- https://godoc.org/golang.org/x/tools/cmd/goimports
## vim
- https://github.com/mattn/vim-goimports

- [mygodoc](mygodoc.md)

## VSCode
- Ctrl + Shift + P > Go: Install/Update Tools > 全てチェック
## チュートリアル
- https://go.dev/doc/tutorial/getting-started
- https://go.dev/tour/
- https://go-tour-jp.appspot.com/
- https://go.dev/doc/tutorial/
- [【決定版！？】A Tour of Goの練習問題の解答・解説まとめ | exMedia>A Tour of Goの練習問題を解説するシリーズ(1/11) &#8211; Exercise: Loops and Functions | exMedia](https://www.exmedia.jp/blog/%e3%80%90%e6%b1%ba%e5%ae%9a%e7%89%88%ef%bc%81%ef%bc%9f%e3%80%91a-tour-of-go%e3%81%ae%e7%b7%b4%e7%bf%92%e5%95%8f%e9%a1%8c%e3%81%ae%e8%a7%a3%e7%ad%94%e3%83%bb%e8%a7%a3%e8%aa%ac%e3%81%be%e3%81%a8/)
- https://golangdocs.com/makefiles-golang

```bash
## ソースファイルを作成する
mkdir hello
cd hello
vim hello.go
## ドキュメントの確認
go doc -all fmt
## フォーマット (gofmt の代わりに goimports を使う方が高機能)
gofmt -w .
## フォーマット (インポート宣言の挿入と削除も行う)
goimports -w .
## go.mod ファイルを作成する
go mod init example.hello
## 標準モジュール以外を呼び出す場合、go.sum　ファイルを作成する
go mod tidy
```

- Makefile: https://golangdocs.com/makefiles-golang
```makefile
ico = $(shell cygpath -w "$(HOME)/work/go/Icons/")
.PHONY: build clean
build:
 	go mod tidy
 	goimports -w .
 	staticcheck -checks inherit,ST1003,ST1016,ST1020,ST1021,ST1022,-ST1001
 	go vet
 	#rsrc -o rsrc.syso -manifest $(ico)myapp.manifest -ico $(ico)myapp.ico
 	#go build -ldflags="-H windowsgui"
 	gotags -f tags *.go
 	go build

clean:
 	rm -f *.exe rsrc.syso
```

```bash
## make 実行
make
## 実行
go run .
## ビルド
go build .
./hello.exe
## Linux 64bit 用バイナリを作成する。
GOOS=linux GOARCH=amd64 go build -o ./helo_linux
## インストール済みパッケージ一覧
go list ...
```

# Hello, World! (プログラミング言語Go)
- [プログラミング言語Go](https://www.amazon.co.jp/dp/B099928SJD)
- http://www.gopl.io/
- https://github.com/YoshikiShibata/gpl
- https://github.com/torbiak/gopl

```bash
## helloworld
GOPATH=$(cygpath -w $HOME/work/go/gobook)
mkdir -p $GOPATH
go install gopl.io/ch1/helloworld@latest  # go get gopl.io/ch1/helloworld ではエラーが出る
$GOPATH/bin/helloworld
```
# 眺めて覚えるGo言語
- [眺めて覚えるGo言語 - Qiita](https://qiita.com/hiratarich/items/adf6fd3c4ec4cdd436d5)
- [眺めて覚えるGo言語 その2 - Qiita](https://qiita.com/hiratarich/items/6914c5b2944ec3458915)
# 標準ライブラリ
- https://pkg.go.dev/std
# オブジェクト指向
- https://golangdocs.com/object-oriented-programming-in-golang
# デバッグ
- https://dave.cheney.net/2014/09/28/using-build-to-switch-between-debug-and-release
# 参考
- https://go.dev/doc/
- https://go.dev/ref/spec
- https://pkg.go.dev/
- https://go.dev/blog/
- https://go.dev/play/
- https://go.dev/doc/effective_go
- https://go.dev/blog/using-go-modules
- https://github.com/golang/go/wiki/
- https://github.com/golang/go/wiki/Modules/

- [Writing, building, installing, and testing Go code(YouTube)](https://www.youtube.com/watch?v=XCsL89YtqCs)
- https://go.dev/doc/code
- [Google I/O 2012 - Go Concurrency Patterns(YouTube)](https://www.youtube.com/watch?v=f6kdp27TYZs)
- https://go.dev/talks/2012/concurrency.slide#1
- [Google I/O 2013 - Advanced Go Concurrency Patterns(YouTube)](https://www.youtube.com/watch?v=QDDwwePbDtw)
- https://go.dev/talks/2013/advconc.slide#1
- https://go.dev/doc/codewalk/sharemem/
- [Vimeoで Go: a simple programming environment(動画)](https://vimeo.com/53221558)
- https://go.dev/talks/2012/simple.slide#1
- https://go.dev/doc/articles/wiki/
- https://go.dev/doc/codewalk/functions/

- http://go.shibu.jp/effective_go.html

- https://github.com/fukata/golang-stats-api-handler

- [みんなのGo言語[現場で使える実践テクニック](https://www.amazon.co.jp/dp/B01LMS7B1O/)
- https://shinpei.github.io/blog/2014/10/07/use-build-constrains-or-build-tag-in-golang

- [Learn Go Programming by Building 11 Projects &#8211; Full Course(YouTube)](https://www.youtube.com/watch?v=jFfo23yIWac)

- [Web上の参考になった記事のリスト - golangの日記](https://golang.hateblo.jp/web-articles)
- https://news.mynavi.jp/techplus/series/gogogo/

- https://github.com/GomaGoma676/go-basics 講座


# workspaces
- https://go.dev/doc/tutorial/workspaces
- https://go.dev/ref/mod#workspaces


```bash
cd toolkit-project/toolkit
go mod init github.com/nonsugar-go/toolkit
cd ../app
go mod init myapp
cd ..
toolkit-project/toolkit
cd ..
```

output:
```bash
find toolkit-project
toolkit-project
toolkit-project/app
toolkit-project/app/go.mod
toolkit-project/go.work
toolkit-project/toolkit
toolkit-project/toolkit/go.mod
toolkit-project/toolkit.code-workspace
```
