class CodeMaker
    attr_accessor :code

    def initialize
        @code = []
    end
end

class CodeMakerComputer < CodeMaker
    def initalize
    end

    public

    def create_code
        4.times { code << Extras.get_random_color }
    end
end
