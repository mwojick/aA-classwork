const View = require("./ttt-view.js");// require appropriate file
const Game = require("../../solution/game.js");

$( () => {
  let game = new Game();
  let view = new View(game, $('.ttt'));
  
  view.setupBoard();
  view.bindEvents();
  
  // Your code here
});
