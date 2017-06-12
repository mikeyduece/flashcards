require './test/test_helper'
require './lib/round'

class RoundTest < Minitest::Test
  attr_reader :round

  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    @round = Round.new(deck)
  end

  def test_it_exists
    round = Round.new
  end

  def test_it_can_hold_a_deck
    assert_instance_of Deck, round.deck
  end

  def test_it_can_hold_guess
    assert_equal [], round.guesses
  end

end
