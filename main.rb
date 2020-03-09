require_relative './lib/game.rb'
require_relative './lib/board.rb'
require_relative './lib/code_maker.rb'
require_relative './lib/code_breaker.rb'
require_relative './lib/peg.rb'
require_relative './lib/extras.rb'
require 'colorize'

include Extras

loop do
    board_1 = Board.new(12)

    Extras.display_welcome
    Extras.display_rules
    result = Extras.play_as_code_maker?
    if result
        code_maker_1 = CodeMaker.new
        code_breaker_1 = CodeBreakerComputer.new
    else
        code_maker_1 = CodeMakerComputer.new
        code_breaker_1 = CodeBreaker.new
    end
    
    game_1 = Game.new(board_1,code_breaker_1,code_maker_1)
    game_1.play
    break if !Extras.replay?
end
