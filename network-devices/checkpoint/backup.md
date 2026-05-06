# Backup

## Gaia OS レベル 設定ファイル バックアップ (saving the configuration)

## システム バックアップ (system backup)

> [!NOTE]
> system backup は、Gaia OS-level の設定と追加の Check Point 固有データを含みます。
> リストアは、同じバージョンの Check Point ソフトウェアと同じバージョンの Jumbo Hotfix Accumulator である必要がある。 

1. Gaia Portal にログイン
2. Maintenance > System Backup > `[Backup]`
3. Maintenance > System Backup > `[Export]` (PC にバックアップ ファイル .tar.gz をダウンロード)

## スナップショット (snapshots)

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
