require './lib/card'
class Guess
  attr_reader :card, :response

  def initialize(response, card)
    @response = response.downcase
    @card = card
  end

  def correct?
    true
  end

  def feedback
    "Correct!"
  end
end
