require 'minitest/autorun'
require 'blackjack'

# This is a test file for a game of blackjack.
class BlackjackTest < MiniTest::Unit::TestCase

  def setup
    @game = Blackjack.new
  end

  def test_game_play
    @game.play
    # assert_equal true, @game.finished
  end

  # def test_that_ace_is_low
  #   ace = Card.new(:A, :spades)
  #   # two = Card.new(2, :hearts)
  #
  #   # assert two.greater_than?(ace)
  #   # # return true if two.greater.than?(ace) is true.
  #   # refute ace.greater_than?(two)
  #   # # return true if ace.greater_than?(two) is false.
  # end

  def test_face_card_ranks
    ten = Card.new(10, :hearts)
    jack = Card.new(:J, :spades)
    queen = Card.new(:Q, :diamonds)
    king = Card.new(:K, :clubs)

    # assert king.greater_than?(queen)
    # assert queen.greater_than?(jack)
    # assert jack.greater_than?(ten)
  end
end
