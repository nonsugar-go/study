# ネットワーク・コマンド・センター
- https://docs.oracle.com/ja-jp/iaas/Content/Network/Concepts/net_command_center.htm
# リージョン間のレイテンシ
- ネットワーキング > Inter-Region Latency
# ネットワーク・パス・アナライザ
# ネットワーク・ビジュアライザ
- Remote Peering Connection &lt;RPC&gt;
- Nat Gateway (NAT)
- Security Gateway (SGW)
- Internet Geteway (IGW)
- Local Peering Gateway (LPG)
- Oracle region (PHX)
- Resource outside the region or compartment (dettail are not visible) \👁
# 仮想テスト・アクセス・ポイント(VTAP)
- IPv4 と IPv6 の両方のトラフィックのミラーリングをサポートします。
- コンポーネント
  - VTAP ソース
  - VTAP ターゲット
  - 取得フィルタ
- トラフィックは、VxLAN にカプセル化され、UDP ポート 4789 を介して VTAP ターゲット (ネットワーク・ロード・バランサ) に送信されます。
- 最大パケット・サイズ: パケット切り捨て構成が可能、ターゲットの取り込みを改善
- 優先順位モード: 本番トラフィックと同じ優先順位をミラー化トラフィックに与える、すべての重要なトラフィックをキャプチャするのに役立つ
## 取得フィルター
- 取得するトラフィックのタイプを定義
- 取得フィルタが関連付けられている必要があり
- 少なくとも1つのルールが必要で、最大10個のルールを持つことが可能
# フロー・ログ
