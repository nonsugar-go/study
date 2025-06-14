# Docker

# Install (Ubuntu)

```bash
sudo apt install docker-compose
```

# 起動/停止

```bash
sudo docker-compose up -d
sudo docker-compose down
sudo docker images
sudo docker rmi REPOSITORY
```

# nginx

## Dockerfile

```dockerfile
version: "3.9"
services:
  nginx:
    image: nginx:latest
    ports:
      - "80:80"
    volumes:
      - ./index.html:/usr/share/nginx/html/index.html
```

# rsyslog

## docker-compose.yaml

```yaml
version: "3.9"
services:
  rsyslog:
    build:
      context: .
    ports:
      - "514:514/udp"
    volumes:
      - ./syslog.log:/var/log/syslog.log
```

## Dockerfile

```dockerfile
FROM alpine:latest
RUN apk add --no-cache rsyslog
COPY rsyslog.conf /etc/rsyslog.conf
CMD ["rsyslogd", "-n"]
```

## rsyslog.conf

```conf
module(load="imudp")
input(type="imudp" port="514")
*.* /var/log/syslog.log
```

## syslog.log

```bash
touch syslog.log
```
