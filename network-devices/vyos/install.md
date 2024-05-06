# VyOS のインストール
# 概要
- https://docs.vyos.io/ja/latest/configuration/index.html
- [[VyOS nightly builds>https://vyos.net/get/nightly-builds/]]

検証環境構築のためソフトウェア ルータ VyOS を利用しています。
次のような環境で利用している想定で記述しています。
```
                                  :
                                  :  .-[vSwitch0]--------.                 .-[vSW1]----------.
                                  :  |{_Default Network}----eth0[VyOS]eth1----{Trunk}  {V10}----[Other VMs]
                                  :  |   |               |            eth2 |     |       |   |
                                  :  | ======            |            eth3 | ========  ===== |
                                  :  '---|---------------'                 '-----------------'
 {Internet}--(PPPoE)--[UTM]---vmnic0-----'
                                  :
                                  :
             物理ネットワーク<----:---->仮想環境 [VMware ESXi]
```

- ESXi 上に、VyOS (Vyatta) や検証用仮想マシンをインストールします。
- 物理ネットワークは、DHCP でアドレスが割り当てられ、デフォルトゲートウェイとして、インターネットへ接続する [UTM] が指定されます。
- ESXi の仮想スイッチ vSwitch0 のポート グループ \_Default Network は、物理アダプタ (vmnic0) で物理ネットワークに繋がっている構成である。
- ESXi の仮想スイッチ vSW1 のセキュリティ (無差別モード・MAC アドレス変更・偽装転送) は、[承諾] にする。
- ESXi の vSW1 でポート グループの VLAN ID に 4095 を振り、Trunk を作成している。

# インストール
## LIVE CD (iso ファイル) からのインストール
0. [[VyOS nightly builds>https://vyos.net/get/nightly-builds/]] から、''vyos-1.5-rolling-YYYYMMDDhhmm-amd64.iso'' をダウンロードします。
0. VMware ESXi での仮想マシン作成例
    - ゲスト OS タイプ: その他の Linux 5.x 以降 (64 ビット)
    (VyOS は Debian ベースなので近いものを選ぶ)
    - [仮想ハードウェア] タブ
        -- CPU: 1
        -- メモリ: 1024MB (シンプル構成なら、512MBでも可能)
        -- ハードディスク1: 16GB (シン プロビジョニング) (シンプル構成なら 2GB でも可能)
        -- ネットワーク アダプタ 1: \_Default Network
        -- ネットワーク アダプタ 2 (ネットワーク アダプタの追加): Trunk
        -- ネットワーク アダプタ 3 (ネットワーク アダプタの追加): Trunk
        -- ネットワーク アダプタ 4 (ネットワーク アダプタの追加): Trunk
        -- CD/DVD ドライブ1: vyos-1.5-rolling-YYYYMMDDhhmm-amd64.iso
    - [仮想マシン オプション]
        -- 起動オプション > ファームウェア: BIOS
0. live CD で起動し、ログイン (id: vyos, passwd: vyos)
```bash
$ install image
## 以下の選択肢以外は既定値 (enter) で進める。
## Would you like to continue? (y/N): y
## Please enter a password for the "vyos" user: vyos
## Please confirm password for the "vyos" user: vyos
## Installation will delete all data on the drive. Continue? [y/N] y
```
+ 再起動
```bash
$ reboot
## Are you sure you want to reboot this system? [y/N] y
```
0. CD/DVD を抜く。(アクション > 設定の編集 > CD/DVD ドライブ: ホスト デバイス, [接続] のチェックを外す)
0. HDD からブートしたら、vyos ユーザでログインし、初期設定を実施します。

## 仮想マシン複製時の注意
仮想マシンのイメージを複製して使用する場合、MAC アドレスが変更されます。
起動時に読み込む設定ファイル (/config/config.boot) から、hw-id の行を削除しておいてから複製すると良いです。

- ssh を vrf Mgmt-intf にする場合

```bash
$ conf

set vrf name mgmt table 65535
set int eth eth0 addr dhcp
set int eth eth0 vrf mgmt
set service ssh vrf mgmt
set vrf name mgmt pr st route 0.0.0.0/0 dhcp eth0
set system time-zone Asia/Tokyo

# commit
# save
# exit
```

- ssh を vrf default にする場合
```bash
$ conf

set int eth eth0 addr dhcp
set service ssh
set system name-server eth0
set system time-zone Asia/Tokyo

# commit
# save
# exit
```

- hw-id をコンフィグから削除して停止
```
$ sed -i '/ hw-id /d' /config/config.boot
$ rm .bash_history
$ poweroff
```

## 更新
+ [[VyOS nightly builds>https://vyos.net/get/nightly-builds/]] から、''vyos-1.5-rolling-YYYYMMDDhhmm-amd64.iso'' のリンクを確認しておきます。(wget の引数で指定する URL となります。)

```
$ sh ver ## 現状のバージョン確認
$ wget https://github.com/vyos/vyos-rolling-nightly-builds/releases/download/1.5-rolling-YYYYMMDDhhmm/vyos-1.5-rolling-YYYYMMDDhhmm-amd64.iso
$ add system image vyos-1.5-rolling-YYYYMMDDhhmm-amd64.iso
$ rm vyos-1.5-rolling-YYYYMMDDhhmm-amd64.iso
$ reboot
$ sh system image ## イメージ確認
$ delete system image ## ディスクの空き容量を確保するため、使用していないバージョンのイメージを削除
```

## 初期化
```
$ configure
# load /opt/vyatta/etc/config.boot.default
# commit
# save
# exit
$ reboot
```

