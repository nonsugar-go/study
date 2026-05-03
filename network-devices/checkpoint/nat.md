# NAT

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

### Automatic hide NAT (Single host hiding behid a unique IP address)

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

> [!IMPORTANT]
> - [NAT Hide failure - there are currently no available ports for hide operation.](https://support.checkpoint.com/results/sk/sk156852)
> - [CoreXL Dynamic Balancing](https://support.checkpoint.com/results/sk/sk164155)

- cpview > Advanced > NAT > Pool-IPv4 の High port で現在の dynamic NAT について確認する

#### Automatic Many-to-One (hide behind NAT)

以下の3つの設定方法がある

- 内部ネットワークをゲートウェイ/クラスタのプロパティでゲートウェイの外部 IP アドレスで隠す
- 内部ネットワーク・アドレス範囲・ホストをオブジェクトのプロパティでゲートウェイの IP アドレスで隠す
- 内部ネットワーク・アドレス範囲・ホストをオブジェクトのプロパティで指定した IP アドレスで隠す

##### 内部ネットワークをゲートウェイ/クラスタのプロパティでゲートウェイの外部 IP アドレスで隠す

簡単に設定できるが、小規模な環境でのみの利用を推奨

- SmartConsole > ゲートウェイ & サーバ > (クラスタ/ゲートウェイ) > NAT
  - Hide internal networks behind the Gateway's extend IP: ✅

ログ上は、NAT Rule Number = 0 で記録される。

##### 内部ネットワーク・アドレス範囲・ホストをオブジェクトのプロパティでゲートウェイの IP アドレスで隠す

- Network (Net_192.168.102.0)
  - NAT
    - アドレス変換の値
      - 自動アドレス変換ルールの追加: ✅
        - 変換メソッド: 非表示
          - ゲートウェイで隠す: 🔘
        - インストール先ゲートウェイ: CPGW1 

```sh
add network name "Net_192.168.102.0" subnet4 192.168.102.0 subnet-mask 255.255.255.0 color "sea green" nat-settings.auto-rule true nat-settings.method "hide" nat-settings.hide-behind "gateway" nat-settings.install-on "CPGW1"
```

**Automatic Generated Rules : Network Hide NAT**
|名前                              |元の発信元       |元の宛先          |元のサービス|変換後の発信元                         |変換後の宛先|変換後のサービス|インストール|
|---------------------------------|-----------------|-----------------|-----------|--------------------------------------|----------|---------------|-----------|
|Automatic Rule: Net_192.168.102.0|Net_192.168.102.0|Net_192.168.102.0|Any        |＝ Oritinal                           |＝ Oritinal|＝ Oritinal   |CPGW1      |
|Automatic Rule: Net_192.168.102.0|Net_192.168.102.0|Any              |Any        |H) Net_192.168.102.0  (Hiding Address)|＝ Oritinal|＝ Oritinal   |CPGW1      |

##### 内部ネットワーク・アドレス範囲をオブジェクトのプロパティで指定した IP アドレスで隠す

- Network (Net_192.168.101.0)
  - NAT
    - アドレス変換の値
      - 自動アドレス変換ルールの追加: ✅
        - 変換メソッド: 非表示
          - IP アドレスで隠す > IPv4 アドレス: 192.0.2.30
        - インストール先ゲートウェイ: CPGW1 

```sh
add network name "Net_192.168.101.0" subnet4 192.168.101.0 subnet-mask 255.255.255.0 color "sea green" nat-settings.auto-rule true nat-settings.method "hide" nat-settings.hide-behind "ip-address" nat-settings.ipv4-address "192.0.2.30" nat-settings.install-on "CPGW1"
```

**Automatic Generated Rules : Network Hide NAT**
|名前                              |元の発信元       |元の宛先          |元のサービス|変換後の発信元                         |変換後の宛先|変換後のサービス|インストール|
|---------------------------------|-----------------|-----------------|-----------|--------------------------------------|----------|---------------|-----------|
|Automatic Rule: Net_192.168.101.0|Net_192.168.101.0|Net_192.168.101.0|Any        |＝ Oritinal                           |＝ Oritinal|＝ Oritinal   |CPGW1      |
|Automatic Rule: Net_192.168.101.0|Net_192.168.101.0|Any              |Any        |H) Net_192.168.101.0  (Hiding Address)|＝ Oritinal|＝ Oritinal   |CPGW1      |

