module Extras
    AVAILABLE_COLORS = ['red','green','yellow','blue','magenta','cyan']

    def get_random_color
        colors = AVAILABLE_COLORS
        colors[rand(0...colors.length)]
    end

    def replay?
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