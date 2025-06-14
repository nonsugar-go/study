# Docker

# Install (Ubuntu)

```bash
sudo apt install docker-compose
```

# rsyslog

## rsyslog.conf

```
module(load="imudp")
input(type="imudp" port="514")
*.* /var/log/syslog.log
```

## Dockerfile

```dockerfile
FROM alpine:latest
RUN apk add --no-cache rsyslog
COPY rsyslog.conf /etc/rsyslog.conf
CMD ["rsyslogd", "-n"]
# touch syslog.log
# alias docker='sudo docker'
# docker build -t rsyslog .
# docker run -d -p 514:514/udp -v $(pwd)/syslog.log:/var/log/syslog.log rsyslog
# tail -f syslog
# docker ps
# docker stop CONTINER_ID
# docker ps -a
# docker rm CONTAINER_ID
# docker images
# docker rmi IMAGE_ID
# docker exec -it CONTINER_ID tail -f /var/log/syslog.log
```
