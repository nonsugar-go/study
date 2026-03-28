# Alpine + Openbox + Firefox

- https://wiki.alpinelinux.org/wiki/Install_Alpine_on_VMware_ESXi

検証用に軽量 Linux をインストールします。

1. Alpine のインストーラー (Standard, x86_64) をダウンロードします。[alpinelinux.org](https://alpinelinux.org/downloads/)
2. 仮想マシンの作成
   - Name: CPAL1
   - Type: その他の Linux 5.x 以降 (64 ビット)
   - CPU: 1 Core
   - Memory: 1024 MB
   - HDD: 16 GB (Thin Provisioning)
   - SCSI コントローラ: LSI Logic Parallel
   - NIC: 1つ (VMXNET3)
   - DVD: alpine-standard-*.*.*-x86_64.iso
   - Firmware: BIOS
3. 仮想マシンの電源を入れて、インストーラーを起動
   1. login: root (パスワードなし)
   2. `setup-alpine`
      - Keymap：jp / jp-OADG109A
      - Hostname：CPAP1（任意）
      - Interface：eth0 / dhcp
      - Root Password: Lab@12345 (任意)
      - Timezone：Asia/Tokyo
      - Proxy: none
      - Network Time Protocol: busybox
      - APK Mirror: f
      - Setup a user?: no
      - Which ssh server?: openssh
      - Allow root ssh login?: yes
      - Enter ssh key or URL for root: none
      - Which disk(s) would you like to use?: sda
      - How would you like to use it? sys
      - Erase the above disk(s) and continue?: y
   4. `reboot` を入力して再起動 (再起動後、ISO を外す)
   5. 再起動後、root でログイン
      ```bash
      apk update
      apk add xorg-server open-vm-tools xf86-video-vesa xf86-input-libinput openbox obconf tint2 firefox-esr dbus
      setup-xorg-base
      rc-service open-vm-tools start
      rc-update add open-vm-tools
      rc-service dbus start
      rc-update add dbus
      echo "exec openbox-session" > ~/.xinitrc
      echo "tint2 &" >> ~/.xinitrc
      startx
      ```
   6. 右クリック > メニューで Firefox の起動が可能
