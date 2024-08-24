# アカウント管理
# useradd
```bash
$ sudo useradd -g superheros -s /bin/bash -c 'Perman 1' -m -d /home/perman perman
$ sudo passwd perman
```

```bash
$ sudo groupadd superheros
$ sudo useradd booby
$ id booby
$ sudo usermod -G superheroes booby
$ sudo passwd booby
```

## /etc/login.def
```bash
$ grep UID_ /etc/login.defs
# No LASTLOG_UID_MAX means that there is no user ID limit for writing
#LASTLOG_UID_MAX
UID_MIN                  1000
UID_MAX                 60000
SYS_UID_MIN               201
SYS_UID_MAX               999
SUB_UID_MIN                100000
SUB_UID_MAX             600100000
SUB_UID_COUNT               65536
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

```bash
$ sudo chage -m 5 -M 90 -W 10 -I 3 perman
```
