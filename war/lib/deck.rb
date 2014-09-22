require "card"

class Deck
  attr_reader :cards

  def initialize
    @cards = []

    Card::RANKS.each do |rank|
      Card::SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end

    # @cards = Card::RANKS.product(Card::SUITS).map { |combo| Card.new(*combo) }
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def draw
    @cards.pop
  end

  def count
    @cards.count
  end
end
