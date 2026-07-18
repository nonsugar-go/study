# Console

- https://nodejs.org/docs/latest-v24.x/api/console.html

```javascript
// # console
// format: %s (文字列), %d (数値), %i (整数), %f (少数), %o (オブジェクト), %% (%)
const number = -123.45;
const lang = 'Node.js';
const obj = { number, lang };
const fmt = '%% lang: %s, number: %d, %i, %f, %o';
console.log('console.log: ' + fmt, lang, number, number, number, obj);
// console.trace('console.trace: ' + fmt, lang, number, number, number, obj) // スタック表示付き
console.debug('console.debug: ' + fmt, lang, number, number, number, obj)
console.info('console.info: ' + fmt, lang, number, number, number, obj)
console.warn('console.warn: ' + fmt, lang, number, number, number, obj)
console.error('console.error: ' + fmt, lang, number, number, number, obj)

console.table(Symbol());
console.table(undefined);
console.table([{ a: 1, b: 'Y' }, { a: 'Z', b: 2 }]);
console.table([{ a: 1, b: 'Y' }, { a: 'Z', b: 2 }], ['b', 'a']);
```
