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
    @finished = false
    @house = 0
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
    @deck.create_deck
    @players.push(Player.new)
    puts "Welcome to blackjack!"
    while !@finished
      puts "\n\nLet's play a round"
      @pot = 0
      @dealer.hand.add_a_card(@deck.draw)
      @players[0].hand.add_a_card(@deck.draw)
      @dealer.hand.add_a_card(@deck.draw)
      @players[0].hand.add_a_card(@deck.draw)

      puts " player[0]: bank: #{@players[0].bank} value: #{value(@players[0].hand)} #{@players[0].hand} "
      puts " dealer:    bank: #{@house} value: #{value(@dealer.hand)} #{@dealer.hand} "
      quit_game = false
      end_round = false

      print "Bets are $10. Would you like to place a bet?"
      answer = gets.chomp

      if answer == "y"
        @pot += 10
        @players[0].bet 10
      else
        end_round = true
      end

      while !end_round
        print " hit(h), stand (s), or quit (q)? "
        answer = gets.chomp

        if answer == "q"
          end_round = true
          @finished = true
          break
        end

        if answer == "h"
          @players[0].hand.add_a_card(@deck.draw)
          puts " player[0]: value: #{value(@players[0].hand)} #{@players[0].hand}"
          if value(@players[0].hand) > 21
            puts " !!Player[0] busted!!"
            @house += @pot
            end_round = true
          elsif value(@players[0].hand) == 21
            puts " !!!!!!Player[0] wins!!!!!!!"
            @players[0].win @pot
            end_round = true
          end
        end

        if answer == "s"
          break
        end
      end

      while (end_round == false) && (value(@dealer.hand) < 17)
        @dealer.hand.add_a_card(@deck.draw)
        puts " dealer:    value: #{value(@dealer.hand)} #{@dealer.hand} "
        if value(@dealer.hand) > 21
          puts " !!!Dealer has busted!!!"
          @players[0].win @pot
          end_round = true
        elsif value(@players[0].hand) == 21
          puts " !!!!Dealer Wins!!!!"
          @house += @pot
          end_round = true
        end
      end

      if !end_round
        if value(@players[0].hand) > value(@dealer.hand)
          puts " !!!!!Player[0] wins!!!!!"
          @players[0].win @pot
        elsif ace?(@players[0].hand)
          # if there's an ace in the hand, the elsif statement returns true
          # test if the value of the player's is hand less than 11 and
          # test if the value of the player's hand is greater than the hand of the dealer
          if (value(@players[0].hand) < 11) and ((value(@players[0].hand) + 10) > value(@dealer.hand))
            puts " !!!!!Player[0] wins!!!!!"
            @players[0].win @pot
          else
            puts " !!!!Dealer wins!!!!"
            @house += @pot
          end
        else
          puts " !!!!Dealer wins!!!!"
          @house += @pot
        end
      end
      @dealer.hand.clear
      @players[0].hand.clear
      if @players[0].bank == 0
        puts "You are out of money...game over! Come and see us again and thanks for playing!"
        @finished = true
        break
      end
    end
  end

  def numerical_rank(rank)
    case (rank)
    when :A then 1
    when :J then 10
    when :Q then 10
    when :K then 10
    else
      rank
    end
  end

  def value(hand)
    index = 0
    return_value = 0
    ace_in_hand = false
    while (index < hand.contents.size)
      return_value += numerical_rank(hand.contents[index].rank)
      if hand.contents[index].rank == :A
        ace_in_hand = true
      end
      index += 1
    end
    if ace_in_hand == true
      if return_value == 11
        return_value += 10
      end
    end
    return_value
    # If there's an ace in the hand, we return the value as an 11 and the total is 21.
  end

  def ace?(hand)
    index = 0
    ace_in_hand = false
    while (index < hand.contents.size)
      if hand.contents[index].rank == :A
        ace_in_hand = true
      end
      index += 1
    end
    ace_in_hand
    # An ace was found in the hand.
  end

    def finished
    # return true
    # You may also notice the lack of a return statement.
    # It is unneeded because a ruby function returns the last thing
    # that was evaluated in it.
    # Use of a return statement here is permissible but unnecessary.
  end
end



game = Blackjack.new
game.play
