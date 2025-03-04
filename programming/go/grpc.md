# gRPC
- https://grpc.io/docs/languages/go/quickstart/
- https://github.com/Clement-Jean/grpc-go-course
# Protocol Buffers
- [Protocol Buffers](../protobuf/)
- https://grpc.io/docs/protoc-installation/
```zsh
sudo apt install -y protobuf-compiler
protoc --version  # Ensure compiler version is 3+
```
# Quick start
- https://grpc.io/docs/languages/go/quickstart/
```zsh
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
```
# grpc
```zsh
go mod init example/m
mkdir -p greet{server,client,proto}
protoc -Igreet/proto --go_opt=module=example/m --go_out=. --go-grpc_opt=module=example/m --go-grpc_out=. greet/proto/*.proto
```
# Golang Docs
- https://golangdocs.com/grpc-golang
- https://golangdocs.com/unary-grpc-golang
- https://golangdocs.com/unary-grpc-golang-part-2
# Misc Docs
- https://www.tohoho-web.com/ex/grpc.html
- https://docs.insomnia.rest/insomnia/grpc
- https://konghq.com/blog/engineering/insomnia-grpc
