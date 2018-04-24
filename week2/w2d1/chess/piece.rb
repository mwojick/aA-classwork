class Piece

  attr_accessor :pos, :board

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end


end



class King < Piece

  DELTAS = [[0,1],[1,0],[1,1],[0,-1],[-1,0],[-1,-1],[1,-1],[-1,1]]
  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def valid_moves
    possible_moves = DELTAS.map {|delt|}




  end

end
