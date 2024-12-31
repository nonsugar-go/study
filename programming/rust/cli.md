# cli
- https://doc.rust-jp.rs/book-ja/ch12-00-an-io-project.html
# コマンドライン引数
- https://doc.rust-jp.rs/book-ja/ch12-01-accepting-command-line-arguments.html
# ファイルの読み込み
- https://doc.rust-jp.rs/book-ja/ch12-02-reading-a-file.html
# JSON
- https://crates.io/crates/serde
- https://crates.io/crates/serde_json

```toml
[dependencies]
serde = { version = "1.0.217", features = ["derive"] }
serde_json = "1.0.134"
```

```rust
use std::{fs::File, io::BufReader};
use std::io::prelude::*;
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Debug)]
struct Person {
    name: String,
    age: u8,
    phones: Vec<String>,
}
fn main() {
    let p = Person {
        name: String::from("John"),
        age: 28,
        phones: vec![String::from("000-111-2222"), String::from("000-222-3333")],
    };
    let json_data = serde_json::to_string_pretty(&p).unwrap();
    let mut f = File::create("src/sample.json").unwrap();
    writeln!(f, "{}", json_data).unwrap();
    let f = File::open("src/sample.json").unwrap();
    let br = BufReader::new(f);
    let data: Person = serde_json::from_reader(br).unwrap();
    println!("{:?}", data);
}
```
