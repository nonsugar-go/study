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
# アロー関数式
- https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Functions/Arrow_functions
# デフォルト引数
- https://typescriptbook.jp/reference/functions/default-parameters
# スプレッド/レスト 演算子 (spread / rest)
- https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Spread_syntax
- https://github.com/tc39/proposal-object-rest-spread
# 分割代入 (Destructuring assignment)
- https://developer.mozilla.org/ja/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment
# Class
- https://www.typescriptlang.org/docs/handbook/2/classes.html

# Intersection Types (交差型)
- https://typescriptbook.jp/reference/values-types-variables/intersection
# Type Guards (型ガード)
# DiscriminateUnions (判別される Union 型)
# Type Casting (型キャスト)
# Function Overloads (関数オーバーロード)
