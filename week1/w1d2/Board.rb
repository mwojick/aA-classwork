require_relative 'Card.rb'

class Board

  attr_reader :grid

  def initialize(grid = Array.new(2) {Array.new(2) {nil}}   )
    @grid = grid
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

  def render
    grid.flatten.each do |card|
      p card.display_card
    end
  end

  def won?
    grid.flatten.all? {|card| card.face }
  end

  def gen_numbers
    total_uniq_cards  = grid.flatten.size/2
    array_numbers = (0...total_uniq_cards).to_a*2
    array_numbers.shuffle
  end

  def reveal(guess_pos)
    grid[guess_pos].reveal
  end

  def populate
    numbers = gen_numbers
    grid.each_index do |row|
      grid.each_index do |col|
        grid[row][col] = Card.new(numbers.pop,false)
      end
    end
  end

end

if __FILE__ == $0
  board = Board.new
  board.populate
  board.render
  p board.won?
end
