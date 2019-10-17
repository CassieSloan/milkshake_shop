class MilkshakesController < ApplicationController

    def index
        @milkshakes = Milkshake.all
    end

end
