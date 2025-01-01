# cli
- https://doc.rust-jp.rs/book-ja/ch12-00-an-io-project.html
# コマンドライン引数
- https://doc.rust-jp.rs/book-ja/ch12-01-accepting-command-line-arguments.html
# 時刻
- https://crates.io/crates/chrono
# ファイルの読み込み
- https://doc.rust-jp.rs/book-ja/ch12-02-reading-a-file.html
# ファイル操作
- https://doc.rust-lang.org/stable/std/fs/index.html

```rust
use std::{
    fs,
    os::unix::prelude::PermissionsExt,
    path::{Path, PathBuf},
};

fn main() {
    let path = Path::new("src");
    println!("{:?}", path.exists());
    println!("{:?}", path.is_dir());
    println!("{:?}", path.is_file());
    println!("{:?}", path.file_name());
    let mut pb = PathBuf::from("src");
    pb.push("sample1.txt");
    println!("{:?}", pb);
    pb.set_file_name("README.md");
    println!("{:?}", pb);
    pb.set_extension("txt");
    println!("{:?}", pb);
    pb.pop();
    println!("{:?}", pb);
    // fs::create_dir("src/test1").unwrap();
    // fs::create_dir_all("src/test2/sub-test2").unwrap();
    // fs::remove_dir("src/test1").unwrap();
    // fs::remove_dir_all("src/test2").unwrap();
    // fs::remove_file("src/sample1.txt").unwrap();
    // fs::copy("src/sample2.txt", "src/sample3.txt").unwrap();
    // fs::create_dir("src/test1").unwrap();
    // fs::rename("src/sample3.txt", "src/test1/sample3.txt").unwrap();
    let mut permissions = fs::metadata("src/sample2.txt").unwrap().permissions();
    permissions.set_mode(0o600);
    fs::set_permissions("src/sample2.txt", permissions).unwrap();
}
```
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
