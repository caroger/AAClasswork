function sum1() {
  let output = 0;
  for (let i = 0; i < arguments.length; i++) {
    output += arguments[i];
  }
  return output;
}

// console.log(sum1(1, 2, 3, 4, 5));

function sum2(...args) {
  let output = 0;
  args.forEach((el) => (output += el));
  return output;
}
// console.log(sum2(1, 2, 3, 4, 5));

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

class Dog {
  constructor(name) {
    this.name = name;
  }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");
markov.says("meow", "Ned");

Function.prototype.myBind = function () {
  let that = this;
  let args = Array.from(arguments);

  return function () {
    let args2 = Array.from(arguments);
    return that.apply(args[0], args2.concat(args.slice(1)));
  };
};

markov.says.myBind(pavlov, "meow", "Kush")();
markov.says.myBind(pavlov)("meow", "a tree");

function curriedSum(numArgs) {
  let numbers = [];

  function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      output = 0;
      numbers.forEach((el) => (output += el));
      return output;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

let f1 = curriedSum(3);
f1 = f1(4);
f1 = f1(20);
f1 = f1(6);
console.log(f1);

Function.prototype.curry = function (numArgs) {
  const args = [];
  const fn = this;

  function _curriedFn(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return fn(...args);
    } else {
      return _curriedFn;
    }
  }
  return _curriedFn;
};

function sumThree(num1, num2, num3) {
  return num1 + num2, +num3;
}
