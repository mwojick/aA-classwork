require_relative 'piece'
require_relative 'stepable'

class Knight < Piece
  include Stepable

  DELTAS = [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[-2,-1],[2,-1],[-2,1]]

  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def move_diff
    [[1,2],[1,-2],[-1,2],[-1,-2],[2,1],[-2,-1],[2,-1],[-2,1]]
  end

  def symbol
    :N
  end

end
