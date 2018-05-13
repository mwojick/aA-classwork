require_relative 'board.rb'
require_relative 'player.rb'

class Game
  def initialize(board, player)
    @board = Board.new
    @player = Player.new("Bob")
  end

  
end
