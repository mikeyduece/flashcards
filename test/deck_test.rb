require './test/test_helper'
require './lib/deck'

class DeckTest < Minitest::Test
  attr_reader :deck
  def setup
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    @deck = Deck.new([card_1, card_2, card_3])
  end
  def test_it_exists
    deck = Deck.new
    assert_instance_of Deck, deck
  end

  def test_it_can_make_a_deck
    assert_instance_of Deck, deck
  end

  def test_it_can_store_cards
    assert_instance_of Array, deck.cards
    assert_instance_of Card, deck.cards[0]
  end

  def test_it_can_count_cards
    assert_equal 3, deck.count
  end
end
