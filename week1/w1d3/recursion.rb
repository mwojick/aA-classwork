
require "byebug"

def range(start,finish)
  return [start] if start == finish-1 || start == finish
  return [] if start > finish

  [start] + range(start+1,finish)
end


def sum_arr_rec(arr)
  return nil if arr.empty?
  return arr.first if arr.length == 1
  arr.pop + sum_arr_rec(arr)
end

def sum_arr_iter(arr)
  arr.reduce(:+)
end

def exp1(b, n)
  return 1 if n <= 0
  b*exp1(b,n-1)
end

def exp2(b, n)
  return 1 if n == 0
  if n.even?
    exp2(b, n/2) ** 2
  else
    b * (exp2(b, (n-1)/2)**2)
  end
end

class Array
  def deep_dup
    dupped_array = []
    self.each do |el|
      if el.is_a?(Array)
        dupped_array << el.dup.deep_dup
      else
        dupped_array << el
      end
    end
    return dupped_array
  end
end

def fib(n)
  return [1] if n == 1
  return [1,1] if n == 2

  prev_fib = fib(n-1)
  prev_fib << prev_fib[-1] + prev_fib[-2]
end


def fib2(n)
  return 1 if n == 1
  return 1 if n == 2
  fib2(n-1) + fib2(n-2)
end

def bsearch(array,target)
  middle_idx = array.length/2
  middle_el = array[middle_idx]

  return nil if array.empty?
  return middle_idx if middle_el == target

  if target < middle_el
    bsearch(array[0...middle_idx],target)
  else
    if bsearch(array[middle_idx+1..-1],target).nil?
      return nil
    else
      middle_idx + 1 + bsearch(array[middle_idx+1..-1],target)
    end
  end
end

def merge_sort(arr)
  return arr if arr.length <= 1
  middle_idx = arr.length/2
  left_arr = merge_sort(arr[0...middle_idx])
  right_arr = merge_sort(arr[middle_idx..-1])
  
  new_arr = []
  until left_arr.empty? || right_arr.empty?
    if  left_arr[0] < right_arr[0]
      new_arr << left_arr.shift
    else
      new_arr << right_arr.shift
    end
  end
  new_arr + left_arr + right_arr
end

def subsets(arr)
  return [arr] if arr.length == 0

  result = subsets(arr.take(arr.length-1))
  result + result.map {|el| el += [arr[-1]]}

end

def permutations(arr)
    # byebug
  return [arr] if arr.length == 1
  el = arr.shift

  sub_permutations = permutations(arr)

  result = []

  sub_permutations.each do |sub_arr|
    (0..sub_arr.length).each do |i|
        result << sub_arr[0...i] + [el] + sub_arr[i..-1]
      end
    end
  result
end




if __FILE__ == $0


  # p subsets([1,2,3,4])
  # p merge_sort([3, 4, 1, 2, 7, 4, 9])
  p permutations([1,2,3])

end
