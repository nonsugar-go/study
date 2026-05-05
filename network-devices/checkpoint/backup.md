# Backup

- https://sc1.checkpoint.com/documents/R81.10/WebAdminGuides/JP/CP_R81.10_SecurityManagement_AdminGuide/Topics-SECMG/CLI/migrate.htm
- https://sc1.checkpoint.com/documents/R81/WebAdminGuides/EN/CP_R81_SecurityManagement_AdminGuide/Topics-SECMG/CLI/migrate_server.htm
- https://support.checkpoint.com/results/sk/sk133312

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
