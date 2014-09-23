module War
  class Card
    RANKS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    SUITS = ["Hearts", "Diamonds", "Clubs", "Spades"]

    attr_reader :suit, :rank

    def initialize(rank = RANKS.sample, suit = SUITS.sample)
      # if suit.nil?
      #   suit = ["Hearts", "Diamonds", "Clubs", "Spades"].sample
      # end
      # suit ||= SUITS.sample
      @suit = suit

      # rank ||= RANKS.sample
      @rank = rank
    end

    def <(other_card)
      self.value < other_card.value
    end

    def value
      RANKS.index(rank) + 2
    end
  end
end
