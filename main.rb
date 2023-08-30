require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/instructions'

TextInstructions.welcome

p1 = Player.new '', 'human'
p2 = Player.new('', 'human')

game = Game.new(p1, p2)

game.play
