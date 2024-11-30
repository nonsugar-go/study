# gRPC
```zsh
sudo apt install openjdk-21-jdk
sudo apt install maven
```
```zsh
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.5 -DinteractiveMode=false
cd my-app
mvn package
java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
```
- https://github.com/grpc/grpc-java // for Maven with non-Android, add to your pom.xml:
```zsh
vim pom.xml
```
