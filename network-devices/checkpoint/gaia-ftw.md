# First Time Configuration Wizard (FTW)

> [!WARNING]
> - https://community.checkpoint.com/t5/Firewall-and-Security-Management/R82-10-smartconsole-Evaluation-License-Expired/m-p/272789
> - https://support.checkpoint.com/results/sk/sk184766
>
> R82 と R82.10 では、2026年3月1日以降、新規に生成された証明書と CRLs が not yet valid と評価されるため、評価ライセンスが有効になりません。
> 暫定処置として、日付を過去に戻して FTW を実施する必要があります。
>
> ESXi ホストなどの仮想基盤の時刻を過去の時間に設定しておきます。
> NTP サーバの設定は無効にして、手動で過去の時刻に設定します。

> [!NOTE]
> `Subnet mask` は、予め `set format netmask length` を設定した場合は、サブネット長で指定します。

## CPSMS

1. Deployment Options
   - Setup: Continue with R82.10 configuration
2. Management Connection
   - Interface: eth0
   - Configure IPv4: Manually
   - IPv4 address: 192.168.1.41
   - Subnet mask: 255.255.255.0 (または Mask length: 24)
   - Default Gateway: 192.168.1.1
   - Configure IPv6: Off
3. Internet Connection
   - Interface: eth1
   - Configure IPv4: Off
   - Configure IPv6: Off
4. Device Information
   - Host Name: CPSMS
   - Domain Name: cplab.test
   - Primary DNS Server: 8.8.8.8
   - Secondary DNS Server: 1.1.1.1
   - Tertiary DNS Server: (None)
   - Use a Proxy server: [_]
5. Date and Time Settings
   - Set time manually: (X) … 手動で設定する場合
     - Date: (現在の日付)
     - Time: (現在の時刻)
     - Time Zone: Tokyo, Asia (GMT +9:00)
   - Use Network Time Protocol (NTP): (X) … NTP で設定する場合
     - Preferred NTP server: 192.168.1.39, Type: Server, Version: 4
     - Secondary NTP server: ntp.nict.jp, Type: Pool, Version: 4
     - Time Zone: Tokyo, Asia (GMT +9:00)
6. Installation Type
   - Security Gateway and/or Security Management: (X)
7. Products
   - Security Gateway: [_]
   - Security Management: [X]
     - Define Security Management as: Primary
8. Security Management Administrator
   - Define a new administrator
     - Administrator Name: secadmin
     - New Password: Lab@12345
9. Security Management GUI Clients
   - GUI clients can log into the Security Management from: Network
     - IP Address: 192.168.1.0
     - Subnet: 255.255.255.0 (または Mask length: 24)
10. First Time Configuration Wizard Summary
    - Update and Data Sharing settings
      - Allow automatic download and installation of security and software updates.: [X]
        - Allow automatic download and installation of new software features: [X]
      - Allow sending non-personal telemetry data to enable remote monitoring of critical alerts and improve the product and its security: [X]
        - I approve sharing core dumps files and other relevant crash data whitch might contain personal information. All shared data will be processed in accordance with Check Point's Privacy Policy: [_]

## CPGW1A

1. Deployment Options
   - Setup: Continue with R82.10 configuration
2. Management Connection
   - Interface: eth0
   - Configure IPv4: Manually
   - IPv4 address: 192.168.1.42
   - Subnet mask: 255.255.255.0 (または Mask length: 24)
   - Default Gateway: 192.0.2.62
   - Configure IPv6: Off
3. Internet Connection
   - Interface: eth4
   - Configure IPv4: Manually
   - IPv4 address: 192.0.2.2
   - Subnet mask: 255.255.255.192 (または Mask length: 26)
   - Configure IPv6: Off
4. Device Information
   - Host Name: CPGW1A
   - Domain Name: cplab.test
   - Primary DNS Server: 8.8.8.8
   - Secondary DNS Server: 1.1.1.1
   - Tertiary DNS Server: (None)
   - Use a Proxy server: [_]
5. Date and Time Settings
   - Set time manually: (X) … 手動で設定する場合
     - Date: (現在の日付)
     - Time: (現在の時刻)
     - Time Zone: Tokyo, Asia (GMT +9:00)
   - Use Network Time Protocol (NTP): (X) … NTP で設定する場合
     - Preferred NTP server: 192.168.1.39, Type: Server, Version: 4
     - Secondary NTP server: ntp.nict.jp, Type: Pool, Version: 4
     - Time Zone: Tokyo, Asia (GMT +9:00)
6. Installation Type
   - Security Gateway and/or Security Management: (X)
7. Products
   - Security Gateway: [X]
   - Security Management: [_]
   - Unit is a part of a cluster: [X]
     - type: ClusterXL
8. Secure Communication to Management Server
   - Activation Key: SIC@12345
   - Connect to your Management as a Service: [_]
9. First Time Configuration Wizard Summary
   - Update and Data Sharing settings
     - Allow automatic download and installation of security and software updates.: [X]
       - Allow automatic download and installation of new software features: [X]
     - Allow sending non-personal telemetry data to enable remote monitoring of critical alerts and improve the product and its security: [X]
       - I approve sharing core dumps files and other relevant crash data whitch might contain personal information. All shared data will be processed in accordance with Check Point's Privacy Policy: [_]

## CPGW1B

1. Deployment Options
   - Setup: Continue with R82.10 configuration
