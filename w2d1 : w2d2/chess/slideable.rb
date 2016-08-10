
module Slideable

  DIAG_MOVES = [
    [1, 1],
    [1, -1]
    [-1, 1]
    [-1, -1]
  ]

  HORIZONTAL_MOVES = [
    [0, 1],
    [0, -1],
    [1, 0],
    [-1, 0]
  ]

  def moves
  end

  def move_dir()
  end

  def horizontal_dir(pos)
    x,y = pos
    possible_pos = []

    (0..7).each do |i|
      next if i == x
      possible_pos << [i, y]
    end
    (0..7).each do |j|
      next if j == y
      possible_pos << [x, j]
    end

    possible_pos
  end


  def diagonal_dir()
    x, y = pos
    possible_pos = []

    (0..6).each do |increment|
      possible_pos << [x + increment, y + increment]
      possible_pos << [x - increment, y - increment]
      possible_pos << [x + increment, y - increment]
      possible_pos << [x - increment, y + increment]
    end
    #pos..it can only go up/over by one or down/over by one until end of the board
    #pos = x, y
    #pos = x+1, y+1
    #pos = x-1, y-1
    #pos = x+1, y-1
    #pos = x-1, y+1

  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end

end
