def populate_initial(num)
  grid = []
  row =[]
  stack = (1..(num * (num / 2))).to_a * 2
  card_value = stack.shuffle
  num.times {
    row << []
    grid << row
  }

  grid.map do |arr|
    arr.map do |el|
      until el.length == num
        new_card_val = card_value.pop
        el << ["?", new_card_val]
      end
    end
  end

  grid[0]

end

 p populate_initial(6)

#   def populate_initial
#     stack = (1..8).to_a * 2
#     # grid = Array.new (4) {Array.new(4) {Array.new(2)}}
#
#     # grid = [[1,2,3,4], [4,3,2,1]]
# little_arr = []
# grid = []
# 4.times {grid << little_arr}
#
#     4.times {little_arr << ["?" , 0] }
#
#
#
#     grid.map do |row|
#       row.map do |col|
#          col[1] = stack.shuffle.pop
#         # end
#       end
#     end
#      grid
#
#     # big_printed
#
#   end



#
# def render
#   grid = populate_initial
#   big_printed = []
#   printed_grid = []
#   grid.each do |row|
#     row.each do |arr|
#       printed_grid << arr.first
#     end
#     big_printed << printed_grid
#     printed_grid = []
#   end
#
#   big_printed
#
# end
#
# def render_nums
#   grid = populate_initial
#   big_printed = []
#   printed_grid = []
#   grid.each do |row|
#     row.each do |arr|
#       printed_grid << arr.last
#     end
#     big_printed << printed_grid
#     printed_grid = []
#   end
#
#   big_printed
#
# end
#
# # print render_nums
