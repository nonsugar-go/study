# Fyne - Basic
## 事前準備, Demo
- https://developer.fyne.io/started/
- https://github.com/fyne-io/fyne/tree/master/cmd/fyne_demo
### VMware 上で動かす場合、以下の設定が必要
- 仮想マシン > 設定の編集 > 仮想ハードウェア > ビデオ カード > 3D グラフィックス: &#9745; 3Dサポートを有効化
### Install Cygwin Packages
- Cygwin Packages
  - make
  - mingw64-x86_64-gcc-core: 64-bit C compiler for native 64-bit Windows. The executable is "x86_64-w64-mingw32-gcc".
<!-- - mingw64-i686-gcc-core: 64-bit C compiler for native 32-bit Windows. The executable is "i686-w64-mingw32-gcc". (いらない) -->
```bash
export CC=x86_64-w64-mingw32-gcc
go run fyne.io/fyne/v2/cmd/fyne_demo@latest
```
### WSL2 (Ubuntu)
- [Go+Fyneで作ったデスクトップアプリを新WSL上で動かしてみる｜SHIFT Group 技術ブログ](https://note.shiftinc.jp/n/nff7670275af4)
# Hello World
- https://developer.fyne.io/started/hello
- https://developer.fyne.io/started/apprun
- https://developer.fyne.io/started/updating
# Fyne
- https://developer.fyne.io/
- https://apps.fyne.io/
- https://developer.fyne.io/api/v2.3/

- https://www.youtube.com/watch?v=AVIQn1areC4&list=PLjpijTpXl1_po-ld8jORR9k5NornDNKQk
- https://www.youtube.com/watch?v=1qDimQU3OX4

- https://www3.ntu.edu.sg/home/ehchua/programming/howto/Cygwin_HowTo.html
- https://vivacocoa.jp/go/fyne/fyne_install.php

- https://developer.fyne.io/started/hello

```bash
vim hello.go
```

```go
package main

import (
	"os"
	"path/filepath"
 
	"fyne.io/fyne/v2"
 	"fyne.io/fyne/v2/app"
 	"fyne.io/fyne/v2/container"
 	"fyne.io/fyne/v2/widget"
)
 
func main() {
 	//os.Setenv("FYNE_THEME", "dark")
 	os.Setenv("FYNE_THEME", "light")
 	windir := os.Getenv("windir")
 	fontPath := filepath.Join(windir, "Fonts", "yumin.ttf")
 	if _, err := os.Stat(fontPath); err == nil {
 		os.Setenv("FYNE_FONT", fontPath)
 	}
 	myApp := app.New()
 	myWindow := myApp.NewWindow("Hello 世界") 
 	tabs := container.NewAppTabs(
 		container.NewTabItem("世界",
 			widget.NewLabel("Hello 世界!")),
 		container.NewTabItem("Go",
 			widget.NewLabel("Hello Go!")),
 		container.NewTabItem("Fyne",
 			widget.NewLabel("Hello Fyne!")),
 	)
 
 	tabs.SetTabLocation(container.TabLocationLeading)
 
 	myWindow.SetContent(tabs)
 	myWindow.Resize(fyne.NewSize(400, 300))
 	myWindow.ShowAndRun()
}
```

```bash
export CC=x86_64-w64-mingw32-gcc
go mod init myApp
go mod tidy
goimports -w .
staticcheck
go vet
go build -ldflags -H=windowsgui .
```

- https://developer.fyne.io/started/packaging

```bash
go install fyne.io/fyne/v2/cmd/fyne@latest
fyne package -icon myapp.png  ## Icon.png をカレントディレクトリに置けば、-icon オプションはいらない
```

# Makefile
```makefile
export CC := x86_64-w64-mingw32-gcc
export FYNE_THEME := light
export FYNE_FONT := C:\\Windows\\Fonts\\yumin.ttf
TARGET := $(shell find -name '*.go' | grep -v '_test\.go' | tail -1 | sed 's/\.go//')
.PHONY: all clean

all: ${TARGET}

%: %.go
  go mod tidy
 	goimports -w $<
 	staticcheck $<
 	go vet $<
 	gotags -f tags $<
 	go build -o $@.exe $<
```

```bash
./$@.exe

%_test: %.go
 	go test -v $< $@.go

clean:
 	go clean
 	rm -f ${TARGET}.exe tags
```
# Example
- https://www.youtube.com/playlist?list=PL5vZ49dm2gshlo1EIxFNcQFBUfLFoHPfp
- https://blogvali.com/category/fyne-golang-gui/
