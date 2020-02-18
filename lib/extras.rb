module Extras
    AVAILABLE_COLORS = ['red','green','yellow','blue','magenta','cyan']
    
    def get_random_color
        colors = AVAILABLE_COLORS
        colors[rand(0...colors.length)]
    end
end