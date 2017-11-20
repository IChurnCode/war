class Side
  attr_accessor :height
  attr_reader :name
  
  def initialize(name, height)
    @name = name
    @height = height
  end
  
  def withStoodAttack(strength)
    height >= strength
  end
end