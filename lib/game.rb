class Game
    attr_reader :board, :possible_colors 
    attr_accessor :code_maker, :code_breaker

    def initialize(board=0, code_breaker=0, code_maker=0)
        @board = board
        @code_breaker = code_breaker
        @code_maker = code_maker
        @possible_colors = Extras::AVAILABLE_COLORS
    end

    public

    def play
        get_secret_code
        if code_breaker.class == CodeBreakerHuman
            game_loop_human_guesser
        else
            game_loop_computer_guesser
        end
        display_results
    end

    private

    def prompt_for_pegs
        i = 0
        input = []
        while i < 4
            puts "\n\tPick a color for position #{i + 1}: #{get_available_colors_in_color}"
            input << gets.chomp.downcase
            if possible_colors.none?(input[-1])
                input.pop
                puts "\n\tPlease enter valid input!".colorize(:red)
            else
                i += 1
            end
        end
        input
    end

    def display_results
        if board.winner?
            Extras.display_winner_message
        else
            Extras.display_loser_message
        end
    end

    def get_available_colors_in_color
        possible_colors.map{ |x| x.colorize(x.to_sym) }.join("  ")
    end

    def display_round
        puts "\n\n\nRound #{board.current_round + 1} begins."
    end

    def get_secret_code
        if code_maker.class == CodeMakerComputer
            code_maker.create_code
        else
            code_maker.code = prompt_for_pegs
        end
    end

    def game_loop_human_guesser
        loop do 
            display_round
            code_breaker.guess = prompt_for_pegs
            board.place_code(code_maker.code)
            board.place_guess(code_breaker.guess)
            board.display
            break if board.game_over?
            board.increment_round
        end
    end

    def game_loop_computer_guesser
        board.place_code(code_maker.code)
        loop do
            display_round
            if board.current_round == 0
                code_breaker.make_initial_guess
            else
                code_breaker.make_next_guess(board.red_fdbk, board.wht_fdbk)
            end
            puts "Computer is thinking...."
            sleep 2
            board.place_guess(code_breaker.guess)
            board.display
            break if board.game_over?
            board.increment_round
        end
    end
end