#### 不要な NAT を抑制する

自動アドレス変換では、内部ネットワーク間 (Internal ⇔ DMZ 間など) で意図せずアドレス変換が発生することがある。
抑制するには、NAT ルールのトップに以下を追加する。

```sh
add group name "Int_Nets" members.1 "Net_192.168.1.0" members.2 "Net_192.168.101.0" members.3 "Net_192.168.102.0" members.4 "Net_192.168.111.0"

add nat-rule package "standard" position "top" name "No NAT" method "static" original-source "Int_Nets" original-destination "Int_Nets" original-service "Any" translated-source "Original" translated-destination "Original" translated-service "Original" install-on.1 "CPGW1"
```

|名前  |元の発信元|元の宛先 |元のサービス|変換後の発信元|変換後の宛先|変換後のサービス|インストール|
|------|---------|--------|-----------|-------------|----------|---------------|-----------|
|No Nat|Int_Nets |Int_Nets|Any        |＝ Oritinal  |＝ Oritinal|＝ Oritinal   |CPGW1      |



## Manual static NAT

```
add address-range name "Hide_NAT_Range" ip-address-first "192.0.2.40" ip-address-last "192.0.2.41"

add nat-rule package "standard" position "bottom" name "Hide NAT Scope" method "hide" original-source "Int_Nets" original-destination "Any" original-service "Any" translated-source "Hide_NAT_Range" translated-destination "Original" translated-service "Original" install-on.1 "CPGW1"
```

**Manual Lower Rules**
|名前          |元の発信元|元の宛先|元のサービス|変換後の発信元    |変換後の宛先              |変換後のサービス|インストール|
|--------------|---------|-------|-----------|-----------------|-------------------------|--------------|-----------|
|Hide NAT Scope|Int_Nets |Any    |Any        |H) Hide_NAT_Range|＝ Oritinal              |＝ Oritinal   |CPGW1      |

Manual NAT の場合、Proxy ARP の設定を自動で実施するには、以下の設定が必要となります。

> [!WARNING]
> Merge manual proxy ARP configuration のチェックをいれないと、手動の Proxy ARP 設定が、ポリシーインストール時に消えてしまいます。

1. SmartConsole > グローバル プロパティ...
   - NAT - Network Address Translation
     - Automatic NAT rules
       - Allow bi-directional NAT (for more details see help): ✅
       - Translate destination on client side: ✅
       - Automatic ARP configuration: ✅
         - Merge manual proxy ARP configuration: 🔳 → ✅
     - Manula NAT rules
       - Translate destination on client side: ✅
     - IP Pool NAT
       - Enable IP Pool NAT: 🔳
         - Address exhaustion track: Log
         - Address allocation and release track: None
2. 公開とポリシーのインストール
3. 手動で Proxy ARP の設定 (CPGW1A)
   ```sh
   add arp proxy ipv4-address 192.0.2.40 interface eth4 real-ipv4-address 192.0.2.2
   add arp proxy ipv4-address 192.0.2.41 interface eth4 real-ipv4-address 192.0.2.2
   save config
   ```
4. 手動で Proxy ARP の設定 (CPGW1B)
   ```sh
   add arp proxy ipv4-address 192.0.2.40 interface eth4 real-ipv4-address 192.0.2.3
   add arp proxy ipv4-address 192.0.2.41 interface eth4 real-ipv4-address 192.0.2.3
   save config
   ```
5. 再度、ポリシーのインストール
6. proxy ARP 設定の確認
   ```sh
   fw ctl arp -n
   ```
