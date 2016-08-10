require 'hand.rb'

describe Hand do


  let(:straight_1) { Hand.new([
    Card.new('10', 'H'),
    Card.new('J', 'D'),
    Card.new('Q', 'C'),
    Card.new('K', 'S'),
    Card.new('A', 'H')
  ]) }

  let(:straight_flush) { Hand.new([
    Card.new('A', 'H'),
    Card.new('5', 'H'),
    Card.new('3', 'H'),
    Card.new('2', 'H'),
    Card.new('4', 'H')
  ]) }

  let(:not_straight) { Hand.new([
    Card.new('10', 'H'),
    Card.new('J', 'D'),
    Card.new('5', 'C'),
    Card.new('K', 'S'),
    Card.new('A', 'H')
  ]) }

  describe "#initialize" do
    it ""
  end

  describe '#is_straight?' do
    it 'recognizes only straights' do
      expect(straight_1.is_straight?).to be true
      expect(straight_flush.is_straight?).to be true
      expect(not_straight.is_straight?).to be false
    end
  end

  describe '#is_flush?' do
    expect(straight_flush.is_flush?).to be true
    expect(straight_1.is_flush?).to be false
  end

end
