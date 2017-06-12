require './lib/guess'
class Round
  attr_reader :deck, :guesses, :number_correct, :current

  def initialize(deck=nil)
    @deck = deck
    @guesses = []
    @current = 0
    @number_correct = 0
  end

  def current_card
    deck.cards[@current]
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
    @current += 1
  end

  def percent_correct
    ((number_correct.to_f / guesses.count.to_f) * 100).round
  end

end
