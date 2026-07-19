# Events

- https://nodejs.org/docs/latest-v24.x/api/events.html#class-eventemitter

```
const EventEmitter = require('events');
const Child = class extends EventEmitter {
    constructor() {
        super();
    }
};

const obj = new Child();

obj.on('tick', (message) => {
    console.log(message);
});

obj.emit('tick', 'Hello, world!');

const Clock = require('./clock');
const clock = new Clock();
let i = 0;
clock.on('tick', () => {
    console.log(++i);
    if (i > 3) {
        clock.stop();
    }

});
clock.start();
```
