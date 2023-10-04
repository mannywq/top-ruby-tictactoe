require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/instructions'

TextInstructions.welcome

p1 = Player.new 'Taro', 'human'
p2 = Player.new('Tara', 'human')

p1.set_marker
p2.set_marker

game = Game.new(p1, p2)

game.play
