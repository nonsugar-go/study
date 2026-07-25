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
// | 繝励Ο繝代ユ繧｣ | 蝙・      | 隱ｬ譏・                     | 繝・ヵ繧ｩ繝ｫ繝・       |
// |-----------|----------|--------------------------|------------------|
// | cwd       | string   | 蟄舌・繝ｭ繧ｻ繧ｹ縺ｮ cwd          | undefined        |
// | env       | object   | 迺ｰ蠅・､画焚                  | process.env      |
// | execPath  | string   | Node.js 縺ｮ螳溯｡後ヵ繧｡繧､繝ｫ繝代せ | process.execPath |
// | execArgv  | string[] | Node.js 螳溯｡梧凾繧ｪ繝励す繝ｧ繝ｳ   | process.execArgv |
// | stdio     | string   | 讓呎ｺ門・蜃ｺ蜉帙・謗･邯夊ｨｭ螳・(pipe|ignore|inherit) | 'inherit' |

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
