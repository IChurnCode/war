class Attack
  attr_reader :side, :strength

  def initialize(tribe, side, strength)
    @tribe = tribe
    @side = side
    @strength = strength
  end
end