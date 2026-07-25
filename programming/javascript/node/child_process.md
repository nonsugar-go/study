# Child process

- https://nodejs.org/docs/latest-v24.x/api/child_process.html#child_processforkmodulepath-args-options

## fork

### index.js

```javascript
const { fork } = require('child_process');
const path = require('path');

const child = fork(path.join(__dirname, 'child.js'), { execArgv: [] });
child.on('close', (code, signal) => {
    console.log(`Child process exit with code [${code}]`);
})
```

### child.js

```javascript
setTimeout(() => {
    console.log('Hello, world!'); 
}, 3000);
```

### index2.js

```javascript
const { fork } = require('child_process');
const path = require('path');
child = fork(path.join(__dirname, 'child2.js'), { execArgv:[] });
child.on('message', (data) => {
    console.log(data);
    child.send({hello: 'message from parent.'});
});
child.on('close', (code) => {
    console.log(`Child process exited with code [${code}]`);
})

// # child_process.fork(filename, [, args][, options]);
// ## options:
// | プロパティ | 型       | 説明                      | デフォルト        |
// |-----------|----------|--------------------------|------------------|
// | cwd       | string   | 子プロセスの cwd          | undefined        |
// | env       | object   | 環境変数                  | process.env      |
// | execPath  | string   | Node.js の実行ファイルパス | process.execPath |
// | execArgv  | string[] | Node.js 実行時オプション   | process.execArgv |
// | stdio     | string   | 標準入出力の接続設定 (pipe|ignore|inherit) | 'inherit' |

// # child_process.ChildProcess
// ## event
// - close
// - message
// ## method
// - send(message)

// # Process
// ## event
// - message
// ## method
// - send(message)
// - exit([code])
```

### cnild2.js

```javascript
setTimeout(() => {
    process.send({hello: 'message from child.'});
}, 3000);
process.on('message', (data) => {
    console.log(data);
    process.exit(0);
});
```
