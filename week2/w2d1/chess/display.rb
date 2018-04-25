require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0],board)

  end

  def render
    8.times do |row|
      8.times do |col|
        current_piece = board[[row,col]]
        color = current_piece.color
        if [row,col] == cursor.cursor_pos
          print current_piece.to_s.colorize(color).colorize(:background => :red)
        elsif current_piece.is_a?(NullPiece)
          print " ".colorize(:background => :black)
        else
          print current_piece.to_s.colorize(color).colorize(:background => :black)
        end
      end
      puts ""
    end
  end


  def test
    input = []
    inp = nil
    loop do
      # system("clear")
      render
      puts " "
      p inp
      p input
      input = [] if input.length == 2

      inp = cursor.get_input
      input << inp unless inp.nil?

      if input.length == 2
        p "piece moved"
        board.move_piece(input[0],input[1])
        p "????????"
      end
    rescue
      retry
    end
  end

  private

  attr_accessor :board, :cursor

end

if __FILE__ == $0
  b = Board.new
  disp = Display.new(b)
  disp.test

end
