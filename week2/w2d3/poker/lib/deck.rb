require_relative 'card'


class Deck
  attr_reader :cards

  def initialize
    @cards = []
  end

  def populate
    suits = [:heart, :spade, :diamond, :club]
    suits.each do |suit|
      (0..12).each do |value|
        @cards << Card.new(suit, value)
      end
    end
    nil
  end

  def shuffle
    cards.shuffle!
  end

  def draw
    cards.pop
  end
end
