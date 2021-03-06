# Role and responsibilities include keeping tracking of the card set hand has,
# has to be able to add a single card into hand
# must be able to give a reference to the cards hand has (the array)
# must be able to give away all hand's cards
# display info about the hand of individual cards hand has (as a string)

# when you have a collection that you are going to search, you often will
# want to use a method of collectionname.include, where collection name is the name of the collection.
# in this case, it might be hand.include
# you will also want a comparison operator such as == or < so that you can find
# similar objects in the collection.
class Hand
  def initialize # The initialize method is used during the new method
    # to fill in the contents of the class.
    @hand = [] # The instance variable is assigned the value of the contents of the array.
    @aces = 0
  end

  def contents # This is the method that will make it possible for the hand to reference the cards it has.
    @hand
  end

  def size
    @hand.size
  end

  def add_a_card(new_card)
    @hand.push new_card
    if (new_card.rank == :A)
        @aces += 1
    end
  end
# Here there be dragons
  def to_s
    index = 0
    return_string = "["
    while (index < @hand.size)
      if index > 0
        return_string = return_string + ","
      end
      return_string = return_string + @hand[index].to_s
      index = index + 1
    end
    return_string = return_string + "]"
  end
  
  def aces?
    @aces
  end

  def clear
    return_hand = Array.new(@hand)
    @hand.clear
    @aces = 0
    return_hand
  end
end
