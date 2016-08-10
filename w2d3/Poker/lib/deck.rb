require_relative 'card'

class Deck
  attr_accessor :deck

  def initialize
    @deck = create_deck
  end

  SUITS = ['H', 'S', 'D', 'C']
  CARDS = ['A', '2', '3', '4', '5', '6', '7',
          '8', '9', '10', 'J', 'Q', 'K', 'A']

  def create_deck
    new_deck = []
    SUITS.each do |suit|
      CARDS[0...-1].each do |char|
        new_deck << Card.new(char, suit)
      end
    end
    new_deck
  end

  def length
    @deck.length
  end

  def shuffle
    @deck = @deck.shuffle
  end

  def draw(num)
    drawn_cards = []
    len = @deck.length
    num = num > len ? len : num
    num.times { drawn_cards << @deck.pop }
    drawn_cards
  end

end
