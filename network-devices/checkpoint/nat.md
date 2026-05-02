# NAT

> [!NOTE]
> 簡単に、hide NAT の設定をするには、以下ようにします。
>
> - SmartConsole > ゲートウェイ & サーバ > (クラスタ/ゲートウェイ) > NAT
>   - Hide internal networks behind the Gateway's extend IP: [X]

## Automatic NAT

## Automatic static NAT (One-to-One)

- Host (DMZSRV)
  - NAT
    - アドレス変換の値
      - 自動アドレス変換ルールの追加: ✅
        - 変換メソッド: スタティック
          - IP アドレスに変換 > IPv4 アドレス: 192.0.2.5
        - インストール先ゲートウェイ: CPGW1 

## Automatic dynamic NAT

## Manual static NAT
