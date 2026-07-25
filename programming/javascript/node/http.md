# Http

# http.Server

- https://nodejs.org/docs/latest-v24.x/api/http.html#class-httpserver

```javascript
const http = require('http');
const fs = require('fs');
const path = require('path');
// # http.Server
const server = http.createServer((req, res) => {
    // # http.IncommingMessage
    console.log(
        `${(new Date().toISOString())} ` +
        `${req.method} ${req.url} ` +
        `${req.headers['user-agent']}`
    )
    if (req.method === 'POST') {
        req.pipe(res);
    } else {
        const reader = fs.createReadStream(
            path.join(__dirname, 'http_server.js'), 'utf8');
        reader.pipe(res);
    }

    // # http.ServerResponse
    // write(chunk[, encoding])
    // end(chunk[, encoding])
    // setHeader(name, value)
    // removeHeader(name)
    // statusCode
    // res.end('Hello, world!');
});
server.listen(8000);
```

# http.ClientRequest

- https://nodejs.org/docs/latest-v24.x/api/http.html#class-httpclientrequest

```javascript
const http = require('http');
// req: http.ClientRequest
const req = http.request(
    'http://localhost:8000',
    { method: 'GET' },
    res => {
        // res: http.IncommingMessage

        // res.pipe(process.stdout);

        res.on('data', chunk => {
            console.log(chunk.toString());
        });
    } 
);
req.end();
```

```javascript
const http = require('http');
const data = 'Hello, 亮!'
const url = 'http://localhost:8000/'
const options = {
    method: 'POST',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(data)
    }
};
const req = http.request(url, options, res => {
    res.pipe(process.stdout);
});
req.on('error', err => {
    console.log(err.message);
});
req.end(data);

// # http.ClientRequest
// ## event
// - response
// - error
// ## method
// - write(chunk[, encoding])
// - end(chunk[, encoding])
// - setHeader(name, value)
// - removeHader(name)
```

