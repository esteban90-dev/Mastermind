require 'colorize'
require './lib/game.rb'
require './lib/board.rb'
require './lib/code_maker_human.rb'
require './lib/code_maker_computer.rb'
require './lib/code_breaker_human.rb'
require './lib/code_breaker_computer.rb'
require './lib/peg.rb'
require './lib/extras.rb'

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
