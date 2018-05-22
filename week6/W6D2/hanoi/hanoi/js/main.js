const HanoiGame = require("./game.js");
const HanoiView = require("./hanoi-view.js");

$( () => {
  const rootEl = $('.hanoi');
  window.HanoiGame = HanoiGame;
  const game = new HanoiGame();
  window.game = game; 
  new HanoiView(game, rootEl);
});