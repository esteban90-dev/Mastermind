require './guess_cell.rb'
require './feedback_cell.rb'

class Board
    attr_reader :guesses, :feedbacks, :rounds

    def initialize(rounds=8)
        @guesses = empty_guess_array(rounds)
        @feedbacks = empty_fdbk_array(rounds)
        @rounds = rounds
    end

    public

    def display
        i = 0
        while i < rounds
            puts "-------------------"
            #display first two feedback cells
            puts "\t\t" + feedbacks[0].slice(0,feedbacks[0].length/2).map{ |x| x.get_cell }.join
            #display last two feedback cells
            puts "\t\t" + feedbacks[0].slice(feedbacks[0].length/2, feedbacks[0].length-1).map{ |x| x.get_cell }.join
            puts guesses[i].map{ |x| x.get_cell }.join(" ")
            i += 1
        end
    end

    def place_guess_on_board(current_round, input)
        input.each{ |k,v| guesses[current_round][v].set_color(k)}
        input.each{ |k,v| guesses[current_round][v].set_shape("\u25A0")}
    end


    private 

    def empty_guess_array(rounds)
        Array.new(rounds){ Array.new(4) { GuessCell.new }}
    end

    def empty_fdbk_array(rounds)
        Array.new(rounds){ Array.new(4) { FeedbackCell.new }}
    end
end

a = Board.new(8)
b = {}
b['red'] = 0
b['yellow'] = 1
b['cyan'] = 2
b['blue'] = 3
a.place_guess_on_board(0,b)
a.display


