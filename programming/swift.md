# Swift
# Install
- https://zenn.dev/seshat/articles/3151c5643785dd
- https://qiita.com/nak435/items/a83fa44b4a2a7f18e87b
- https://www.swift.org/download/
# WSL2 (Ubuntu 22.04.5 LTS)
```zsh
sudo apt install gcc-multilib
curl -LO https://download.swift.org/swift-6.0.1-release/ubuntu2204/swift-6.0.1-RELEASE/swift-6.0.1-RELEASE-ubuntu22.04.tar.gz
rm swift-6.0.1-RELEASE-ubuntu22.04.tar.gz
tar xzf ./swift-6.0.1-RELEASE-ubuntu22.04.tar.gz -C ~/
```

- ~/.zshrc (末尾に追加)
```zsh
export PATH=$PATH:$HOME/swift-6.0.1-RELEASE-ubuntu22.04/usr/bin
```

```zsh
source ~/.zshrc
swift --version
echo 'print("Hello, World🌐")' >hello.swift
swift hello.swift
```

