# golang

- https://hub.docker.com/_/golang
- https://hub.docker.com/_/alpine/

**Dockerfile**

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

**docker-compose.yml**

```yaml
version: '3'
services:
  broker-service:
    build:
      context: ./../my-service
      dockerfile: ./../my-service/Dockerfile
    restart: always
    ports:
      - "8080:80"
    deploy:
      mode: replicated
      replicas: 1
```
