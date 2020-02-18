class CodeMakerComputer < CodeMakerHuman
    def initalize
    end

    public

    def create_code
        4.times { code << get_random_color }
    end

    private

    def get_random_color
        colors = ['red','green','yellow','blue','magenta','cyan']
        colors[rand(0...colors.length)]
    end
end
