class Board
    attr_reader :grid

    def initialize
        @grid = default_grid
    end

    public

    def display
        grid.each{ |x| puts x.join }
    end

    private 

    def default_grid
        Array.new(10){ Array.new(8){ |x| x < 4 ? 1:0 }}
    end
end

a = Board.new
a.display

