require './test/test_helper'
require './lib/card_generator'

class ClassGeneratorTest < Minitest::Test
  def test_it_exists
    card_gen = CardGenerator.new("./cards.txt")
    assert_instance_of CardGenerator, card_gen
  end

  def test_it_can_load_file
    card_gen = CardGenerator.new("./cards.txt")
    assert File.exists?("./cards.txt")
  end

  def test_it_can_count_cards
    card_gen = CardGenerator.new("./cards.txt")
    assert_equal 4, card_gen.cards.count
  end
end
