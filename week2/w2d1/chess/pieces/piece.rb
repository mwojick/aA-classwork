# require_relative "nullpiece"


class Piece

  attr_accessor :pos, :color, :board

  def initialize(color = :white, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def empty?
  end

  def valid_moves
  end

  def symbol
    :X
  end

  def to_s
    "#{symbol}"
  end

  def move_into_check?(end_pos)
  end

end
