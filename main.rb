require 'colorize'
require_relative './lib/game.rb'
require_relative './lib/board.rb'
require_relative './lib/code_maker.rb'
require_relative './lib/code_breaker.rb'
require_relative './lib/peg.rb'
require_relative './lib/extras.rb'

include Extras

loop do
    board_1 = Board.new(3)
    code_maker_1 = CodeMakerHuman.new
    code_breaker_1 = CodeBreakerComputer.new

    game_1 = Game.new(board_1,code_breaker_1,code_maker_1)
    game_1.play
    break if !replay?
end
