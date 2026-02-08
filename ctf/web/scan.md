# Scan

## gobuster

- https://github.com/OJ/gobuster
- https://github.com/danielmiessler/SecLists

```zsh
gobuster dir -u http://$target/ -w /usr/share/seclists/Discovery/Web-Content/common.txt -x .php,.txt

## 再帰的には検索しないので、見つかったディレクトリを更に調べる必要がある。
gobuster dir -u http://$target/foo/ -w /usr/share/seclists/Discovery/Web-Content/common.txt -x .php,.txt
```

## feroxbuster

- https://github.com/epi052/feroxbuster

## dirsearch

- https://github.com/maurosoria/dirsearch

## nmap

```zsh
sudo apt install nmap -y
nmap -T4 $target
nmap -A -T4 $target
nmap -A -p 80 --script vulners $target | tee result.log
```

## netdiscover

```zsh
sudo apt install netdiscover -y
sudo netdiscover -r 192.168.1.0/24
```

> [!NOTE]
> WSL2 では NAT で外部と接続するため、外部のネットワークの ARP スキャンはできない
