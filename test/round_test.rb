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
    assert_instance_of Round, round
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
    assert_instance_of Guess, round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
  end

  def test_it_can_tell_you_if_youre_right
    round.record_guess("juneau")
    assert_equal "Correct!", round.guesses.first.feedback
  end

  # def test_it_can_traverse_the_deck
  #   round.record_guess("2")
  #   round.next_card
  #   require "pry"; binding.pry
  #   assert_equal card_2, round.current_card
  # end

  def test_it_can_count_correct
    round.record_guess("juneau")
    round.next_card
    assert_equal 1, round.number_correct
  end

  def test_it_can_move_to_next_card
    round.record_guess("juneau")
    round.next_card
    assert_instance_of Array, deck.cards
    assert_instance_of Card, deck.cards[1]
    assert_equal 2, deck.cards.count
  end

  def test_it_can_count_more_than_one_guess
    round.record_guess("2")
    assert_instance_of Guess, round.record_guess("2")
    assert_equal 2, round.guesses.count
  end

  def test_it_can_record_wrong_guess
    round.record_guess("2")
    assert_equal "Incorrect!", round.guesses.last.feedback
  end

  def tst_it_can_count_correct_while_having_wrong_guesses
    assert_equal 1, round.number_correct
  end

  def test_it_can_give_percentage_correct
    round.record_guess("juneau")
    round.next_card
    round.record_guess("2")
    assert_equal 50, round.percent_correct
  end

end
