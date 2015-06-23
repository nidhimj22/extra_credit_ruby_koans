$LOAD_PATH << File.dirname(__FILE__)

require 'score'
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
    
       @number_of_players.times {
         puts "Enter names of player"
         name = gets  
         name.chomp
         @players << Player.new(name)
 
       }
  
       #Keep playing until someone reached 3000
       while true
      	puts "round number -  #{@round} "
        flag = false
  			@players.each { |player|
  				player.play
          
  				if player.goodscore # check if player reached 3000 score
            flag = true
            break
          end
        }
        if flag
          break
        end
        
  			@round += 1
      end
  
  		# Play last round. 
  			@players.each do |player|
  					player.play
  	
          end
  
   winner
    
  end
  
  def winner
    i = 1
    winnerplayer = 1
    max_score = 0 
		@players.each {|player|
      puts " Player number - #{i} Player score - #{player.total}"
      
      if player.total>max_score
        winnerplayer = i 
        max_score = player.total
      end
      
      i+=1 
    }
    
    puts "Winner is Player number - #{winnerplayer} and his score is #{max_score} "
		
  end
  
  
  
end




