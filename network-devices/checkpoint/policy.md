# Policy

## SmartConsole > セキュリティ ポリシー > Access Control > Policy

| No. | 名前                            | 発信元        | 宛先        | VPN | サービス & アプリケーション      | アクション | 追跡     |
|-----|---------------------------------|--------------|-------------|-----|--------------------------------|-----------|---------|
| 1   | Allow Mgmt to GW                | Any          | Grp_GW_Mgmt | Any | echo-request, https, ssh       | Accept    | Log     |
| 2   | Allow from Internal to External | InternalZone | Any         | Any | echo-request, dns, http, https | Accept    | Log     |
| 3   | Cleanup rule                    | Any          | Any         | Any | Any                            | Drop      | **Log** |
