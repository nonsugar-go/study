# File

- https://nodejs.org/docs/latest-v24.x/api/path.html

```javascript
// # パス文字列
const path = require('path');
p1 = 'C:\\\\test\\index.js';
p2 = 'C:\\\\test';
p3 = 'index.js'
p4 = 'C:\\\\test\\project\\red\\..\\..\\index.js'
console.log('dirname(%s): %s', p1, path.win32.dirname(p1));
console.log('basename(%s): %s', p1, path.win32.basename(p1));
console.log('extname(%s): %s', p1, path.win32.extname(p1));
console.log('join(%s, %s): %s', p2, p3, path.win32.join(p2, p3));
console.log('normalize(%s): %s', p4, path.win32.normalize(p4));
```

- https://nodejs.org/docs/latest-v24.x/api/fs.html

```javascript
```
