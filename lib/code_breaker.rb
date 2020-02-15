class CodeBreaker
    attr_accessor :guess

    def initialize
        @guess = {}
    end

    public 

    def make_guess(input)
        self.guess = input
    end
end

