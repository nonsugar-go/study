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
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g'\"" |
	\ endif
autocmd FileType go setlocal tabstop=4 shiftwidth=4 expandtab

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

augroup vimrc_lsp_install
	autocmd!
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
```

### PlugInstall

```zsh
$ vi
:PlugInstall
:q!

$ vi foo.md
:LspInstallServer
:q!

$ vi foo.go
:LspInstallServer
:q!

$ vi foo.py
:LspInstallServer
:q!
```

<!--
$ sudo apt install python3-venv

$ vi foo.py
:LspInstallServer
:q!

$ vi foo.cpp
:q!
-->

## 基本的なパッケージ

```zsh
sudo apt install 7zip bat bind9-dnsutils jq ncal tcpdump unzip w3m
```

## ビルド パッケージなど

```zsh
sudo apt install build-essential sqlite3
```

## Golang

- https://go.dev/doc/install

```zsh
curl -LO https://go.dev/dl/go1.25.3.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.25.3.linux-amd64.tar.gz
```

- ~/.zshrc

```zsh
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/bin
```

```zsh
go install github.com/fatih/gomodifytags@latest
go install github.com/josharian/impl@latest
go install github.com/peco/peco/cmd/peco@latest
go install github.com/tc-hib/go-winres@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/stringer@latest
```

## CTF で使用できるパッケージ

```bash
sudo apt update && sudo apt upgrade -y

sudo apt install unzip plocate gdb gcc-multilib gdbserver nasm wabt \
  python3-venv ltrace strace socat docker-compose w3m hexer bat peco -y

cd ~/CTF
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh
cd ~
echo "set follow-fork-mode parent" >>~/.gdbinit

python3 -m venv ~/CTF/myenv
source ~/CTF/myenv/bin/activate
pip3 install -U pwntools ropper pycryptodome gmpy2 sympy z3-solver scapy
```

### pwndbg (pwndbg でなく gdb-peda を使用する場合)

```bash
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
```

### Ghidra

```zsh
sudo apt install openjdk-21-jdk
curl -LO https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.4.2_build/ghidra_11.4.2_PUBLIC_20250826.zip
unzip ./ghidra_11.4.2_PUBLIC_20250826.zip -d ~/CTF
~/CTF/ghidra_11.4.2_PUBLIC/ghidraRun&
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
~/CTF/ida-free-pc-9.1/ida&
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
```

## Chromium, Firefox

```zsh
sudo snap install chromium
sudo snap install firefox
sudo apt install fonts-noto
```

## sshd

```bash
$ sudo apt install openssh-server -y
$ sudo /etc/init.d/ssh start
```

## Podman (Docker でなく Podman を使用する場合)

```bash
$ sudo apt install podman -y
```

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
