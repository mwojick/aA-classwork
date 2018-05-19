class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.  
    let date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    this.printTime();
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    let time = `${this.hours}:${this.minutes}:${this.seconds}`;
    console.log(time);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.seconds++;
    this.printTime();
  }
}

// const clock = new Clock();


const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum = 0, numsLeft, callback){
  if (numsLeft < 1) {
    reader.close();
    return callback(sum);
  }
  
  reader.question("Enter Number: ", function(num_str) {
    let num = parseInt(num_str);
    sum += num;
    console.log(sum);
    addNumbers(sum, numsLeft - 1, callback);
  });
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));

function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question(`Is ${el1} > ${el2}? (y/n)`, function(response){
    if (response === 'y') {
      callback(true);
    } else {
      callback(false);
    }
  });
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
  if (i === arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps);
  } else {
    askIfGreaterThan(arr[i], arr[i + 1], function(isGreater){
      if (isGreater) {
        madeAnySwaps = isGreater;
      }
      if (madeAnySwaps) {
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]];
      }
      console.log(arr);
      innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
    });
  }
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps = true) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, madeAnySwaps = false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
    
  }
  
  outerBubbleSortLoop();
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
}

// absurdBubbleSort([3, 7, 1, 5, 4, 2], function (arr) {
//   console.log("Sorted array: " + JSON.stringify(arr));
//   reader.close();
// });

Function.prototype.myBind = function(context) {
  return () => {
    this.apply(context);
  };
};

class Lamp {
  constructor() {
    this.name = "a lamp";
  }
}

const turnOn = function() {
   console.log("Turning on " + this.name);
};

const lamp = new Lamp();

turnOn(); // should not work the way we want it to

const boundTurnOn = turnOn.bind(lamp);
const myBoundTurnOn = turnOn.myBind(lamp);

boundTurnOn(); // should say "Turning on a lamp"
myBoundTurnOn(); // should say "Turning on a lamp"



// 