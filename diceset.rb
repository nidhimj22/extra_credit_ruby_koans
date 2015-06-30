class DiceSet
  attr_accessor :values
  def initialize(i)
    @values = i.times.map { rand(5) + 1 }
  end

  def score
    dice = @values
    result = 0
    dice_left = dice.size
    if(dice.size < 1 or dice.size > 5)
      return result,dice_left
    else
      dice_left = dice.size
    end

    countHash = Hash.new(0)

    dice.each { |d| countHash[d] += 1 }

    countHash.each do |die, count|

      if count >= 3
        if die == 1
          result += 1000
        else
          result += (die * 100)
        end
        count -= 3
        dice_left=dice_left-3
      end

      if die==1
        result+=count * 100
        dice_left=dice_left-count
      end

      if die==5
        result+=count * 50
        dice_left=dice_left-count
      end
    end

    return result,dice_left
  end

end
