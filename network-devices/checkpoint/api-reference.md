# Management API Reference

- https://sc1.checkpoint.com/documents/latest/APIs/
- https://sc1.checkpoint.com/documents/latest/APIs/?#cli/login
- https://sc1.checkpoint.com/documents/R82.10/WebAdminGuides/EN/CP_R82.10_SecurityManagement_AdminGuide/Content/Topics-SECMG/CLI/mgmt_cli.htm

SmartConsole がインストールされた Windows 上で実行できます。

```cmd
cd /d "%ProgramFiles(x86)%\CheckPoint\SmartConsole\<VERSION>\PROGRAM\"

mgmt_cli login user secadmin password Lab@12345 -m 192.168.1.41

 :
```

または、SMS 上で実行できます。

```sh
CPSMS> mgmt login user secadmin password Lab@12345
  :

CPSMS> mgmt discard

CPSMS> mgmt publish

CPSMS> mgmt logout
```
