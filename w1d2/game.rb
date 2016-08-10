class Game

  attr_accessor :guess1, :guess2

  def initialize(board)
    @board = board
    @guess1 = guess1
    @guess2 = guess2
    # @board_size = board_size
  end

  def play
    size = self.get_size
    @board.populate_initial(size)

    until @board.won?
      self.turn
    end

    puts "Congrats! You won!"
  end

  def turn
    @guess1 = get_first_guess
    @board.reveal(@guess1)

    @guess2 = get_second_guess
    @board.reveal(@guess1)

    

    @board.update_board(@guess1, @guess2)
  end

  def get_first_guess
    puts "Choose a card coordinate! In the format of [row, col]"
    @guess1 = gets.chomp

    unless @board.grid[*@guess1][0] == nil
      puts "Guess again! That card is already matched"
      @board.render
      @guess1 = gets.chomp
    end


    @guess1
  end

  def get_second_guess
    puts "Choose a second card coordinate! In the format of [row, col]"
    @guess2 = gets.chomp

    unless @board.grid[*@guess2][0].is_a (FixNum)
      puts "Guess again! That card is already matched"
      @board.render
      @guess2 = gets.chomp
    end

    @guess2
  end

  def get_size
    puts "How big do you want your board to be? Choose an even number."
    gets.chomp
  end

  def match?(guess1, guess2)
    return true if @board.grid[*guess1][0] == @board.grid[*guess2][0]
    false
  end





end
