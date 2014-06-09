# This is a game of blackjack.
require 'card'
require 'deck'
require 'player'
# Anything that is calculated you don't have to initialize.
# This is a game of blackjack.
class Blackjack
  def initialize
    # @deck = Deck.new
    # @deck.shuffle
    @dealer = Player.new
    @deck = Deck.new
    @players = []
  end

  def dealer
    @dealer
  end

  def deck
    @deck
  end

  def players
    @players
  end      

  def play
  end


  def numerical_rank
    case @rank
    when :A then 1
    when :J then 10
    when :Q then 10
    when :K then 10
    end
  end

  def finished
    # return true
    # You may also notice the lack of a return statement.
    # It is unneeded because a ruby function returns the last thing
    # that was evaluated in it.
    # Use of a return statement here is permissible but unnecessary.
  end
end
