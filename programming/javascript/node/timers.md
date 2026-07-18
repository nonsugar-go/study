# Timers

- https://nodejs.org/docs/latest-v24.x/api/timers.html

```javascript
// 遅延実行

// # イベントループ
// ## フェーズ
// | フェーズ          | 処理内容                     |
// | Times            | setTimeout(), setInterval() |
// | pending callback | I/O 完了処理、I/O 例外処理    |
// | idle             | Node.js 内部処理             |
// | poll             | I/O 処理                     |
// | check            | setImmediate()               |
// | close callback   | I/O 切断処理                 |
// ## キュー (各フェーズの間で実行)
// | キュー           | 処理内容                      |
// | nextTickQueue    | nextTick()                   |
// | microTaskQueue   | Promise                      |

setImmediate(() => { console.log('1. global.setImmediate()'); }) // setTime(callback, 0); より推奨
setTimeout(() => { console.log('1. global.SetTimeout()'); }, 4100);
const timer1 = setInterval((name, greeting) => {
    console.log('1. global.setInterval'); }, 1000);
setTimeout(() => {
    clearInterval(timer1);
    console.log("タイマー1を停止しました。");
}, 10000);
process.nextTick(() => { console.log('1. process.nextTick()'); }); // 再帰呼び指し禁止
Promise.resolve().then(() => { console.log('1. Promise.resolve().then()'); })

console.log('遅延実行のテスト1');

const end = (new Date()).getTime() + 3000;
while ((new Date()).getTime() < end) { }

setTimeout(() => { console.log('2. global.setTimeout()'); }, 4000);
setImmediate(() => { console.log('2. global.setImmediate()'); }); // setTimeout(callback, 0); より推奨
const timer2 = setInterval((name, greeting) => {
    console.log('2. global.setInterval'); }, 1000);
setTimeout(() => {
    clearInterval(timer2);
    console.log("タイマー2を停止しました。");
}, 10000);
process.nextTick(() => { console.log('2. process.nextTick()'); }); // 再帰呼び出し禁止
Promise.resolve().then(() => { console.log('2. Promise.resolve().then()'); });

console.log('遅延実行のテスト2');
```
