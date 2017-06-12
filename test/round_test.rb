require './test/test_helper'
require './lib/round'

class RoundTest < Minitest::Test
  attr_reader :round, :card_1, :card_2, :deck

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    @deck = Deck.new([card_1, card_2])
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

  def test_it_can_draw_a_card
    assert_instance_of Card, round.current_card
  end

  def test_can_it_guess
    assert_instance_of Array, round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
    assert_instance_of Guess, round.record_guess("Juneau")[0]
  end

  def test_it_can_tell_you_if_youre_right
    # require "pry"; binding.pry
    round.record_guess("juneau")
    assert_equal "Correct!", round.guesses.first.feedback
  end

end
