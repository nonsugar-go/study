# Test
- https://dave.cheney.net/2019/05/07/prefer-table-driven-tests
```bash
go test -v -coverprofile=cover.out
go tool cover -func=cover.out
go tool cover -html=./cover.out -o cover.html
```
