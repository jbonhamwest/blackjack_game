# This is a game of blackjack.
require 'card'
require 'deck'
require 'player'
# Anything that is calculated you don't have to initialize.
# This is a game of blackjack.
class Blackjack
  attr_reader :dealer, :deck, :players, :finished
  def initialize
    @dealer = Player.new
    @deck = Deck.new
    @players = []
    @finished = false
    @house = 0
    @pot = 0
  end

  def start_a_round
    puts "\n\nLet's play a round"
    @pot = 0
    @dealer.hand.add_a_card(@deck.draw)
    @players[0].hand.add_a_card(@deck.draw)
    @dealer.hand.add_a_card(@deck.draw)
    @players[0].hand.add_a_card(@deck.draw)
  end

  def player_wins
    puts " !!!!!!Player[0] wins!!!!!!!"
    @players[0].win @pot
  end

  def player_busts
    puts " !!!Player[0] has busted!!!"
    @house += @pot
  end

  def dealer_wins
    puts " !!!!Dealer Wins!!!!"
    @house += @pot
  end

  def dealer_busts
    puts " !!!Dealer has busted!!!"
    @players[0].win @pot
  end

  def display_player
    puts " player[0]: bank: #{@players[0].bank} value: #{value(@players[0].hand)} #{@players[0].hand} "
  end

  def display_dealer
    puts " dealer:    bank: #{@house} value: #{value(@dealer.hand)} #{@dealer.hand} "
  end

  def play
    @deck.create_deck
    @players.push(Player.new)
    puts "Welcome to blackjack!"
    while !@finished
      start_a_round
      display_player
      display_dealer

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
          display_player
          players_value = value(@players[0].hand)
          if players_value > 21
            player_busts
            end_round = true
          elsif players_value == 21
            player_wins
            end_round = true
          end
        end

        if answer == "s"
          players_value = value(@players[0].hand)
          break
        end
      end

      while (end_round == false) && (value(@dealer.hand) < 17)
        @dealer.hand.add_a_card(@deck.draw)
        display_dealer
        dealers_value = value(@dealer.hand)
        if dealers_value > 21
          dealer_busts
          end_round = true
        elsif players_value == 21
          dealer_wins
          end_round = true
        end
      end

      if !end_round
        if players_value > dealers_value
          player_wins
        elsif ace?(@players[0].hand)
          # if there's an ace in the hand, the elsif statement returns true
          # test if the value of the player's is hand less than 11 and
          # test if the value of the player's hand is greater than the hand of the dealer
          if (players_value < 11) and ((players_value + 10) > dealers_value)
            player_wins
          else
            dealer_wins
          end
        else
          dealer_wins
        end
      end
      @dealer.hand.clear
      @players[0].hand.clear
      if @players[0].bank == 0
        puts "You are out of money...game over! Come and see us again, and thanks for playing!"
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
    while (index < hand.contents.size)
      return_value += numerical_rank(hand.contents[index].rank)
      index += 1
    end
    if hand.aces? > 0
      if return_value <= 11
        return_value += 10
      end
    end
    return_value
    # If there's an ace in the hand, we return the value as an 11 and the total is 21.
  end

  def ace?(hand)
    hand.aces? > 0
  end
end

game = Blackjack.new
game.play
