require 'colorize'

class GuessCell
    attr_accessor :shape, :color

    def initialize(shape="\u25A1", color=:default)
        @shape = shape
        @color = color
    end

    def get_cell
        self.shape.colorize(color)
    end

    def set_color(new_color)
        self.color = new_color.to_sym
        self.shape = "\u25A0"   #need to use a solid unicode character to have a 'fill color'
    end 
end

