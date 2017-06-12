require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'

card_1 = Card.new("What is 5 + 5?", "10")
card_2 = Card.new("What is Rachel's favorite animal?","red panda")
card_3 = Card.new("Who is Sal's favorite singer?","Taylor Swift")
card_4 = Card.new("Who is Ali's favorite singer?","Justin Beiber")
deck   = Deck.new([card_1,card_2,card_3,card_4])
round  = Round.new(deck)

puts "Welcome! You're playing with #{deck.count} cards"
puts "-"*60
deck.cards.each do |card|
  puts "This is card number #{round.current + 1} out of #{deck.count}."
end
