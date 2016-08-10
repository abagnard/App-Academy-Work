class Game

  def initialize(players, fragment = "", @dictionary = dictionary.txt)
    @fragment = fragment
    @players = players

  end

  def current_player
  end

  def previous_player
  end

  def next_player!
    if @players == self.previous_player
      @players = self.current_player
    else
      @players = self.previous_player
    end

  end

  def take_turn(player)
    @fragment += player.guess if self.valid_word?(player.guess)
  end

  # def valid_play?(letter)
  #   return true if "a".."z".include?(letter.downcase) && valid_word?(letter)
  #   false
  # end

  def valid_word?(letter)
     possible_frag = @fragment + letter

     File.open(dictionary.txt) do |f|
       f.any? {|line| line.include?(possible_frag)}
     end

  end

  def play_round
  end


end
