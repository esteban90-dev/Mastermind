require 'colorize'
require_relative './lib/game.rb'
require_relative './lib/board.rb'
require_relative './lib/code_maker_human.rb'
require_relative './lib/code_maker_computer.rb'
require_relative './lib/code_breaker_human.rb'
require_relative './lib/code_breaker_computer.rb'
require_relative './lib/peg.rb'
require_relative './lib/extras.rb'

include Extras

def replay?
    input = 0
    puts "Would you like to play again? Enter Y/N."
    loop do
        input = gets.chomp.upcase
        break if "YN".include?(input)
        puts "Please enter valid input."
    end
    input == "Y"
end

loop do
    board_1 = Board.new(3)
    code_maker_1 = CodeMakerComputer.new
    code_breaker_1 = CodeBreakerHuman.new

    game_1 = Game.new(board_1,code_breaker_1,code_maker_1)
    game_1.play
    break if !replay?
end
