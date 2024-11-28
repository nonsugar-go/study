# Maven
- https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html
```zsh
mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.5 -DinteractiveMode=false
cd my-app
mvn package
java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App
```
- https://maven.apache.org/guides/introduction/introduction-to-the-pom.html
- https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html
- https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html

- https://zenn.dev/caunus/books/apache-maven-introduction
# Install
```zsh
sudo apt install openjdk-21-jdk
sudo apt install maven
```
# VScode
- https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-maven
- https://tigertaizo.hatenablog.com/entry/2022/03/26/200000

1. Java: Create Java Project...
   1. Maven
   2. maven-archetype-quickstart
   3. version: 1.4
   4. group id: com.example
   5. artifact id: demo
   6. directory
# ローカル リポジトリの削除
```zsh
rm -rf ~/.m2/repository
```
