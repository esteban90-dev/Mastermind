class Game
    attr_reader :board, :possible_colors

    def initialize(board=0, code_breaker=0, code_maker=0)
        @board = board
        @code_breaker = code_breaker
        @code_maker = code_maker
        @possible_colors = ['red','green','yellow','blue','magenta','cyan']
    end

    public

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

    def prompt_code_breaker
        i = 0
        input = []
        while i < 4
            #puts "\nRound #{board.current_round} begins."
            puts "\n\tPick a color for position #{i+1}: " + "red".colorize(:red) + ", " + "green".colorize(:green) + ", " + "yellow".colorize(:yellow) + ", " + "blue".colorize(:blue) + ", " + "magenta".colorize(:magenta) + ", and " + "cyan".colorize(:cyan) + "."
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
end

