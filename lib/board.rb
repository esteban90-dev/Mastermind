class Board
    attr_reader :guesses, :feedbacks, :rounds
    attr_accessor :code, :current_round, :red_fdbk, :wht_fdbk

    def initialize(rounds=8)
        @guesses = create_empty_guess_array(rounds)
        @feedbacks = create_empty_fdbk_array(rounds)
        @code = []
        @rounds = rounds
        @current_round = 0
        @red_fdbk = [false, false, false, false]
        @wht_fdbk = [false, false, false, false]
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
        place_feedback
    end

    def increment_round
        self.current_round += 1
    end

    def game_over?
        winner? || loser?
    end

    def winner?
        get_feedback.select{ |x| x == 'red'}.length == 4
    end

    def loser?
        current_round == rounds - 1
    end

    private 

    def create_empty_guess_array(rounds)
        Array.new(rounds){ Array.new(4) { Peg.new }}
    end

    def create_empty_fdbk_array(rounds)
        Array.new(rounds){ Array.new(4) { Peg.new }}
    end

    def place_feedback
        input = get_feedback
        input.each_with_index{ |x,index| self.feedbacks[current_round][index].set_color(x) }
    end

    def get_current_guess
        self.guesses[current_round].map{ |x| x.get_color }
    end

    def get_feedback
        guess = get_current_guess
        i = 0
        j = 0
        result = []
        temp_guess = []
        temp_code = []
        #find red peg matches
        while i < code.length
            if code[i] == guess[i]
                result << 'red'
                red_fdbk[i] = true
                #ignore red peg matched items during the search for white pegs
                temp_code << "ignore-code"
                temp_guess << "ignore-guess"
            else
                red_fdbk[i] = false
                temp_code << code[i]
                temp_guess << guess[i]
            end
            i += 1
        end
        i = 0
        #find white peg matches
        while i < temp_code.length
            if temp_code.include?(temp_guess[i])
                wht_fdbk[i] = true
                result << 'white'
                #ignore white peg matched items during next white peg search
                while j < temp_code.length
                    if temp_code[j] == temp_guess[i]
                        temp_code[j] = "ignore-code"
                    end
                    j += 1
                end
            else
                wht_fdbk[i] = false
            end
            i += 1
        end
        result
    end
end





