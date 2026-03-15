# ラボ環境

- VyOS
  - eth0/Mgmt: DHCP
  - eth1:192.0.2.62/26
  - eth2: 192.0.2.126/26
- CPSMS
  - eth0/Mgmt: 192.168.1.41/24
- CPGW1 (Cluster VIP)
  - eth1/Internal: 192.168.101.1/24
  - eth3/External: 192.0.2.1/26
  - eth4/DMZ: 192.168.102.1/24
- CPGW1A
  - eth0/Mgmt: 192.168.1.42/24
  - eth1/Internal: 192.168.101.2/24
  - eth2/Sync: 192.168.255.1/24
  - eth3/External: 192.0.2.2/26
  - eth4/DMZ: 192.168.102.2/24
- CPGW1B
  - eth0/Mgmt: 192.168.1.43/24
  - eth1/Internal: 192.168.101.3/24
  - eth2/Sync: 192.168.255.2/24
  - eth3/External: 192.0.2.3/26
  - eth4/DMZ: 192.168.102.3/24
- CPGW2
  - eth0/Mgmt: 192.168.1.44/24
  - eth1/Internal: 192.168.202.1/24
  - eth2/External: 192.0.2.65/26

# 構築

## VyOS

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
   set int eth eth0 addr dhcp
   set service ssh
   set system host-name CPLAB-VyOS
   set system time-zone Asia/Tokyo
   set system name-server eth0
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
3. 仮想マシンの作成
   - Name: CPSMS
   - Type: Red Hat Enterprise Linux (64-bit)
   - CPU: 4 Core
   - Memory: 6144 MB
   - HDD: 60 GB (Thin Provisioning)
   - NIC: 5つ (VMXNET3)
   - DVD: Check_Point_R82.10_T464.iso
   - Firmware: BIOS
5. Gaia のインストール
   1. Install Gaia on this system
   2. Keyboard Selection: Japanese
   3. Partitions Configuration
      - System-root (GB): 15
      - Logs (GB): 11
   4. Account Configuration / Password: Lab@12345
   5. Maintenace password / Password: Lab@12345
   6. Management Port: eth0
   7. Management Interface (eth0)
      - IP address: 192.168.1.41
      - Netmask: 255.255.255.0
   8. Press return to quit: `[Enter]`
6. 再起動後、admin でログインする
   ```sh
   set hostname CPSMS
   set interface eth0 ipv4-address 192.168.1.41 mask-length 24
   set interface eth0 comments "Mgmt"
   save config
   halt
   ```

### その他の Check Point 仮想マシンの作成

1. CPSMS を選択し、`[エクスポート]` をクリックする。
2. CPSMS をエクスポートした OVA ファイルをインポートして CPGW1A 用の仮想マシンを作成する。
3. 起動後、admin でログインする。
   ```sh
   set hostname CPGW1A
   set interface eth0 ipv4-address 192.168.1.42 mask-length 24
   set interface eth0 comments "Mgmt"
   save config
   halt
   ```
4. 同様に CPGW1B, GPGW2 用の仮想マシンを作成する。
