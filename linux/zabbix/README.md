# Zabbix
- https://www.zabbix.com/download?zabbix=7.0&os_distribution=red_hat_enterprise_linux&os_version=9&components=server_frontend_agent&db=mysql&ws=apache
- [Zabbix7.0 LTSをRHEL9にインストールする #zabbix7.0LTS - Qiita](https://qiita.com/mi_h/items/70e5d85838891850890d)
# Zabbix 7.0 LTS をインストールする
## OS バージョン確認
```bash
$ cat /etc/redhat-release
Red Hat Enterprise Linux release 9.5 (Plow)
```
## MariaDB のインストール・設定
```bash
$ sudo dnf install mariadb-server -y

$ rpm -q mariadb
mariadb-10.5.22-1.el9_2.x86_64

$ sudo systemctl enable mariadb --now
$ systemctl status mariadb

$ sudo mariadb-secure-installation
 (snip)
Enter current password for root (enter for none): ↵
 (snip)
Switch to unix_socket authentication [Y/n] n
 (snip)
Change the root password? [Y/n] y
New password: SECRET
Re-enter new password: SECRET
 (snip)
Remove anonymous users? [Y/n] y
 (snip)
Disallow root login remotely? [Y/n] y
 (snip)
Remove test database and access to it? [Y/n] y
 (snip)
Reload privilege tables now? [Y/n] y
```
## Zabbix パッケージのインストール
```bash
$ sudo rpm -Uvh https://repo.zabbix.com/zabbix/7.0/rhel/9/x86_64/zabbix-release-latest-7.0.el9.noarch.rpm
$ sudo dnf clean all
$ sudo dnf install zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-sql-scripts zabbix-selinux-policy zabbix-agent -y
$ sudo dnf install zabbix-web-japanese.noarch -y
```
## データベースの作成
```bash
$ mysql -uroot -p
Enter password: SECRET
mysql> create database zabbix character set utf8mb4 collate utf8mb4_bin;
mysql> create user zabbix@localhost identified by 'password';
mysql> grant all privileges on zabbix.* to zabbix@localhost;
mysql> set global log_bin_trust_function_creators = 1;
mysql> quit;

$ zcat /usr/share/zabbix-sql-scripts/mysql/server.sql.gz | mysql --default-character-set=utf8mb4 -uzabbix -p zabbix

$ mysql -uroot -p
Enter password: SECRET
mysql> set global log_bin_trust_function_creators = 0;
mysql> quit;
```
## データベースのパスワードを編集
```bash
$ sudo cp -p /etc/zabbix/zabbix_server.conf{,.orig}
$ sudo vi /etc/zabbix/zabbix_server.conf

$ sudo diff /etc/zabbix/zabbix_server.conf{.orig,}
131a132
> DBPassword=password
DBPassword=password
```
## Zabbix サービスの起動
```bash
$ sudo systemctl enable zabbix-server zabbix-agent httpd php-fpm --now
$ systemctl status zabbix-server zabbix-agent httpd php-fpm
```
## firewalld の設定
```bash
$ sudo firewall-cmd --add-service=http
$ sudo firewall-cmd --add-port=10051/tcp
$ sudo firewall-cmd --list-all
$ sudo firewall-cmd --runtime-to-permanent
```
## ブラウザで接続
http://IP_ADDRESS/zabbix
- https://www.zabbix.com/documentation/7.0/en/manual/quickstart/login
# Zabbix Agent
- https://www.zabbix.com/download?zabbix=7.0&os_distribution=red_hat_enterprise_linux&os_version=9&components=agent&db=&ws=

```bash
$ sudo rpm -Uvh https://repo.zabbix.com/zabbix/7.0/rhel/9/x86_64/zabbix-release-latest-7.0.el9.noarch.rpm
$ sudo dnf install zabbix-agent -y
$ sudo cp -a /etc/zabbix{,.orig}
$ sudo cp -p /etc/zabbix/zabbix_agentd.conf{,.orig}
$ sudo vi /etc/zabbix/zabbix_agentd.conf

$ diff /etc/zabbix/zabbix_agentd.conf{.orig,}
74a75,76
> AllowKey=system.run[*]
>
117c119,120
< Server=127.0.0.1
---
> ##Server=127.0.0.1
> Server=192.168.100.123
171c174,175
< ServerActive=127.0.0.1
---
> ##ServerActive=127.0.0.1
> ServerActive=192.168.100.123
182c186
< Hostname=Zabbix server
---
> ##Hostname=Zabbix server

$ sudo systemctl enable zabbix-agent --now
$ sudo firewall-cmd --add-port=10050/tcp
$ sudo firewall-cmd --list-all
$ sudo firewall-cmd --runtime-to-permanent
```

## PSK
```bash
$ openssl rand -hex 32 | sudo tee /etc/zabbix/secret.psk
$ sudo chown zabbix:zabbix /etc/zabbix/secret.psk
$ sudo chmod 600 /etc/zabbix/secret.psk
$ sudo vi /etc/zabbix/zabbix_agentd.conf

$ grep ^TLS /etc/zabbix/zabbix_agentd.conf
TLSConnect=psk
TLSAccept=psk
TLSPSKIdentity=RH9-1
TLSPSKFile=/etc/zabbix/secret.psk

$ sudo systemctl restart zabbix-agent
$ sudo systemctl status zabbix-agent
```
- ホスト > 暗号化
  - ホストへの接続: PSK
  - ホストからの接続: [ ] 暗号化なし
  - ホストからの接続: [x] PSK
  - ホストからの接続: [ ] 証明書
  - PSKアイデンティティ: RH9-1
  - PSK: ********
# Zabbix Agent 2 (Windows)
- https://www.zabbix.com/download_agents?version=7.0+LTS&release=7.0.6&os=Windows&os_version=Any&hardware=amd64&encryption=OpenSSL&packaging=MSI&show_legacy=0
