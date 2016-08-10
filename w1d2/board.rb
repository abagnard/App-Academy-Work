require_relative "card.rb"

class Board
  attr_accessor :grid, :face_value

  def initialize(grid, face_value)
    # @grid = Array.new (4) {Array.new(4)}
    @grid = []
    @face_value = Card.new
  end

  def [](row,col)
    @grid[row, col]
  end

  def []=(row, col, symbol)
    @grid[row, col] = symbol
  end


  def populate_initial(num)
    row =[]
    stack = (1..(num * (num / 2))).to_a * 2
    card_value = stack.shuffle
    num.times {
      row << []
      @grid << row
    }

    @grid.map do |arr|
      arr.map do |el|
        until el.length == num
          new_card_val = card_value.pop
          el << ["?", new_card_val]
        end
      end
    end

    @grid = @grid[0]

  end

  def update_board(guess1, guess2)
    if !@game.match?(guess1, guess2)
      @grid[*guess1][0] = "?"
      @grid[*guess2][0] = "?"
    else
      @grid[*guess1][0] = nil
      @grid[*guess2][0] = nil
    end
    @grid.render
  end


  def render
    big_printed = []
    @grid.each do |row|
      printed_grid = []
      row.each {|arr| printed_grid << arr.first}
      big_printed << printed_grid
    end
    big_printed
  end


  def won?
    shown_values = @grid.flatten.select.with_index {|el, i| !i.odd?}
    shown_values.all? {|el| el == nil}
  end

  def reveal(guess)
    @grid[*guess][0] = @grid[*guess][1]
    p @grid.render
  end


end




  #   # card_hash = {face => "blank"}
  #   # (0...self.length).each do |row|
  #   #   (0...self.length).each do |col|
  #   #     self[row, col] =
  #   pos_value_hash = Hash.new(@grid.flatten.length)
  #   pos_value_hash.each do |position, value|
  #     (0...grid.length).each do |row|
  #       (0...grid.length).each do |col|
  #         position = [row, col]
  #         value = {"shown" => 0, "face" => 1} #@card.stack.shuffle.pop}
  #       end
  #     end
  #   end
  #   pos_value_hash
  #
  #   (0...grid.length).each do |row|
  #     (0...grid.length).each do |col|
  #
  #
  #
  # end



  # def populate_initial
  #   little_arr = []
  #   4.times {@grid << little_arr}
  #   4.times {little_arr << ["?" , 0] }
  #   @grid.map do |row|
  #     row.map do |col|
  #       col[1] = stack.shuffle.pop
  #     end
  #   end
  #   @grid
  # end
