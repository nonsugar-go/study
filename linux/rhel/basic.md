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
| 大項目 | 中項目 | 小項目 | 値 |
|----|----|----|----|
| 起動メニュー ||| Install Red Hat Enterprise Linux 9.0 |
| 言語を選択 ||| 日本語 / 日本語 (日本) |
| インストール概要 |━|━|━|
|┃| キーボード || 日本語 |
|┃| 言語サポート || 日本語 (日本) |
|┃| 時刻と日付 || アジア/東京タイムゾーン |
|┃| インストール先 || デフォルト設定のまま \[完了] をクリック |
|┃| Red Hat に接続 |━|━|
|┃|┃| 認証 | アカウント |
|┃|┃| \[ユーザー名] と \[パスワード] | Red Hat アカウントを入力 |
|┃|┃| 用途 | \[システムの用途の設定] にチェックを入れる |
|┃|┃| 用途/ロール | Red Hat Enterprise Linux Server |
|┃|┃| 用途/SLA | Self-Support |
|┃|┃| 用途/使用法 | Development/Test |
|┃|┃| Red Hat Insights に接続します | チェックを入れたまま |
|┃|┃| [登録] をクリック |
|┃| ソフトウェアの選択 || サーバー (GUI 使用) |
|┃| root パスワード |━|━|
|┃|┃| \[root パスワード] と \[確認] | (パスワードを入力) |
|┃|┃| root アカウントをロック | \[_] |
|┃|┃| パスワードによる root ssh ログインを許可 | \[_] |
|┃| ユーザーの作成 |━|━|
|┃|┃| フルネーム | (任意) |
|┃|┃| ユーザー名 | (任意) |
|┃|┃| このユーザーを管理者にする | \[x] (sudo できるようになる) |
|┃|┃| このアカウントを使用する場合にパスワードを要求する | \[x] |

- \[インストールの開始] をクリックします。
- \[システムの再起動] をクリックします。

### \[Red Hat に接続] で「認証=アカウント」でうまくいかない場合
認証を \[アクティベーション キー] にして試してください

1. [アクティベーションキー](https://console.redhat.com/settings/connector/activation-keys) を開く
2. \[Organization ID] (組織 ID) を控える (8桁数字)
4. \[Create activation Key] をクリックする
   1. Name: (英数字、アンダースコア、ハイフン で任意の名前を付ける)
   2. Select Workload: Latest release
   3. Select system purpose/Role: RHEL Server
   4. Select system purpose/Service level agreement (SLA): Self-Support
   5. Select system purpose/Development/Test

インストーラーの \[Red Hat に接続] で、認証を \[アクティベーションキー] とする場合
| 大項目 | 中項目 | 小項目 | 値 |
|----|----|----|----|
|┃| Red Hat に接続 |━|━|
|┃|┃| 認証 | アクティベーションキー |
|┃|┃| 組織 ID | 控えた値を入力 |
|┃|┃| アクティベーションキー | 作成したアクティベーションキーの名前を入力 |
|┃|┃| 用途/ロール | Red Hat Enterprise Linux Server |
|┃|┃| 用途/SLA | Self-Support |
|┃|┃| 用途/使用法 | Development/Test |
|┃|┃| Red Hat Insights に接続します | チェックを入れたまま |
|┃|┃| [登録] をクリック |
# 再起動・電源オフ
```bash
sudo reboot
```

```bash
sudo poweroff
```
## Cockpit
```bash
$ sudo systemctl enable --now cockpit.socket
$ sudo systemctl status cockpit.socket
```
