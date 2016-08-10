require 'card.rb'

describe Card do
  describe '#initialize' do
    subject(:test_card) { Card.new('J', 'H') }

    it 'initializes with character and suit' do

      expect(test_card.string).to eq('J')
      expect(test_card.suit).to eq('H')
      expect(test_card.value).to eq(11)
    end

    it 'initializes with valid suit' do
      expect(['H', 'S', 'D', 'C'].include?(test_card.suit)).to be true
    end

  end
end
