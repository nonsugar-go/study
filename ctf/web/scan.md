# Scan

## gobuster

```zsh
gobuster dir -u http://10.10.10.10/ -w /usr/share/seclists/Discovery/Web-Content/common.txt -x .php,.txt

## 再帰的には検索しないので、見つかったディレクトリを更に調べる必要がある。
gobuster dir -u http://10.10.10.10/foo/ -w /usr/share/seclists/Discovery/Web-Content/common.txt -x .php,.txt
```

- https://github.com/maurosoria/dirsearch
- https://github.com/epi052/feroxbuster

## nmap

```zsh
sudo apt install nmap -y
nmap -T4 192.168.1.0/24
nmap -A -T4 192.168.1.1
nmap -A -p 80 --script vulners 192.168.1.1 | tee result.log
```

## netdiscover

```zsh
sudo apt install netdiscover -y
sudo netdiscover -r 192.168.1.0/24
```

> [!NOTE]
> WSL2 では NAT で外部と接続するため、外部のネットワークの ARP スキャンはできない
