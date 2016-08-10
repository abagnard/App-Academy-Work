class Piece

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def to_s
  end

  def empty?()
    false
  end

  def symbol() #why do we need this? all the actual pieces have this method
  end

  def valid_move?(end_move)
  end



end
