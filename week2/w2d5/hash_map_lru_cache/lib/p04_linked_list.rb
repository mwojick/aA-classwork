class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next
    self.next.prev = self.prev
    self
  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_node = @head
    until current_node == @tail
      if current_node.key == key
        return current_node.val
      end
      current_node = current_node.next
    end
    nil
  end

  def include?(key)
    current_node = @head
    until current_node == @tail
      if current_node.key == key
        return true
      end
      current_node = current_node.next
    end
    false
  end

  def append(key, val)
    if include?(key)
      update(key, val)
    else
      new_node = Node.new(key, val)
      new_node.prev = @tail.prev
      new_node.next = @tail
      @tail.prev.next = new_node
      @tail.prev = new_node
    end
    nil
  end

  def update(key, val)
    if include?(key)
      current_node = @head
      until current_node.key == key
        current_node = current_node.next
      end
      current_node.val = val
    end
    nil
  end

  def remove(key)
    if include?(key)
      current_node = @head
      until current_node.key == key
        current_node= current_node.next
      end
      current_node.remove
    end
    nil
  end

  def each(&prc)
    current_node = @head.next
    until current_node == @tail
      prc.call(current_node)
      current_node = current_node.next
    end
       
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
