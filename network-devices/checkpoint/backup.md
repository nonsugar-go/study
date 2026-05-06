# Backup

## Gaia OS レベル 設定ファイル バックアップ (saving the configuration)

```sh
save configuration cpsms_gaia_config_20260506.conf
```

ホームディレクトリに `cpsms_gaia_config_20260506.conf` の名前でファイルが作成されます。

## システム バックアップ (system backup)

> [!NOTE]
> システムバックアップは、Gaia OS-level の設定と追加の Check Point 固有データを含みます。
> 復元時は、同じバージョンの Check Point ソフトウェアと Jumbo Hotfix Accumulator が前提となる。

1. Gaia Portal にログイン
2. Maintenance > System Backup > `[Backup]`
   1. Backup Type: This appliance
   2. `[Backup]` をクリック (`/var/log/CPbackup/backups/backup_--_HOSTNAME_YYYY_mm_dd_HH_MM_SS.tgz` にバックアップ ファイルが作成される)
3. Maintenance > System Backup > Regular Backup の一覧からバックアップを選択し、`[Export]` をクリック (PC にバックアップ ファイル .tgz をダウンロード)
4. Maintenance > System Backup > Regular Backup の一覧からバックアップを選択し、`[Delete]` をクリック (/var/log/CPbackup/backups/ 配下の .tgz ファイルを削除)

## スナップショット (snapshots)

> [!NOTE]
> スナップショットは、ルートパーティションのバイナリ イメージを含む。
> 復元時は、同じバージョンの Check Point ソフトウェアと Jumbo Hotfix Accmulator (JHFA) に予めしておく**必要がない**。
> 復元は、FTW の Deployment Options で `Import existing snapshot` を選択する。
> スナップショットは、インストール直後、アップグレード前、JHFA 適用前に取得することが推奨される。
> スナップショットは、インタフェースの MAC アドレスが維持されます。
> スナップショットの名前と説明は、英数字にすることが推奨される。
> スナップショットには、ルートパーティションの 1.15 倍の容量が必要とされる。
> スナップショットのエクスポートには、スナップショットの 2倍の容量が必要とされる。
> エクスポートされたスナップショットの名前を変更すべきではない。

1. Gaia Portal にログイン
2. Maintenance > Snapshot Management > Statistics で空き容量の確認をする
3. Maintenance > Snapshot Management > `[New]` (スナップショットを取得)
4. Maintenance > Snapshot Management > My Snapshot の一覧からバックアップを選択し、`[Download]` をクリック (PC にスナップショットをダウンロード)
5. Maintenance > Snapshot Management > My Snapshot の一覧からバックアップを選択し、`[Delete]` をクリック (スナップショットを削除)

## サーバー マイグレーション ツール (server migration tools)

> [!NOTE]
> `$FWDIR/scripts/migrate_server` にツールが存在します。Management, Log, SmartEvent サーバ上で動作します。
> Check Point の設定を異なるアプライアンスやプラットフォーム、新しいバージョンの製品に移行するために使用できる。
> ツール実行時に最新バージョンをダウンロードします。インターネット接続が無い場合、この処理の結果がエラーとなります。
> エラーを回避して実行するには、`-skip_upgrade_tools_check` オプションを使用します。

- https://support.checkpoint.com/results/sk/sk135172
- https://sc1.checkpoint.com/documents/R82/WebAdminGuides/EN/CP_R82_SecurityManagement_AdminGuide/Content/Topics-SECMG/CLI/migrate_server.htm

```sh
expert
cd $FWDIR/scripts/
./migrate_server verify -v R82.10 -skip_upgrade_tools_check
./migrate_server export -v R82.10 -skip_upgrade_tools_check /var/log/cpsms_export_$(date +%Y%m%d-%H%M).tgz
```

# 設定情報の抽出

## オブジェクト エクスプローラー

1. SmartConsole > 対象 ▼ > オブジェクト エクスプローラ
   1. 抽出したいカテゴリを選択
   2. アクション ▼ > エクスポート... (CSV ファイルのファイル名を指定してエクスポート)

以下のカテゴリを選択することを推奨

- カテゴリ > ネットワーク オブジェクト > { ネットワーク, ホスト, アドレス範囲, ドメイン }
- カテゴリ > ネットワーク オブジェクト > グループ (**メンバーの一覧は取得できない**)
- カテゴリ > サービス > TCP
- カテゴリ > サービス > UDP
- カテゴリ > サービス > サービス グループ (**メンバーの一覧は取得できない**)

## Show Package Tool

- https://support.checkpoint.com/results/sk/sk120342
- https://github.com/CheckPointSW/ShowPolicyPackage

### 使い方

```bash
> expert
# $FWDIR/scripts/web_api_show_package.sh -h

# $FWDIR/scripts/web_api_show_package.sh
Script finished running successfully!
Result file location: show_package-2026-05-01_11-51-44.tar.gz
```

# SMS, GW から PC へのファイルの移動

ファイルを PC に移動させるには、`python3 -m http.server 4444` で簡易 Web サーバを立ち上げる方法や、expert モードで `ftp`、`tftp`、`scp` コマンドを使用する方法などが考えられる。
SMS, GW へ ssh 接続可能な環境であっても、PC からの SCP はできない。(シェルが Clish のため)

### tar.gz ファイルのダウンロード

以下、Python で簡易 http サーバを立ち上げてダウンロードする方法を説明します。

```bash
# ss -ltn|grep :4444
# python3 -m http.server 4444
Serving HTTP on 0.0.0.0 port 4444 (http://0.0.0.0:4444/) ...
```

Windows PC からファイルを取得します。

```powershell
PS C:\Users\Administrator> wget http://192.168.1.40:4444/show_package-2026-05-01_11-51-44.tar.gz -o show_package-2026-05-01_11-51-44.tar.gz
```
