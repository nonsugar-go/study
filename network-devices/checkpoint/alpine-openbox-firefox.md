# Alpine + Openbox + Firefox

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
      - Setup a user?: no
      - Which ssh server?: openssh
      - Allow root ssh login?: yes
      - Enter ssh key or URL for root: none
      - Which disk(s) would you like to use?: sda
      - How would you like to use it? sys
      - Erase the above disk(s) and continue?: y
   4. `reboot` コマンドで、再起動 (再起動後、ISO を外す)
   5. 再起動後、root でログイン
      ```bash
      sed -i 's/^#//g; s%^/%#/%g' /etc/apk/repositories
      apk update
      apk add --no-cache xorg-server xinit xterm \
        xf86-video-vesa xf86-input-libinput xf86-video-vmware xf86-input-vmmouse \
        open-vm-tools openbox tint2 firefox-esr dbus udev
      rc-service open-vm-tools start
      rc-update add open-vm-tools
      rc-service dbus start
      rc-update add dbus
      rc-service udev start
      rc-update add udev
      echo "exec openbox-session" > ~/.xinitrc
      echo "tint2 &" >> ~/.xinitrc
      startx
      CPAP1:~# setup-desktop
      Setup a user? (enter a lower-case loginname, or 'no') [no]
      Which desktop environment? ('gnome', 'plasma', 'xfce', 'mate', 'sway', 'lxqt' or 'none') [none] xfce
      ```
   6. 右クリック > メニューで Firefox の起動が可能
