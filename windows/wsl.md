# WSL

# インストール
- https://learn.microsoft.com/ja-jp/windows/wsl/install

## ESXi 仮想マシンで動かす場合
- ビデオカード > 3D グラフィックス: 3D サポートを有効化: [x]

## Windows 11

PowerShell \[管理者モード]

```pwsh
wsl -l --online
wsl --install
wsl -l -v
```

(再起動)

```bash
Enter new UNIX username: USERNAME
New password: PASSWORD
```

## 既定のインストールパスから別のフォルダーへ移動

- 既定のインストールパス: c/Users/USER/AppData/Local/wsl/

PowerShell \[管理者モード]

```pwsh
wsl --export Ubuunt ./Ubuntutar
wsl --unregister Ubuntu
wsl --import Ubunnt E:\wsl ./Ubuntu.tar
rm .\Ubuntu.tar
```

# 使い方

- コマンド プロンプトで wsl を実行するとコンソール接続できる。
- [ファイル名を指定して実行] > [wsl] もしくは [ファイル名を指定して実行] > [ubuntu] で接続できる。
- wsl -u root で root ユーザーでログインできる
- /mnt/c/ で C:\ ドライブに接続できる。
- Windows からは `\\wsl$\Ubuntu\` で wsl 側のファイルシステムにアクセスできる

# 初期設定

## Update

```bash
sudo apt update && sudo apt upgrade -y
```

## ~/.tmux.conf

```
set -g prefix F1
unbind C-b
setw -g mode-keys vi
set -s escape-time 0
bind-key -n F12 select-pane -P 'bg=colour88,fg=white'
bind-key -n S-F12 select-pane -P 'bg=black,fg=white'
```

## symlink

```bash
USERPROFILE=/mnt/c/Users/$(cmd.exe /c echo %USERNAME% | tr -d '\r')
ln -s $USERPROFILE/Desktop .
ln -s $USERPROFILE/Documents .
ln -s $USERPROFILE/Downloads .
ln -s $USERPROFILE/OneDrive .
```

## zsh

- [zsh](/linux/zsh.md)

```bash
sudo apt install zsh -y
chsh -s /bin/zsh
```

- 初回ログイン時の `zsh-newuser-install` の問いには、`(0)  Exit, creating the file ~/.zshrc containing just a comment.` を選択

### ~/.zshrc

```zsh
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/bin
alias open=explorer.exe
alias bat=batcat
alias ctf="source ~/CTF/aliases.sh"
```

- 下記の行を変更

```
plugins=(git python web-search z)
```

## vim 関連

```
if [ ! -d ~/.vim/autoload ]; then
  mkdir -p ~/.vim/autoload
  (
  cd ~/.vim/autoload
  curl -LO https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  )
fi
```

## neovim

```
% sudo apt install neovim -y
```

- [NeoVim](/tools/vim/neovim.md)

### プラグイン

- https://github.com/junegunn/vim-plug
- https://github.com/mattn/vim-maketable
- https://github.com/tpope/vim-commentary
- https://github.com/mattn/vim-lsp-settings

### ~/.config/nvim/init.vim

```
set number
set colorcolumn=80
tnoremap <C-w><C-w> <C-\><C-n><C-w>w
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g'\"" |
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

au User lsp_setup call lsp#register_server({
  \ 'name': 'Rust Language Server',
  \ 'cmd': {server_info->[expand('$HOME/.local/bin/rust-analyzer')]},
  \ 'whitelist': ['rust'],
  \ 'initialization_options': {
    \ 'check': {
      \ 'command': 'clippy',
      \ 'extraArgs': ['--', '-W', 'clippy::pedantic']},
    \ },
  \ })

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

aug filetype_rust
  au!
  au FileType rust nnoremap <F5> :w<CR>:!cargo run %<CR>
  au FileType rust inoremap <F5> <Esc>:w<CR>:!cargo run %<CR>
aug END

