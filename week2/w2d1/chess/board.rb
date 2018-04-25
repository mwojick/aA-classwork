require_relative "pieces/piece"
require_relative "pieces/nullpiece"
require_relative "pieces/pawn"
require_relative "pieces/king"
require_relative "pieces/knight"
require_relative "pieces/queen"
require_relative "pieces/rook"
require_relative "pieces/bishop"

class Board

  attr_reader :player_one_color, :player_two_color

  START_ROWS = [0,1,6,7]

  def initialize
    @rows = Array.new(8) {Array.new(8) {nil}}
    @player_one_color = :blue
    @player_two_color = :white
    NullPiece.instance
    populate



  end

  def populate
    # filled in nullpieces
      rows.each_index do |row|
        rows[row].each_index do |square|
          pos = [row,square]
          unless START_ROWS.include?(row)
            self[pos] = NullPiece.instance
          end
        end
      end

      # fills in all pawns
      place_pawns(1,player_one_color)
      place_pawns(6,player_two_color)

      #fills in all other pieces
      place_back_row(0,player_one_color)
      place_back_row(7,player_two_color)

  end

  def place_pawns(row,color)
    rows[row].each_index do |ind1|
      self[[row,ind1]] = Pawn.new(color, self, [row,ind1])
    end
  end

  def place_back_row(row,color)
    rows[row].each_index do |ind1|
      case ind1
      when 0
        self[[row,ind1]] = Rook.new(color, self, [row,ind1] )
      when 1
        self[[row,ind1]] = Knight.new(color, self, [row,ind1] )
      when 2
        self[[row,ind1]] = Bishop.new(color, self, [row,ind1] )
      when 3
        self[[row,ind1]] = King.new(color, self, [row,ind1] )
      when 4
        self[[row,ind1]] = Queen.new(color, self, [row,ind1] )
      when 5
        self[[row,ind1]] = Bishop.new(color, self, [row,ind1] )
      when 6
        self[[row,ind1]] = Knight.new(color, self, [row,ind1] )
      when 7
        self[[row,ind1]] = Rook.new(color, self, [row,ind1] )
      end
    end
  end



  def [](pos)
    row, col = pos
    rows[row][col]
  end

  def []=(pos,val)
    row, col = pos
    rows[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "Position outside the board." unless valid_pos?(start_pos)
    raise "This is a null piece." if self[start_pos].is_a?(NullPiece) # change to check null piece

    start_piece = self[start_pos]

    piece_valid_moves = start_piece.moves

    if piece_valid_moves.include?(end_pos)
      self[end_pos] = start_piece
      self[start_pos] = NullPiece.instance #???
      start_piece.pos = end_pos
      print "piece was moved to #{end_pos}"
    else
      raise "This is not a valid move for this piece."
    end
  end

  def valid_pos?(start_pos)
    start_pos.each do |idx|
      unless idx.between?(0,7)
        return false
      end
    end
    true
  end

  private
  attr_accessor :rows

end

if __FILE__ == $0
  board = Board.new

  # p board.

end
