# CentOS

## CentOS 7 の CD-ROM を `yum` のリポジトリに設定する
```bash
$ sudo mkdir /mnt/cdrom
$ sudo mount /dev/cdrom /mnt/cdrom
$ cd /etc/yum.repos.d
$ sudo CentOS-Media.repo cdrom.repo
$ sudo vi cdrom.repo
```

- [/etc/yum.repos.d/cdrom.repo]
```bash
[cdrom]
name=CentOS-$releasever - Media
baseurl=file:///mnt/cdrom/
gpgcheck=0
enabled=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
```

```bash
$ sudo yum update
```

😃
