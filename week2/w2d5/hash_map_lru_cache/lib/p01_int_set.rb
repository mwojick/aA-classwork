class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    @store[num] = true if is_valid?(num)
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > @max || num < 0
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless include?(num)
  end

  def remove(num)
    @store[num].delete(num) if include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    i = num % num_buckets
    @store[i]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      if @count < num_buckets
        self[num] << num
        @count += 1
      else
        resize!
        self[num] << num
        @count += 1
      end
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    i = num % num_buckets
    @store[i]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_size = 2 * num_buckets
    new_arr = Array.new(new_size) { [] }
    @store.each do |arr|
      arr.each do |el|
        j = el % new_size
        new_arr[j] << el
      end
    end
    @store = new_arr
  end
end
