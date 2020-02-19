class CodeBreakerHuman
    attr_accessor :guess
    
    def initialize
        @guess = []
    end
end

class CodeBreakerComputer < CodeBreakerHuman
    def make_a_guess
        4.times { self.guess << Extras.get_random_color }
    end
end