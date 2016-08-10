require_relative 'piece'

class King < Piece
  def initialize(board,pos,color)
    super
  end

  def to_s
    " ♚ ".colorize({color: @color})
  end

  def symbol
    :K
  end

  def move_dirs

  end
end
