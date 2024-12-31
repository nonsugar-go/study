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
# 標準ライブラリの型
## ベクタ型
- https://doc.rust-jp.rs/rust-by-example-ja/std/vec.html
```rust
fn main() {
    let city = vec!["Tokyo", "Osaka", "Nagoya", "Fukuoka"];
    println!("{:?}", city);
    println!("{:?}", city.as_ptr());
    println!("{}", city.len());
    println!("{}", city.capacity());
    println!("{}", &city[0]);
    println!("{:?}", city.get(0));
    let mut country = vec!["JP", "US", "GB", "FR", "DE"];
    println!("{:?}", country);
    country.push("CN");
    println!("{:?}", country);
    let pop_val = country.pop();
    println!("{:?}", pop_val);
    println!("{:?}", country);
    country.insert(1, "IN");
    println!("{:?}", country);
    country.remove(2);
    println!("{:?}", country);
    let l1 = vec!["English", "Hindi", "Arabic"];
    let l2 = vec!["French", "Japanese"];
    let l3 = [l1, l2].concat();
    println!("{:?}", l3);
    let (l4, l5) = l3.split_at(2);
    println!("{:?} | {:?}", l4, l5);
    let mut num = vec![32, -2, -9, 3];
    num.sort();
    println!("{:?}", num);
    num.reverse();
    println!("{:?}", num);
    println!("{}", num.contains(&-9));
    println!("{}", num.contains(&2));
    let pos = num.iter().position(|x| *x == 3);
    println!("{:?}", pos);

    #[derive(Debug)]
    struct Foo {
        id: u32,
        rank: i32,
    }

    let mut foo = vec![
        Foo { id: 1, rank: 3 },
        Foo { id: 2, rank: 2 },
        Foo { id: 3, rank: 5 },
    ];
    foo.sort_by_key(|x| x.rank);
    println!("{:?}", foo);


}
```
## ハッシュマップ
- https://doc.rust-jp.rs/rust-by-example-ja/std/hash.html
