# インストール
- https://go.dev/dl/
## Linux
```bash
curl -OL https://go.dev/dl/go1.23.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz
```
### ~/.zshrc
```
export PATH=$PATH:/usr/local/go/bin
```
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
