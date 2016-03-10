
require_relative "deck"
require_relative "card"
require_relative "hand"


deck = Deck.new

player_cards = deck.deal(2)
player_hand = Hand.new(player_cards)
player_score = player_hand.calculate_hand

computer_cards = deck.deal(2)
computer_hand = Hand.new(computer_cards)
computer_score = computer_hand.calculate_hand


puts "Welcome to Blackjack!\n\n"

player_cards.each do |card|
  print "Player was dealt #{card.rank}#{card.suit}\n"
end

puts "Player score: #{player_score}\n"

while true
  print "\nHit or stand (H/S): "
  move = gets.chomp.downcase

  if move == 'h'
    hit_card = deck.deal(1).first
    player_hand.cards << hit_card
    player_score = player_hand.calculate_hand

    puts "\nPlayer was dealt #{hit_card.rank}#{hit_card.suit}"
    puts "Player score: #{player_score}\n"

    if player_score > 21
      puts "\nBust! You lose..."
      break
    end
  elsif move == 's'
    puts "\nPlayer score: #{player_score}\n\n"

    computer_cards.each do |card|
      print "Computer was dealt #{card.rank}#{card.suit}\n"
    end

    puts "Computer score: #{computer_score}\n\n"

    while computer_score < 17

      hit_card = deck.deal(1).first
      computer_hand.cards << hit_card
      computer_score = computer_hand.calculate_hand

      puts "Computer was dealt #{hit_card.rank}#{hit_card.suit}"
      puts "Computer score: #{computer_score}\n\n"
    end

    if computer_score > 21
      puts "Computer Busts! You win."
      break
    end

    if computer_score >= 17
      puts "\nComputer stands."

      if player_score > computer_score
        puts "\nYou win!"
        break
      elsif player_score < computer_score
        puts "\nComputer wins."
        break
      elsif player_score == computer_hand
        puts "\nTie. No winner."
        break
      end
    end

  else
    puts "\ninvalid move, try again."
  end
end
