# アカウント管理
## chage
- /etc/login.def
```bash
$ grep ^PASS_ /etc/login.defs
PASS_MAX_DAYS   99999
PASS_MIN_DAYS   0
PASS_WARN_AGE   7
```

```bash
chage -m MIN_DAYS -M MAX_DAYS -d LAST_DAY -I INACTIVE -E EXPIRE_DATE -W WARN_DAYS LOGIN
chage -l LOGIN
```
