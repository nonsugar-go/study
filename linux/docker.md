# Docker

## Install (WSL2/Ubuntu)

```zsh
$ sudo apt install docker-compose-v2
$ sudo usermod -aG docker $USER
```

```powershell
PS> wsl --shutdown
```

## コマンド一覧

- https://docs.docker.jp/engine/reference/commandline/

| Type | Full | Short | Example |
|---|---|---|---|
| image | docker image build | docker build | |
| image | docker image list | docker images | |
| image | docker image pull | docker pull | |
| image | docker image rm | docker rmi | docker rmi IMAGE |
| image | docker image prune | - | docker image prune -a |
| container | docker container run | docker run | docker run -it ubuntu bash |
| container | docker container stop | docker stop | |
| container | docker container ls | docker ps | docker ps -a |
| container | docker container rm | docker rm | |
| container | docker container exec | docker exec | docker exec -it CONTAINER sh |
| container | docker container logs | docker logs | docker logs CONTAINER |
| compose | docker compose config | - | docker compose config |
| compose | docker compose up | - | docker-compose up -d |
| compose | docker compose down | - | docker compose down --rmi all |

### コンテナの起動と停止

```bash
docker compose up -d

docker compose down --rmi all
docker images
docker rmi IMAGE
```

## docker compose

- https://docs.docker.jp/engine/reference/builder.html
- https://docs.docker.jp/compose/toc.html
 
### nginx

- https://hub.docker.com/_/nginx

**./compose.yaml**

```yaml
services:
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

**./templates/default.conf.template**

```zsh
server {
    listen       ${NGINX_PORT};
    server_name  ${NGINX_HOST};

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }
}
```

### rsyslog

- https://hub.docker.com/_/alpine

**./compose.yaml**

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

**./Dockerfile**

```dockerfile
FROM alpine:latest
COPY rsyslog.conf /etc/rsyslog.conf
RUN apk add --no-cache rsyslog
ENTRYPOINT ["rsyslogd", "-n" ]
```

**./rsyslog.conf**

```conf
module(load="imudp")
input(type="imudp" port="514")
action(type="omfile" file="/var/log/syslog.log")
```

**./syslog.log**

```bash
touch syslog.log
```
