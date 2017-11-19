class Side
  def initialize(name, height)
    @name = name
    @height = height
  end
  def getName
    @name
  end
  def setHeight(value)
        @height = value
  end
  def getHeight
    @height
  end
  def withStoodAttack(strength)
    height >= strength
  end
end
class Wall
  def initialize(sides_hash)
    @sides = Array.new
    sides_hash.each do |name, height|
      side = Side.new(name, height)
      @sides << side
    end
  end
  def getSides
    @sides
  end
  
  
  def getSideByName(name)
    @sides.detect { |side| side.getName == name }
  end
end
class Attack
  def initialize(tribe, side, strength)
    @tribe = tribe
    @side = side
    @strength = strength
  end
  def AttackSide
    @side
  end
  def AttackStrength
    @strength
  end
end
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
        unless attack_by_side.key?(attack.AttackSide)
          attack_by_side[attack.AttackSide.to_sym] = attack.AttackStrength
        else
          attack_by_side[attack.AttackSide.to_sym] += attack.AttackStrength
        end
      end
      attack_by_day << attack_by_side
    end
    
    
    #find number of defeated sides at the end of each day
    
    attack_by_day.each do |att|
      att.each do |side_name, strength|
        
        
        side = @wall.getSideByName(side_name)
        unless side.getHeight >= strength #s.withStoodAttack(strength)
          @defeatCount += 1 
          raiseWallAgain(side, strength)
        end
      end
    end
  @defeatCount
  end
  private
  def raiseWallAgain(side, strength)
    @wall.getSides.detect { |s| s == side }.setHeight(strength)
  end
  
end

sides = { :N => 0, :E => 0, :S => 0, :W => 0 }
wall = Wall.new(sides)
a1 = Attack.new('T1','N',3)
a2 = Attack.new('T2','S',4)
a3 = Attack.new('T3','W',2)
day1_attack = Array.new
day1_attack << a1
day1_attack << a2
day1_attack << a3
a4 = Attack.new('T1','E',4)
a5 = Attack.new('T2','N',3)
a6 = Attack.new('T3','S',2)
day2_attack = Array.new
day2_attack << a4
day2_attack << a5
day2_attack << a6
a7 = Attack.new('T1','W',3)
a8 = Attack.new('T2','E',5)
a9 = Attack.new('T3','N',2)
day3_attack = Array.new
day3_attack << a7
day3_attack << a8
day3_attack << a9
attacks = Array.new
attacks << day1_attack
attacks << day2_attack
attacks << day3_attack
wallBuilder = WallBuilder.new(wall, attacks)
puts wallBuilder.calculateDefeatCount
