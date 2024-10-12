# Range
- https://future-architect.github.io/articles/20240718a/
- https://tip.golang.org/doc/go1.23
- https://tip.golang.org/blog/range-functions
- [Go 1.23のイテレータについて知っておくべきこと<](https://zenn.dev/syumai/articles/cqud4gab5gv2qkig5vh0)
# rangeループの対象
- 配列, スライス, 文字列, map, channel, 整数
- イテレータ関数 (>1.23)
## イテレータ関数
```go
// 1. 値を返さない
func(func() bool)
// 使い方
var f1 func(func() bool)
for range f1 {} // 値が何も返らないので、 x := range f1 の形式では書けない

// 2. channel, 整数と同じで値を一つ返す
func(func(V) bool) // Seq[V any]     func(yield func(V) bool)
// 使い方
var f2 func(func(int) bool)
for x := range f2 {} // x: int

// 3. 配列、スライス、文字列, map と同じで値を二つ返す
func(func(K, V) bool) // Seq2[K, V any] func(yield func(K, V) bool)
// 使い方
var f3 func(func(string, int) bool)
for x, y := range f3 {} // x: string, y: int
```
## package iter 
- https://pkg.go.dev/iter
``` go
type (
	Seq[V any]     func(yield func(V) bool)
	Seq2[K, V any] func(yield func(K, V) bool)
)
```
