# Alpine + Xfce + Firefox

検証用に軽量 Linux をインストールします。

1. Alpine のインストーラー (Standard, x86_64) をダウンロードします。[alpinelinux.org](https://alpinelinux.org/downloads/)
2. 仮想マシンの作成
   - Name: CPAL1
   - Type: その他の Linux 5.x 以降 (64 ビット) (VyOS は Debian ベースなので近いものを選ぶ)
   - CPU: 1 Core
   - Memory: 1024 MB
   - HDD: 16 GB (Thin Provisioning)
   - NIC: 1つ (VMXNET3)
   - DVD: alpine-standard-*.*.*-x86_64.iso
   - Firmware: BIOS
