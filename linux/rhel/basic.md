# Red Hat Enterprise Linux - Basic
# ライセンス
- https://docs.redhat.com/ja/documentation/red_hat_enterprise_linux/9/html/package_manifest/index
- https://docs.redhat.com/ja/documentation/red_hat_enterprise_linux/8/html/package_manifest/index
# CentOS Stream
- https://www.redhat.com/ja/topics/linux/what-is-centos-stream
# ライフサイクル
- https://access.redhat.com/support/policy/updates/errata

| バージョン | メンテナンス サポートの終了日 |
| ------| -------------|
| RHEL9 | 2032年5月31日 |
| RHEL8 | 2029年5月31日 |
# システム要件
- https://catalog.redhat.com/hardware/search
- https://access.redhat.com/articles/rhel-limits
## RHEL9, x86_64 の場合のシステム要件
| 項目 | 最小 |
| ---- | ---- |
| CPU | 1 Core |
| Memory | 1.5GB |
| Storage | 10GB (20GB 推奨) |
# Red Hat Developer Subscription for Individuals
- 1ユーザー、16台までの物理マシン/仮想マシンまで」という制約のもと、任意の用途での利用が可能
- 1年間有効のサブスクリプションで、有効期限が切れた場合には、Red Hat Developer Program に再登録することで、新しく Developer Subscription が利用可能となる。
- https://developers.redhat.com/articles/renew-your-red-hat-developer-program-subscription#how_to_renew_your_red_hat_developer_for_individual_subscription
- https://developers.redhat.com/articles/faqs-no-cost-red-hat-enterprise-linux#getting_your_no_cost_subscription

1. [Red Hat カスタマーポータル](https://access.redhat.com/ja) にアクセスし、\[登録する] をクリックして、無料でアカウント作成ができます。
2. [Red Hat Developer](https://developers.redhat.com) にアクセスして、\[Join Red Hat Developer] をクリックします。
   1. Login Infomation で Red Hat アカウントを選択
   2. \[I have read and agree to all the terms and conditions below (check all boxes).] にチェックを入れる
   3. \[Create my account] をクリック
3. [Red Hat カスタマーポータル](https://access.redhat.com/ja) のトップ画面左上にある \[サブスクリプション] をクリックします。
4. \[Subscriptions Inventory](https://console.redhat.com/insights/subscriptions/inventory) をクリックします。
5. \[Red Hat Developer Subscription for Individuals] が表示されることを確認します。
6. [Red Hat カスタマーポータル](https://access.redhat.com/ja) のトップ画面左上にある \[ダウンロード] をクリックします。
7. \[Red Hat Enterprise Linux 9.4 Boot ISO] をダウンロードします。
# ESXi に RHEL9 をインストールする
## 仮想マシンの作成
| 項目 | 値 |
|----|----|
| CPU | 1 |
| メモリ | 2048 |
| ハードディスク 1 | 16GB, シン プロビジョニング |
| CD/DVD ドライブ 1 | rhel-9.4-x86_64-boot.iso |
## インストーラー
| 項目 | 値 |
| 起動メニュー | Install Red Hat Enterprise Linux 9.0 |
| 言語を選択 | 日本語 / 日本語 (日本) |
| インストール概要 | 》 |
