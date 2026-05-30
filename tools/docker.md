# Docker

- [docker composeを始めよう（メリットとよく使う設定） #初心者 - Qiita](https://qiita.com/yuya_sega/items/a4bd9a0531c0d10c5b3d)
- https://github.com/docker/awesome-compose

## golang

- https://hub.docker.com/_/golang
- https://hub.docker.com/_/alpine/

```
FROM golang:1.26.3-alpine as builder
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN CGO_ENABLED=0 go build -o myApp ./cmd/api
RUN chmod +x /app/brokerApp

FROM alpine:latest
RUN mkdir /app
COPY --from=builder /app/myApp /app
CMD [ "/app/brokerApp" ]
```
