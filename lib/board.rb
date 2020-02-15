require './peg.rb'

class Board
    attr_reader :guesses, :feedbacks, :rounds
    attr_accessor :code, :current_round 

    def initialize(rounds=8)
        @guesses = empty_guess_array(rounds)
        @feedbacks = empty_fdbk_array(rounds)
        @code = []
        @rounds = rounds
        @current_round = 0
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

    def place_code(input)
        self.code = input
    end

    def place_guess(input)
        input.each_with_index{ |x,index| guesses[current_round][index].set_color(x) }
    end

    def increment_round
        self.current_round += 1
    end

    private 

    def empty_guess_array(rounds)
        Array.new(rounds){ Array.new(4) { Peg.new }}
    end

    def empty_fdbk_array(rounds)
        Array.new(rounds){ Array.new(4) { Peg.new }}
    end
end

a = Board.new
b = ['red','red','yellow','cyan']
a.increment_round
a.increment_round
a.place_guess(b)
a.display
