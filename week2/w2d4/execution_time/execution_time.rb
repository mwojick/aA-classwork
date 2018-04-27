def my_min_slow(array)
  array.each do |x|
    smaller = true
    array.each do |y|
      next if x == y
      smaller = false if x > y
    end
    return x if smaller == true
  end
end


def my_min_fast(array)
  min = nil
  array.each do |i|
    min = i if min.nil?
    min = i if min > i
  end
  min
end

# class Array
#   def subset
#     return [[]] if self.length < 1
#     last_el  = self.pop
#     first = subset
#     first += first.map{|el|el += [last_el]}
#   end
# end
#
# def largest_contiguous(list)
#   subs = list.subset
#   max = nil
#   max_sum = nil
#   subs.each do |arr|
#     next if arr.empty?
#     sum = arr.reduce(:+)
#     if max.nil? || max_sum < sum
#       max_sum = sum
#       max = arr
#     end
#   end
#   max
# end

def largest_contiguous(list)
  max = nil
  current_sum = nil

  if list.all? {|el| el < 0}
    return list.max
  end

  list.each do |el|
    if max.nil?
      max = el
      current_sum = el
      next
    end
    current_sum += el
    current_sum = 0 if current_sum < 0
    max = current_sum if max < current_sum
  end
  max
end

def first_anagram?(string1,string2)
  string1.chars.permutation.any? {|str| str.join == string2}
end

# def second_anagram?(str1,str2)
#   copies = []
#   copies << str1.chars << str2.chars
#   str1.each_char do |char1|
#     if str2.chars.include?(char1)
#       copies.each do |arr|
#         idx = arr.index(char1)
#         p char1
#         p idx
#         arr[idx] = nil
#       end
#     end
#   end
#   copies.each {|arr| arr.delete(nil)}
#   copies.all?(&:empty?)
# end

def second_anagram?(str1,str2)

  copy = str2.chars

  str1.each_char do |char|
    if copy.include?(char)
      copy[copy.index(char)] = nil
    end
  end
  copy.delete(nil)
  copy.empty?
end

def third_anagram?(str1,str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1,str2)

  hash1 = Hash.new { |hash, key| hash[key] = 0 }
  str1.each_char do |char|
    hash1[char] += 1
  end

  str2.each_char do |char|
    hash2[char] += 1
  end

  hash1 == hash2
end

def two_sum?(arr, target)
  hash = Hash.new(0)
  arr.each { |el| hash[el] += 1}

  hash.each do |k,v|
    x = target-k
    return true if x == k && v > 1
    return true if hash[x] != 0 && x != k
  end
  false

end

if __FILE__ == $0


  list = [-2, -3, -6, -7, -6, -7]

  p my_min_fast(list)
  p largest_contiguous(list)
end
