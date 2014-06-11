# This class defines card.

# Define the roles and responsibilities for each class. Figure out the objects
# (nouns),their behaviors (methods, which function as verbs), and arguments
# (function as adjectives).
#
# Implementation: now go to the test class and rewrite the roles and
# responbilities as tests.

class Card # begin the creation of the class Card.
  # A class is a template to be used to manage the objects of that type.
  def initialize(rank, suit) # The initialize method is used during the new method
    # to fill in the contents of the class. The arguments rank and suit in this method
    # are the values the object is filled with.
    @rank = rank # The instance variable is assigned the value of the argument "rank".
    @suit = suit # The instance variable is assigned the value of the argument "suit".
  end #the method ends here

  def rank # This type of method is called an "accessor" method;
    # it can only access the instance variable "rank"--the getter. If we don't do this
    # the instance variable is not accessible to things outside their own class.
    @rank
  end

  def suit
    @suit
  end
  # goes below the class definition (which includes its methods) above so card exists, has its traits
  # and you can now do something with it

  def to_s
    ret = "(#{@rank},#{@suit})"
  end
end
