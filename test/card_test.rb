require './test/test_helper'
require './lib/card'

class CardTest < Minitest::Test

  attr_reader :card

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau")
  end

  def test_it_exists
    assert_instance_of Card, card
  end

  def test_its_been_to_alaska
    expected = "What is the capital of Alaska?"
    assert_equal expected, card.question
  end

  def test_is_knows_the_answer
    assert_equal "juneau", card.answer
  end
end
