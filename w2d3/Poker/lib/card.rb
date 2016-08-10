

class Card

  attr_accessor :value, :suit, :string

  CARDS = ['A', '2', '3', '4', '5', '6', '7',
          '8', '9', '10', 'J', 'Q', 'K', 'A']

  def initialize(char, suit)
    @string = char
    @value = ((CARDS.index(@string) - 1) % 13) + 2
    @suit = suit
  end

  def <=>(card_2)
    value = self.value - card_2.value
    case
    when value < 0
      -1
    when value == 0
      0
    when value > 0
      1
    end
  end

end
