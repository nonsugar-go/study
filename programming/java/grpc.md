# gRPC
```zsh
sudo apt install openjdk-21-jdk
sudo apt install maven
```
```zsh
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.5 -DinteractiveMode=false
cd my-app
```
- https://github.com/grpc/grpc-java
  - for Maven with non-Android, add to your pom.xml:
  - For protobuf-based codegen integrated with the Maven build system, you can use protobuf-maven-plugin
```zsh
vim pom.xml
```
# protobuf
- [protobuf](../protobuf/READEME.md)

必要ならば、com.google.protobuf » protobuf-java-util を追加
- https://protobuf.dev/reference/java/api-docs/overview-summary.html
- https://mvnrepository.com/artifact/com.google.protobuf/protobuf-java-util
