# Management API Reference

- https://sc1.checkpoint.com/documents/latest/APIs/
- https://sc1.checkpoint.com/documents/R82.10/WebAdminGuides/EN/CP_R82.10_SecurityManagement_AdminGuide/Content/Topics-SECMG/CLI/mgmt_cli.htm

## SMS 上で実行

- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/login
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/publish

```sh
mgmt login user secadmin password Lab@12345

mgmt add host name "host-1" ip-address "192.168.1.10"
mgmt add service-udp name "DNS-Service" port 53 comments "DNS service" tags.1 "dns" tags.2 "udp" ignore-warnings true

mgmt discard
mgmt publish

mgmt logout
```

## SmartConsole がインストールされた Windows 上

最初に SmartConsole の設定を変更します。

1. SmartConsole > 管理 & 設定 > ブレード > Management API > 詳細設定...
   - 許可する API 呼び出し: GUI クライアントで使えるすべての IP アドレス
2. `[公開]`

- https://sc1.checkpoint.com/documents/latest/APIs/?#cli/login

```cmd
cd /d "C:\Program Files (x86)\CheckPoint\SmartConsole\R82.10\PROGRAM"

mgmt_cli login -u secadmin -p Lab@12345 -m 192.168.1.41 >sid.txt

mgmt_cli add host name "host-1" ip-address "192.168.1.10" -s sid.txt
mgmt_cli add service-udp name "DNS-Service" port 53 comments "DNS service" tags.1 "dns" tags.2 "udp" ignore-warnings true -s sid.txt

mgmt_cli discard -s sid.txt
mgmt_cli publish -s sid.txt

mgmt_cli logout -s sid.txt
```


