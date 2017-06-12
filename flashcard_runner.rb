require 'colorize'
require './lib/card'
require './lib/guess'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require './lib/messages'

cards = CardGenerator.new("./cards.txt").cards
deck  = Deck.new(cards)
round = Round.new(deck)
round.start
