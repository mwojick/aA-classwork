require 'rspec'
require 'hand'
require 'card'

describe Hand do
  let(:card) { double("card") }
  let(:cards) {[card,card,card,card,card]}
  subject(:hand) { Hand.new(cards) }

  describe '#initialize' do
    it "stores the cards we have" do
      expect(hand.cards).to eq(cards)
    end
  end

  let(:cards) {
    [Card.new(:heart,1),
      Card.new(:heart,2),
      Card.new(:heart,3),
      Card.new(:heart,4),
      Card.new(:heart,5)] }

  describe '#flush?' do
    it 'returns flush' do
      hand.set_hand(cards)
      expect(hand).to be_flush
    end
  end

  describe '#straight?' do
    it "returns straight" do
      hand.set_hand(cards)
      expect(hand).to be_straight
    end
  end

  describe '#straight_flush?' do
    it 'returns straight_flush' do
      hand.set_hand(cards)
      expect(hand).to be_straight_flush
    end
  end

  let(:cards2) {
    [Card.new(:heart,1),
      Card.new(:spade,1),
      Card.new(:club,1),
      Card.new(:diamond,1),
      Card.new(:heart,2)] }

  describe '#four_of_kind?' do
    it "returns four of a kind" do
      hand.set_hand(cards2)
      expect(hand).to be_four_of_kind
    end
  end

  let(:cards2) {
    [Card.new(:heart,1),
      Card.new(:spade,1),
      Card.new(:club,1),
      Card.new(:diamond,2),
      Card.new(:heart,2)] }

  describe '#full_house' do
    it "returns full house" do
      hand.set_hand(cards3)
      expect(hand).to be_full_house
    end
  end
    #
    # it "return three of a kind" do
    #
    # end
    #
    # it "return two pairs" do
    #
    # end
    #
    # it "return one pair" do
    #
    # end
    #
    # it "return high card" do
    #
    # end
end
