# Docker

## jail

- https://github.com/redpwn/jail

## 起動・停止

```zsh
sudo docker-compose up -d
sudo docker-compose down --rmi all
```

## SECCON 過去問用の証明書作成

```zsh
sudo mkdir -m 755 /etc/seccon
sudo openssl req -x509 -newkey rsa:2048 \
  -keyout /etc/seccon/privkey1.pem \
  -out /etc/seccon/fullchain1.pem \
  -days 365 \
  -nodes \
  -subj "/C=JP/ST=Tokyo/L=Tokyo/O=seccon/CN=localhost" \
  -addext "subjectAltName=DNS:localhost,IP:127.0.0.1,IP:::1"
```
