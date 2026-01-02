# Grammar

# Result の扱い

| 書き方           | 失敗時 | 何が起きる           | 主な用途        |
| --------------- | ------ | ------------------- | --------------- |
| `ok()?`         | Err    | **return None**     | 静かに上へ返す   |
| `unwrap()`      | Err    | **panic**           | 実験・短いコード |
| `expect("msg")` | Err    | **panic（msg付き）** | 前提条件        |

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
## キュー
```rust
use std::collections::{BinaryHeap, VecDeque};

fn main() {
    let mut q1 = VecDeque::new();
    q1.push_back("Linux");
    q1.push_back("Windows");
    q1.push_back("Mac");
    q1.push_back("MS-DOS");
    println!("{:?}", q1);
    let mut q2 = VecDeque::from([99, 77, 103, 52]);
    println!("{:?}", q2);
    println!("{:?}", q2.pop_front());
    println!("{:?}", q2);
    let mut bh = BinaryHeap::new();
    bh.push(3);
    bh.push(5);
    bh.push(300);
    bh.push(99);
    println!("{:?}", bh);
    println!("{:?}", bh.pop());
    println!("{:?}", bh);
}
```
## ハッシュマップ
- https://doc.rust-jp.rs/rust-by-example-ja/std/hash.html
```rust
use std::collections::HashMap;

fn main() {
    let mut score = HashMap::new();
    score.insert("Tanaka", 32);
    score.insert("Mamiya", 23);
    score.insert("Nishida", 82);
    score.insert("Suzuki", 92);
    println!("{:?}", score);
    score.insert("Nishida", 84);
    println!("{:?}", score.get("Suzuki"));
    println!("{:?}", score.remove("Tanaka"));
    println!("{:?}", score);

    for (k, v) in &score {
        println!("{}: {}", k, v);
    }
}
```
## セット
```rust
use std::collections::HashSet;

fn main() {
    let mut s1 = HashSet::new();
    s1.insert(5);
    s1.insert(8);
    s1.insert(28);
    s1.insert(8);
    s1.insert(33);
    s1.insert(3);
    s1.insert(8);
    println!("s1: {:?}", s1);
    let s2 = HashSet::from([3, 9, 8, 28, 32]);
    println!("s2: {:?}", s2);
    println!("s1 contains 8: {}", s1.contains(&8));
    println!("s1 contains 99: {}", s1.contains(&99));
    println!("s1 remove 33: {}", s1.remove(&33));
    println!("s1: {:?}", s1);
    println!("s2: {:?}", s2);
    let s3 = &s1 | &s2;
    println!("s1 | s2: {:?}", s3);
    let s4 = &s1 & &s2;
    println!("s1 & s2: {:?}", s4);
    let s5 = &s1 - &s2;
    println!("s1 - s2: {:?}", s5);
    let s6 = &s1 ^ &s2;
    println!("s1 ^ s2: {:?}", s6);
}
```
