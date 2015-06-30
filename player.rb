class Player
  attr_accessor :id
  attr_accessor :total
  attr_accessor :goodscore
  attr_accessor :in_game
  attr_accessor :continuegame
  attr_accessor :num_dice

  def initialize(id)
    @id = id #id
    @total = 0 # score accumulated
    @in_game = false #check for 300+
    @goodscore = false #check for 3000+
    @num_dice = 5 #number of dice inititally
    @continuegame = true #stop playing if score obtained = 0 or dice left = 0
  end


  def playturn
    my_game = DiceSet.new(@num_dice)
    num,@num_dice = my_game.score

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

    @continuegame = true
    @num_dice = 5
    puts "Rolling all 5 dice..."
    playturn

    if @continuegame
      puts "There are #{@num_dice} dice left. Do you want to continue the game. y for yes. n for no"
      choice = gets.chomp
      if choice.downcase == "y"
        playturn
      else
        #do nothing
      end

    end

    if @total>=3000
      @goodscore = true
    end

  end

end

