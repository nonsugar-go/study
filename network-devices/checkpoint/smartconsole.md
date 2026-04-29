# SmartConsole

## インストール

1. CPSMS の Gaia Portal に admin でログインする
2. Overview > Manage Software Blades using SmartConsole > `[Download Now!]` をクリック
3. ダウンロードサイトから、インストーラーをダウンロードする
   - [R82.10 SmartConsole Build 422](https://support.checkpoint.com/results/download/142561)
4. インストーラー `Check_Point_SmartConsole_R82.10_Windows.exe` をダブルクリックし、実行する

## Security Management Server に接続

- Username: secadmin
- Password: Lab@12345
- Server Name or IP address: 192.168.1.40
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
     - Cluster IPv4 Address: 192.168.1.41
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
     - Cluster Topology
       - IPv4 Network Address: 192.168.111.0 (read-only)
       - Net Mask: 255.255.255.0 (read-only)
       - This network is intended for: Representing a cluster interface
         - Interface IPv4: 192.168.111.1
         - Net Mask: 255.255.255.0
     - Cluster Topology
       - IPv4 Network Address: 192.0.2.0 (read-only)
       - Net Mask: 255.255.255.192 (read-only)
       - This network is intended for: Representing a cluster interface
         - Interface IPv4: 192.0.2.1
         - Net Mask: 255.255.255.192
     - Cluster Topology
       - IPv4 Network Address: 192.168.102.0 (read-only)
       - Net Mask: 255.255.255.0 (read-only)
       - This network is intended for: Representing a cluster interface
         - Interface IPv4: 192.168.102.1
         - Net Mask: 255.255.255.0
     - Cluster Topology
       - IPv4 Network Address: 192.168.101.0 (read-only)
       - Net Mask: 255.255.255.0 (read-only)
       - This network is intended for: Representing a cluster interface
         - Interface IPv4: 192.168.101.1
         - Net Mask: 255.255.255.0
     - Cluster Topology
       - IPv4 Network Address: 192.168.255.0 (read-only)
       - Net Mask: 255.255.255.0 (read-only)
       - This network is intended for: Cluster Synchronization
         - Primary: (X)
     - Cluster Topology
       - IPv4 Network Address: 192.168.1.0 (read-only)
       - Net Mask: 255.255.255.0 (read-only)
       - This network is intended for: Representing a cluster interface
         - Interface IPv4: 192.168.1.41
         - Net Mask: 255.255.255.0
2. `[ゲートウェイ & サーバ]` の一覧にクラスタ `CPGW1` が登録されていることを確認し、変更をコミットするために、`[公開]` をクリック
3. `[ゲートウェイ & サーバ]` の一覧に登録されたクラスタ `CPGW1` をダブルクリックし、`Network Management` をクリック
   1. インタフェースの取得... > トポロジを除くインタフェースを取得 をクリック
4. インタフェースの一覧から各行をダブルクリックして編集
   1. コメントの入力: Internal1 **適切なコメントを入力**
   2. General > トポロジ > `[変更...]` をクリック
      - 対象先: 上書き
        - このネットワーク (内部): (X)
          - このインタフェース背後の IP アドレス: インターフェース IP とネット マスクにより定義されたネットワーク
            (ルータの先に他のネットワークが存在する場合、`Network defined by routes` を選択)
          - インタフェースは DMZ へ: (_) **DMZ の場合は、チェックする**
        - インターネット (外部): (_) **External の場合は、こちらを選択**
      - セキュリティ ゾーン: トポロジに基づく
      - セキュリティ ゾーン: ユーザ定義 **Mgmt と Sync の場合は、こちらを選択し、`[セキュリティ ゾーンを指定]` は、チェックしない**
      - アンチスプーフィング
        - インタフェース トポロジに基づくアンチスプーフィングを行う: [X] (**Sync の場合は、チェックしない**)
          - アンチスプーフィング アクションを以下に設定: Prevent
          - スプーフ追跡: Log
5. 同様に全てのインタフェースの設定をする
   最終的に下記の状態にする
   | 名前 | トポロジ           | バーチャル IP     | CPGW1A           | CPGW1B           | コメント   | セキュリティ ゾーン | アンチスプーフィング |
   |------|-------------------|------------------|------------------|------------------|-----------|--------------------|--------------------|
   | eth0 | This network      | Private          | 192.168.1.42/24  | 192.168.1.43/24  | Mgmt      | なし               | ブロックしてログ記録 |
   | eth1 | This network      | Sync             | 192.168.255.1/24 | 192.168.255.2/24 | Sync      | なし               | 無効                |
   | eth2 | This network      | 192.168.101.1/24 | 192.168.101.2/24 | 192.168.101.3/24 | Internal1 | InternalZone       | ブロックしてログ記録 |
   | eth3 | This network      | 192.168.102.1/24 | 192.168.102.2/24 | 192.168.102.3/24 | Internal2 | InternalZone       | ブロックしてログ記録 |
   | eth4 | External          | 192.0.2.1/26     | 192.0.2.2/26     | 192.0.2.3/26     | External  | ExternalZone       | ブロックしてログ記録 |
   | eth5 | This network, DMZ | 192.168.111.1/24 | 192.168.111.2/24 | 192.168.111.3/24 | DMZ       | DMZZone            | ブロックしてログ記録 |
6. 変更をコミットするために、`[公開]` をクリック
7. `[ポリシーのインストール]` をクリック

## Gateway の追加

1. ゲートウェイ & サーバ > 新規 > Gateway...
2. Wizard
3. General Properties
   - Gateway name: CPGW2
   - Gateway platform: Open server
   - Gateway IP address: 192.168.1.44
4. Trusted Communication
   - Initiate trusted communication now: (X)
     - Gateway's Name: CPGW2
     - One-time Password: SIC@12345
5. `[ゲートウェイ & サーバ]` の一覧にゲートウェイ `CPGW2` が登録されていることを確認し、変更をコミットするために、`[公開]` をクリック
6. `[ゲートウェイ & サーバ]` の一覧に登録されたゲートウェイ `CPGW2` をダブルクリックし、`Network Management` をクリック
   1. インタフェースの取得... > トポロジを除くインタフェースを取得 をクリック
7. インタフェースの一覧から各行をダブルクリックして編集 (eth2 の例)
   1. コメントの入力: Internal1 **適切なコメントを入力**
   2. General > トポロジ > `[変更...]` をクリック
      - 対象先: 上書き
        - このネットワーク (内部): (X)
          - このインタフェース背後の IP アドレス: インターフェース IP とネット マスクにより定義されたネットワーク
            (ルータの先に他のネットワークが存在する場合、`Network defined by routes` を選択)
        - インターネット (外部): (_) **External の場合は、こちらを選択**
      - セキュリティ ゾーン: トポロジに基づく
      - セキュリティ ゾーン: ユーザ定義 **Mgmt と Sync の場合は、こちらを選択し、`[セキュリティ ゾーンを指定]` は、チェックしない**
      - アンチスプーフィング
        - インタフェース トポロジに基づくアンチスプーフィングを行う: [X] (**Sync の場合は、チェックしない**)
          - アンチスプーフィング アクションを以下に設定: Prevent
          - スプーフ追跡: Log
8. 同様に全てのインタフェースの設定をする
   最終的に下記の状態にする
   | 名前 | トポロジ           | IP               | コメント   | セキュリティ ゾーン | アンチスプーフィング |
   |------|-------------------|------------------|-----------|--------------------|--------------------|
   | eth0 | This network      | 192.168.1.44/24  | Mgmt      | なし               | ブロックしてログ記録 |
   | eth1 | This network      | 192.168.201.2/24 | Internal  | InternalZone       | ブロックしてログ記録 |
   | eth2 | External          | 192.0.2.65/26    | External  | ExternalZone       | ブロックしてログ記録 |
9. 変更をコミットするために、`[公開]` をクリック