aug filetype_c_cpp
  au!
  au FileType c,cpp setlocal tabstop=2 shiftwidth=2 expandtab
  au FileType c,cpp nnoremap <F5> :w<CR>:make SRC=%<CR>
  au FileType c,cpp inoremap <F5> <Esc>:w<CR>:make SRC=%<CR>
  au FileType c,cpp setlocal commentstring=//\ %s
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

### PlugInstall

```zsh
$ vi
:PlugInstall
:q!

$ vi foo.md
:LspInstallServer
:LspStatus
:q!

$ vi foo.go
:LspInstallServer
:LspStatus
:q!

$ vi foo.py
:LspInstallServer
:LspStatus
:q!
```

<!--
$ sudo apt install python3-venv

$ vi foo.py
:LspInstallServer
:LspStatus
:q!

$ vi foo.cpp
:LspStatus
:q!
-->

## CTF

```zsh
mkdir -p ~/CTF/bin
```

```bash
sudo apt install 7zip bat bind9-dnsutils build-essential cmake docker-compose \
  gcc-multilib gdb gdbserver gobuster hashcat hexer jq libimage-exiftool-perl \
  libxml2-utils ltrace nasm ncal nmap openvpn poppler-utils python3-venv qpdf \
  socat sqlite3 sqlmap strace tcpdump tshark unzip w3m wabt wireshark z80dasm \
  zip
```

```zsh
cd ~/CTF
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ~
echo "set follow-fork-mode parent" >>~/.gdbinit
```

<!--
### pwndbg (pwndbg でなく gdb-peda を使用する場合)

```bash
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
```
-->

```zsh
python3 -m venv ~/CTF/myenv
source ~/CTF/myenv/bin/activate
pip3 install -U Flask flask-unsign gmpy2 pwntools pycryptodome pyshark \
  pyzipper randcrack ropper scapy sympy tqdm z3-solver \
  git+https://github.com/RsaCtfTool/RsaCtfTool
```

### gobuster / hashcat 用のワードリスト

```zsh
cd ~/CTF
curl -LO \
  https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/common.txt
curl -LO https://raw.githubusercontent.com/zacheller/rockyou/master/rockyou.txt.tar.gz
tar xvzf rockyou.txt.tar.gz
rm rockyou.txt.tar.gz
```

### Chromium, Firefox

```zsh
sudo snap install chromium
sudo snap install firefox
sudo apt install fonts-noto-cjk
```

### Ghidra

- https://github.com/NationalSecurityAgency/ghidra

```zsh
sudo apt install openjdk-21-jdk
curl -LO https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_12.0.3_build/ghidra_12.0.3_PUBLIC_20260210.zip
unzip ./ghidra_12.0.3_PUBLIC_20260210.zip -d ~/CTF
ln -s ~/CTF/ghidra_12.0.3_PUBLIC/ghidraRun ~/CTF/bin/ghidra
```

### IDA Free

- https://hex-rays.com/ida-free

```zsh
sudo apt install libxcb-icccm4 libxcb-image0 libxcb-keysyms1 \
  libxcb-render-util0 libxcb-shape0 libxcb-xinerama0 libxcb-xkb1 \
  libxkbcommon-x11-0
chmod +x ./ida-free-pc_91_x64linux.run
./ida-free-pc_91_x64linux.run
## Installation Directory: /home/yutaka/CTF/ida-free-pc-9.1
mv ~/idafree_XX-XXXX-XXXX-XX.hexlic ~/CTF/ida-free-pc-9.1
ln -s ~/CTF/ida-free-pc-9.1/ida ~/CTF/bin
```

#### IDA Free 8.4 (IDA Free 9.x でなく IDA Free 8.4 を使用する場合)

```bash
cull -LO https://out7.hex-rays.com/files/idafree84_linux.run
chmod +x idafree84_linux.run
./idafree84_linux.run
rm ./idafree84_linux.run
## メッセージを見て足りないライブラリをインストールする
QT_DEBUG_PLUGINS=1 ~/idafree-8.4/ida64
sudo apt install libxcb-icccm4 libxcb-image0 libxcb-keysyms1 \
  libxcb-render-util0 libxcb-xinerama0 libxcb-xkb1 libxkbcommon-x11-0
ln -s ~/CTF/idafree84_linux.run ~/CTF/bin/ida
```

