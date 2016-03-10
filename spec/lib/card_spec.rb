require "spec_helper"
RSpec.describe Card do

  let(:card) { Card.new('7', '♦')}
  let(:card_face) { Card.new('J', '♥')}

  describe '.new' do
    it "creates card object" do
      expect(card).to be_a(Card)
    end

    it "creates a card object with a rank" do
      expect(card.rank.to_i).to eq(7)
    end

    it "creates a card object with a suit" do
      expect(card.suit).to eq('♦')
    end
  end

  describe '#face_card?' do
    it "returns true if card is a face card" do
      expect(card_face.face_card?).to eq(true)
    end

    it "returns false if not face card" do
      expect(card.face_card?).to eq(false)
    end
  end

  describe '#ace?' do
    it "returns true if card is an ace" do
      ace_card = Card.new('A', '♥')
      expect(ace_card.ace?).to eq(true)
    end

    it "returns false if card is not an ace" do
      expect(card.ace?).to eq(false)
    end
  end

end
