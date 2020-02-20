class CodeBreakerHuman
    attr_accessor :guess
    
    def initialize
        @guess = []
    end
end

class CodeBreakerComputer < CodeBreakerHuman
    def make_initial_guess
        self.guess = []
        4.times { self.guess << Extras.get_random_color}
    end

    def make_next_guess(input)
        #
    end

end

