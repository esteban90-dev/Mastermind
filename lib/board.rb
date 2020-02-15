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
            #split the feedback cells across 2 lines
            puts "\t\t" + feedbacks[0].slice(0,feedbacks[0].length/2).map{ |x| x.get_cell }.join
            puts "\t\t" + feedbacks[0].slice(feedbacks[0].length/2, feedbacks[0].length-1).map{ |x| x.get_cell }.join
            puts guesses[i].map{ |x| x.get_cell }.join(" ")
            i += 1
        end
    end

    def place_guess_on_board(input,current_round)
        input.each_with_index{ |x,index| guesses[current_round][index].set_color(x)}
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
b = ['red','blue','yellow','cyan']
a.place_guess_on_board(b,7)
a.display


