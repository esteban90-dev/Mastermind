require_relative 'extras.rb'

class CodeBreakerHuman
    attr_accessor :guess
    
    def initialize
        @guess = []
    end
end

class CodeBreakerComputer < CodeBreakerHuman
    def make_initial_guess
        self.guess = []
        4.times { self.guess << Extras.get_random_color }
    end

    def make_next_guess(reds, whites)
        i = 0
        keep_arr = []
        shift_vals = []
        temp = []
        result = []
        
        #keep colors that earned a red peg
        while i < reds.length
            if reds[i]
                keep_arr[i] = self.guess[i]
            else
                keep_arr[i] = false
            end
            i += 1
        end
        i = 0
        
        #keep colors that earned a white peg, or get new colors
        while i < whites.length
            if whites[i] 
                shift_vals[i] = self.guess[i]
            elsif reds[i]
                shift_vals[i] = false
            else
                shift_vals[i] = Extras.get_random_color
            end
            i += 1
        end
        i = 0 
        while i < shift_vals.length
            temp.push(shift_vals[i]) if shift_vals[i] != false
            i += 1
        end
        i = 0

        #shuffle the colors that earned a white peg and new colors
        temp.prepend(temp.pop)
        
        #build new guess with colors that earned red pegs left in place and the others shuffled
        while i < self.guess.length
            if keep_arr[i] != false
                result << self.guess[i]
            else
                result << temp.shift
            end
            i += 1
        end
        self.guess = result
    end
end


a = CodeBreakerComputer.new
a.guess = ['red','red','green','blue']
reds = [false, true, false, false]
whites = [false, false, true, true]


a.make_next_guess(reds, whites)