### Burp Suite Community Edition

- https://portswigger.net/burp/communitydownload

```zsh
cd ~/CTF
curl -L https://portswigger.net/burp/releases/download?product=community&version=2026.1.4&type=Linux -o burpsuite_community_linux.sh
chmod +x burpsuite_community_linux.sh
./burpsuite_community_linux.sh
```

- Select Destination Directory: /home/USER/CTF/BurpSuiteCommunity
- Select Directory for Symlinks: Create symlinks のチェックを外す

```zsh
ln -s ~/CTF/BurpSuiteCommunity/BurpSuiteCommunity ~/CTF/bin/burp
```

### bkcrack

```zsh
cd ~/CTF
curl -LO https://github.com/kimci86/bkcrack/releases/download/v1.8.1/bkcrack-1.8.1-Linux-x86_64.tar.gz
tar xvzf bkcrack-1.8.1-Linux-x86_64.tar.gz
ln -s ~/CTF/bkcrack-1.8.1-Linux-x86_64/bkcrack ~/CTF/bin
```

### UPX

- https://github.com/upx/upx/releases/

```zsh
cd ~/CTF
curl -LO https://github.com/upx/upx/releases/download/v5.1.0/upx-5.1.0-amd64_linux.tar.xz
tar xJf upx-5.1.0-amd64_linux.tar.xz
ln -s ~/CTF/upx-5.1.0-amd64_linux/upx ~/CTF/bin
```

### JADX

- https://github.com/skylot/jadx/releases/

```zsh
cd ~/CTF
curl -LO https://github.com/skylot/jadx/releases/download/v1.5.4/jadx-1.5.4.zip
unzip jadx-1.5.4.zip -d jadx-1.5.4
chmod +x jadx-1.5.4/bin/{jadx,jadx-gui}
ln -s ~/CTF/jadx-1.5.4/bin/jadx ~/CTF/bin
ln -s ~/CTF/jadx-1.5.4/bin/jadx-gui ~/CTF/bin
```

### ~/CTF/aliases.sh

```zsh
alias angr='sudo docker run -it --rm -v $PWD:/local angr/angr'
alias c='curl -LO'
alias ckp='source ~/CTF/checkpwn.sh'
alias g='grep -Rin'
alias gdb='gdb -q'
alias mkd='mydir=$(printf %02d $(($(ls -d [0-9][0-9]|tail -1)+1)))&&mkdir $mydir&&cd $mydir' # Zsh-only
alias myenv='source ~/CTF/myenv/bin/activate'
alias q='vi Question.txt'
alias w='vi Writeup.md'
clip() { iconv -t utf16le "$@" | clip.exe }
case ":$PATH:" in
	*":/snap/bin:"*) ;;
	*) export PATH="$PATH:/snap/bin" ;;
esac
case ":$PATH:" in
	*":$HOME/CTF/bin:"*) ;;
	*) export PATH="$PATH:$HOME/CTF/bin" ;;
esac
myenv
```

### ~/CTF/checkpwn.sh

```zsh
f="${1:-chall}"
(strings -n 5 $f; strings -n 5 -el $f)|sort -u >strings.output
checksec $f >checksec.output 2>&1
file $f >file.output
hexdump -C $f >hexdump.output
nm $f >nm.output
objdump -DCM intel $f >objdump.output
pwn template $f >solver.py.output
readelf -SW $f >sections.output
readelf -r $f >relocs.output
readelf -sW $f >syms.output
strings -tx $f >strings-tx.output
```

## Golang

- https://go.dev/doc/install

```zsh
curl -LO https://go.dev/dl/go1.26.2.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.26.2.linux-amd64.tar.gz
```

- ~/.zshrc

```zsh
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/bin
```

```zsh
go install github.com/air-verse/air@latest
go install github.com/fatih/gomodifytags@latest
go install github.com/josharian/impl@latest
go install github.com/peco/peco/cmd/peco@latest
go install github.com/tc-hib/go-winres@latest
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/stringer@latest
```

## Rust

