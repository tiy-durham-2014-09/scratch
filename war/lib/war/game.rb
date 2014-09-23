# require "war/deck"
require "rubycards"

module War
  class Game
    attr_accessor :player1, :player2
    attr_reader :deck, :quiet

    def initialize(quiet = false)
      @player1 = []
      @player2 = []
      @deck = RubyCards::Deck.new
      @quiet = quiet

      deal_cards
    end

    def say(output)
      puts output unless quiet
    end

    def deal_cards
      deck.shuffle!

      while deck.count > 0
        player1 << deck.draw
        player2 << deck.draw
      end
    end

    def battle
      card1 = player1.pop
      card2 = player2.pop

      pool = [card1, card2].shuffle

      find_winner(card1, card2, pool)

      say "#{player1.count} / #{player2.count}"
    end

    def world_war(prev_card1, prev_card2, pool)
      cards1 = player1.pop(4).compact
      cards2 = player2.pop(4).compact

      card1 = cards1.first || prev_card1
      card2 = cards2.first || prev_card2

      pool += cards1
      pool += cards2

      pool.shuffle!

      find_winner(card1, card2, pool)
    end

    def find_winner(card1, card2, pool)
      if card1 > card2
        player1.unshift(*pool)
        say "Player 1 wins with a #{card1.rank}!"
      elsif card2 > card1
        player2.unshift(*pool)
        say "Player 2 wins with a #{card2.rank}!"
      else
        say "WORLD WAR!!! with a #{card1.rank}"
        world_war(card1, card2, pool)
      end
    end

    def run
      i = 0
      until player1.count == 0 || player2.count == 0
        battle
        i += 1
      end
      say "Turns: #{i}"
    end
  end
end
