class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def deal
    card = @cards.pop
    return card
  end
end

deck = Deck.new([Card.new(3, "H"), Card.new(4, "H"), Card.new(5, "H")])

hand = []
hand << deck.deal

puts hand[0].rank
puts hand[1].suit

p deck.cards
