# SmartConsole

## インストール

1. CPSMS の Gaia Portal に admin でログインする
2. Overview > Manage Software Blades using SmartConsole > `[Download Now!]` をクリック
3. ダウンロードサイトから、インストーラーをダウンロードする
4. インストーラー `Check_Point_SmartConsole_R82.10_Windows.exe` をダブルクリックし、実行する

## Security Management Server に接続

- Username: secadmin
- Password: Lab@12345
- Server Name or IP address: 192.168.1.41
- `[LOGIN →]` をクリック

## 設定

1. MANAGE & SETTINGS (管理 & 設定) > Preferences (詳細設定) > Language (言語): Japanese (Japan) ( 日本語 (日本) )
2. 管理 & 設定 > 詳細設定 > セッションペインを有効にする

## Gateway Cluster の作成

1. ゲートウェイ & サーバ > 新規 > クラスタ > クラスタ...
   - Select the cluster type: Legacy ClusterXL
     - Wizard Mode: (X)
   - Cluster General Properties
     - Cluster Name: CPGW1
     - Cluster IPv4 Address: 192.168.100.1
     - Cluster IPv6 Address: (None)
     - Choose the Cluster's Solution: Check Point ClusterXL
       - High Availability
   - Cluster members' properties
     - Add... > New Cluster Member...
       - Name: CPGW1A
       - IPv4 Address: 192.168.1.42
       - IPv6 Address: (None)
       - Secure Internal Communication
         - Activation Key: SIC@12345
         - `[Initialize]` をクリック後、Trust State が Trust established になることを確認
     - Add... > New Cluster Member...
       - Name: CPGW1B
       - IPv4 Address: 192.168.1.43
       - IPv6 Address: (None)
       - Secure Internal Communication
         - Activation Key: SIC@12345
         - `[Initialize]` をクリック後、Trust State が Trust established になることを確認


