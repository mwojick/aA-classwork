
class View {
  constructor(game, rootEl) {
    this.game = game;
    this.rootEl = rootEl;
    this.setupBoard();
    this.bindEvents();
  }
  
  setupBoard() {
    for (let i = 0; i < 3; i++) {
      this.rootEl.append(`<ul data-idx='${i}'></ul>`);
      for (let j = 0; j < 3; j++) {
        if (i === 0) {
          $('ul').eq(i).append(`<li class='disk-${j+1}'></li>`);
        } else {
          $('ul').eq(i).append(`<li class=""></li>`);
        }
      }
    }
  }
  
  bindEvents() {
    let firstMove;
    let secondMove; 
    let clicked = false;
    $("ul").on("click", (e) => {
      let $el = $(e.currentTarget); 
      if (clicked) {
        $('ul').removeClass("selected");
        secondMove = parseInt($el.data("idx"));
        
        if (this.game.isValidMove(firstMove, secondMove)) {
          let $children = $('ul').eq(firstMove).children();
          let disk;
          for (let i = 0; i < $children.length; i++) {
            if ($children.eq(i).attr("class") !== "") {
              disk = $children.eq(i).attr("class");
              $children.eq(i).removeClass(disk);
              break;
            }
          }
          let $children2 = $('ul').eq(secondMove).children();
          for (let j = 2; j > -1; j--) {
            if ($children2.eq(j).attr("class") === "") {
              $children2.eq(j).addClass(disk);
              break;
            }
          }
        
        
          this.game.move(firstMove, secondMove);
          if (this.game.isWon()) {
            $("li").css("background", "green");
            $("ul").off("click");
          }
        }
        
        clicked = false;
      } else {
        $el.addClass("selected");
        firstMove = parseInt($el.data("idx"));
        clicked = true;
      }
      
    });
  }
    
}




module.exports = View;