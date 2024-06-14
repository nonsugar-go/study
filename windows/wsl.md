# WSL
# インストール
- https://learn.microsoft.com/ja-jp/windows/wsl/install
## Windows 11
PowerShell \[管理者モード]
```pwsh
PS> wsl -l --online
PS> wsl --install
PS> wsl -l -v
```
(再起動)
# 使い方
- コマンド プロンプトで wsl を実行するとコンソール接続できる。
- wsl -u root で root ユーザーでログインできる
- /mnt/c/ で C:\ ドライブに接続できる。
- Windows からは \\wsl$ で wsl 側のファイルシステムにアクセスできる

# 初期設定
## 設定ファイル
- https://superuser.com/questions/1284561/why-is-vim-starting-in-replace-mode

```bash
$ echo 'set t_u7=' > ~/.vimrc        ## Windows 10 の場合のみ
$ echo 'setw -g mode-keys vi' > ~/.tmux.conf
$ echo "export PS1='\\u@\\h:\\W\\$ '" >>~/.bash_profile
```
## sshd
```bash
$ sudo apt update -y && sudo apt upgrade -y
$ sudo apt install openssh-server -y
$ sudo /etc/init.d/ssh start
```
//** GDB
//- [[Programming/GDB]]
//- https://github.com/microsoft/WSL/issues/8516
//- https://launchpad.net/~ubuntu-support-team/+archive/ubuntu/gdb
//
// $ sudo add-apt-repository ppa:ubuntu-support-team/gdb
// $ sudo apt update
// $ sudo apt-get install gdb
## その他のパッケージ
```bash
$ sudo apt install unzip plocate gdb gdbserver nasm python3-z3 python3-scapy python3-pip \
  ltrace socat docker-compose bat -y
$ sudo pip3 install -U pwntools
$ sudo pip3 install -U ropper
$ git clone https://github.com/longld/peda.git ~/peda
$ echo "source ~/peda/peda.py" >> ~/.gdbinit
```
//* 32bit 環境
//- [[Ubuntu 14.04 64bit で 32bit アプリを動作させる方法 - 明日にはでっかい太陽が昇るかもしれません。>https://agekuno.hatenablog.com/entry/2014/10/22/190712]]

//* ネットワークからの接続を許可する
//- 管理者として実行する
// netsh interface portproxy add v4tov4 listenport=4444 listenaddress=0.0.0.0 connectport=4444 connectaddress=(wsl hostname -I)
# Podman
```bash
$ sudo apt install podman -y
```