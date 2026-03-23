# ラボ環境

## CPVYOS (VyOS)

| 名前 | IP Address       | コメント   |
|------|------------------|-----------|
| eth0 | 192.168.1.39/24  | Mgmt      |
| eth1 | 192.0.2.62/26    | External1 |
| eth2 | 192.0.2.126/26   | External2 |

## CPSMS

| 名前 | IP Address       | コメント   |
|------|------------------|-----------|
| eth0 | 192.168.1.41/24  | Mgmt      |

## CPGW1

| 名前 | バーチャル IP     | CPGW1A           | CPGW1B           | コメント   |
|------|------------------|------------------|------------------|-----------|
| eth0 | Private          | 192.168.1.42/24  | 192.168.1.43/24  | Mgmt      |
| eth1 | Sync             | 192.168.255.1/24 | 192.168.255.2/24 | Sync      |
| eth2 | 192.168.101.1/24 | 192.168.101.2/24 | 192.168.101.3/24 | Internal1 |
| eth3 | 192.168.102.1/24 | 192.168.102.2/24 | 192.168.102.3/24 | Internal2 |
| eth4 | 192.0.2.1/26     | 192.0.2.2/26     | 192.0.2.3/26     | External  |
| eth5 | 192.168.111.1/24 | 192.168.111.2/24 | 192.168.111.3/24 | DMZ       |

## CPGW2

| 名前 | IP Address       | コメント   |
|------|------------------|-----------|
| eth0 | 192.168.1.44/24  | Mgmt      |
| eth1 | 192.168.201.1/24 | Internal  |
| eth2 | 192.0.2.65/26    | External  |

# 構築

## CPVYOS (VyOS)

1. 仮想マシンの作成
   - Name: VyOS
   - Type: その他の Linux 5.x 以降 (64 ビット) (VyOS は Debian ベースなので近いものを選ぶ)
   - CPU: 1 Core
   - Memory: 1024 MB
   - HDD: 16 GB (Thin Provisioning)
   - NIC: 3つ (VMXNET3)
   - DVD: vyos-*.*.*-*-rolling-generic-amd64.iso
   - Firmware: BIOS
2. VyOS のインストール
   ```
   vyos login: vyos
   Password: vyos
   $ install image
   $ reboot
   ```
3. 再起動後の設定
   ```
   configure
   set int eth eth0 addr 192.168.1.39/24
   set protocols static route 0.0.0.0/0 next-hop 192.168.1.1
   set service ssh
   set system host-name CPVYOS
   set system time-zone Asia/Tokyo
   set system name-server 8.8.8.8
   set int eth eth1 addr 192.0.2.62/26
   set int eth eth2 addr 192.0.2.126/26
   set nat source rule 100 outbound-interface name eth0
   set nat source rule 100 translation address masquerade
   commit
   save
   exit
   ```

## Check Point

1. Check Point UserCenter アカウント作成
   - https://usercenter.checkpoint.com
