require './side.rb'
require './wall.rb'
require './attack.rb'
require './wall_builder.rb'



sides = { :N => 0, :E => 0, :S => 0, :W => 0 }
wall = Wall.new(sides)
a1 = Attack.new('T1','S',4)
a2 = Attack.new('T1','N',2)
a3 = Attack.new('T3','W',3)
day1_attack = Array.new
day1_attack << a1
day1_attack << a2
day1_attack << a3
a4 = Attack.new('T2','S',5)
a5 = Attack.new('T2','N',1)
a6 = Attack.new('T3','N',3)
day2_attack = Array.new
day2_attack << a4
day2_attack << a5
day2_attack << a6
a7 = Attack.new('T1','W',2)
a8 = Attack.new('T1','W',4)
a9 = Attack.new('T2','N',3)
a10 = Attack.new('T2','S',4)
day3_attack = Array.new
day3_attack << a7
day3_attack << a8
day3_attack << a9
day3_attack << a10
attacks = Array.new
attacks << day1_attack
attacks << day2_attack
attacks << day3_attack
wallBuilder = WallBuilder.new(wall, attacks)
puts wallBuilder.calculateDefeatCount
