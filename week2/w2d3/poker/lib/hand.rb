require_relative 'card'


class Hand

  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def set_hand(new_cards)
    @cards = new_cards
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_kind?
    if two_uniq_values?
      # return true if something meets
      # return false if something not meets
    else
      false
    end
  end

  def full_house?
    two_uniq_values?
  end

  def two_uniq_values?
    card_values = cards.map{ |card| card.value }
    card_values.uniq.length == 2
  end

  def flush?
    first_suit = cards.first.suit
    cards.all? {|card| card.suit == first_suit}
  end

  def straight?
    sorted_cards = cards.sort_by{|card| card.value}
    lowest_value = sorted_cards.first.value

    sorted_cards.each_with_index do |card, idx|
      if card.value - idx != lowest_value
        return false
      end
    end
    true
  end


end
