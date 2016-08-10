require_relative 'piece'

class Rook < Piece

  def initialize(board,pos,color)
    super
  end

  def symbol
    :R
  end

  def to_s
    " ♜ ".colorize({color: @color})
  end

  def move_dirs
    HORIZONTAL_MOVES
  end

end
