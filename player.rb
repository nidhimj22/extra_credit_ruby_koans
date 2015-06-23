
class Player
	attr_accessor :name
	attr_accessor :total
	attr_accessor :goodscore
	attr_accessor :in_game
	attr_accessor :continuegame
	attr_accessor :num_dice
  
  def initialize(name)
    @name = name #name of player
    @total = 0 # score accumulated 
    @in_game = false #check for 300+
    @goodscore = false #check for 3000+
    @num_dice = 5 #number of dice inititally
    @continuegame = true #stop playing if score obtained = 0 or dice left = 0 
  end
  
  
  def playturn
    my_game = DiceSet.new
    my_game.roll(@num_dice) #we are using 5 dice inititally
    num,@num_dice = score(my_game.values)

    if @num_dice==0
      @continuegame = false
    end
    
    if num>=300
      @in_game = true
    end
    
    if num<300 && !@in_game
      @continuegame = false
      end
      if @in_game
        @total = @total + num
      end
          
end
  
  def play
    #keep playing until turn complete
    @continuegame = true
    @num_dice = 5
    if @continuegame
      playturn
    end
    
    if @total>=3000
      @goodscore = true
    end
      
  end

end
