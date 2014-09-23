class Card
  include Comparable

  RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  SUITS = ["Hearts", "Diamonds", "Clubs", "Spades"]

  attr_reader :suit, :rank

  def initialize(rank = nil, suit = nil)
    # if suit.nil?
    #   suit = ["Hearts", "Diamonds", "Clubs", "Spades"].sample
    # end
    suit ||= SUITS.sample
    @suit = suit

    rank ||= RANKS.sample
    @rank = rank
  end

  def value
    RANKS.index(rank) + 2
  end

  def <=>(other)
    if self.value < other.value
      -1
    elsif self.value > other.value
      1
    elsif self.value == other.value
      0
    end
  end

  # def <(other)
  #   (self <=> other) == -1
  # end
  #
  # def >(other)
  #   (self <=> other) == 1
  # end
  #
  # def ==(other)
  #   (self <=> other) == 0
  # end
  #
  # def >=(other)
  #   self > other || self == other
  # end
  #
  # def <=(other)
  #   self < other || self == other
  # end
  #
  # def between?(card1, card2)
  #   self >= card1 && self <= card2
  # end
end

card1 = Card.new
card2 = Card.new
card3 = Card.new

#----

module Domesticatable
  def friendly?
    true
  end

  def pet
    @happy = true
    ""
  end
end

class Animal
end

class Feline < Animal
  attr_accessor :color

  def initialize(color)
    @color = color
  end
end

class Dog < Animal
  include Domesticatable

  def wag
    super
  end
end

class Cat < Feline
  include Domesticatable

  def pet
    super
    "purrr"
  end
end

class MountainLion < Feline
end


morris = Cat.new(:orange)
fido = Dog.new
fang = MountainLion.new(:tawny)
