# コンピュート
- 「コンピュート > インスタンス」で作成する
- シェイプ
  - Fixed シェイプ: サイズ変更不可 (Bare Metal / Virtual Machine)
  - Flexible シェイプ: サイズ変更可能 (Virtual Machine のみ)
    - 1 to 64 OCPUs AMD
    - 1 to 80 OCPUs Ampere
    - 1 to 64 GB memory/OCPU (1024 GB Max AMD / 256 GB MAx Intel / 512 GB Max Ampere)
- Bare Metal (シングルテナント・モデル), VM (マルチテナント・モデル), Dedicated VM Hosts (共有されないシングルテナント・モデル)
- GPU Options NVIDIA Tensor Core GPUs (Ampere A100, Volta V100)
# Flexible シェイプの例
- VM.Standard.E3.Flex (AMD)
- VM.Standard.E4.Flex (AMD)
- VM.Standard3.Flex (Intel)
- VM.Optimized3.Flex (Intel)
- VM.Standard.A1.Flex (Arm processor from Ampere)
# GPU シェイプ
- A100, A10, V100, P100 の NVIDIA GPU を搭載
# イメージ
- Oracle-provided: Orace 提供イメージ (Oracle Linux, Ubuntu, CentOS, Microsoft Windows)
- Custom images: カスタムイメージ (既存のインスタンスから作成、上限 300GB)
- Marketplace: マーケットプレース (Oracle やサードパーティによる構築済みアプリケーション・eイメージ
- Bring Your Own Image: 独自イメージ
# プリエンプティブル・インスタンス
- 短期間の使用前提 (他で必要になった場合は、インスタンスが終了)
- 作成後にシェイプの変更ができない
- オンデマンド・インスタンスへの変更は不可
- オンデマンド・インスタンスに比べて50%のコスト削減
# 容量予約
- 特定のアベイラビリティ・ドメインに関連付けられた予約
- 専用VMホストには適用されない
- 容量の設定で定義されたシェープに限定されたインスタンスのシェープ
- あるアベイラビリティー・ドメインから別のドメインに移動することはできません
- 容量は作成時に割り当てられる。容量が利用できない場合は、容量の作成は失敗します。
# 専用仮想マシンホスト - Dedicated VM Hosts (共有されないシングルテナント・モデル)
- シェイプ
  - DVH.Standard2.52 - VM.Standard2 series
  - DVH.Standard.E2.64 - VM.Standard.E2 series
  - DVH.Standard.E3.128 - VM.Standard.E3 series
  - SVH.DenselO2.52 - VM.DenselO2 series
- 制限事項
  - 自動スケーリング
  - 容量予約
  - インスタンス構成
  - インスタンスプールのバースト可能インスタンス
  - リブート・マイグレーション
# バースト可能インスタンス
- オンデマンド・インスタンスと同様に作成
- シェイプのタイプは、VM.Standard.E3.Flex
- 最大 OCPU の設定
- 「バースト可能」を選択
# インスタンス構成とプール
## インスタンス構成
- OS イメージ、メタデータ、シェイプ、vNICs、ストレージ、サブネット
## インスタンス・プール
- 異なる可能性ドメイン
- 一元管理 (停止・開始・終了)
- ロードバランサーへのアタッチ
## コンピュートの自動スケーリング
- メトリック・ベースの自動スケーリング
- スケジュール・ベースの自動スケーリング
### 自動スケーリングの構成
1. インスタンスからインスタンス構成を作成
2. インスタンス構成を使用してインスタンスプールを作成
3. インスタンス・プールを設定
4. 自動スケーリング構成を作成
