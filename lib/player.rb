# This class defines the blackjack game player. The dealer also follows
# some of the same rules as a player does but not all.
require 'hand'
class Player
  def initialize
    @hand = Hand.new
  end

  def hand
    @hand
  end

  def hit_me?
    true
  end

end

# The dealer is also a player.
# can add a methoed to learn if the player gets blackjack
# blackjack?
# hand_value
