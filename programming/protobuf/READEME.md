# Protocol Buffers
- https://protobuf.dev/
- https://github.com/Clement-Jean/proto-course

- https://grpc.io/docs/protoc-installation/
```zsh
sudo apt install -y protobuf-compiler
protoc --version  # Ensure compiler version is 3+
```
# VSCode extensions
- https://marketplace.visualstudio.com/items?itemName=zxh404.vscode-proto3
# Languages
## Go
- https://protobuf.dev/reference/go/
- [Go/gRPC](../go/grpc.md)
```zsh
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest

go mod init example/m
go mod tidy

protoc -Iproto --go_opt=module=example/m --go_out=. proto/*.proto
```
## Python
- https://protobuf.dev/reference/python/
```zsh
python3 -m venv venv
. ./venv/bin/activate

python -m pip install protobuf==3.20.3
python -m pip freeze > requirements.txt

protoc -Iproto --python_out=proto proto/*.proto

deactive
```
## Java
- https://protobuf.dev/reference/java/
- [Java/gRPC](../java/grpc.md)
```zsh
protoc -Iproto --java_out=java proto/*.proto
```
# Programming Guides
- https://protobuf.dev/programming-guides/style/
## Types
### Scalar Value Types 
- [Scalar Value Types](https://protobuf.dev/programming-guides/proto3/#scalar)
# Examples
- https://github.com/protocolbuffers/protobuf/tree/main/examples
- https://github.com/googleapis/googleapis/tree/master/google/type
