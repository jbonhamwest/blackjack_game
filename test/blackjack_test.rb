require 'minitest/autorun'
require 'blackjack'

# This is a test file for a game of blackjack.
class BlackjackTest < MiniTest::Unit::TestCase

  def test_construct_game
    game = Blackjack.new
    assert_equal 0, game.players.size
    assert_equal 0, game.dealer.hand.contents.size
    assert_equal 0, game.deck.deck.size
  end

  def test_game_play
    # assert_equal true, @game.finished
  end
end
