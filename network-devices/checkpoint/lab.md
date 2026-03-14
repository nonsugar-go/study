# ラボ環境

1. Check Point UserCenter アカウント作成
   - https://usercenter.checkpoint.com
2. Web サイトへアクセスする
   - [Check Point R81.10: sk170416](https://support.checkpoint.com/results/sk/sk170416)
   - [Check Point R82.10: sk183506](https://support.checkpoint.com/results/sk/sk183506)
3. インストーラーのダウンロード
   - Check Point R81.10: sk170416
     1. Installation > Quantum Security Gateway > Clean Install Image
     2. Installation > Quantum Security Management and Multi-Domain Server > Clean Install Image
     3. Installation > SmartConsole > EXE
   - Check Point R82.10: sk183506
     1. Downloads and Installation > Clean Install of Security Gateway and Management Server > Clean Install Image
     2. Downloads and Installation > SmartConsole > SmartConsole EXE
4. 仮想マシンの作成
   - Type: Red Hat Enterprise Linux (64-bit)
   - CPU: 4 Core
   - Memory: 6144 MB
   - HDD: 60 GB (Thin Provisioning)
   - NIC: 3つ (VMXNET3)
   - Firmware: BIOS
