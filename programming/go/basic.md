# Basic
# workspaces
- https://go.dev/doc/tutorial/workspaces
- https://go.dev/ref/mod#workspaces


```zsh
cd toolkit-project/toolkit
go mod init github.com/nonsugar-go/toolkit
cd ../app
go mod init myapp
cd ..
toolkit-project/toolkit
cd ..
```

output:
```zsh
find toolkit-project
toolkit-project
toolkit-project/app
toolkit-project/app/go.mod
toolkit-project/go.work
toolkit-project/toolkit
toolkit-project/toolkit/go.mod
toolkit-project/toolkit.code-workspace
```
