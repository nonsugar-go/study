# SNMP Trap

- https://www.zabbix.com/documentation/current/jp/manual/config/items/itemtypes/snmptrap

```mermaid
graph TD
    %% ノードの定義
    Device["ネットワーク機器等\n[device]"]
    Trapd["snmptrapd\n(受信デーモン)"]
    Receiver["zabbix_trap_handler.sh\n(スクリプト)"]
    Log["snmptrap.log\n(ログファイル)"]
    Server["Zabbix Server\n(SNMPTrapperプロセス)"]
    
    Item1["アイテム: snmptrap[regexp]"]
    Item2["アイテム: snmptrap.fallback"]

    %% フローの接続
    Device -- "trap (UDP 162)" --> Trapd
    Trapd -->|"起動・処理"| Receiver
    Receiver -->|"パースして追記"| Log
    Server -- "定期的にログを読み込み" --> Log
    
    Server --> Item1
    Server --> Item2
```

## SNMP トラップ形式

```
[timestamp] [the trap, part 1] ZBXTRAP [address] [the trap, part 2]
```

