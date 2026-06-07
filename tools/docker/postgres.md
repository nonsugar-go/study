# Postgres

- https://hub.docker.com/_/postgres/

## docker-compose.yml

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
        - ./db-data/postgres/:/var/lib/postgresql/18/docker/
```

## psql

```zsh
$ sudo docker exec -it project_postgres_1 psql -U postgres -d users
psql (18.4 (Debian 18.4-1.pgdg13+1))
Type "help" for help.

users=# \?
users=# \dt
users=# \d public.users
users=# users=# select * from public.users;
users=# \q
```
