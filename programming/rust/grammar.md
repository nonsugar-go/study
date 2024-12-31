# Grammar
# 関数
## Closures (クロージャー)
- https://doc.rust-jp.rs/rust-by-example-ja/fn/closures.html
# Traits (トレイト)
- https://doc.rust-jp.rs/book-ja/ch10-02-traits.html
## Derive 属性
- https://doc.rust-jp.rs/rust-by-example-ja/trait/derive.html
## イテレーター
- https://doc.rust-jp.rs/rust-by-example-ja/trait/iter.html
- https://doc.rust-jp.rs/rust-by-example-ja/trait/impl_trait.html
```rust
fn main() {
    let v = vec![1, 2, 3, 4, 5];
    let map = v.iter().map(|x| x * 2);
    for x in map {
        println!("{}", x);
    }
    let collect: Vec<_> = v.iter().map(|x| x * 2).collect();
    println!("{:?}", collect);
    let filter: Vec<_> = v.iter().filter(|x| *x % 2 != 0).collect();
    println!("{:?}", filter);
    let count = v.iter().count();
    println!("{}", count);
    let sum: i32 = v.iter().sum();
    println!("{}", sum);
    let product: i32 = v.iter().product();
    println!("{}", product);
    let min = v.iter().min();
    println!("{:?}", min);
    let max = v.iter().max();
    println!("{:?}", max);
    let s2 = v.iter().fold(100, |sum, x| sum - x);
    // 100 - 1 - 2 - 3 - 4 - 5
    println!("{:?}", s2);
}
```
# Generics (ジェネリクス)
- https://doc.rust-jp.rs/rust-by-example-ja/generics.html
# エラーハンドリング
- https://doc.rust-jp.rs/rust-by-example-ja/error.html
