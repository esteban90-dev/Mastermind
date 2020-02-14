require 'colorize'

class FeedbackCell
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
    end 

    def set_shape(new_shape)
        self.shape = new_shape
    end

end
