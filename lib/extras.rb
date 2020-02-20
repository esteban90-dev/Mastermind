module Extras
    AVAILABLE_COLORS = ['red','green','yellow','blue','magenta','cyan']

    def Extras.get_random_color
        colors = AVAILABLE_COLORS
        colors[rand(0...colors.length)]
    end

    def Extras.display_welcome
        puts "\n\tWelcome to the game MASTERMIND!".colorize(:cyan)
    end

    def Extras.display_rules
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

    def Extras.display_winner_messsage
        puts "\n\n\tCongratulations, you guessed the secret code and won the game!\n\n\n"
    end

    def Extras.display_loser_message
        puts "\n\n\tSorry, you lost the game!\n\n\n"
    end

    def Extras.replay?
        input = 0
        puts "Would you like to play again? Enter Y/N."
        loop do
            input = gets.chomp.upcase
            break if "YN".include?(input)
            puts "Please enter valid input."
        end
        input == "Y"
    end
end
