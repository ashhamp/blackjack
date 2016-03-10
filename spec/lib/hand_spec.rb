require "spec_helper"

RSpec.describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'

  let(:hand) { Hand.new([Card.new('10', '♦'), Card.new('J', '♥')]) }

  describe ".new" do
    it "creates a Hand object" do
      expect(hand).to be_a(Hand)
    end

    it "has a cards argument that is an array of Card objects" do
      expect(hand.cards).to be_a(Array)
      expect(hand.cards.first).to be_a(Card)
    end
  end

  describe "#calculate_hand" do
    it "counts face cards as 10 points" do
      expect(hand.calculate_hand).to eq(20)
    end

    it "counts an Ace as an 11 only if it's beneficial" do
      hand_1 = Hand.new([Card.new('10', '♦'), Card.new('A', '♥')])
      expect(hand_1.calculate_hand).to eq(21)
      expect(hand_1.calculate_hand).to_not eq(11)
    end

    it "counts an Ace as 1 if it's beneficial" do
      hand_2 = Hand.new(
        [Card.new('10', '♦'), Card.new('K', '♥'), Card.new('A', '♥')]
      )
      expect(hand_2.calculate_hand).to eq(21)
      expect(hand_2.calculate_hand).to_not eq(31)
    end

    it "counts non-face cards and non-aces at face value" do
      hand_3 = Hand.new(
        [Card.new('10', '♦'), Card.new('10', '♥'), Card.new('5', '♥')]
      )
      expect(hand_3.calculate_hand).to eq(25)
    end
  end
end
