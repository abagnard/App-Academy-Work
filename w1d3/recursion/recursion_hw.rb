def range(start_yr, end_yr)
  return [] if start_yr == end_yr
  range(start_yr + 1, end_yr) << start_yr + 1
end

def exp_rec_1(b, n)
  return 1 if n == 0

  b * exp_rec_1(b, n-1)
end

def exp_rec_2(b, n)
  return 1 if n == 0

  if n.even?
    exp_fxn = exp_rec_2(b, n/2)
    p exp_fxn * exp_fxn
  else
    exp_fxn = exp_rec_2(b, (n-1)/2)
    b * exp_fxn * exp_fxn
  end

end

# exp_rec_2(3,2)

class Array
  def deep_dup
    dup_arr = []
    self.each do |el|
      if !el.is_a?(Array)
        dup_arr << el
      else
        dup_arr << el.deep_dup
      end
    end
    dup_arr

  end
end

# p [1, [2], [3, [4]]].deep_dup

def fibonacci(n)
  return [0, 1].take(n) if n <= 2

  fibs = fibonacci(n - 1)
  fibs << fibs[-1] + fibs[-2]

end

# p fibonacci(6)

def bsearch(array, target)
  middle_idx = array.length / 2
  return middle_idx if array[middle_idx] == target
  if array[middle_idx] < target
    bsearch(array[middle_idx+1...-1], target)
    # middle_idx
  else
    bsearch(array[0...middle_idx], target)
  end

end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

class Array
  def unmerge
    return self if self.length <= 1
    mid_idx = self.length / 2
    left = self[0...mid_idx].unmerge
    right = self[mid_idx...self.length].unmerge
    merged = []
   until left.empty? || right.empty?
     if left.first < right.first
       merger


   end
    # p right
  end

  # [[[0,1], [2,3]][[4,5],[6,7]]]



  def merge_sort
  end
end

[1, 2, 3, 4, 5, 6].unmerge
