require "deck"

class War
  attr_reader :player1, :player2, :deck

  def initialize
    @player1 = []
    @player2 = []
    @deck = Deck.new
    @deck.shuffle

    while @deck.count > 0
      @player1 << @deck.draw
      @player2 << @deck.draw
    end
  end

  def play_round
    card1 = @player1.pop
    card2 = @player2.pop

    if card1.value > card2.value
      @player1.unshift(card1)
      @player1.unshift(card2)
      puts "Player 1 wins with a #{card1.rank} vs #{card2.rank}."
      puts "Player 1 count: #{player1.count}"
    elsif card2.value > card1.value
      @player2.unshift(card1)
      @player2.unshift(card2)
      puts "Player 2 wins with a #{card2.rank} vs #{card1.rank}."
      puts "Player 2 count: #{player2.count}"
    else
      puts "WHOOPS"
    end
  end

  def run
    until @player1.count == 0 || @player2.count == 0
      play_round
    end
    # fail "You need to add some functionality here before you can use this."
  end
end
