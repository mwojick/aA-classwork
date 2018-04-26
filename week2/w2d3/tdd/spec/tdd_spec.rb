require 'rspec'
require 'tdd'

RSpec.describe Array do
  describe '#my_uniq' do
    it "returns an empty array when given an empty array" do
      expect([].my_uniq).to be_empty
    end
    it "returns an array of one element" do
      expect([1].my_uniq).to eq([1])
    end
    it 'returns an array without duplicate values' do
      expect([1,2,3].my_uniq).to eq([1,2,3])
    end
    it "returns an array with unique values" do
      expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end
  end

  describe '#two_sum' do
    it "returns an empty array if no two elements sum up to zero" do
      expect([1,2,3,4].two_sum).to be_empty
    end

    it "return the index pairs of elements with sum zero in order" do
      expect([-1,0,2,-2,1].two_sum).to eq([[0,4], [2,3]])
    end
  end

  describe '#my_transpose' do
    it "transposes an empty array" do
      expect([].my_transpose).to be_empty
    end

    it "transposes a matrix" do
      matrix = [
        [0,1,2],
        [3,4,5],
        [6,7,8]
      ]
      tranposed_matrix = [
        [0,3,6],
        [1,4,7],
        [2,5,8]
      ]
      expect(matrix.my_transpose).to eq(tranposed_matrix)
    end
  end

end

describe '#stock_picker' do
  it "outputs most profitable pair of days (simple)" do
    prices = [1,2,3,4]
    expect(stock_picker(prices)).to eq([0,3])
  end
  it "outputs most profitable pair of days in order" do
    prices = [2,3,4,5,1,9,3,3,2,45,0,1,44]
    expect(stock_picker(prices)).to eq([4,9])
  end
end


RSpec.describe TowersOfHanoi do
  subject(:tower) { TowersOfHanoi.new }
  describe "#initialize" do
    it "starts with 3 piles" do
      expect(tower.piles.length).to eq(3)
    end

    it "start first pile with 3 disks" do
      expect(tower.piles.first.length).to eq(3)
    end

    it "start with other 2 piles with no discs" do
      expect(tower.piles[1]).to be_empty
      expect(tower.piles[2]).to be_empty
    end
  end

  describe "#valid_move?" do
    it "takes two positions" do
      expect { tower.valid_move?(0) }.to raise_error(ArgumentError)
    end

    it "can only move disks from existing piles" do
      expect(tower.valid_move?(-1, 4)).to be false
    end

    it "can not move from an empty pile" do
      expect(tower.valid_move?(1, 0)).to be_falsey
    end

    it "can not move a larger piece on to a smaller one" do
      tower.piles = [[3,2],[1],[]]
      expect(tower.valid_move?(0, 1)).to be_falsey
    end
  end

  describe "#move" do
    it "moves disc from pile to pile" do
      tower.move(0,1)
      expect(tower.piles[1]).to eq([1])
    end
  end

  describe "#won?" do
    before(:each) {
      tower.piles = [[],[3,2],[1]]
    }
    it "returns true if game is over" do
      tower.move(2,1)
      expect(tower).to be_won
    end

    it "returns false if not game over" do
      expect(tower).to_not be_won
    end

  end


end







#
