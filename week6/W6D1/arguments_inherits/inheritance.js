

Function.prototype.inherits = function(parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
}

function MovingObject (size) {
  this.size = size;
}

function Ship (color, name, size) {
  MovingObject.call(this, size)
  this.color = color;
  this.name = name;
}
Ship.inherits(MovingObject);

function Asteroid (speed, size) {
  MovingObject.call(this, size)
  this.speed = speed;
}
Asteroid.inherits(MovingObject);


const ship1 = new Ship("blue","name",20);
const asteroid1 = new Asteroid(100,25);

const ufo = new MovingObject(999);
