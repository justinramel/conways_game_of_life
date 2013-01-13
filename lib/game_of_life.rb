require 'game_of_life/god'
require 'game_of_life/world'
require 'game_of_life/cell'
require 'game_of_life/live_cell'
require 'game_of_life/dead_cell'
require 'game_of_life/console_output'
require 'game_of_life/patterns'
require 'game_of_life/game'

if __FILE__==$0
  pattern_name = ARGV[0] ||= 'gosper_glider_gun'
  size = ARGV[1] ||= 60

  game = GameOfLife::Game.new(pattern_name.to_sym, size)
  game.play(1000)
end
