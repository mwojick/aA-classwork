const MovingObject = require("./moving_object.js");
window.MovingObject = MovingObject;

console.log("Webpack is working!")

const mo = new MovingObject(
  { pos: [30, 30], vel: [10, 10], radius: 20, color: "#00FF00"}
);

// console.log(mo);
// console.log(mo.pos[0]);
//
window.mo = mo;


const canvasEl = document.getElementsByTagName("canvas")[0];
console.log(canvasEl);
const ctx = canvasEl.getContext("2d");
mo.draw(ctx);
