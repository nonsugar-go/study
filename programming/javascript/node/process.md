# Process

- https://nodejs.org/docs/latest-v24.x/api/process.html

```javascript
// # グローバル オブジェクト
console.log('__dirname: %s', __dirname);
console.log('__filename: %s', __filename);

// # process
console.log('環境変数: %s', JSON.stringify(process.env, null, 2));
for (let i = 0; i < process.argv.length; i++)
    console.log(`argv[${i}]: ${process.argv[i]}`);
console.log('cwd: %s', process.cwd());
console.log('実行時環境: %s', process.platform);

process.exit(0);
```

```javascript
// # process
const process = require('process');
const fs = require('fs');

process.on('uncaughtException', (err, origin) => {
  fs.writeSync(
    process.stderr.fd,
    `Caught exception: ${err}\n` +
    `Exception origin: ${origin}\n`,
  );
});

setTimeout(() => {
  console.log('This will still run.');
}, 5000);

// Intentionally cause an exception, but don't catch it.
nonexistentFunc();
console.log('This will not run.');
```
