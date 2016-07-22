# Anagrams
#
# # Our goal today is to write a method that determines if two given words
#  are anagrams. This means that the letters in one word can be rearranged
#  to form the other word. For example:
# #
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.

# def first_anagram?

# end
#
# def second_anagram?(first_string,second_string)
#   hash1 = Hash.new(0) #{|h, k| h[k] = []}
#   # hash2 = Hash.new(0)
#   # first_string.chars.each {|letter| hash1[letter] += 1}
#   # second_string.chars.each do |letter|
#   #   return false if hash1[letter] == 0
#   #   hash1[letter] -= 1
#   # end
#   # return true if hash1.values.all? {|el| el == 0}
#   first_string.chars.each do |letter1|
#     second_string.chars.each do |letter2|
#       hash1[letter1] += 1
#       hash1[letter2] -= 1
#     end
#   end
#
# end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

class Array

  def bsearch(target)
    return nil if self.empty?
    mid = self.length / 2
    compare = self[mid] <=> target
    if compare == 0
      return mid
    elsif compare == 1
      # p self.take(mid)
      return self.take(mid).bsearch(target)
    else
      # p self.drop(mid+1)
      answer  = self.drop(mid + 1).bsearch(target)
      return nil if answer.nil?
      answer + 1 + mid
    end
  end
end

  def two_sum?(array ,target)
    array.each_with_index do |number, i|
      new_arr = array.take(i) + array.drop(i+1)
      # p "#{target - number }"
      return true if new_arr.bsearch(target - number) #&& numbe
      #} != nil #&& (target - number) != number
    end
    false
  end

# p [1,2,3,4,5,6,7,8].bsearch(2)
  # p bsearch

# arr = [0, 1, 5, 7]
# hash = {0 => 6, 1 => 5, 5 => 5, 7 => 3}
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10)


def pair_sum?(arr, target)
  hash = Hash.new()
  # arr.each {|el| hash[target - el] = el} #if (target - el == el && hash.has_key?(el))}
  arr.each do |el|
    if hash.has_key?(el) && target - el == el
      return true
    elsif hash.has_key?(el)
      return true
    else
      hash[target - el] = el
    end
  end
  false
  # arr.each {|el| return true if hash.has_key?(el) && hash[el] != el }
  # false
end
arr = [0, 1, 5, 5, 7]
 p pair_sum?(arr, 6) # => should be true
 p pair_sum?(arr, 10)
