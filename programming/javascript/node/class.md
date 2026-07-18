# Class

- https://nodejs.org/docs/latest-v24.x/api/util.html#utilinheritsconstructor-superconstructor

```javascript
// # クラスの実現方法
// ## 1. class

class Animal1 {
    constructor(name) {
        this.name = name;
    }

    speak() {
        process.stdout.write(`${this.name}: `);
    }
};

class Dog1 extends Animal1 {
    constructor(name) {
        super(`🐶 ${name}`);
    }

    speak() {
        super.speak();
        console.log(`ワン`);
    }
};

class Cat1 extends Animal1 {
    constructor(name) {
        super(`🐱 ${name}`);
    }

    speak() {
        super.speak();
        console.log(`ミャー`);
    }
};

const dog1 = new Dog1('ブル');
const cat1 = new Cat1('タマ');
dog1.speak();
cat1.speak();

// ## 2. function
const util = require('util');

function Animal2(name) {
    this.name = name;
};

Animal2.prototype.speak = function () {
    process.stdout.write(`${this.name}: `)
};

function Dog2(name) {
    Dog2.super_.call(this, `🐶 ${name}`);
}
util.inherits(Dog2, Animal2);

Dog2.prototype.speak = function () {
    Dog2.super_.prototype.speak.call(this);
    console.log(`Woof`);
};

function Cat2(name) {
    Cat2.super_.call(this, `🐱 ${name}`);
}
util.inherits(Cat2, Animal2);

Cat2.prototype.speak = function () {
    Cat2.super_.prototype.speak.call(this);
    console.log(`Meow`);
};

const dog2 = new Dog2('Buddy');
const cat2 = new Cat2('Oliver');
dog2.speak();
cat2.speak();
```
