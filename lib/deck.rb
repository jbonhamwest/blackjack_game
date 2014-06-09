# This class defines the deck.
# The deck's role is to be able to represent a collection of cards, to be able
# to randomize (shuffle) the cards, and take cards out of the deck.
class Deck
  def initialize(quantity)
    @deck = []
  end

  def deck
    @deck
  end

  def quantity
    @deck.size
=begin
Anytime you have a class with a collection, you need to include a method for tracking the size.
=end
  end

  def create_deck
    # the variable index is set to= 0, which means when we call the method create_deck,
    #  no cards have yet been created.
    # this method gives you all 13 cards from one suit. This is repeated for all four suits
    # after 13 cards have been created, index will be set to 1.
    index = 0
    while index < 4
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
    end # while
  end # create_deck

  def draw
    # use the pop method on @deck to indicate one card has been turned over
  end

  def cards_left
  end

  def shuffle!
    # .shuffle method will work on @deck
  end

  def size
  end

  def test_that_deck_has_52_cards
  end
end

# Call a draw; make a finite deck. Card can have a random suit,
# random rank.
