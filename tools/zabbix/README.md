# Zabbix

## Install

- https://www.zabbix.com/documentation/current/jp/manual/installation

### 環境

- https://www.zabbix.com/download?zabbix=7.4&os_distribution=ubuntu&os_version=24.04&components=server_frontend_agent_2&db=mysql&ws=nginx
- Zabbix: 7.4
- OS: Ubuntu 24.04 Noble (amd64)
- Zabbix component: Server, Frontend, Agent 2
- Database: MySQL
- Web server: Nginx

### Intall Ubuntu 24.04 LTS

#### Create Virtual Machine

- CPU: 2 Core
- Memory: 2 GB
- HDD: 16 GB (Thin)

#### Install Ubuntu 24.04 LTS

- GNU GRUB: Try or Install Ubuntu Server
- Select your language: English
- Keyboard configuration: **Japanse** / **Japanese - Japanese (OADG 109A)**
- Choose the type of installation:
  - (X) Ubuntu Server
  - ( ) Ubuntu Server (minimized)
  - [ ] Search for third-party drivers
- Network configuraiton
  - ens160:
    - IPv4 Configuration:
      - IPv4 Method: **Manual**
      - Subnet: **192.168.1.0/24**
      - Address: **192.168.1.35**
      - Gateway: **192.168.1.1**
      - Name servers: **1.1.1.1, 8.8.8.8**
      - Search domains: **example.test**
- Proxy configuration: (blank)
- Ubuntu archive mirror configuration: [Done]
- Installer update available: Continue without updating
- Guided storage configuration:
  - (X) Use an entire disk
    - [X] Set up the disk as an LVM group
      [ ] Encrypt the LVM group with LUKS
  - ( ) Custom storage layout
- Storage configuration: [Done]
  - Confirm destructive action: [Continue]
- Prifile configuraiton:
  - Your name: user1
  - Your servers name: zb1
  - Pick a username: (Any)
  - Choose a password: (Any)
- Upgrade to Ubuntu Pro:
  - ( ) Enable Ubuntu Pro
  - (X) Skip for now
- SSH configuration:
  - [X] **Install OpenSSH server**
  - [X] Allow password authentication over SSH
- Featured server snaps: (None)
- Installation complete!: **[reboot now]**

```
$ tmux
$ sudo apt update && sudo apt upgrade -y
$ sudo hostnamectl hostname zb1.example.test
$ sudo cp -p /etc/hosts{,.orig}

$ sudo vi /etc/hosts
127.0.0.1 localhost
127.0.1.1 zb1.example.test zb1
 (snip)
```

```bash
$ sudo wget https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest_7.4+ubuntu24.04_all.deb
$ sudo dpkg -i zabbix-release_latest_7.4+ubuntu24.04_all.deb
$ sudo apt update
$ sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-nginx-conf zabbix-sql-scripts zabbix-agent2
$ sudo apt install mysql-server nginx
$ sudo systemctl enable --now mysql
$ sudo systemctl enable --now nginx

$ sudo mysql -uroot
mysql> create database zabbix character set utf8mb4 collate utf8mb4_bin;
mysql> create user zabbix@localhost identified by 'password';
mysql> grant all privileges on zabbix.* to zabbix@localhost;
mysql> set global log_bin_trust_function_creators = 1;
mysql> quit;

$ zcat /usr/share/zabbix/sql-scripts/mysql/server.sql.gz | sudo mysql --default-character-set=utf8mb4 -uzabbix -ppassword zabbix

$ sudo mysql -uroot
mysql> set global log_bin_trust_function_creators = 0;
mysql> quit;

$ sudo cp -a /etc/zabbix{,.orig}
$ sudo cp -p /etc/zabbix/zabbix_server.conf{,.orig}

$ sudo vi /etc/zabbix/zabbix_server.conf
 (snip)
DBPassword=password
 (snip)

$ sudo cp -p /etc/zabbix/nginx.conf{,.orig}

$ sudo vi /etc/zabbix/nginx.conf
 (snip)
        listen          8080;
        server_name     zb1.example.test;
 (snip)

$ sudo systemctl restart zabbix-server zabbix-agent2 nginx php8.3-fpm
$ sudo systemctl enable zabbix-server zabbix-agent2 nginx php8.3-fpm
```

#### Zabbix UI web page

- http://<zb1>:8080/
