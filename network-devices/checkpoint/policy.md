# Policy

## SmartConsole > セキュリティ ポリシー > Access Control > Policy

| No. | 名前                            | 発信元        | 宛先        | VPN | サービス & アプリケーション      | アクション | 追跡     |
|-----|---------------------------------|--------------|-------------|-----|--------------------------------|-----------|---------|
| 1   | Allow Mgmt to GW                | Any          | Grp_GW_Mgmt | Any | echo-request, https, ssh       | Accept    | Log     |
| 2   | Allow from Internal to External | InternalZone | Any         | Any | echo-request, dns, http, https | Accept    | Log     |
| 3   | Cleanup rule                    | Any          | Any         | Any | Any                            | Drop      | **Log** |

## ポリシーとレイヤーの管理

- SmartConsole > メニュー > ポリシーとレイヤーの管理...

ポリシーの複製が可能。デフォルトの Access Control policy は、**Standard** と呼ばれる。

## レイヤー (Layers)

レイヤーには2つのモードがあり、**Policy (orderd) layers** と **inline layers** と呼ばれる。

## セキュリティ ゾーン

デフォルトで下記の4つがある

- DMZZone
- ExternalZone
- InternalZone
- WirelessZone

