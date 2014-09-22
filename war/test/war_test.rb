require "minitest/autorun"
require "war"
require "card"

class WarTest < MiniTest::Test
  def test_game_has_two_players
    game = War.new
    refute_nil game.player1
    refute_nil game.player2
  end

  def test_game_has_a_deck
    game = War.new
    assert_kind_of Deck, game.deck
  end

  def test_players_have_26_cards
    game = War.new

    assert_equal 26, game.player1.count
    assert_equal 26, game.player2.count
  end

  def test_player_with_higher_card_gets_both_cards
    higher_card = Card.new("K")
    lower_card = Card.new("4")
    game = War.new

    game.player1 << higher_card
    game.player2 << lower_card

    count1 = game.player1.count
    count2 = game.player2.count

    game.play_round

    assert_equal count1 + 1, game.player1.count
    assert_equal count2 - 1, game.player2.count
  end
end
