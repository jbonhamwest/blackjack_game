require 'minitest/autorun'
require 'card'
# Define the roles and responsibilities for each class. Figure out the objects
# (nouns),their behaviors (methods, which function as verbs), and arguments
# (function as adjectives).
# Now go to the test class and rewrite the roles and
# responbilities as tests.
# Test card can be constructed.
# Test card has a rank.
# Test card has a suit.
# Test card's rank and suit can be converted to string.
# Test card has a value for all interesting (including non-numeric) ranks.

# This class tests the cards in the game.
class CardTest < MiniTest::Unit::TestCase
  def test_that_card_can_be_constructed
    card = Card.new(6, :spades)
    assert_equal :spades, card.suit
    assert_equal 6, card.rank

    card = Card.new(:K, :hearts)
    assert_equal :K, card.rank
    assert_equal :hearts, card.suit
  end

  def test_that_rank_and_suit_can_be_converted_to_a_string
    card = Card.new(3, :diamonds)
    a = card.to_s
    assert_equal '(3,diamonds)', a

    card = Card.new(:J, :clubs)
    a = card.to_s
    assert_equal '(J,clubs)', a
  end
end
