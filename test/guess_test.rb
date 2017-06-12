require './test/test_helper'
require './lib/guess'

class GuessTest < Minitest::Test

  def test_its_a_thing
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Guess, guess
  end

  def test_guess_pulls_right_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Card, guess.card
    assert_equal "juneau", guess.response
    assert guess.correct?
  end

  def test_it_gives_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_it_can_pull_another_card_and_tell_difference_in_answers
    card = Card.new("Which planet is closest to the Sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal "Incorrect!", guess.feedback
    refute guess.correct?
  end

end
