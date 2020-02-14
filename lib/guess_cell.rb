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
    end 

    def set_shape(new_shape)
        self.shape = new_shape
    end

end

a = GuessCell.new
puts a.get_cell

a.set_shape("\u25A0")
a.set_color("red")
puts a.get_cell
