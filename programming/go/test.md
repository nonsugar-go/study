# Test
- https://dave.cheney.net/2019/05/07/prefer-table-driven-tests
```bash
go test -v -coverprofile=coverage.out
go tool cover -func=coverage.out
go tool cover -html=./coverage.out -o coverage.html
```
