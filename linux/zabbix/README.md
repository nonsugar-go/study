# Zabbix
- https://www.zabbix.com/download?zabbix=7.0&os_distribution=red_hat_enterprise_linux&os_version=9&components=server_frontend_agent&db=mysql&ws=apache
- [Zabbix7.0 LTSをRHEL9にインストールする #zabbix7.0LTS - Qiita](https://qiita.com/mi_h/items/70e5d85838891850890d)
# Zabbix 7.0 LTS をインストールする
```bash
$ cat /etc/redhat-release
Red Hat Enterprise Linux release 9.5 (Plow)
```

```bash
$ sudo dnf install mariadb-server -y

$ rpm -q mariadb
mariadb-10.5.22-1.el9_2.x86_64
```
