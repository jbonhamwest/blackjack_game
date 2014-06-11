# This class defines the deck.
# The deck's role is to be able to represent a collection of cards, to be able
# to randomize (shuffle) the cards after each round, and take cards out of the deck
# in the course of a single game.
class Deck
  def initialize
    @deck = Array.new
    @suits = [:spades, :diamonds, :hearts, :clubs]
  end

  def deck
    @deck
  end

  def size
    @deck.size
# Any time you have a class with a collection, include a method for tracking the size.
  end

  def create_deck
    # the variable index is set to= 0, which means when we call the method create_deck,
    #  no cards have yet been created.
    # this method gives you all 13 cards from one suit. This is repeated for all four suits
    # after 13 cards have been created, index will be set to 1.
    index = 0
    while index < @suits.size
      # when the index has done this 4 times at points 0..3 of the array,
      # it has created all 13 cards in all 4 suits.
      @deck.push(Card.new(:A, @suits[index]))
      @deck.push(Card.new(2, @suits[index]))
      @deck.push(Card.new(3, @suits[index]))
      @deck.push(Card.new(4, @suits[index]))
      @deck.push(Card.new(5, @suits[index]))
      @deck.push(Card.new(6, @suits[index]))
      @deck.push(Card.new(7, @suits[index]))
      @deck.push(Card.new(8, @suits[index]))
      @deck.push(Card.new(9, @suits[index]))
      @deck.push(Card.new(10, @suits[index]))
      @deck.push(Card.new(:J, @suits[index]))
      @deck.push(Card.new(:Q, @suits[index]))
      @deck.push(Card.new(:K, @suits[index]))
      index += 1
    end # while logic
    @deck.shuffle!
  end # create_deck method

  def draw
    card = @deck.pop
    # use the pop method on @deck to indicate one card has been turned over
    if @deck.size == 0
      create_deck
    end
    card
  end

  def cards_left
    @deck.size
  end

  def shuffle!
    # .shuffle method will work on @deck
    @deck.shuffle
  end

  def size
    @deck.size
  end
end
