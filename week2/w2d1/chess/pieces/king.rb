require_relative 'piece'
require_relative 'stepable'

class King < Piece
  include Stepable

  DELTAS = [[0,1],[1,0],[1,1],[0,-1],[-1,0],[-1,-1],[1,-1],[-1,1]]

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
    :K
  end

end
