function sum(...args) {
  let results = 0;
  args.forEach((el)=>{
    results += el;
  });
  return results;
}

// console.log(sum(1, 2, 3, 4) === 10);
// console.log(sum(1, 2, 3, 4, 5) === 15);

Function.prototype.myBind2 = function(context, ...bindArgs){
  // let that = this;
  // console.log(that);
  return (...callArgs) => {

    return this.apply(context, bindArgs.concat(callArgs));
  }
}

Function.prototype.myBind = function(context){
  let that = this;
  let bindArgs = Array.prototype.slice.call(arguments, 1);
  return function(){
    // console.log(this);
    let callArgs = Array.prototype.slice.call(arguments);
    return that.apply(context, bindArgs.concat(callArgs));
  }
}

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }
//
//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }
//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
//
// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(breakfast, "meow", "Kush")();
// Breakfast says meow to Kush!
// true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");





// == 30

function curriedSum(numArgs) {
  let numbers = [];
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce((acc, el)=> acc + el);
    } else {
      return _curriedSum;
    }
  }
}

// const sum1 = curriedSum(4);
// console.log(sum1(5)(30)(20)(1)); // => 56

Function.prototype.curry = function (numArgs) {
  let numbers = [];
  // let func = this;

  const _curry = (value) => {
    //return function (value) {}
    numbers.push(value);
    if (numbers.length === numArgs) {
      return this(...numbers);
      // return this.apply(null, numbers);
      // return func.apply(null, numbers);
    } else {
      return _curry;
    }
  }
  // didn't have with function declaration
  return _curry;
}

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

// console.log(sumThree(4, 20, 6)); // == 30

// you'll write `Function#curry`!
let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30

console.log(sumThree.curry(3)(4)(20)(6));








//
