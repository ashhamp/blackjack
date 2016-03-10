class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    score = 0
    aces = 0
    @cards.each do |card|
      if card.ace?
        score += 1
        aces += 1
      elsif card.face_card?
        score += 10
      else
        score += card.rank.to_i
      end
    end

    if aces != 0 && score <= 11
      score += 10
    end

    score
  end
end
