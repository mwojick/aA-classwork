require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  describe '#initialize' do
    it 'starts with empty deck' do
      expect(deck.cards).to be_empty
    end
  end

  describe '#populate' do
    it "adds a set of 52 cards" do
      deck.populate
      expect(deck.cards.length).to eq(52)
    end
  end

  describe '#shuffle' do
    it "shuffle the deck to be different from last deck " do
      deck.populate
      first_card = deck.cards.first
      deck.shuffle
      shuffled_first_card = deck.cards.first
      expect(shuffled_first_card).to_not eq(first_card)
    end

  end


  describe '#draw' do
    it "take out a card" do
      deck.populate
      deck.shuffle
      deck.draw
      expect(deck.cards.length).to eq(51)
    end

  end



end
