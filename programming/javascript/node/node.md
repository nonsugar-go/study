# Node.js

- https://nodejs.org/
- https://www.tohoho-web.com/ex/nodejs.html

# WSL2 に Node.js をインストールする

- https://learn.microsoft.com/ja-jp/windows/dev-environment/javascript/nodejs-on-wsl
- https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating

```zsh
https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm ls
nvm install --lts
node --version
npm --version 
```

## VSCode

- https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets

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

7. Express のインストール
```zsh
npm install express@4.18.1
npm install --save-dev @types/express@4.17.14
```

8. src/main.ts
```ts
import express from 'express'

const PORT = 3000
const app = express()
app.get('/api/hello', async (req, res) => {
    res.json({
        message: 'Hello, Express'
    })
})

app.listen(PORT, () => {
    console.log(`application started: http://localhost:${PORT}`)
})
```

## グローバルに ts-node を使えるようにする

```zsh
npm install -g ts-node

asdf global nodejs
```
- [No version is set for command npm Consider adding one of the following versions in your config file at  nodejs &lt;version&gt; #Node.js - Qiita](https://qiita.com/tiger7112/items/559e588ced077e048250)
