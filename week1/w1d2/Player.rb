class Player
  def initialize(name="bob")
    @name = name
  end

  def guess
    p "Where do you want to guess?"
    $stdin.gets.chomp.split(",").map(&:to_i)
  end

  def receive_revealed_card(num,guess)
  end

  def receive_match(num)
  end



end
