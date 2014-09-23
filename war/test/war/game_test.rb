require "minitest/autorun"
require "war/game"
require "war/card"

module War
  class GameTest < MiniTest::Test
    def setup
      @war = Game.new(true)
    end

    def test_game_has_two_players
      refute_nil @war.player1
      refute_nil @war.player2
    end

    def test_game_has_a_deck
      assert_kind_of Deck, @war.deck
    end

    def test_players_have_26_cards
      assert_equal 26, @war.player1.count
      assert_equal 26, @war.player2.count
    end

    def test_player_with_higher_card_gets_both_cards
      @war.player1 << Card.new("K")
      @war.player2 << Card.new("4")

      count1 = @war.player1.count
      count2 = @war.player2.count

      @war.battle

      assert_equal count1 + 1, @war.player1.count
      assert_equal count2 - 1, @war.player2.count
    end

    def test_war_shifts_5_cards
      create_war_conditions

      count1 = @war.player1.count
      count2 = @war.player2.count

      @war.battle

      assert_equal count1 + 5, @war.player1.count
      assert_equal count2 - 5, @war.player2.count
    end

    def test_tied_war_results_in_more_war
      create_double_war_conditions

      count1 = @war.player1.count
      count2 = @war.player2.count

      @war.battle

      assert_equal count1 + 9, @war.player1.count
      assert_equal count2 - 9, @war.player2.count
    end

    def test_war_without_enough_cards_still_works
      @war.player1 = cards %w(3 6 8 K 2 A)
      @war.player2 = cards %w(9 5 A)

      @war.battle

      assert_equal 1, @war.player1.count
      assert_equal 8, @war.player2.count
    end

    def cards(ranks)
      ranks.map { |rank| Card.new(rank) }
    end

    def create_war_conditions
      # War cards
      @war.player1 << Card.new("A")
      @war.player2 << Card.new("5")

      3.times do
        @war.player1 << Card.new
        @war.player2 << Card.new
      end

      # First cards drawn
      @war.player1 << Card.new("9")
      @war.player2 << Card.new("9")
    end

    def create_double_war_conditions
      create_war_conditions

      3.times do
        @war.player1 << Card.new
        @war.player2 << Card.new
      end

      # First cards drawn
      @war.player1 << Card.new("3")
      @war.player2 << Card.new("3")
    end
  end
end
