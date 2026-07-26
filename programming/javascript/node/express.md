# Express

- https://expressjs.com/en/5x/starter/installing/
- https://expressjs.com/en/5x/starter/hello-world/

## Install

```zsh
npm install express
```

## Example

**`app.js`**

```javascript
const PORT = process.env.PORT;
const express = require('express');
const app = express();
// # ミドルウェア
// function ([err, ]req, res, next) {
//  // TODO
//  next();
// }
app.use((req, res, next) => {
    console.log(`[*] [${new Date().toLocaleString()}] ${req.method} ${req.path}`)
    next();
});
// # ルーティング
// app.(get|post|put|delete)(path, callback)
app.get('/', (req, res) => {
    res.end('Hello, world!');
});
app.get('/ping', (req, res, next) => {
    res.status(200).send('pong');
});
app.use('/home', require('./routers/hello'));
// # パスパラメーター
// http://localhost:8000/items/101
app.get('/items/:id', (req, res, next) => {
    res.status(200).send(req.params.id);
});
// # クエリパラメータ
// http://localhost:8000/q?keyword=WORD&page=n
app.get('/q', (req, res, next) => {
    res.status(200).send(
        {keyword: req.query.keyword, page: req.query.page});
});
app.listen(PORT, () => {
    console.log(`Application listening at ${PORT}`);
});
```

** `routers/hello.js` **

```javascript
const router = require('express').Router();
router.get('/hello', (req, res, next) => {
    res.status(200).send('world!');
});
module.exports = router;
```

