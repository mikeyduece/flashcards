require './lib/round'
class CardGenerator
  attr_reader :filename, :cards
  def initialize(filename=nil)
    @filename = filename
    @cards = []
  end

  def cards
    File.readlines filename do |question, answer|
      cards << Card.new(question, answer)
    end
  end
end