- https://rust-lang.org/ja/tools/install/
- https://rust-analyzer.github.io/book/installation.html
- https://rust-analyzer.github.io/book/rust_analyzer_binary.html
- https://rust-analyzer.github.io/book/other_editors.html#vim-lsp
- https://rust-analyzer.github.io/book/configuration.html#check.command
- https://doc.rust-lang.org/clippy/

```zsh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"
rustup update
mkdir -p ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer
rustup component add rust-src
```

## VSCode 拡張

VSCode を起動して、以下の拡張をインストールする。

- [Japanese Language Pack for Visual Studio Code (microsoft.com)](https://marketplace.visualstudio.com/items/?itemName=MS-CEINTL.vscode-language-pack-ja)
- [Vim (vscodevim)](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)
- [Remote Development (microsoft.com)](https://marketplace.visualstudio.com/items/?itemName=ms-vscode-remote.vscode-remote-extensionpack)
- [Go (go.dev)](https://marketplace.visualstudio.com/items/?itemName=golang.Go)
  - CTRL+SHIFT+P: Go: Install/Update Tools
- [JSON to Go (Mario Petričko)](https://marketplace.visualstudio.com/items?itemName=maracko.json-to-go)
- [PowerShell (microsoft.com)](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
- [Markdown Preview Enhanced](https://marketplace.visualstudio.com/items/?itemName=shd101wyy.markdown-preview-enhanced)
- [markdownlint](https://marketplace.visualstudio.com/items/?itemName=DavidAnson.vscode-markdownlint)
- [Live Sass Compiler](https://marketplace.visualstudio.com/items?itemName=glenn2223.live-sass)
- [Python (microsoft.com)](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Black Formatter (microsoft.com)](https://marketplace.visualstudio.com/items?itemName=ms-python.black-formatter)
- [rust-analyzer (The Rust Programming Language)](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)
- [CodeLLDB (Vadim Chugunov)](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb)

## Node.js

```zsh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
source ~/.zshrc
nvm install --lts
```

<!--
```zsh
nvm ls
node --version
npm --version 
```
-->

## sshd

```bash
sudo apt install openssh-server
sudo /etc/init.d/ssh start
```

<!--
## Podman (Docker でなく Podman を使用する場合)

```bash
$ sudo apt install podman -y
```
-->

# ネットワークからの接続を許可する

- https://learn.microsoft.com/ja-jp/windows/wsl/networking?WT.mc_id=AZ-MVP-4021785#default-networking-mode-nat

- 管理者として実行する

```pwsh
## アドレスを調べておく
$wslip=(wsl hostname -I).split(' ')[0]
$port=3000
netsh int portproxy add v4tov4 listenport=$port listenaddress=0.0.0.0 connectport=$port connectaddr=$wslip
New-NetFirewallRule -DisplayName "TCP_$port" -Protocol TCP -LocalPort $port -Action Allow
```

- 削除

```pwsh
netsh int portproxy del v4tov4 listenport=$port listenaddress=0.0.0.0
Remove-NetFirewallRule -DisplayName "TCP_$port"
```

# ミラーモード

- https://learn.microsoft.com/ja-jp/windows/wsl/networking

## `C:\Users\USER\.wslconfig`

```bash
vi /mnt/c/Users/USER/.wslconfig
```

```ini
[wsl2]
networkingMode=mirrored
```

## WSL2 を停止して、再起動

```pwsh
wsl --shutdown
```

## Hyper-V Firewall Rule

- PowerShell (管理者)

```pwsh
Set-NetFirewallHyperVVMSetting -Name '{40E0AC32-46A5-438A-A0B2-2B479E8F2E90}' -DefaultInboundAction Allow
```

# Windows Terminal の設定

- Ctrl + V の無効化: 設定 > ⌨ 操作 > 貼り付け > Ctrl + V: 設定を🗑️をクリックして消す
- ビープ音を消す: 設定 > 規定値 > 詳細設定 > ベル通知スタイル > 音によるチャイム: チェックを外す

- https://learn.microsoft.com/ja-jp/windows/wsl/setup/environment
