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

3. ~/.zshrc を読み込む
```zsh
source ~/.zshrc
```

4. Node.js のインストール
```zsh
sudo apt-get install dirmngr gpg curl gawk
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf list all nodejs
```

5. ディレクトリを作成して特定バージョンの Node.js をインストール
```zsh
mkdir study
cd study
asdf list all nodejs 16.17
echo "nodejs 16.17.1" >.tool-versions
asdf install
node -v
```

6. ts-code のインストール
```zsh
npm init
npm install --save-dev typescript@4.8.3 ts-node@10.9.1
echo "console.log('Hello TypeScript')" >hello.ts
npx ts-node hello.ts
```
