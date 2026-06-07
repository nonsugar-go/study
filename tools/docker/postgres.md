# Postgres

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
        - ./db-data/postgres/:/var/lib/postgresql/18/docker/
```
