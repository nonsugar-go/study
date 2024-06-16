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
## CTF で使用できるパッケージ
```bash
$ sudo apt update -y && sudo apt upgrade -y
$ sudo apt install unzip plocate gdb gdbserver nasm python3-z3 python3-scapy python3-pip \
  ltrace socat docker-compose bat -y
$ sudo pip3 install -U pwntools
$ sudo pip3 install -U ropper
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
## GDB
- https://github.com/microsoft/WSL/issues/8516
- https://launchpad.net/~ubuntu-support-team/+archive/ubuntu/gdb
```bash
$ sudo add-apt-repository ppa:ubuntu-support-team/gdb
$ sudo apt update
$ sudo apt-get install gdb
```
## 32bit 環境
- [Ubuntu 14.04 64bit で 32bit アプリを動作させる方法 - 明日にはでっかい太陽が昇るかもしれません。](https://agekuno.hatenablog.com/entry/2014/10/22/190712)
## ネットワークからの接続を許可する
- 管理者として実行する
```pwsh
PS> netsh interface portproxy add v4tov4 listenport=4444 listenaddress=0.0.0.0 connectport=4444 connectaddress=(wsl hostname -I)
```

## PyCrypto -> PyCryptodome
```bash
$ sudo apt install python3-pycryptodome
```

```diff
< from Crypto.Util.number import getPrime, isPrime
---
> from Cryptodome.Util.number import getPrime, isPrime
```

- https://stackoverflow.com/questions/58569361/attributeerror-module-time-has-no-attribute-clock-in-python-3-8
