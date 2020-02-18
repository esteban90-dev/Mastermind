class CodeBreakerComputer < CodeBreakerHuman
    def initialize
    end

    def create_guess
        4.times { guess << Extras.get_random_color }
    end
end