# require_relative "dictionary.txt"
require_relative "player.rb"

class Game

  ALPHABET = ("a".."z").to_a
  attr_accessor :dictionary, :players, :fragment

  def initialize(dictionary="dictionary.txt",*players)
    @dictionary = File.readlines(dictionary).map(&:chomp)
    @players = players
    @fragment = ""
    @current_player = @players.first
    @previous_player = @players.last
  end

  def play
    until oneplayerleft?

      until @previous_player.lives == 2
        @fragment = ""
        play_round
      end

      p "#{@previous_player.name} is out!"
      @players.delete(@previous_player)

      self.next_player!
      
    end

    p "#{@players.first.name} wins!"
  end


  def play_round
    until @dictionary.include?(@fragment)
      take_turn(@current_player)
      self.next_player!
      p "fragment: #{@fragment}"
    end
    @previous_player.lives += 1
    p "#{@previous_player.name} has #{@previous_player.lives} points"
  end

  def oneplayerleft?
    @players.length == 1
  end

  def next_player!
    @players.rotate!
    @current_player = @players.first
    @previous_player = @players.last
  end

  def take_turn(player)
    guess = player.guess
    if valid_play?(guess)
      @fragment += guess.downcase
    else
      player.alert_invalid_guess
      take_turn(player)
    end
  end

  def valid_play?(guess)
    if ALPHABET.include?(guess.downcase)
      frag = @fragment + guess

      @dictionary.any? do |word|
        word =~ /^#{frag}/
      end
    else
      false
    end
  end

end





if __FILE__ == $0
  player1 = Player.new("Bob")
  player2 = Player.new("George")
  player3 = Player.new("Alex")
  new_game = Game.new("dictionary.txt",player1,player2,player3)


  new_game.play


end
