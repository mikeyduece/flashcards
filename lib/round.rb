require 'colorize'
require './lib/messages'
class Round
  include Messages

  attr_reader :deck, :guesses, :number_correct, :current

  def initialize(deck=nil)
    @deck = deck
    @guesses = []
    @current = 0
    @number_correct = 0
  end

  def current_card
    deck.cards[current]
  end

  def record_guess(attempt)
    @try = Guess.new(attempt, current_card)
    guesses << @try
    return @try
  end

  def next_card
    if @try.correct?
      @number_correct += 1
    elsif !@try.correct?
      deck.cards.push(deck.cards[@current])
    end
    @current += 1
  end

  def percent_correct
    ((number_correct.to_f / guesses.count.to_f) * 100).round
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards"
    puts "-"*60
    deck.cards.each do |card|
      puts "This is card number #{current + 1} out of #{deck.count}."
      puts "Question: #{card.question}"
      puts ("*"*60).blue
      response = gets.chomp.downcase
      if response.downcase == "hint"
        hint
        start
      end
      record_guess(response)
      puts guesses.last.feedback
      next_card
    end

    puts game_over
    puts "You had #{number_correct} correct answers out of #{deck.count}
          for a score of #{percent_correct}%"

  end

end
