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
| system | docker system df | - | docker system df |
| system | docker system prune | - | docker system prune |
| image | docker image build | docker build | docker build -t test . |
| image | docker image list | docker images | docker images |
| image | docker image pull | docker pull | docker pull centos:7 |
| image | docker image rm | docker rmi | docker rmi IMAGE |
| image | docker image prune | - | docker image prune -a |
| container | docker container run | docker run | docker run -it ubuntu bash |
| container | docker container stop | docker stop | docker stop CONTAINER |
| container | docker container ls | docker ps | docker ps -a |
| container | docker container rm | docker rm | docker rm CONTAINER |
| container | docker container exec | docker exec | docker exec -it CONTAINER sh |
| container | docker container logs | docker logs | docker logs CONTAINER |
| container | docker container prune | - | docker container prune |
| compose | docker compose config | - | docker compose config |
| compose | docker compose up | - | docker-compose up -d |
| compose | docker compose down | - | docker compose down --rmi all |

## docker run

- https://docs.docker.jp/engine/reference/commandline/run.html

```zsh
docker pull nginx
docker images
docker history nginx
docker run -p 80:80 --name nginx nginx  # -p (--publish)
docker ps  # -a (--all) は停止中も含めて
docker logs -f nginx  # -f (--follow)
docker inspect nginx
docker stop nginx
docker rm nginx

docker run -d -e hello=world -p 8080:80 --rm --name nginx nginx
  # -d (--detach),  -e (--env), --rm (コンテナ終了時に削除)
curl "[::1]:8080"
docker exec -it nginx env
docker exec -it nginx sh  # shell で接続 --interactive, --tty
docker stop nginx
 
mkdir html
docker run -d --rm --name nginx nginx
docker exec -it nginx find -name '*.html'
docker cp nginx:/usr/share/nginx/html/index.html ./html/index.html
vi ./html/index.html
docker stop nginx
docker run -d -v "$(pwd)/html":/usr/share/nginx/html -p 80:80 --rm --name nginx nginx  # -v (--volume)
docker stop nginx

docker run -d -p 80:80 --rm --name nginx nginx
echo '<html><body><h1>Hello, World!</h1></body></html>' >index.html
docker cp index.html nginx:/usr/share/nginx/html/
docker exec -it nginx chown root:root /usr/share/nginx/html/index.html
docker exec -it nginx chmod 644 /usr/share/nginx/html/index.html   
docker commit nginx hello  # hello イメージの作成
docker images
docker stop nginx 
docker run -d -p 80:80 --rm --name hello hello
docker stop hello
docker rmi hello  # イメージ削除

vi Dockerfile
FROM nginx:latest
WORKDIR /usr/share/nginx/html
COPY index.html index.html
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

docker build -t hello:1.0.0 .  # -t (--tag)
docker run -d -p 80:80 --rm --name hello hello:1.0.0

docker system prune  # 停止中コンテナと無名のイメージを削除
docker rm -vf $(docker ps -aq)
  # 起動中のコンテナ含め削除 -v (--volumes), -f (--force), -a (--all), -q (--quiet)
docker rmi -f $(docker images -aq)
  # -f (--force), -a (-all), -q (--quiet)
docker system df  # ディスク使用率
```

## docker compose

- https://docs.docker.jp/engine/reference/builder.html
- https://docs.docker.jp/compose/toc.html

### コンテナの起動と停止

```zsh
docker compose up -d

docker compose down --rmi all
docker images
docker rmi IMAGE
```
 
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
