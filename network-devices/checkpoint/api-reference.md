# Management API Reference

## SMS 上で実行

- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/login
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/publish
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/discard
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/logout

```sh
mgmt login user secadmin password Lab@12345

mgmt add service-udp name "DNS-Service" port 53 comments "DNS service" tags.1 "dns" tags.2 "udp" ignore-warnings true

# mgmt discard
mgmt publish

mgmt logout
```

- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/add-host
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/add-network
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/add-dns-domain
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/add-group
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/set-group
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/add-service-tcp
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/add-service-udp
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/add-service-group
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/add-access-rule

```sh
mgmt add host name "New Host 1" ip-address "192.0.2.1"
mgmt add network name "New Network 1" subnet "192.0.2.0" subnet-mask "255.255.255.0"
mgmt add dns-domain name ".www.example.com" is-sub-domain false
mgmt add service-tcp name "New_TCP_Service_1" port 5669
mgmt add service-udp name "New_UDP_Service_1" port 5669
mgmt add service-group name "New Service Group 1" members.1 "New_TCP_Service_1" members.2 "New_UDP_Service_1"
mgmt add access-rule layer "Network" position 1 name "Rule 1" service.1 "SMTP" service.2 "AOL" action "Accept"
```

- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/show-hosts
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/show-networks
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/show-dns-domains
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/show-services-tcp
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/show-services-udp
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/show-service-groups
- https://sc1.checkpoint.com/documents/latest/APIs/?#clish/show-access-rulebase

```sh
mgmt show hosts limit 500 offset 0 details-level "standard" -f json
mgmt show networks limit 500 offset 0 details-level "standard" -f json
mgmt show dns-domains limit 500 offset 0 details-level "standard" -f json
mgmt show services-tcp limit 500 offset 0 details-level "standard" -f json
mgmt show services-udp limit 500 offset 0 details-level "standard" -f json
mgmt show service-groups limit 500 offset 0 details-level "standard" -f json
mgmt show access-rulebase limit 500 offset 0 name "Network" details-level "standard" -f json
```

> [!NOTE]
> 下記エラーが出た場合、`SmartConsole > 管理 & 設定 > セッションの表示` で別セッションを確認して対応する
> 
> ```
>   MGMT9000  code: "generic_error"
> message: "Action cannot be executed due to: An object is locked by another session."
> ```

## SmartConsole がインストールされた Windows 上

- - https://sc1.checkpoint.com/documents/R82.10/WebAdminGuides/EN/CP_R82.10_SecurityManagement_AdminGuide/Content/Topics-SECMG/CLI/mgmt_cli.htm

最初に SmartConsole の設定を変更します。

1. SmartConsole > 管理 & 設定 > ブレード > Management API > 詳細設定...
   - 許可する API 呼び出し: GUI クライアントで使えるすべての IP アドレス
2. `[公開]`

- https://sc1.checkpoint.com/documents/latest/APIs/?#cli/login

```cmd
cd /d "C:\Program Files (x86)\CheckPoint\SmartConsole\R82.10\PROGRAM"

mgmt_cli login -u secadmin -p Lab@12345 -m 192.168.1.41 >sid.txt

mgmt_cli add service-udp name "DNS-Service" port 53 comments "DNS service" tags.1 "dns" tags.2 "udp" ignore-warnings true -s sid.txt

rem mgmt_cli discard -s sid.txt
mgmt_cli publish -s sid.txt

mgmt_cli logout -s sid.txt
```

