require 'colorize'
require './lib/game.rb'
require './lib/board.rb'
require './lib/code_maker.rb'
require './lib/code_breaker.rb'
require './lib/peg.rb'

board_1 = Board.new(4)
code_maker_1 = CodeMaker.new
code_breaker_1 = CodeBreaker.new

game_1 = Game.new(board_1,code_breaker_1,code_maker_1)
game_1.play
game_1.display_results