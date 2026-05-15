# GORM

- https://golangdocs.com/gorm-golang-orm-package
- https://gorm.io/ja_JP/docs/index.html

```zsh
go get -u gorm.io/gorm
go get -u gorm.io/driver/sqlite
go get -u gorm.io/driver/postgres
```

- https://gorm.io/ja_JP/docs/models.html
- https://gorm.io/ja_JP/docs/constraints.html
- https://gorm.io/ja_JP/docs/migration.html
- https://gorm.io/ja_JP/docs/create.html

## sqlite でメモリ上で実施する方法

```go
func main() {
  db, err := gorm.Open(sqlite.Open(":memory:"), &gorm.Config{})

  if err != nil {
    panic("failed to connect database")
  }

  ctx := context.Background()

  // Migrate the schema
  db.AutoMigrate(&Product{})
```
