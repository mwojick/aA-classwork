class View {
  constructor(game, $el) {
    this.$el = $el; 
    this.game = game;
    
  }
  
  bindEvents() {
    $('li').on("click",(e)=>{
      let $li = $(e.currentTarget);
      if ($li.text() === "") {
        let cp = this.game.currentPlayer;
        $li.html(`<h1>${cp}</h1>`);
        $li.css("background", "white");
        
        let pos = $li.data("pos").split(',').map((el)=>parseInt(el));
        this.game.playMove(pos);
        if (this.game.isOver()) {
          $("li").off("click");
          let winner = this.game.winner();
          let $lis = $('li');
          for (var i = 0; i < $lis.length; i++) {
            if ($lis.eq(i).text() === winner) {
              $lis.eq(i).css("background", "green");
              $lis.eq(i).css("color", "white");
            } else {
              $lis.eq(i).css("background", "white");
              $lis.eq(i).css("color", "red");
            }
          }
          // alert("test");
          
        }
        
      }
  });
  }

  makeMove($square) {
    
  }

  setupBoard() {
    for (var i = 0; i < 3; i++) {
      this.$el.append(`<ul></ul>`);
      for (var j = 0; j < 3; j++) {
        $('ul').eq(i).append(`<li data-pos='${i},${j}'></li>`);
      }
    }
  }
}

module.exports = View;
