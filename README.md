# study
ネットワークとプログラミング言語の学習用

- [Cloud Computing](cloud-computing)
- [CTF](ctf)
  - [pwn/tools](ctf/pwn/tools.md)
- [Linux](linux)
- [Network Devices](network-devices)
- [Programming](programming)
  - [VSCode](programming/vscode.md)
- [Tools](tools)
- [Windows](windows)
  - [wsl](windows/wsl.md)

# Tomato
:tomato: :tomato:

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
