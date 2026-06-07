# MongoDB

- https://hub.docker.com/_/mongo
- https://www.mongodb.com/ja-jp/docs/v8.0/tutorial/install-mongodb-community-with-docker/
- https://hub.docker.com/r/mongodb/mongodb-community-server

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
