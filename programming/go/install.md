# インストール
- https://go.dev/dl/
## Linux
```bash
curl -OL https://go.dev/dl/go1.23.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz
```
### ~/.zshrc
```
export PATH=$PATH:/usr/local/go/bin
```
