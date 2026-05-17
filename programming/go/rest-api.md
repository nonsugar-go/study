# REST API

> [!NOTE]
> REST API 開発でよく利用するライブラリなどを記載

## Insomnia

- https://insomnia.rest/download

## REST Client (Huachao Mao)

- [REST Client (Huachao Mao)](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)
  - Ctrl+,: 拡張機能 > REST Client
    - Preview Option: full → exchange
    - Preview Response Panel Take Focus: ✅ → ☐

- Ctrl+Alt+R: Send Request

**test.http**

```
@hostname = localhost
@port = 8080
@baseUrl = http://{{hostname}}:{{port}}

### Signup

POST @{{baseUrl}}/signup
content-type: application/json

{
    "email": "user1@example.com",
    "password": "user1pass"
}

### Login

POST @{{baseUrl}}/login
content-type: application/json

{
    "email": "user1@example.com",
    "password": "user1pass"
}

### Logout

POST {{baseUrl}}/logout
```

## Air

- https://github.com/air-verse/air/blob/master/README-ja.md

```bash
go install github.com/air-verse/air@latest
air init
air
```

## GoDotEnv

- https://github.com/joho/godotenv

```bash
go get github.com/joho/godotenv
```

## bcrypt

- https://pkg.go.dev/golang.org/x/crypto/bcrypt#GenerateFromPassword
- https://pkg.go.dev/golang.org/x/crypto/bcrypt#pkg-constants
- https://pkg.go.dev/golang.org/x/crypto/bcrypt#CompareHashAndPassword
- [Go言語で安全にパスワードを管理する方法！bcryptを使った初心者向けハッシュ化ガイド](https://mura-saki.com/go/1045)

## golang-jwt

- https://github.com/golang-jwt/jwt
- https://pkg.go.dev/github.com/golang-jwt/jwt/v5#example-NewWithClaims-Hmac
- https://pkg.go.dev/github.com/golang-jwt/jwt/v5#example-Parse-Hmac
- https://zenn.dev/shimpo/articles/go-rest-jwt-20250706

```bash
go get -u github.com/golang-jwt/jwt/v5
```