2. インストーラーのダウンロード
   - [Check Point R81.10: sk170416](https://support.checkpoint.com/results/sk/sk170416)
     1. Installation > Quantum Security Gateway > Clean Install Image
     2. Installation > Quantum Security Management and Multi-Domain Server > Clean Install Image
     3. Installation > SmartConsole > EXE
   - [Check Point R82.10: sk183506](https://support.checkpoint.com/results/sk/sk183506)
     1. Downloads and Installation > Clean Install of Security Gateway and Management Server > Clean Install Image
     2. Downloads and Installation > SmartConsole > SmartConsole EXE
3. 仮想マシンの作成 (ひな型)
   - Name: CPTMPL
   - Type: Red Hat Enterprise Linux (64-bit)
   - CPU: 4 Core
   - Memory: 8192 MB
   - HDD: 160 GB (Thin Provisioning)
   - NIC: 6つ (VMXNET3)
   - DVD: Check_Point_R82.10_T464.iso
   - Firmware: BIOS
5. Gaia のインストール
   1. Install Gaia on this system
   2. Keyboard Selection: Japanese
   3. Partitions Configuration: (Default)
   4. Account Configuration / Password: Lab@12345
   5. Maintenace password / Password: Lab@12345
   6. Management Port: eth0
   7. Management Interface (eth0)
      - IP address: 192.168.1.40
      - Netmask: 255.255.255.0
   8. Press return to quit: `[Enter]`
6. 再起動後、admin でログインし、共通設定を実施する
   ```sh
   login: admin
   Password: Lab@12345

   set hostname CPTMPL
   set domainname cplab.test
   set interface eth0 ipv4-address 192.168.1.40 mask-length 24
   set interface eth0 comments "Mgmt"
   set expert-password
   Enter new expert password: Lab@12345
   Enter new expert password (again): Lab@12345
   set dns primary 8.8.8.8
   set dns secondary 1.1.1.1
   set dns suffix cplab.test
   set timezone Asia / Tokyo
   delete ntp server address ntp.checkpoint.com
   delete ntp server address ntp2.checkpoint.com
   add ntp server address 192.168.1.39 type server
   add ntp server address ntp.nict.jp type pool
   set ntp active on
   set format date yyyy/mm/dd
   set format netmask length
   add host name CPSMS ipv4-address 192.168.1.41
   add host name CPGW1A ipv4-address 192.168.1.42
   add host name CPGW1B ipv4-address 192.168.1.43
   add host name CPGW2 ipv4-address 192.168.1.44
   save config
   halt
   Are you sure you want to halt?(Y/N)[N]
   y
   ```
### ひな型から Check Point 仮想マシンの作成

1. CPTMPL を選択し、`[エクスポート]` をクリックする
2. CPTMPL をエクスポートした ovf, vmdk ファイルをインポートして CPSMS 用の仮想マシンを作成する
3. 仮想マシンの NIC を適切なネットワークに接続する
4. 起動後、admin でログインし、CPSMS のアドレスを設定する

   **ホスト名 eth0 以外の設定はここでは必須でないが、スナップショットでこの時点に戻せるので、他のインタフェースとデフォルトゲートウェイも設定があれば、設定しておくと良い**
   
   ```sh
   set hostname CPSMS
   set interface eth0 ipv4-address 192.168.1.41 mask-length 24
   set static-route default nexthop gateway address 192.168.1.1 on
   save config
   halt
   ```
5. 同様に CPGW1A 用の仮想マシンを作成する
   ```sh
   set hostname CPGW1A
   set interface eth0 ipv4-address 192.168.1.42 mask-length 24
   set interface eth1 ipv4-address 192.168.255.1 mask-length 24
   set interface eth1 comments "Sync"
   set interface eth2 ipv4-address 192.168.101.2 mask-length 24
   set interface eth2 comments "Internal1"
   set interface eth3 ipv4-address 192.168.102.2 mask-length 24
   set interface eth3 comments "Internal2"
   set interface eth4 ipv4-address 192.0.2.2 mask-length 26
   set interface eth4 comments "External"
   set interface eth5 ipv4-address 192.168.111.2 mask-length 24
   set interface eth5 comments "DMZ"
   set static-route default nexthop gateway address 192.0.2.62 on
   save config
   halt
   ```
6. 同様に CPGW1B 用の仮想マシンを作成する
   ```sh
   set hostname CPGW1B
   set interface eth0 ipv4-address 192.168.1.43 mask-length 24
   set interface eth1 ipv4-address 192.168.255.2 mask-length 24
   set interface eth1 comments "Sync"
   set interface eth2 ipv4-address 192.168.101.3 mask-length 24
   set interface eth2 comments "Internal1"
   set interface eth3 ipv4-address 192.168.102.3 mask-length 24
   set interface eth3 comments "Internal2"
   set interface eth4 ipv4-address 192.0.2.3 mask-length 26
   set interface eth4 comments "External"
   set interface eth5 ipv4-address 192.168.111.3 mask-length 24
   set interface eth5 comments "DMZ"
   set static-route default nexthop gateway address 192.0.2.62 on
   save config
   halt
   ```
7. 同様に CPGW2 用の仮想マシンを作成する
   ```sh
   set hostname CPGW2
   set interface eth0 ipv4-address 192.168.1.44 mask-length 24
   set interface eth1 ipv4-address 192.168.201.1 mask-length 24
   set interface eth1 comments "Internal"
   set interface eth2 ipv4-address 192.0.2.65 mask-length 26
   set interface eth2 comments "External"
   set static-route default nexthop gateway address 192.0.2.126 on
   save config
   halt
   ```
8. 仮想マシン CPSMS, CPGW1A, CPGW1B, CPGW2 のスナップショットを取っておく

   **試用期間が切れたら、この時点に戻って再設定する**
