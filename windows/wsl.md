# WSL
# インストール
- https://learn.microsoft.com/ja-jp/windows/wsl/install
## ESXi 仮想マシンで動かす場合
- ビデオカード > 3D グラフィックス: 3D サポートを有効化: [x]
## Windows 11
PowerShell \[管理者モード]
```pwsh
PS> wsl -l --online
PS> wsl --install
PS> wsl -l -v
```
(再起動)
```bash
Enter new UNIX username: USERNAME
New password: PASSWORD
```
# 使い方
- コマンド プロンプトで wsl を実行するとコンソール接続できる。
- [ファイル名を指定して実行] > [wsl] もしくは [ファイル名を指定して実行] > [ubuntu] で接続できる。
- wsl -u root で root ユーザーでログインできる
- /mnt/c/ で C:\ ドライブに接続できる。
- Windows からは `\\wsl$\Ubuntu\` で wsl 側のファイルシステムにアクセスできる

# 初期設定
## 設定ファイル
- https://superuser.com/questions/1284561/why-is-vim-starting-in-replace-mode

```bash
$ echo "PS1='\[\e[32m\]\u@\[\e[36m\]WSL \[\e[33m\]\w\[\e[0m\]\n\\$ '" >>~/.bash_profile
```
### ~/.tmux.conf
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
$ USERPROFILE=/mnt/c/Users/$(cmd.exe /c echo %USERNAME% | tr -d '\r')
$ ln -s $USERPROFILE/Desktop .
$ ln -s $USERPROFILE/Documents .
$ ln -s $USERPROFILE/Downloads .
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
$ sudo apt install zsh -y
$ chsh -s /bin/zsh
```
- 初回ログイン時の `zsh-newuser-install` の問いには、`(0)  Exit, creating the file ~/.zshrc containing just a comment.` を選択
### ~/.zshrc
```zsh
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
```
## neovim
```
% sudo apt install neovim -y
```

- [NeoVim](/tools/vim/neovim.md)
## CTF で使用できるパッケージ
```bash
$ sudo apt update && sudo apt upgrade -y
$ sudo apt install unzip plocate gdb gcc-multilib gdbserver nasm \
  python3-pycryptodome python3-z3 python3-scapy python3-pip \
  ltrace socat docker-compose w3m bat peco -y
$ sudo pip3 install -U pwntools
$ sudo pip3 install -U ropper
$ git clone https://github.com/pwndbg/pwndbg
$ cd pwndbg
$ ./setup.sh
```
## pwndbg (pwndbg でなく gdb-peda を使用する場合)
```bash
$ git clone https://github.com/longld/peda.git ~/peda
$ echo "source ~/peda/peda.py" >> ~/.gdbinit
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
wsl hostname -I
netsh int portproxy add v4tov4 listenport=3000 listenaddress=0.0.0.0 connectport=3000 connectaddr=172.21.42.164
```
- 削除
```pwsh
netsh int portproxy del v4tov4 listenport=3000 listenaddress=0.0.0.0
```
# Windows Terminal の設定
- Ctrl + V の無効化: 設定 > ⌨ 操作 > 貼り付け > Ctrl + V: 設定を🗑️をクリックして消す
- ビープ音を消す: 設定 > 規定値 > 詳細設定 > ベル通知スタイル > 音によるチャイム: チェックを外す

- https://learn.microsoft.com/ja-jp/windows/wsl/setup/environment
