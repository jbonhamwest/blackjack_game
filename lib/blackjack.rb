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
      @dealer.hand.add_a_card(@deck.draw)
      @players[0].hand.add_a_card(@deck.draw)
      @dealer.hand.add_a_card(@deck.draw)
      @players[0].hand.add_a_card(@deck.draw)

      puts " player[0]: value: #{value(@players[0].hand)} #{@players[0].hand} "
      puts " dealer:    value: #{value(@dealer.hand)} #{@dealer.hand} "
      quit_game = false
      end_round = false

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
            end_round = true
          elsif value(@players[0].hand) == 21
            puts " !!!!!!Player[0] wins!!!!!!!"
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
          end_round = true
        elsif value(@players[0].hand) == 21
          puts " !!!!Dealer Wins!!!!"
          end_round = true
        end
      end

      if !end_round
        if value(@players[0].hand) > value(@dealer.hand)
          puts " !!!!!Player[0] wins!!!!!"
        else
          puts " !!!!Dealer wins!!!!"
        end
      end
      @dealer.hand.clear
      @players[0].hand.clear
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
      return_value = return_value + numerical_rank(hand.contents[index].rank)
      index = index + 1
    end
    return_value
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
