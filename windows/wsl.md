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
$ echo -e 'setw -g mode-keys vi\nset -g prefix F1' > ~/.tmux.conf
$ echo "PS1='\[\e[32m\]\u@\[\e[36m\]WSL \[\e[33m\]\w\[\e[0m\]\n\\$ '" >>~/.bash_profile
```
### ~/.tmux.conf
```
setw -g mode-keys vi
set -g prefix F1
bind-key -n F12 select-pane -P 'bg=colour52,fg=white'
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
```bash
$ sudo apt install zsh -y
$ chsh -s /bin/zsh
```
- 初回ログイン時の `zsh-newuser-install` の問いには、`(0)  Exit, creating the file ~/.zshrc containing just a comment.` を選択
## neovim
```
% sudo apt install neovim -y
```

- (NeoVim)[tools/vim/neovim.md]
## CTF で使用できるパッケージ
```bash
$ sudo apt update && sudo apt upgrade -y
$ sudo apt install unzip plocate gdb gcc-multilib gdbserver nasm \
  python3-pycryptodome python3-z3 python3-scapy python3-pip \
  ltrace socat docker-compose bat -y
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
# その他、過去に試行錯誤した内容 (うまくいっていない)
## ネットワークからの接続を許可する
- 管理者として実行する
```pwsh
PS> netsh interface portproxy add v4tov4 listenport=4444 listenaddress=0.0.0.0 connectport=4444 connectaddress=(wsl hostname -I)
```

# Windows Terminal の設定
- Ctrl + V の無効化: 設定 > ⌨ 操作 > 貼り付け > Ctrl + V: 消す
- ビープ音を消す: 設定 > Ubuntu > 詳細設定 > ベル通知スタイル > 音によるチャイム: チェックを外す
- ビープ音を消す: 設定 > Windows PowerShell > 詳細設定 > ベル通知スタイル > 音によるチャイム: チェックを外す
