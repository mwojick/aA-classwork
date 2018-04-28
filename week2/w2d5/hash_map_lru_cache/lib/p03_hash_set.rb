require_relative 'p02_hashing'
require_relative 'p01_int_set'

class HashSet < ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  # def insert(key)
  # end
  #
  # def include?(key)
  # end
  #
  # def remove(key)
  # end

  private

  def [](num)
    num = num.hash
    i = num % num_buckets
    @store[i]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  # def resize!
  # end
end
