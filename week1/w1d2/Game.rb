require_relative 'Board.rb'
require_relative 'Player.rb'
require_relative 'Card.rb'

class Game

  attr_reader :board

  def initialize(player=Player.new,board=Board.new)
    @player = player
    @board = board
    @previous_guess = []
  end


  def play

    @board.populate

    @board.render
    until @board.won?

      play_round
    end

      p "Game over"

  end


  def play_round
    @previous_guess = []
    @previous_guess = make_guess
    @player.receive_revealed_card(@board[guess].number,@previous_guess)

    @board.render

    next_guess = make_guess
    @player.receive_revealed_card(@board[guess].number,next_guess)

    if match?(@previous_guess, next_guess)
      @player.receive_match(@board[next_guess].number)
      @board.render
      puts "Match!"
    else
      @board.render
      sleep(3)
      system("clear")
      @board[@previous_guess].hide
      @board[next_guess].hide
    end
  end

  def match?(guess1, guess2)
    @board[guess1].number == @board[guess2].number
  end


  def valid_move?(guess)
    valid_format?(guess) && valid_range?(guess) && valid_card?(guess)
  end

  def valid_format?(guess)
    if guess.class == Array && guess.size == 2
      return true
    end
    puts "Invalid guess format"
    false
  end

  def valid_range?(guess) #[num,num]
    if guess[0].between?(0, @board.grid.size) && guess[1].between?(0, @board.grid.size)
      return true
    else
      puts "Invalid range"
      return false
    end
  end

  def valid_card?(guess)
    if @board[guess].face
      puts "Invalid card choice"
      return false
    end
    true
  end

  def make_guess
    guess = @player.guess
    if valid_move?(guess)
      @board[guess].show
      return guess
    else
      make_guess
    end
  end


end


if __FILE__ == $0
  player1 = Player.new("Bob")
  board=Board.new
  game = Game.new(player1,board)
  game.play

  #
  # game.board.populate
  #   game.play_round
  #   game.board.render
  #
  # game.make_guess
  #   game.board.render
end
