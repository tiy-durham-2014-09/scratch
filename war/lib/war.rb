require "deck"

class War
  attr_reader :player1, :player2, :deck

  def initialize
    @player1 = []
    @player2 = []
    @deck = Deck.new

    deal_cards
  end

  def deal_cards
    deck.shuffle

    while deck.count > 0
      player1 << deck.draw
      player2 << deck.draw
    end
  end

  def battle
    card1 = player1.pop
    card2 = player2.pop

    pool = [card1, card2].shuffle

    if card1.value > card2.value
      player1.unshift(*pool)
      puts "Player 1 wins with a #{card1.rank} vs a #{card2.rank}."
    elsif card2.value > card1.value
      player2.unshift(*pool)
      puts "Player 2 wins with a #{card2.rank} vs a #{card1.rank}."
    else
      puts "WORLD WAR!!! with a #{card1.rank}"
      world_war(card1, card2, pool)
    end
    puts "#{player1.count} / #{player2.count}"
  end

  def world_war(prev_card1, prev_card2, pool)
    cards1 = player1.pop(4).compact
    cards2 = player2.pop(4).compact

    card1 = cards1.last || prev_card1
    card2 = cards2.last || prev_card2

    pool += cards1
    pool += cards2

    pool.shuffle!

    if card2.nil? || card1.value > card2.value
      player1.unshift(*pool)
      puts "Player 1 wins the WORLD WAR with a #{card1.rank}!"
    elsif card1.nil? || card2.value > card1.value
      player2.unshift(*pool)
      puts "Player 2 wins the WORLD WAR with a #{card2.rank}!"
    else
      puts "MORE WORLD WAR!!! with a #{card1.rank}"
      world_war(card1, card2, pool)
    end
  end

  def run
    i = 0
    until player1.count == 0 || player2.count == 0
      battle
      i += 1
    end
    puts "Turns: #{i}"
  end
end
