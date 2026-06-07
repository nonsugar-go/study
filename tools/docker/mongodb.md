# MongoDB

- https://hub.docker.com/_/mongo

## docker-compose.yml

```yaml
services:
  mongo:
    image: mongo:latest
    ports:
      - "27017:27017"
    environment:
      MONGO_INITDB_DATABASE: logs
      MONGO_INITDB_ROOT_USERNAME: admin
      MONGO_INITDB_ROOT_PASSWORD: password
    volumes:
      - ./db-data/mongo/:/data/db
```
