require "minitest/autorun"
require "war/card"

module War
  class CardTest < MiniTest::Test
    # cards have a suit
    # have a rank
    # have a value

    def random_card
      Card.new
    end

    def test_cards_are_assigned_a_random_suit
      card = random_card
      assert Card::SUITS.include?(card.suit),
              "Suit should be one of hearts, clubs, diamonds, or spades."
    end

    def test_cards_have_their_given_suit
      card = Card.new(nil, "Hearts")
      # assert card.suit == "Hearts", "Suit should be hearts."
      assert_equal "Hearts", card.suit

      card = Card.new(nil, "Clubs")
      assert_equal "Clubs", card.suit
    end

    def test_cards_are_assigned_a_random_rank
      card = random_card
      assert Card::RANKS.include?(card.rank),
             "Card should have a random rank."
    end

    def test_cards_have_their_given_rank
      card = Card.new("2")
      assert_equal "2", card.rank

      card = Card.new("4")
      assert_equal "4", card.rank
    end

    def test_cards_have_a_value
      card = Card.new
      assert card.value, "Card should have a value."
    end

    def test_card_value_is_an_integer
      card = Card.new
      assert_kind_of Fixnum, card.value
    end

    def test_card_value_is_based_on_rank
      2.upto(10).each do |num|
        rank = num.to_s
        card = Card.new(rank)
        assert_equal num, card.value
      end

      assert_equal 11, Card.new("J").value
      assert_equal 12, Card.new("Q").value
      assert_equal 13, Card.new("K").value
      assert_equal 14, Card.new("A").value
    end
  end
end
