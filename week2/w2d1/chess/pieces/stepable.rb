module Stepable

  def moves
    all_moves = move_diff.map do |delta|
      x,y = pos
      dx,dy = delta
      [x+dx, y+dy]
    end
    all_moves_on_board = all_moves.select {|move| board.valid_pos?(move)}
    valid_moves = all_moves_on_board.reject do |move|
      board[move].color == self.color
    end
    valid_moves
  end

end
