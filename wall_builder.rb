class WallBuilder

  def initialize(wall, attacks)
    @wall = wall
    @attacks = attacks
  end

  def calculateDefeatCount
    @defeatCount = 0
    attack_by_day = Array.new
    
    @attacks.each do |day_attack|
      attack_by_side = Hash.new
      day_attack.each do |attack|
        unless attack_by_side.key?(attack.side)
          attack_by_side[attack.side.to_sym] = attack.strength
        else
          attack_by_side[attack.side.to_sym] += attack.strength
        end
      end
      attack_by_day << attack_by_side
    end
    
    
    #find number of defeated sides at the end of each day
    
    attack_by_day.each do |att|
      att.each do |side_name, strength|
        
        
        side = @wall.getSideByName(side_name)
        unless side.withStoodAttack(strength)
          @defeatCount += 1 
          raiseWallAgain(side, strength)
        end
      end
    end
  @defeatCount
  end

  private
  
  def raiseWallAgain(side, strength)
    @wall.sides.detect { |s| s == side }.height = strength
  end
  
end