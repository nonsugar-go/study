# Test
- https://dave.cheney.net/2019/05/07/prefer-table-driven-tests
```bash
go test -v -coverprofile=cover.out
go tool cover -func=cover.out
go tool cover -html=./cover.out -o cover.html
```
# 標準出力のテスト
- https://zenn.dev/_kazuya/articles/5dd984f95d6fef45b6eb

```go
func TestTui_Title(t *testing.T) {
        oldOut := os.Stdout
        r, w, _ := os.Pipe()
        os.Stdout = w
        title := "タイトルのテスト"
        Title(title)
        _ = w.Close()
        os.Stdout = oldOut
        out, _ := io.ReadAll(r)
        got := string(out)
        if !strings.Contains(got, title) {
                t.Errorf("want %s, but %s", title, got)
        }
}
```
# bubbletea test
- https://charm.sh/blog/teatest/
