# Range
- https://future-architect.github.io/articles/20240718a/
- https://tip.golang.org/doc/go1.23
- https://tip.golang.org/blog/range-functions
- [Go 1.23のイテレータについて知っておくべきこと<](https://zenn.dev/syumai/articles/cqud4gab5gv2qkig5vh0)
# rangeループの対象
- 配列, スライス, 文字列, map, channel, 整数
- イテレータ関数 (>1.23)
## イテレーション関数
```go
// 1. 値を返さない
func(func() bool)
// 2. channel, 整数と同じで値を一つ返す
func(func(V) bool)
// 3. 配列、スライス、文字列, map と同じで値を二つ返す
func(func(K, V) bool)
```
