# ラボ環境

- VyOS
  - eth0/Mgmt: DHCP
  - eth1:192.0.2.63/26
  - eth2: 192.0.2.126/26
- CPGW1 (Cluster VIP)
  - eth0/Internal
  - eth2/External
  - eth3/DMZ
- CPGW1A
- CPGW2B

```
                                  Internet
                                      |
                               +--------------+
                               |     VyOS     |
Mgmt (DHCP) -------------------| eth0         |
                  192.0.2.62 --| eth1         |
                 192.0.2.126 --| eth2         |
                               +------+-------+
                                      |
                          +-----------+-----------+
                          | External Networks     |
                          | 192.0.2.0/26          |
                          | 192.0.2.64/26         |
                          +-----+-------------+---+
                                |             |
                                |             |
                        +-------+--+      +---+-------+
                        |  CPGW1A  |      |  CPGW1B   |
Mgmt        192.168.1.42| eth0     |      | eth0      |192.168.1.43
Sync       192.168.255.1| eth1     |------| eth1      |192.168.255.2
Internal   192.168.101.2| eth2     |      | eth2      |192.168.101.3
External    192.0.2.2   | eth3     |      | eth3      |192.0.2.3
DMZ        192.168.102.2| eth4     |      | eth4      |192.168.102.3
                        +----+-----+      +-----+-----+
                             |                  |
                             |  Cluster VIP     |
                             | 192.168.101.1    |
                             | 192.168.102.1    |
                             | 192.0.2.1        |
                             |
                 +-----------+-----------+
                 | Internal Network      |
                 | 192.168.101.0/24      |
                 +-----------+-----------+
                             |
                  +----------+----------+
                  |                     |
           +------+-------+      +------+-------+
           |   CPSMS      |      |  Client VM   |
           |--------------|      |--------------|
           |192.168.1.41  |      |192.168.101.10|
           +--------------+      +--------------+

                 +-----------------------------+
                 |           DMZ               |
                 |       192.168.102.0/24      |
                 +--------------+--------------+
                                |
                         +------+-------+
                         |  Web Server  |
                         |--------------|
                         |192.168.102.10|
                         +--------------+

                +-------------------------------+
                |            CPGW2              |
                |-------------------------------|
Mgmt            | eth0 192.168.1.44             |
Internal        | eth1 192.168.201.1            |
External        | eth2 192.0.2.65               |
                +---------------+---------------+
                                |
                       192.168.201.0/24
                                |
                         +------+-------+
                         | Test Client  |
                         |192.168.201.10|
                         +--------------+
```

# 構築

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
   3. Partitions Configuration: デフォルト値のままでよい
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
