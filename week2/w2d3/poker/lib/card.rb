class Card

  attr_reader :suit, :value
  def initialize(suit = nil, value = nil)
    raise ArgumentError if suit.nil? || value.nil?
    @suit = suit
    @value = value
  end

  def show
    "#{suit}: #{value}"
  end

  def inspect
    show
  end

  def to_s
    show
  end

end
