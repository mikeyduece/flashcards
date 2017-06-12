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

end
