# MailHog

- https://hub.docker.com/r/mailhog/mailhog
- [Mailhog × Docker でフォーム送信のデバッグ環境を作る - 銀ねこアトリエ](https://ginneko-atelier.com/blog/entry549/)

## docker-compose.yml

```yaml
services:
  mailhog:
    image: 'mailhog/mailhog:latest'
    ports:
      - "1025:1025"
      - "8025:8025"
```
