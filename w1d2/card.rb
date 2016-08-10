require_relative "game.rb"
require_relative "board.rb"

class Card

  attr_accessor :stack

  def initialize(stack)
    @stack = stack
  end


  # def get_card_deck(size)
  #   @stack = (1..size).to_a * 2
  # end


  def hide(guess1, guess2)
    @grid[*guess1][0] = "?"
    @grid[*guess2][0] = "?"
    @grid.render
  end

  def disappear(guess1, guess2)
    @grid[*guess1][0] = nil
    @grid[*guess2][0] = nil
    @grid.render
  end


  def reveal(guess)
    @grid[*guess][0] = @grid[*guess][1]
    @grid.render
  end


end
