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
# Programming Guides
- https://protobuf.dev/programming-guides/style/
## Types
### Scalar Value Types 
- [Scalar Value Types](https://protobuf.dev/programming-guides/proto3/#scalar)
### Examples
- https://github.com/googleapis/googleapis/tree/master/google/type
