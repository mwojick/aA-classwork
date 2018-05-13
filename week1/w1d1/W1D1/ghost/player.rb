class Player
  attr_accessor :name, :lives

  def initialize(name="Bob")
    @name = name
    @lives = 0
  end

  def guess
    p "Enter Guess #{@name}"
    $stdin.gets.chomp
  end

  def alert_invalid_guess
    p "Invalid Guess"
    p "Must be single letter"
  end

end


if __FILE__ == $0
  # player1 = Player.new("Bob")
  #     p ARGV
  # guess = player1.guess
  #
  # p guess

end
