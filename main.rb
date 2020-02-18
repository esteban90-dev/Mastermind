require 'colorize'
require './lib/game.rb'
require './lib/board.rb'
require './lib/code_maker.rb'
require './lib/code_breaker.rb'
require './lib/peg.rb'

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
    board_1 = Board.new(1)
    code_maker_1 = CodeMaker.new
    code_breaker_1 = CodeBreaker.new

    game_1 = Game.new(board_1,code_breaker_1,code_maker_1)
    game_1.play
    break if !replay?
end
