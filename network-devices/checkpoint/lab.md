# ラボ環境

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
   - Name: SG1
   - Type: Red Hat Enterprise Linux (64-bit)
   - CPU: 4 Core
   - Memory: 6144 MB
   - HDD: 60 GB (Thin Provisioning)
   - NIC: 3つ (VMXNET3)
   - DVD: Check_Point_R82.10_T464.iso
   - Firmware: BIOS
5. Gaia のインストール
   1. Install Gaia on this system
   2. Keyboard Selection: Japanese
   3. Partitions Configuration
      - System-root (GB): 9
      - Logs (GB): 14
   4. Account Configuration / Password: admin@12345
   5. Maintenace password / Password: admin@12345
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
