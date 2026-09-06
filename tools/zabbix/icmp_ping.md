# Cisco IOS by SNMP

## アイテム

### アイテム

- 名前: ICMP ping
- タイプ: シンプルチェック
- キー: icmpping
- データ型: 数値 (整数)
- 監視間隔: 1m
- ヒストリ: 保存期間: 31d
- トレンド: 保存期間: 365d
- 値のマッピング: Service state
- 有効: [X]

### タグ

- component: health
- component: network

## トリガー

### トリガー

- 名前: Cisco IOS: Unavailable by ICMP ping
- 深刻度: 重度の障害
- 条件式: max(/Cisco IOS by SNMP/icmpping,#3)=0
- 正常イベントの生成: 条件式
- 障害イベント生成モード: 単一
- 正常時のイベントクローズ: すべての障害

### タグ

- scope: availability
