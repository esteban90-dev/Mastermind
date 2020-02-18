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

    def prompt_for_pegs
        i = 0
        input = []
        while i < 4
            puts "\n\tPick a color for position #{i + 1}: #{available_colors}"
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

    def play
        display_welcome
        display_rules
        code_maker.create_code
        game_loop
        display_results
    end

    def display_results
        if board.winner?
            puts "\n\n\tCongratulations, you guessed the secret code and won the game!\n\n\n"
        else
            puts "\n\n\tSorry, you lost the game!\n\n\n"
        end
    end

    private

    def available_colors
        possible_colors.map{ |x| x.colorize(x.to_sym) }.join("  ")
    end

    def display_round
        puts "\nRound #{board.current_round + 1} begins."
    end

    def display_welcome
        puts "\n\tWelcome to the game MASTERMIND!".colorize(:cyan)
    end

    def display_rules
        puts "\n\tRules:
        The codemaker chooses a pattern of four colored pegs.
        The codebreaker tries to guess the pattern, in both 
        order and color, within twelve rounds. Each guess is 
        made by placing a row of colored pegs on the decoding 
        board, picking one color peg at a time. Once placed, 
        the computer provides feedback by placing from zero 
        to four feedback pegs in the small holes of the row with 
        the guess. A red feedback peg is placed for each code peg 
        from the guess which is correct in both color and 
        position. A white feedback peg indicates the existence of 
        a correct color code peg placed in the wrong position. \n\n"
    end

    def game_loop
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
end

