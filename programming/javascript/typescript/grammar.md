# 文法
- https://compat-table.github.io/compat-table/es6/
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

# let, const
- let, const はブロックスコープ
- var はグローバルスコープか関数スコープ

