require_relative 'piece'

class Knight < Piece
  def initialize(board,pos,color)
    super
  end

  def symbol
    :H
  end

  def to_s
    " ♞ ".colorize({color: @color})
  end

  def move_dirs

  end
end
