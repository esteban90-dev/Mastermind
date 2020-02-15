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

a = CodeBreaker.new
b = Hash.new
b['red'] = 0
b['blue'] = 1
b['yellow'] = 2
b['cyan'] = 3
a.make_guess(b)
puts a.guess
