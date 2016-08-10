class Player


  def initialize(name)
    @name = name
  end

  def guess
    puts "Guess a letter!"
    player_guess = gets.chomp

    while true
      if !("a".."z").to_a.include?(player_guess)
        puts "Invalid guess! Guess again!"
        player_guess = gets.chomp
      else
        return player_guess
      end
    end

  end

  def alert_invalid_guess(player_guess)

  end

end
