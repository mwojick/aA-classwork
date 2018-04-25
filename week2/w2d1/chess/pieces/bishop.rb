require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  include Slideable

  
  def initialize(color, board, pos)
    super(color, board, pos)
  end

  def symbol
    :B
  end

end
