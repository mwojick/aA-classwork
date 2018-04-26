class Array
  def my_uniq
    arr = []
    self.each do |el|
      arr << el unless arr.include?(el)
    end
    arr
  end

  def two_sum
    arr = []
    (0...self.length - 1).each do |idx1|
      (idx1 + 1...self.length).each do |idx2|
        arr << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    arr
  end

  def my_transpose

    arr = Array.new(self.size) { Array.new(self.size) }
    self.each_with_index do |row,idx1|
      row.each_with_index do |col,idx2|
        arr[idx1][idx2] = self[idx2][idx1]
      end
    end
    arr
  end

end


def stock_picker(array)
  pair = []
  best_profit = 0
  (0...array.length - 1).each do |idx1|
    (idx1 + 1...array.length).each do |idx2|
      profit = array[idx2] - array[idx1]
      if profit > best_profit
        best_profit = profit
        pair = [idx1, idx2]
      end
    end
  end
  pair
end


class TowersOfHanoi

  attr_accessor :piles
  def initialize
    @piles = [[3,2,1],[],[]]
  end

  def valid_move?(start_pos = nil, end_pos = nil)
    raise ArgumentError if start_pos.nil? || end_pos.nil?
    if start_pos.between?(0, 2) && end_pos.between?(0,2)
      return false if piles[start_pos].empty?
      unless piles[end_pos].empty?
        return false if piles[start_pos].last > piles[end_pos].last
      end
      true
    else
      false
    end
  end

  def move(start_pos, end_pos)
    piles[end_pos] << piles[start_pos].pop if valid_move?(start_pos, end_pos)
  end

  def won?
    piles[1].length == 3 || piles[2].length == 3
  end

end
