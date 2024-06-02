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
## watch モード
### 一つの ts ファイルを監視
```bash
$ ../node_modules/.bin/tsc app.ts -w
```
### 複数ファイルを監視
```
## 初期化 (tsconfig.json が作成される)
$ ../node_modules/.bin/tsc --init

## *.ts ファイルをコンパイル 
$ ../node_modules/.bin/tsc

## watch モード
$ ../node_modules/.bin/tsc -w
```
### tsc コマンドのコンパイル除外指定
`tsconfig.json` に記述
```json
  "exclude": [
    "node_modules",
    "**/type-*.ts",
    "using-ts.ts"
  ],
```

## Compiler Options
`tsconfig.js` の説明

```json
{
  "compilerOptions": {
    "target": "es2016",
    // コンパイルされる JavaScript のバージョン
    "module": "commonjs",
    // "lib": [],
    // "allowJs": files. // *.js をコンパイル対象に
    // "checkJs": true, // *.js をチェック対象に
    // "jsx": "preserve", // React 使用時
    "sourceMap": true, // *.js.map が生成される。ブラウザで TypeScript のソースが見れる
    // "outFile": "./",
    // JavaScript のファイルを一つにまとめるときに使用
    "outDir": "./dist", // JavaScript の出力先
    "rootDir": "./src", // *.ts ファイル格納先
    "removeComments": true, // コメントを削除
    // "noEmit": true, // コンパイルせず、チェックのみ
    // "downlevelIteration": true, // 古い JavaScript で for ループがうまく動作しない場合
    "noEmitOnError": true, // コンパイルエラーがある場合、出力しない
    "strict": true, // 厳格な型チェック
    "noUnusedLocals": true, // 未使用のローカル変数を許可しない
    "noUnusedParameters": true, // 未使用のパラメータを許可しない
    "noImplicitReturns": true,  // return が無い分岐を許可しない
    "noFallthroughCasesInSwitch": true, // switch 文でbreak無しを許可しない
    "forceConsistentCasingInFileNames": true, // ファイル名の大文字小文字が正しいことを強制する
  }
}
```

## Visual Studio Code + Chrome でデバッグ
1. `tsconfig.js` の設定 `"sourceMap": true,`
2. `npm start`
3. vscode でブレイクポイントを設定
4. Ctrl+Shift+P > Debug: Open Link: http://localhost:3000/

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
