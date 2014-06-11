# This class defines the blackjack game player. The dealer also follows
# some of the same rules as a player does but not all.
require 'hand'
class Player
  attr_reader :hand, :bank
  def initialize
    @hand = Hand.new
    @bank = 100
  end

  def win(chips)
    @bank += chips
  end

  def bet(chips)
    @bank -= chips
  end

  def hit_me?
    true
  end
end
