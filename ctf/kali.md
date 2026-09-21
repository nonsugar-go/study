# Kali Linux

## インストール

- https://www.kali.org/get-kali/#kali-platforms

### ESXi にインストールする例

- インストーラー: Kili Linux 2026.2 x86_64 Installe
  (https://cdimage.kali.org/kali-2026.2/kali-linux-2026.2-installer-amd64.iso)
- ゲスト OS: Linux / その他の Linux 4.x 以降 (64 ビット)
- CPU: 4コア
- Memory: 4GB
- HDD: 40GB (Thin)
- 起動オプション > UEFI セキュア ブートの有効化: OFF

## 初期設定

```zsh
sudo systemctl enable ssh --now
sudo apt install xrdp
sudo systemctl enable xrdp --now
echo 'setw -g mode-keys vi' >~/.tmux.conf
tmux
sudo apt update && sudo apt upgrade -y
cp /usr/share/wordlists/rockyou.txt.gz .
gunzip rockyou.txt.gz
sudo apt install ffmpeg hexer mediainfo pngcheck
```
