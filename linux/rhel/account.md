# アカウント管理
## /etc/login.def
```bash
$ grep UID_ /etc/login.defs
UID_MIN                  1000
UID_MAX                 60000
#SYS_UID_MIN              100
#SYS_UID_MAX              999
```

```bash
$ grep ^PASS_ /etc/login.defs
PASS_MAX_DAYS   99999
PASS_MIN_DAYS   0
PASS_WARN_AGE   7
```

## chage
```bash
chage -m MIN_DAYS -M MAX_DAYS -d LAST_DAY -I INACTIVE -E EXPIRE_DATE -W WARN_DAYS LOGIN
chage -l LOGIN
```
