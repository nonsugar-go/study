# Kali Linux

## インストール

- https://www.kali.org/get-kali/#kali-platforms

### ESXi にインストールする例

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
```
