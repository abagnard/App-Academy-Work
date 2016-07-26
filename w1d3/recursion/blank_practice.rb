require 'byebug'
#Write a function sum_to(n) that uses recursion to
#calculate the sum from 1 to n (inclusive of n).

def sum_to(n)
  return 1 if n == 1
  n + sum_to(n-1)
end

# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil



#Write a function add_numbers(nums_array) that takes
#in an array of Fixnums and returns the sum of those
#numbers. Write this method recursively.

def add_numbers(nums_arr)
  # return nil if !nums_arr.is_a?(Array)
  return nums_arr[0] if nums_arr.length == 1
  add_numbers(nums_arr[0..-2]) + nums_arr[-1]
end

# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers() # => returns nil



#Let's write a method that will solve Gamma
#Function recursively. The Gamma Function is defined
#Γ(n) = (n-1)!.

def gamma_fnc(num)
  return nil if num == 0
  return 1 if num == 1
  (num-1) * gamma_fnc(num-1)
end

# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040



#Write a recursive method, range, that takes a start
#and an end and returns an array of all numbers
#between. If end < start, you can return the empty
#array

def range(start_yr, end_yr)
  return [] if end_yr < start_yr
  range(start_yr, end_yr - 1) << end_yr
end

# p range(2000, 2010)

def exp_1(b, n)
  return 1 if n == 0
  b * exp_1(b, n-1)

end

def exp_2(b, n)
  return 1 if power == 0
  n.even? ? power = n / 2 : power = (n-1)/2
  # if n.even?
  #   b * exp_2






end
#
# p exp_2(2, 0)
# p exp_2(2, 1)
# p exp_2(2, 2)
# p exp_2(3, 3)

class Array
  def deep_dup
    new_arr = []
    self.each do |el|
      if el.is_a?(Array)
        new_arr << el.deep_dup
      else
        new_arr << el
      end
    end
    new_arr
  end
end

# p [1, [2], [3, [4]]].deep_dup

def fibonacci(n)
  return [0,1].take(n) if n < 3

  arr = []

  arr << fibonacci(n-1)
  arr << arr[-1] + arr[-2]
end

# p fibonacci(2)
# p fibonacci(3)
# p fibonacci(5)

def bsearch(arr, target)
  mid_idx = arr.length / 2


  if arr[mid_idx] == target
    return return_idx
  elsif arr[mid_idx] < target
    bsearch(arr[mid_idx+1..-1], target)
  else

    bsearch(arr[0...mid_idx], target)
  end


end
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort
end
