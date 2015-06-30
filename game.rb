$LOAD_PATH << File.dirname(__FILE__)

require 'diceset'
require 'player'

class Game

  def initialize
    @players = []
    @round = 1
    @last_round = false
  end

  def game_play
    puts "Number of players to play the game"
    temp = gets
    @number_of_players = temp.chomp.to_i
    id = 1

    @number_of_players.times {
      @players << Player.new(id)
      id =  id+1
    }

    #Keep playing until someone reached 3000
    while true
      puts ""
      puts "Round number -  #{@round} "
      flag = false
      @players.each do |player|
        player.play
        puts "Player number - #{player.id} and his score is #{player.total}"

        if player.goodscore # check if player reached 3000 score
          flag = true
          break
        end
      end
      if flag
        break
      end

      @round += 1
    end

    # Play last round.
    puts ""
    puts "Final Round"
    @players.each do |player|
      player.play
      puts "Player number - #{player.id} and his score is #{player.total}"
    end

    puts ""
    puts "Final Results"
    winner

  end


  def winner
    winners=[]
    winners << @players[0]
    tie = false

    @players.each do |player|
      puts "Player number - #{player.id} Player score - #{player.total}"

      if player.total>winners[0].total
        winners=[]
        tie = false
        winners << player
      elsif player.total == winners[0].total
        winners << player
        tie = true
      else
        #print "helo"
      end

    end

    if tie
      puts "Winner is Player number - #{winners[0].id} and his score is #{winners[0].total}"
    else
      puts "Its a tie. Winners are"
      @winners.each do |player|
        puts "Player id - #{player.id} Player score - #{player.total}"
      end
    end
  end

end

