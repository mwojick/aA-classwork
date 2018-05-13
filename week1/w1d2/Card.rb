class Card

  attr_reader :number, :face

  def initialize(number= 0, face = false)
    @number = number
    @face = face
  end

  def display_card
    face ? number : nil
  end

  def hide
    @face = false
  end

  def show
    @face = true
  end

  def to_s
  end

  def ==(card)
    @number == card.number
  end
end

if __FILE__ == $0
  ace = Card.new(1, true)
  ace2 = Card.new(2, true)
  p ace.==(ace2)
end
