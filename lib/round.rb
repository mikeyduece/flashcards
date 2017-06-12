require './lib/guess'
class Round
  attr_reader :deck, :guesses, :number_correct

  def initialize(deck=nil)
    @deck = deck
    @guesses = []
    @current_card = 0
    @number_correct = 0
  end

  def current_card
    deck.cards[@current_card]
  end

  def record_guess(attempt)
    @try = Guess.new(attempt, current_card)
    guesses << @try
    return @try
  end

  def next_card
    if @try.correct?
      @number_correct += 1
    end
    @current_card += 1
  end

  def percent_correct
    ((number_correct.to_f / guesses.count.to_f) * 100).round
  end

end
