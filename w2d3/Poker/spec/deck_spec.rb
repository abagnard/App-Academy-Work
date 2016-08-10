require 'deck.rb'

describe Deck do
  subject(:test_deck) { Deck.new }

  describe '#initialize' do

    it 'initializes with 52 cards' do
      expect(test_deck.deck.length).to eq(52)
    end

    it 'initializes with 13 of each suit' do
      card_hash = Hash.new() { |h,k| h[k] = 0}
      test_deck.deck.each { |card| card_hash[card.suit] += 1 }
      expect(card_hash.length).to eq(4)
      expect(card_hash.values).to eq([13, 13, 13, 13])
    end

    it 'initializes with 4 of each number' do
      card_hash = Hash.new() { |h,k| h[k] = 0}
      test_deck.deck.each { |card| card_hash[card.value] += 1 }
      expect(card_hash.length).to eq(13)
      expect(card_hash.values).to eq(Array.new(13) {4})
    end

  end

  describe '#shuffle' do

    it 'shuffles the deck' do
      orig_deck = test_deck.deck
      expect(test_deck.shuffle).to_not eq(orig_deck)
    end

    it 'does not remove card from deck' do
      expect(test_deck.shuffle.length).to eq(52)
    end

  end

  describe '#draw' do

    it 'decreases the deck size by the correct number of cards' do
      test_deck.draw(5)
      expect(test_deck.length).to eq(47)
    end

    it 'can not deal more cards than remain in the deck' do
      expect(test_deck.draw(53).length).to eq (52)
    end
  end

end
