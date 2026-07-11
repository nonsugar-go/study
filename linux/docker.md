# Docker

## Install (WSL2/Ubuntu)

```zsh
sudo apt install docker-compose-v2
sudo usermod -aG docker $USER
```

```powershell
wsl --shutdown
```

## コマンド一覧

- https://docs.docker.jp/engine/reference/commandline/

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

## 未使用イメージをすべて削除

```bash
docker image prune -a
```

## docker file / compose

- https://docs.docker.jp/engine/reference/builder.html
- https://docs.docker.jp/compose/toc.html
 
### nginx

- https://hub.docker.com/_/nginx

**compose.yaml**

```yaml
web:
  image: nginx
  volumes:
   - ./templates:/etc/nginx/templates
  ports:
   - "8080:80"
  environment:
   - NGINX_HOST=foobar.com
   - NGINX_PORT=80
```

```yaml
services:
  nginx:
    image: nginx:latest
    ports:
      - "80:80"
    volumes:
      - ./index.html:/usr/share/nginx/html/index.html
```

### rsyslog

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

**Dockerfile**

```dockerfile
FROM alpine:latest
RUN apk add --no-cache rsyslog
COPY rsyslog.conf /etc/rsyslog.conf
CMD ["rsyslogd", "-n"]
```

**rsyslog.conf**

```conf
module(load="imudp")
input(type="imudp" port="514")
*.* /var/log/syslog.log
```

**syslog.log**

```bash
touch syslog.log
```
