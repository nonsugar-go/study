# Scan
## nmap
```bash
sudo apt install nmap -y
nmap -T4 192.168.1.0/24
nmap -A -T4 192.168.1.1
nmap -A -p 80 --script vulners 192.168.1.1 | tee result.log
```
## netdiscover
```bash
sudo apt install netdiscover -y
sudo netdiscover -r 192.168.1.0/24
```

> [!NOTE]
> WSL2 では NAT で外部と接続するため、外部のネットワークの ARP スキャンはできない
