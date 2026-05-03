# NAT

> [!NOTE]
> 簡単に、hide NAT の設定をするには、以下ようにします。
>
> - SmartConsole > ゲートウェイ & サーバ > (クラスタ/ゲートウェイ) > NAT
>   - Hide internal networks behind the Gateway's extend IP: [X]

## Automatic NAT

### Automatic static NAT (One-to-One)

- Host (DMZSRV)
  - NAT
    - アドレス変換の値
      - 自動アドレス変換ルールの追加: ✅
        - 変換メソッド: スタティック
          - IP アドレスに変換 > IPv4 アドレス: 192.0.2.5
        - インストール先ゲートウェイ: CPGW1 

```sh
add host name DMZSRV ip-address 192.168.111.5 color "orange" nat-settings.auto-rule true nat-settings.method "static" nat-settings.ipv4-address "192.0.2.5" nat-settings.install-on "CPGW1"
```

**Automatic Generated Rules : Machine Static NAT**
|名前                  |元の発信元|元の宛先               |元のサービス|変換後の発信元            |変換後の宛先              |変換後のサービス|インストール|
|----------------------|---------|----------------------|-----------|-------------------------|-------------------------|--------------|-----------|
|Automatic Rule: DMZSRV|DMZSRV   |Any                   |Any        |S) DMZSRV (Valid Address)|＝ Oritinal              |＝ Oritinal   |CPGW1      |
|Automatic Rule: DMZSRV|Any      |DMZSRV (Valid Address)|Any        |＝ Oritinal              |S) DMZSRV (Valid Address)|＝ Oritinal   |CPGW1      |

### Automatic static NAT (Many-to-Many)

- Range (Range_192.168.101.20-30)
  - NAT
    - アドレス変換の値
      - 自動アドレス変換ルールの追加: ✅
        - 変換メソッド: スタティック
          - IP アドレスに変換 > IPv4 アドレス: 192.168.100.20
        - インストール先ゲートウェイ: CPGW1

```sh
add address-range name "Range_192.168.101.20-30" ip-address-first "192.168.101.20" ip-address-last "192.168.101.30" color "sea green" nat-settings.auto-rule true nat-settings.method "static" nat-settings.ip-address "192.168.100.20" nat-settings.install-on "CPGW1"
```

**Automatic Generated Rules : Address Range Static NAT**
|名前                                    |元の発信元              |元の宛先                               |元のサービス|変換後の発信元                              |変換後の宛先                                |変換後のサービス|インストール|
|---------------------------------------|-----------------------|---------------------------------------|-----------|-------------------------------------------|------------------------------------------|--------------|-----------|
|Automatic Rule: Range_192.168.101.20-30|Range_192.168.101.20-30|Range_192.168.101.20-30                |Any        |＝ Oritinal                                |＝ Oritinal                               |＝ Oritinal   |CPGW1      |
|Automatic Rule: Range_192.168.101.20-30|Range_192.168.101.20-30|Any                                    |Any        |S) Range_192.168.101.20-30  (Valid Address)|＝ Oritinal                               |＝ Oritinal   |CPGW1      |
|Automatic Rule: Range_192.168.101.20-30|Any                    |Range_192.168.101.20-30 (Valid Address)|Any        |＝ Oritinal                                |S) Range_192.168.101.20-30 (Valid Address)|＝ Oritinal   |CPGW1      |

- Network (Net_192.168.101.0)
  - NAT
    - アドレス変換の値
      - 自動アドレス変換ルールの追加: ✅
        - 変換メソッド: スタティック
          - IP アドレスに変換 > IPv4 アドレス: 192.168.100.0
        - インストール先ゲートウェイ: CPGW1 

```sh
add network name "Net_192.168.101.0" subnet4 192.168.101.0 subnet-mask 255.255.255.0 color "sea green" nat-settings.auto-rule true nat-settings.method "static" nat-settings.ip-address "192.168.100.0" nat-settings.install-on "CPGW1"
```

**Automatic Generated Rules : Network Static NAT**
|名前                              |元の発信元       |元の宛先                          |元のサービス|変換後の発信元                        |変換後の宛先                          |変換後のサービス|インストール|
|---------------------------------|-----------------|---------------------------------|-----------|-------------------------------------|-------------------------------------|--------------|-----------|
|Automatic Rule: Net_192.168.101.0|Net_192.168.101.0|Net_192.168.101.0                |Any        |＝ Oritinal                          |＝ Oritinal                          |＝ Oritinal   |CPGW1      |
|Automatic Rule: Net_192.168.101.0|Net_192.168.101.0|Any                              |Any        |S) Net_192.168.101.0  (Valid Address)|＝ Oritinal                          |＝ Oritinal   |CPGW1      |
|Automatic Rule: Net_192.168.101.0|Any              |Net_192.168.101.0 (Valid Address)|Any        |＝ Oritinal                          |S) Net_192.168.101.0  (Valid Address)|＝ Oritinal   |CPGW1      |

### Automatic Hide NAT (Single host hiding behid a unique IP address)

- Host (SmartConsole_VM)
  - NAT
    - アドレス変換の値
      - 自動アドレス変換ルールの追加: ✅
        - 変換メソッド: 非表示
          - IP アドレスで隠す > IPv4 アドレス: 192.0.2.20
        - インストール先ゲートウェイ: CPGW1 

```sh
add host name SmartConsole_VM ip-address 192.168.1.69 color "crete blue" nat-settings.auto-rule true nat-settings.method "hide" nat-settings.hide-behind "ip-address" nat-settings.ipv4-address "192.0.2.20" nat-settings.install-on "CPGW1"
```

**Automatic Generated Rules : Machine Hide NAT**
|名前                           |元の発信元      |元の宛先|元のサービス|変換後の発信元                      |変換後の宛先              |変換後のサービス|インストール|
|-------------------------------|---------------|-------|-----------|-----------------------------------|-------------------------|--------------|-----------|
|Automatic Rule: SmartConsole_VM|SmartConsole_VM|Any    |Any        |H) SmartConsole_VM (Hiding Address)|＝ Oritinal              |＝ Oritinal   |CPGW1      |

### Automatic dynamic NAT

> [!WARN]
> [NAT Hide failure - there are currently no available ports for hide operation.](https://support.checkpoint.com/results/sk/sk156852)


## Manual static NAT
