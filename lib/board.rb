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
            puts "\t-------------------"
            #split the feedback cells across 2 lines
            puts "\t\t\t" + feedbacks[i].slice(0,feedbacks[current_round].length/2).map{ |x| x.get_formatted_peg_shape }.join
            puts "\t\t\t" + feedbacks[i].slice(feedbacks[current_round].length/2, feedbacks[current_round].length-1).map{ |x| x.get_formatted_peg_shape }.join
            puts "\t" + guesses[i].map{ |x| x.get_formatted_peg_shape }.join(" ")
            i += 1
        end
    end

    def place_code(input)
        self.code = input
    end

    def place_guess(input)
        input.each_with_index{ |x,index| self.guesses[current_round][index].set_color(x) }
    end

    def place_feedback
        input = check_guess
        input.each_with_index{ |x,index| self.feedbacks[current_round][index].set_color(x) }
    end

    def increment_round
        self.current_round += 1
    end

    def game_over?
        winner? || loser?
    end

    def winner?
        check_guess == code
    end

    def loser?
        current_round == rounds
    end

    private 

    def empty_guess_array(rounds)
        Array.new(rounds){ Array.new(4) { Peg.new }}
    end

    def empty_fdbk_array(rounds)
        Array.new(rounds){ Array.new(4) { Peg.new }}
    end

    def current_guess
        self.guesses[current_round].map{ |x| x.get_color }
    end

    def check_guess
        guess = current_guess
        i = 0
        result = []
        white_pegs = 0
        temp_code = []
        temp_guess = []
        while i < code.length
            if code[i] == guess[i]
                result << 'red'
            else
                temp_code << code[i]
                temp_guess << guess[i]
            end
            i += 1
        end
        white_pegs = temp_code.map{ |x| temp_guess.include?(x) }.count{ |x| x == true}
        white_pegs.times{ result << 'white' }
        result
    end
end





