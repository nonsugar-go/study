# study
ネットワークとプログラミング言語の学習用

- [Linux](Linux)
- [Network Devices](network-devices)
- [Tools](tools)
- [Programming](programming)

# About me
:tomato: :tomato:

- http://152.70.105.14:8080/

# Simple Syslog Server for Cygwin
```bash
$ cat syslog.sh
#!/bin/bash
# Usage: ./syslog.sh | tee -a syslog_$(date +%Y%m%d-%H%M).log | bat --paging=never -l log
# Usage: ./syslog.sh | tee -a syslog_$(date +%Y%m%d-%H%M).log | egrep --color '<[0-9]+>'
while [ true ];
do
    nc -w 0 -ul 514
    echo
done
```
