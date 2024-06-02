# TypeScript
- Microsoft が中心となって開発を進める JavaScript に静的な型付け機能などを搭載したプログラミング言語
- https://www.typescriptlang.org/
- https://learn.microsoft.com/ja-jp/training/modules/typescript-get-started/
- https://www.tohoho-web.com/ex/typescript.html

# Reference
- https://www.tohoho-web.com/ex/typescript.html

# Install
1. npm コマンドを使用するために Node.js のインストール (https://nodejs.org/)
2. https://www.typescriptlang.org/download/ を確認する
```bash
$ npm install typescript --save-dev
$ ../node_modules/.bin/tsc --version
```

# Compile
```bash
$ ../node_modules/.bin/tsc app.ts 
```

# lite-server (簡易的な Web サーバ)
1. 初期化
```bash
$ npm init
$ npm install --save-dev lite-server
```

2. `package.json` に以下を追加
```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "lite-server"
  },
```

3. lite-server を起動
```bash
$ npm start
```

> [!NOTE]
> `node_modules` フォルダを削除したときは、`npm install`  で再作成する

> [!NOTE]
> watch mode を使うこともできる。
> `../node_modules/.bin/tsc app.ts -w`

# 文法
## Type
```js
// Type
// number: 1, 3.14, -100
// string: 'Hi', "Hi", `Hi`
// boolean: true, false
// object: {age: 30}
// Array: [1, 2, 3]
// Tuple: [1, 2] // TypeScript独自、長さが固定の配列
// Enum: enum { NEW, OLD } // TypeScript独自、列挙型
// Any:
// Union: number | string
// Literal: 'jp'
// type alias: type NumberOrString = number | string;
// void // 何も返さない
// undefined
// Function
// nuknown // any を使うよりは良い
// never // 戻り値を返さない
```
