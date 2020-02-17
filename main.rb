require 'colorize'
require './lib/game.rb'
require './lib/board.rb'
require './lib/code_maker.rb'
require './lib/code_breaker.rb'
require './lib/peg.rb'

b = Board.new
a = Game.new
a.display_welcome
a.display_rules
a.prompt_code_breaker
b.display
