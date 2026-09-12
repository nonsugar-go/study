# AWS

## AM Identity Center

- https://docs.aws.amazon.com/ja_jp/singlesignon/latest/userguide/what-is.html
- https://www.devopsstarterpack.com/docs/intro/environment/aws-cli/iam-identity-center/

```
-- User --  -- 許可セット --   -- ポリシー --
 admin ---> Administrator ---> Admiinstraotr Access 
```

## IAM Identity Center を有効にする

- 現在の AWS リージョン: アジアパシフィック (東京)
- インスタンスの設定: 単一リージョンインスタンス

## ユーザーの追加

1. IAM Identity Center > ユーザー > ユーザーを追加
   - パスワード: パスワードの設定手順が記載された E メールをこのユーザーに送信します。
   - ユーザー名: admin
   - E メールアドレス: example@example.com
   - 名: Mei
   - 姓: Sei
   - 表示名: Mei Sei
   - グループの選択: (設定不要)
2. IAM Identity Center > 許可セット > アクセス許可セットを作成
   - アクセス許可セットタイプ: 事前定義済みのアクセス許可セット (AdministratorAccess)
   - セッション期間: 8時間
   - リレーステート-オプション: https://ap-northeast-1.console.aws.amazon.com
3. IAM Identity Center > AWS アカウント > (組織をチェックして) ユーザーまたはグループを割り当て 
   - 作成したユーザーをチェック
   - アクセス許可セット (AdministratorAccess) をチェック
4. 登録したアドレスでメールを受信して、`Accept invitaion` をクリックして、パスワードを設定
5. 作成したユーザーの ID / Password でサインインして、MFA の設定をする
6. 受信したメールに記載のある　Your AWS access portal URL: https://*.awsapps.com/start/ でサインイン
   - ショートカットの作成 で作成されるリンクをコピーしてブックマークしておく
