# Given a list of integers find the smallest number in the list.
#
# Example:
  def my_min(list)
    min_el = list.first
    (1...list.length).each do |index|
      (index + 1...list.length).each do |index2|
        if list[index] < list[index2]  && min_el > list[index]
          min_el = list[index]
        end
      end
    end
    min_el
  end

  def my_min2(list)
    min_el = list.first
    (1..list.length - 1).each do |index|
      min_el = list[index] if list[index] < min_el
    end
    min_el
  end

    # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    # p my_min(list)  # =>  -5


    # def largest_contiguous_subsum(list)
    #   cont_subs = []
    #   (1...list.length).each do |index|
    #     (index...list.length).each do |index2|
    #       cont_subs << list[index..index2]
    #     end
    #   end
    #   max_sum = list.first
    #   cont_subs.each do |array|
    #     temp_sum = array.inject[0](:+)
    #     if temp_sum > max_sum
    #       max_sum = temp_sum
    #     end
    #   end
    #   max_sum
    # end

    def largest_contiguous_subsum1(list)
      largest_sum = 0
      temp_sum = 0
      (0...list.length).each do |i|
        if temp_sum + list[i] < 0
          temp_sum = 0
        else
          temp_sum = temp_sum + list[i]
          largest_sum = temp_sum if temp_sum > largest_sum
        end

      end
      largest_sum
    end

      list = [5, 3, -7]
      p largest_contiguous_subsum1(list)


    # You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.
    #
    # Example:
    #
    #     list = [5, 3, -7]
    #     largest_contiguous_subsum(list) # => 8
    #
    #     # possible sub-sums
    #     [5]           # => 5
    #     [5, 3]        # => 8 --> we want this one
    #     [5, 3, -7]    # => 1
    #     [3]           # => 3
    #     [3, -7]       # => -4
    #     [-7]          # => -7
    # Example 2:
    #
    #     list = [2, 3, -6, 7, -6, 7]
    #     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
