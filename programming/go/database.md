# Database

## database/sql

- https://go.dev/doc/database/
- https://go.dev/wiki/SQLInterface
- https://go.dev/wiki/SQLDrivers

## MySQL (MariaDB)

- https://hub.docker.com/_/mariadb
- https://github.com/go-sql-driver/mysql
- https://github.com/go-sql-driver/mysql?tab=readme-ov-file#dsn-data-source-name

## sqlite3

- https://github.com/mattn/go-sqlite3

```bash
sudo apt install build-essential sqlite3
go get github.com/mattn/go-sqlite3
```

## PostgreSQL

- https://github.com/jackc/pgx
- https://hub.docker.com/_/postgres/

**docker-compose.yml**
```
version: '3'
  services:
    postgres:
      image: postgres:18.4
      ports:
        - "5432:5432"
      restart: always
      deploy:
        mode: replicated
        replicas: 1
      environment:
        POSTGRES_USER: postgres
        POSTGRES_PASSWORD: password
        POSTGRES_DB: users
      volumes:
        - ./db-data/postgres/:/var/lib/postgresql/data/
```

## Managing connections

- https://please-sleep.cou929.nu/go-sql-db-connection-pool.html
- https://go.dev/doc/database/manage-connections

# OSS

- https://github.com/jmoiron/sqlx
- https://entgo.io
- https://gorm.io
- https://sqlc.dev
- https://pkg.go.dev/github.com/volatiletech/sqlboiler/v4
