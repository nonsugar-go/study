# Basic
# 格言
- [Gopherfest 2015 | Go Proverbs with Rob Pike](https://www.youtube.com/watch?v=PAAkCSZUG1c)
# プロジェクトの構造
- https://github.com/golang-standards/project-layout/blob/master/README_ja.md
## modules
- https://go.dev/blog/using-go-modules
- https://go.dev/doc/modules/version-numbers
- https://go.dev/ref/mod#mod-commands
- https://go.dev/doc/modules/release-workflow
- https://research.swtch.com/vgo-mvs
- https://semver.org/lang/ja/
- https://docs.github.com/ja/repositories/releasing-projects-on-github/managing-releases-in-a-repository

- https://go.dev/ref/mod#environment-variables
  ```bash
  go env -w GOPRIVATE="github.com/nonsugar-go"
  ```
## workspaces
- https://go.dev/doc/tutorial/workspaces
- https://go.dev/ref/mod#workspaces
- https://future-architect.github.io/articles/20220216a/


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
# チュートリアル
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
go mod init example/hello
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
- https://go.dev/doc/effective_go#embedding
- https://dave.cheney.net/2016/08/20/solid-go-design
- https://go.dev/talks/2012/splash.article#TOC_15.
# デバッグ
- https://dave.cheney.net/2014/09/28/using-build-to-switch-between-debug-and-release
# 参考
- https://go.dev/doc/
- https://go.dev/ref/spec
- https://pkg.go.dev/
- https://go.dev/blog/
- https://go.dev/play/
- https://go.dev/doc/effective_go
- https://go.dev/wiki/CodeReviewComments
- https://go.dev/doc/faq
- https://go.dev/talks/2012/splash.article
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

- https://shinpei.github.io/blog/2014/10/07/use-build-constrains-or-build-tag-in-golang

- [Learn Go Programming by Building 11 Projects &#8211; Full Course(YouTube)](https://www.youtube.com/watch?v=jFfo23yIWac)

- [Web上の参考になった記事のリスト - golangの日記](https://golang.hateblo.jp/web-articles)
- https://news.mynavi.jp/techplus/series/gogogo/

- https://github.com/GomaGoma676/go-basics 講座
