require 'byebug'

class Hand

  attr_accessor :cards

  HAND_TYPE = {
    'royal_flush' => 10,
    'straight_flush' => 9,
    'four_of_a_kind' => 8,
    'full_house' => 7,
    'flush' => 6,
    'straight' => 5,
    'three_of_a_kind' => 4,
    'two_pair' => 3,
    'pair' => 2,
    'high_card' => 1
  }

  def initialize(cards, value = nil)
    @cards = cards
    @value = value
  end

  def check_type
    # value = [type, val_1, val_2, val_3 ... ]
    value = Array.new(6) { 0 }
    # iterate through all types, either store and return value
    # or move on to next type
  end

  def is_straight?
    return true if @cards.map {|card| card.value }.sort == [2,3,4,5,14]
    @cards.sort[0..-2].each_with_index do |card, i|
      return false unless card.value + 1 == @cards[i + 1].value
    end
    true
  end

  def is_flush?
    @cards.map { |card| card.suit }.uniq == 1
  end

  def is_straight_flush?
    is_flush? && is_straight?
  end

  def is_royal_flush?
    is_flush? && @cards.map {|card| card.value }.sort == [10, 11, 12, 13, 14]
  end

  def is_four_of_a_kind?
  end

  def is_three_of_a_kind?
  end

  def is_two_of_a_kind?
  end

  def is_two_pair?
  end

  def is_full_house?
  end

  def is_high_card?
  end




end