2. Management Connection
   - Interface: eth0
   - Configure IPv4: Manually
   - IPv4 address: 192.168.1.43
   - Subnet mask: 255.255.255.0 (または Mask length: 24)
   - Default Gateway: 192.0.2.62
   - Configure IPv6: Off
3. Internet Connection
   - Interface: eth4
   - Configure IPv4: Manually
   - IPv4 address: 192.0.2.3
   - Subnet mask: 255.255.255.192 (または Mask length: 26)
   - Configure IPv6: Off
4. Device Information
   - Host Name: CPGW1B
   - Domain Name: cplab.test
   - Primary DNS Server: 8.8.8.8
   - Secondary DNS Server: 1.1.1.1
   - Tertiary DNS Server: (None)
   - Use a Proxy server: [_]
5. Date and Time Settings
   - Set time manually: (X) … 手動で設定する場合
     - Date: (現在の日付)
     - Time: (現在の時刻)
     - Time Zone: Tokyo, Asia (GMT +9:00)
   - Use Network Time Protocol (NTP): (X) … NTP で設定する場合
     - Preferred NTP server: 192.168.1.39, Type: Server, Version: 4
     - Secondary NTP server: ntp.nict.jp, Type: Pool, Version: 4
     - Time Zone: Tokyo, Asia (GMT +9:00)
6. Installation Type
   - Security Gateway and/or Security Management: (X)
7. Products
   - Security Gateway: [X]
   - Security Management: [_]
   - Unit is a part of a cluster: [X]
     - type: ClusterXL
8. Secure Communication to Management Server
   - Activation Key: SIC@12345
   - Connect to your Management as a Service: [_]
9. First Time Configuration Wizard Summary
   - Update and Data Sharing settings
     - Allow automatic download and installation of security and software updates.: [X]
       - Allow automatic download and installation of new software features: [X]
     - Allow sending non-personal telemetry data to enable remote monitoring of critical alerts and improve the product and its security: [X]
       - I approve sharing core dumps files and other relevant crash data whitch might contain personal information. All shared data will be processed in accordance with Check Point's Privacy Policy: [_]

## CPGW2

1. Deployment Options
   - Setup: Continue with R82.10 configuration
2. Management Connection
   - Interface: eth0
   - Configure IPv4: Manually
   - IPv4 address: 192.168.1.44
   - Subnet mask: 255.255.255.0 (または Mask length: 24)
   - Default Gateway: 192.0.2.126
   - Configure IPv6: Off
3. Internet Connection
   - Interface: eth2
   - Configure IPv4: Manually
   - IPv4 address: 192.0.2.65
   - Subnet mask: 255.255.255.192 (または 26)
   - Configure IPv6: Off
4. Device Information
   - Host Name: CPGW2
   - Domain Name: cplab.test
   - Primary DNS Server: 8.8.8.8
   - Secondary DNS Server: 1.1.1.1
   - Tertiary DNS Server: (None)
   - Use a Proxy server: [_]
5. Date and Time Settings
   - Set time manually: (X) … 手動で設定する場合
     - Date: (現在の日付)
     - Time: (現在の時刻)
     - Time Zone: Tokyo, Asia (GMT +9:00)
   - Use Network Time Protocol (NTP): (X) … NTP で設定する場合
     - Preferred NTP server: 192.168.1.39, Type: Server, Version: 4
     - Secondary NTP server: ntp.nict.jp, Type: Pool, Version: 4
     - Time Zone: Tokyo, Asia (GMT +9:00)
6. Installation Type
   - Security Gateway and/or Security Management: (X)
7. Products
   - Security Gateway: [X]
   - Security Management: [_]
   - Unit is a part of a cluster: [_]
8. Dynamically Assigned IP
   - Does this gateway have a dynamically assigned IP address (DAIP gateway)?: No
9. Secure Communication to Management Server
   - Activation Key: SIC@12345
   - Connect to your Management as a Service: [_]
10. First Time Configuration Wizard Summary
    - Update and Data Sharing settings
      - Allow automatic download and installation of security and software updates.: [X]
        - Allow automatic download and installation of new software features: [X]
      - Allow sending non-personal telemetry data to enable remote monitoring of critical alerts and improve the product and its security: [X]
        - I approve sharing core dumps files and other relevant crash data whitch might contain personal information. All shared data will be processed in accordance with Check Point's Privacy Policy: [_]

## FTW 後のネットワーク インタフェースのアクティブ化

FTW 後は、eht0 以外は、インタフェースがダウン状態のようです。
Gaia Portal の `Network Management > Network Interfaces` で有効化するか、下記のように Gaia Clish で有効化します。

> [!NOTE]
> Gaia Clish で下記のメッセージが表示された場合には、`local database override` を入力する必要があります。
> ```
> CLINFR0519  Configuration lock present. Can not execute this command. To acquire the lock use the command 'lock database override'.
> ```

### CPGW1A

```sh
lock database override
set interface eth1 state on
set interface eth2 state on
set interface eth3 state on
set interface eth4 state on
set interface eth5 state on
save config
```

### CPGW1B

```sh
lock database override
set interface eth1 state on
set interface eth2 state on
set interface eth3 state on
set interface eth4 state on
set interface eth5 state on
save config
```

### CPGW2

```sh
lock database override
set interface eth1 state on
set interface eth2 state on
save config
```
