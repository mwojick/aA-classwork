require 'rspec'
require 'card'


describe Card do
  subject(:card) { Card.new(:heart,1) }
  describe '#initialize' do
    it "has a suit" do
      expect(card.suit).to eq(:heart)
    end
    it "has a value" do
      expect(card.value).to eq(1)
    end
  end

  describe '#show' do
    it "shows the card" do
      expect(card.show).to eq("heart: 1")
    end
  end

end
