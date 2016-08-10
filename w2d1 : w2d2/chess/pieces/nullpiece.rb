require "singleton"
# require_relative 'piece'

class NullPiece
  include Singleton

  def initialize()
  end

  def symbol
    :N
  end

  def valid_moves()
  end

  def to_s()
    "   "
  end
  #
  # def empty?()
  #   true
  # end


end
