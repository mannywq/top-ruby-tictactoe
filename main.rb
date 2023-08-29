require_relative 'game'
require_relative 'player'

p1 = Player.new '', 'human'
p2 = Player.new('', 'human')

game = Game.new(p1, p2)

game.play
