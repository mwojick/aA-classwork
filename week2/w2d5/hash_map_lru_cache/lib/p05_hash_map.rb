require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket = bucket(key)
    bucket.include?(key)
  end

  def set(key, val)
    bucket = bucket(key)
    @count += 1 unless bucket.include?(key)
    resize! if @count > num_buckets
    bucket.append(key, val)
  end

  def get(key)
    bucket = bucket(key)
    bucket.get(key)
  end

  def delete(key)
    bucket = bucket(key)
    bucket.remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |bucket|
      bucket.each do |node|
        prc.call(node.key,node.val)
      end
    end

    self
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_size = 2 * num_buckets
    new_arr = Array.new(new_size) { LinkedList.new }
    @store.each do |bucket|
      bucket.each do |node|
        j = node.key.hash % new_size
        new_arr[j].append(node.key, node.val)
      end
    end
    @store = new_arr
  end


  def bucket(key)
    i = key.hash % num_buckets
    @store[i]
  end


end
