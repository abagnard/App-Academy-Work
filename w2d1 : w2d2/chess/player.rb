require_relative 'display'
require 'byebug'
class Player
  attr_accessor :display, :color
  def initialize(color)
    @color = color
    @display = Display.new
  end

end


class HumanPlayer < Player
  attr_accessor :display, :color

  def initialize(color)
    super
    @display = Display.new
  end
# debugger
  def make_move()
    start_move = get_start
    end_move = get_end

    @display.board.move_piece(start_move, end_move)
  end

  def get_start
    start_move = nil
    until !start_move.nil?
      @display.render
      start_move = @display.get_input
    end
    until valid_start?(start_move)
      @display.render
      print "Invalid piece to move. Select a new piece."
      start_move = @display.get_input
    end
    start_move
  end

  def get_end
    end_move = nil
    until !end_move.nil?
      @display.render
      end_move = @display.get_input
    end
    until valid_end?(end_move)
      @display.render
      print "Invalid move. Enter new move."
      end_move = @display.get_input
    end
    end_move
  end


  def valid_start?(start_move)
    # if start_move.nil?
    #   false
    # elsif @display.board(start_move).is_a? NullPiece
    #   false
    # elsif @display.board(start_move).color == @color
    #   false
    # else
      true
    # end
  end

  def valid_end?(end_move)
    # if end_move.nil?
    #   false
    # elsif @display.board(end_move).is_a? NullPiece
    #   true
    # elsif @display.board(end_move).color == @color
    #   false
    # else
      true
    # end
end

class ComputerPlayer < Player
  def make_move()
    #must pick random valid move
  end
end
end

p = HumanPlayer.new(:black)
p.display.board.create_board
while true
  # p.display.render
  p.make_move
end
