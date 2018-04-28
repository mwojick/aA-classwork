class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    new_hash = 0
    each_with_index do |el, i|
      new_hash += (el * i).hash
    end

    new_hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    new_hash = 0
    each do |key, value|
      new_hash += (key.to_s.ord * value.to_s.ord).hash
    end
    new_hash
  end
end
