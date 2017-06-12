require './lib/guess'
class Round
  attr_reader :deck, :guesses

  def initialize(deck=nil)
    @deck = deck
    @guesses = []
    @current_card = 0
  end

  def current_card
    deck.cards[@current_card]
  end

  def record_guess(attempt)
    attempt = Guess.new(attempt, current_card)
    guesses << attempt
    return attempt
  end

end
