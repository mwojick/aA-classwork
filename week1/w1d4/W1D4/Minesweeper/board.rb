require "byebug"
class Board
  attr_reader :grid, :bombs

  def initialize(grid = Array.new(3) { Array.new(3) {nil} }, bombs = 3)
    @grid = grid
    @bombs = bombs
    place_bombs
  end

  def [](pos)
    x,y = pos
    grid[x][y]
  end

  def []=(pos,val)
    x,y = pos
    grid[x][y] = val
  end

  def find_empty_coordinates
    empty_coordinates = []
    grid.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        empty_coordinates << [i, j] if cell.nil?
      end
    end
    empty_coordinates
  end

  def place_bombs
    @bombs.times do
      pos = find_empty_coordinates.sample
      self[pos] = :bomb
    end
  end

end


if __FILE__ == $0
  board = Board.new
p  board.grid
end
