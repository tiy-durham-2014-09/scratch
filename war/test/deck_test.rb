require "minitest/autorun"
require "deck"
require "awesome_print"

class DeckTest < MiniTest::Test
  def test_deck_has_cards
    deck = Deck.new
    card = deck.draw

    assert card.rank
    assert card.suit
    assert card.value
  end

  def test_starting_deck_has_52_cards
    deck = Deck.new
    assert_equal 52, deck.count
  end

  def test_deck_knows_remaining_number_of_cards
    deck = Deck.new
    deck.draw
    assert_equal 51, deck.count
  end

  def test_deck_can_be_shuffled
    deck = Deck.new
    old_cards = deck.cards

    deck.shuffle
    new_cards = deck.cards

    # p old_cards.object_id
    # p new_cards.object_id

    refute_equal old_cards, new_cards
  end
end
