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
## zsh
- [zsh](/linux/zsh.md)
```bash
sudo apt install zsh -y
chsh -s /bin/zsh
```
- 初回ログイン時の `zsh-newuser-install` の問いには、`(0)  Exit, creating the file ~/.zshrc containing just a comment.` を選択
### ~/.zshrc
```zsh
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias bat="batcat"

export PATH=$PATH:/usr/local/go/bin
```
- 下記の行を変更
```
plugins=(git python web-search z)
```
## neovim
```
% sudo apt install neovim -y
```

- [NeoVim](/tools/vim/neovim.md)
## プラグイン
- https://github.com/junegunn/vim-plug
- https://github.com/mattn/vim-maketable
- https://github.com/tpope/vim-commentary
- https://github.com/mattn/vim-lsp-settings

```
```
## CTF で使用できるパッケージ
```bash
$ sudo apt update && sudo apt upgrade -y
$ sudo apt install unzip plocate gdb gcc-multilib gdbserver nasm \
  python3-pycryptodome python3-z3 python3-scapy python3-pip \
  ltrace socat docker-compose w3m hexer bat peco -y
$ sudo pip3 install -U pwntools
$ sudo pip3 install -U ropper
$ git clone https://github.com/pwndbg/pwndbg
$ cd pwndbg
$ ./setup.sh
```
### pwndbg (pwndbg でなく gdb-peda を使用する場合)
```bash
$ git clone https://github.com/longld/peda.git ~/peda
$ echo "source ~/peda/peda.py" >> ~/.gdbinit
```
### IDA
- https://hex-rays.com/ida-free/#download

```bash
cull -LO https://out7.hex-rays.com/files/idafree84_linux.run
chmod +x idafree84_linux.run
./idafree84_linux.run
rm ./idafree84_linux.run
## メッセージを見て足りないライブラリをインストールする
QT_DEBUG_PLUGINS=1 ~/idafree-8.4/ida64
sudo apt install libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-render-util0 libxcb-xinerama0 libxcb-xkb1 libxkbcommon-x11-0
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

## Golang
```bash
sudo apt install golang -y
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
# Windows Terminal の設定
- Ctrl + V の無効化: 設定 > ⌨ 操作 > 貼り付け > Ctrl + V: 設定を🗑️をクリックして消す
- ビープ音を消す: 設定 > 規定値 > 詳細設定 > ベル通知スタイル > 音によるチャイム: チェックを外す

- https://learn.microsoft.com/ja-jp/windows/wsl/setup/environment
