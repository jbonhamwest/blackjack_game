require 'minitest/autorun'
require 'hand'
require 'card'
# Define the roles and responsibilities for each class. Figure out the objects
# (nouns),their behaviors (methods, which function as verbs), and arguments
# (function as adjectives).
# Now go to the test class and rewrite the roles and
# responbilities as tests.
# - Test hand can be constructed
# - has to be able to add a single card into his hand
# - must be able to give a reference to the cards he has (the array)
# - must be able to give away all his cards
# - display info about the hand of individual cards he has (as a string)

# When you have a collection that you are going to search, you often will
# want to use a method of collectionname.include, where collection name is the name of the collection.
# in this case, it might be hand.include
# you will also want a comparison operator such as == or < so that you can find
# similar objects in the collection.

# This class tests the cards in the game.
class HandTest < MiniTest::Unit::TestCase
  def test_that_card_can_be_constructed
    hand = Hand.new
    assert_equal [], hand.contents
  end

  def test_hand_can_add_a_card
    hand = Hand.new
    card1 = Card.new(9, :clubs)
    hand.add_a_card(card1)
    card2 = Card.new(:J, :spades)
    hand.add_a_card(card2)

    assert_equal 2, hand.contents.size
    assert_equal card1, hand.contents[0]
    assert_equal card2, hand.contents[1]
  end

  def test_can_display_hand_as_string
    hand = Hand.new
    assert_equal "[]", hand.to_s

    card1 = Card.new(10, :clubs)
    hand.add_a_card(card1)
    assert_equal '[(10,clubs)]', hand.to_s

    card2 = Card.new(:K, :spades)
    hand.add_a_card(card2)
    assert_equal '[(10,clubs),(K,spades)]', hand.to_s
    # hand = hand.include ''
  end

  def test_hand_can_give_away_all_its_cards
    hand = nil
  end

end
