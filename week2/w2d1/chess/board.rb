class Board

  START_PIECES = [0,1,6,7]

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    populate
  end

  def populate
      rows.each_index do |row|
        row.each do |square|
          if START_PIECES.include?(row)
            square = Piece.new
          else
            square = nil
          end
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
    # check if the start_pos has a piece on it
    p_start_pos = self[start_pos]
      raise "No piece at this starting position" if p_start_pos.nil?
    # check if piece can go to end_pos
    #get potential moves from the piece
    p_valid_moves = p_start_pos.valid_moves
      #do those moves include the one from the user
    if p_valid_moves.include?(end_pos)
      self[end_pos] = p_start_pos
      self[start_pos] = nil
      p_start_pos.pos = end_pos
    else
      raise "This is not a valid move for this piece"
    end
  end

  def valid_move?(start_pos, end_pos)

  end

  private
  attr_accessor :rows

end
