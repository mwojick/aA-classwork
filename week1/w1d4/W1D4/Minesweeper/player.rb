class Player
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_move
    puts "Enter your move (ex. r 0 0)"
    puts "r = reveal, f = flag"
    print ">"
    gets.chomp
  end
end
