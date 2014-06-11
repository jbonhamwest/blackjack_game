blackjack_game
==============

A simple text-oriented blackjack game written in Ruby.
Disclaimer:
I accessed the knowledge and help of student peers, instructors, and spouses to
complete and submit (collaboratively-created) code that runs successfully.



How to Run this Program
cd into the blackjack program folder and
execute ruby by tying in the following characters
-I./lib lib/blackjack.rb

Follow the prompts to play the game.

----
How to Run Tests for this Program
cd into the blackjack program folder and
execute rake by typing in the word
rake

----
Features Completed

This project was started in my first week of software development education, so I included
extensive comments to help solidify my understanding of core programming elements and structures,
and TDD methods. Typically a developer would not include this type/degree of commenting for future reference.

Bets limited to $10
Player may bet until player runs out of money
Deck is shuffled after every round
Play options are limited to hit, stand, and hold
Created shell script to execute Ruby for the blackjack program

____
Features Not Completed
Double-down
Chips undefined; were given a discreet value of $10

____
Features not Used
Inheritance: we primarily treated the Dealer as a Player and did not create a separate
dealer.rb file. Therefore, no inheritance naturally applied to these two classes. 

Future work could include:

--Convert Ruby script to binary executable.
--Make Decks and Hands Enumerable objects, if it makes sense to do so.
If it makes sense to do so, change your code to use Enumerable methods.
If it doesn't make sense, write up why in your README.
--Reduce clutter in the blackjack.play method
--Learn how to use additional iterators for arrays beyond the while loop (until, map, times, etc.).
