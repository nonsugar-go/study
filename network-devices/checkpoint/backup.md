# Backup

## Gaia OS レベル 設定ファイル バックアップ (saving the configuration)

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

- https://sc1.checkpoint.com/documents/R81/WebAdminGuides/EN/CP_R81_SecurityManagement_AdminGuide/Topics-SECMG/CLI/migrate_server.htm

```sh
cd $FWDIR/scripts/
./migrate_server -h
./migrate_server verify -v R82.10
./migrate_server export -v R82.10
```

```
Detailed upgrade report is available at /opt/CPsuite-R82.10/fw1/log/upgrade_report/upgrade_report.html
Exported data to: /opt/CPsuite-R82.10/fw1/scripts/export.6May2026-000747.tgz.
```
