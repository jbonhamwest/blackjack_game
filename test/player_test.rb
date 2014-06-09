require 'minitest/autorun'
require 'player'
# Define the roles and responsibilities for each class. Figure out the objects
# (nouns),their behaviors (methods, which function as verbs), and arguments
# (function as adjectives).
# Now go to the test class and rewrite the roles and
# responbilities as tests.

# This class tests the players in the game.
class PlayerTest < MiniTest::Unit::TestCase
  def test_that_player_can_be_constructed
    player = Player.new
    assert_equal 0, player.hand.contents.size
  end
end
