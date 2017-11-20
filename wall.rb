require './side.rb'
class Wall
  attr_reader :sides

  def initialize(sides_hash)
    @sides = Array.new
    sides_hash.each do |name, height|
      side = Side.new(name, height)
      @sides << side
    end
  end
  
  def getSideByName(name)
    @sides.detect { |side| side.name == name }
  end
end