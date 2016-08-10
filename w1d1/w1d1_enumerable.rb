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
    new_arr = []
    self.my_each {|el| new_arr << el if prc.call(el) == true}
    new_arr
  end

  def my_reject(&prc)
    self - self.my_select(&prc)
  end

  def my_any?(&prc)
     self.my_each {|el| return prc.call(el) == true}
     false
  end

  def my_all?(&prc)
    self.my_each {|el| return false if prc.call(el) == false}
    true
  end



  def my_flatten()
    flat_arr = []

    self.each do |el|
      if el.is_a?(Fixnum)
        flat_arr << el
      else
        flat_arr += el.my_flatten()
      end
    end

    flat_arr
  end

  def my_zip(*arg)
    zip_array = Array.new(self.length) {Array.new}

    # (0...zip_array.length).each do |i|
    #   zip_array[i] << self[i]
    #   arg.each {|arr| zip_array[i] << arr[i]}
    # end
    new_name = zip_array.each_with_index do |el, i|
      el << self[i]
      arg.each {|arr| el << arr[i]}
    end
    new_name
  end

  def my_rotate(rotate = 1)
    if rotate > 0
      rotate.times {
        moved_el = self.shift
        self.push(moved_el)
      }
    else
      (rotate * -1).times {
        moved_el = self.pop
        self.unshift(moved_el)
      }
    end
    self
  end

  def my_join(separator = "")
    new_str = ""
    self.each do |el|
      new_str += el
      new_str += separator
    end
    return new_str[0...new_str.length-1] if !("a".."z").to_a.include?(new_str.chars.last)
    new_str[0...new_str.length]
  end

  def my_reverse
    new_array = []
    self.each {|el| new_array.unshift(el)}
    new_array
  end

end


# a = [ "a", "b", "c", "d" ]
# p a.my_reverse
# p a.my_join
# p a.my_join("&")
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(3)
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

a = [1, 2, 3]
p a.my_reject { |num| num > 1 } # => [1]
p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
