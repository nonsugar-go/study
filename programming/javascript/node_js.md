# Node.js
# 概要
- https://nodejs.org/
- https://www.tohoho-web.com/ex/nodejs.html
## VSCode
- VS Code ES7+ React/Redux/React-Native/JS snippets
## my-app
- https://github.com/npm/cli/issues/6971
- https://stackoverflow.com/questions/66813198/react-app-localhost3000-logo-not-spinning

```powershell
PS> npm install -g npm@latest
PS> npx create-react-app my-app
PS> cd my-app
PS> npm start
```
# asdf を利用した手順
## asdf のインストール (wsl2)
1. https://asdf-vm.com/ja-jp/guide/getting-started.html

```zsh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
```

2. ~/.zshrcに下記の行を追記します:
```zsh
. "$HOME/.asdf/asdf.sh"
```
