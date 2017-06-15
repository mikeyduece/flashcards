require 'colorize'
require './lib/messages'

class Round
  include Messages

  attr_reader :deck, :guesses, :number_correct, :current

  def initialize(deck=nil)
    @deck           = deck
    @guesses        = []
    @current        = 0
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
    puts ("-"*60).cyan
    deck.cards.each do |card|
      puts ("*"*60).blue
      puts "This is card number #{current + 1} out of #{deck.count}.".bold
      puts "For a hint enter 'hint', to cheat, enter 'cheat'".cyan
      puts "Question: #{card.question}"
      response = gets.chomp.downcase
      if response.downcase == "hint"
        hint
      elsif response.downcase == "cheat"
        puts "The answer is #{card.answer}.".bold.red 
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
