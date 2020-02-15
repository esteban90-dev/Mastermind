class CodeBreaker
    attr_accessor :position, :color

    def initialize
        @position = 0
        @color = ''
    end

    public 

    def make_guess(position, color)
        self.position = position
        self.color = color.to_s
    end
end