require 'colorize'

class Peg
    attr_accessor :shape, :color

    def initialize(shape="\u25CB", color=:default)
        @shape = shape
        @color = color
    end

    def get_cell
        self.shape.colorize(color)
    end

    def set_color(new_color)
        self.color = new_color.to_sym
        self.shape = "\u25CF"   #need to use a solid unicode character to have a 'fill color'
    end 
end

