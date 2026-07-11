# Docker

## Install (WSL2/Ubuntu)

```wzh
sudo apt install docker-compose
```

```zsh
sudo usermod -aG docker $USER
```

```powershell
wsl --shutdown
```

## コマンド一覧

| Type | Full | Short |
|---|---|---|
| image | docker image build | docker build |
| image | docker image list | docker images |
| image | docker image pull | docker pull |
| image | docker image rm | docker rmi |
| container | docker container run | docker run |
| container | docker container stop | docker stop |
| container | docker container ls | docker ps |
| container | docker container rm | docker rm |

## 起動 / 停止

```bash
docker-compose up -d

docker-compose down --rmi all
docker images
docker rmi REPOSITORY
```

## nginx

### Dockerfile

```dockerfile
services:
  nginx:
    image: nginx:latest
    ports:
      - "80:80"
    volumes:
      - ./index.html:/usr/share/nginx/html/index.html
```

## rsyslog

### docker-compose.yaml

```yaml
services:
  rsyslog:
    build:
      context: .
    ports:
      - "514:514/udp"
    volumes:
      - ./syslog.log:/var/log/syslog.log
```

### Dockerfile

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

### syslog.log

```bash
touch syslog.log
```
