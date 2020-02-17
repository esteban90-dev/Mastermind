class Game
    attr_reader :board

    def initialize(board=0, code_breaker=0, code_maker=0)
        @board = board
        @code_breaker = code_breaker
        @code_maker = code_maker
    end

    public

    def display_welcome
        "\n\tWelcome to the game MASTERMIND!"
    end

    def display_rules
        "\n\tRules:
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
            puts "\nRound #{self.board.current_round} begins."
            puts "\nPick a color for position #{i+1}: red, green, yellow, blue, magenta, and cyan."
            input << gets.chomp.downcase
            if ['red','green','yellow','blue','magenta','cyan'].none?(input[-1])
                input.pop
                puts "\nPlease enter valid input!"
            else
            i += 1
            end
        end
        input
    end


end

a = Game.new
puts a.display_welcome
puts a.display_rules
a.prompt_code_breaker