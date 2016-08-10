require_relative './pieces/piece'
require_relative 'pieces'
require 'byebug'

class Board
  attr_accessor :grid

def initialize()
  @grid= Array.new(8) { Array.new(8) }
end




def move_piece(start, end_pos)
    #update the grid and also the moved piece's position
    #raise exception if there is no piece at start or the piece cannot
    # make such move

    debugger

    ##pos is not a method for a piece..weird bc pos is an instance variable - wtf
    #shouldn't you be able to set a piece's pos (ie position)?

    end_piece = self[start]
    end_piece.pos = end_pos

    self[end_pos] = end_piece
    self[start] = NullPiece.instance

end

def in_bounds?(pos)
  return true if pos[0].between?(0,7) && pos[1].between?(0,7)
  false
end

def [](pos)
  x,y = pos
  @grid[x][y]
end

def []=(pos, value)
  x,y = pos
  @grid[x][y] = value
end

def create_board
  @grid[0] = [
    Rook.new(self, [0,0], :black),
    Knight.new(self, [0,1], :black),
    Bishop.new(self, [0,2], :black),
    King.new(self, [0,3], :black),
    Queen.new(self, [0,4], :black),
    Bishop.new(self, [0,5], :black),
    Knight.new(self, [0,6], :black),
    Rook.new(self, [0,7], :black)
  ]
  @grid[1] = @grid[1].map.with_index {|space, index| space = Pawn.new(self, [1, index], :black)}
  # @grid[2...-2].flatten.map! {|space| space = NullPiece.instance}
  i = 2
  while i < 6
    @grid[i].map! {|space| space = NullPiece.instance}
    i+=1
  end
  @grid[-2] = @grid[-2].map.with_index {|space, index| space = Pawn.new(self,[-2,index], :white)}
  @grid[-1] = [
    Rook.new(self, [7,0], :white),
    Knight.new(self, [7,1], :white),
    Bishop.new(self, [7,2], :white),
    Queen.new(self, [7,4], :white),
    King.new(self, [7,3], :white),
    Bishop.new(self, [7,5], :white),
    Knight.new(self, [7,6], :white),
    Rook.new(self, [7,7], :white)
  ]

end

def checkmate?
  #Check all of King's valid moves, if all of them are also valid moves
  #of opponent's pieces, then return true.
end

def find_king(color)
end


#update piece instance's location w/attr accessor
#update same on board
end

#pieces need to know how they move, direction ,etc
#board's valid move checks to see
# b= Board.new
# p b.create_board
