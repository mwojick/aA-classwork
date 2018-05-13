require "byebug"
class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    ans = []
    self.my_each {|el| ans << el if prc.call(el)}
    ans
  end

  def my_reject(&prc)
    ans = []
    self.my_each {|el| ans << el if !(prc.call(el))}
    ans
  end

  def my_any?(&prc)
    self.my_each {|el| return true if prc.call(el)}
    false
  end

  def my_all?(&prc)
    self.my_each {|el| return false if !prc.call(el)}
    true
  end


  def my_flatten
    flattened = []

    self.my_each do |el|
      #byebug
      if el.is_a?(Array)
        flattened += el.my_flatten
      else
        flattened << el
      end

    end
    flattened
  end

  def my_zip(*args)
    arr = Array.new(self.length) {[]}
    (0...self.length).each do |idx|
        arr[idx] << self[idx]
        args.each{|sub_arr| arr[idx] << sub_arr[idx]}
    end
    arr
  end

  def my_rotate(shift=1)
    if shift > self.length-1
      shift = shift%self.length
    end
    if shift < 0 && shift.abs > self.length-1
      shift = -(shift.abs%self.length)
    end
    arr = []
    if shift >= 0
      arr = self.drop(shift) + self.take(shift)
    else
      arr = self.drop(self.length + shift) + self.take(self.length + shift)

    end
    arr
  end


end
