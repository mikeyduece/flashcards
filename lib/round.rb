class Round
  attr_reader :deck

  def initialize(deck=nil)
    @deck = deck
  end

  def guesses
    []
  end
end
