# Alpine + Xfce

- https://wiki.alpinelinux.org/wiki/Install_Alpine_on_VMware_ESXi

検証用に軽量 Linux をインストールします。

1. Alpine のインストーラー (Virtual, x86_64) をダウンロードします。[alpinelinux.org](https://alpinelinux.org/downloads/)
2. 仮想マシンの作成
   - Name: CPAL1
   - Type: その他の Linux 5.x 以降 (64 ビット)
   - CPU: 1 Core
   - Memory: 1024 MB
   - HDD: 16 GB (Thin Provisioning)
   - NIC: 1つ (VMXNET3)
   - DVD: alpine-virt-*.*.*-x86_64.iso
   - Firmware: BIOS
3. 仮想マシンの電源を入れて、インストーラーを起動
   1. login: root (パスワードなし)
   2. `setup-alpine`
      - Keymap：jp / jp-OADG109A
      - Hostname：CPAP1（任意）
      - Which one do you want to initialize?：eth0
      - Ip address for eth0?: dhcp
      - Do you want to do any manual network configuration?: n
      - Root Password: Lab@12345 (任意)
      - Timezone：Asia/Tokyo
      - Proxy: none
      - Network Time Protocol: busybox
      - APK Mirror: 1
      - Setup a user?: user1
      - Full name for user user1: user1
      - New password: Lab@12345 (任意)
      - Enter ssh key or URL for user1: none
      - Which ssh server?: openssh
      - Which disk(s) would you like to use?: sda
      - How would you like to use it? sys
      - Erase the above disk(s) and continue?: y
   4. `reboot` コマンドで、再起動 (再起動後、ISO を外す)
   5. 再起動後、root でログイン
      ```bash
      CPAP1:~# setup-desktop
      Which desktop environment?: xfce
      CPAP1:~# apk add open-vm-tools sudo font-noto-cjk
      CPAP1:~# apk cache purge
      CPAP1:~# rc-service open-vm-tools start
      CPAP1:~# rc-update add open-vm-tools
      CPAP1:~# sed -i.orig 's/^# %wheel/%wheel/' /etc/sudoers
      CPAP1:~# reboot
      ```
   6. GUI にログイン (英語キーボードで認識されている場合 `@` は、Shift + 2 なので注意)
 
