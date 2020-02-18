class CodeMakerComputer < CodeMakerHuman
    def initalize
    end

    public

    def create_code
        4.times { code << Extras::get_random_color }
    end
end
