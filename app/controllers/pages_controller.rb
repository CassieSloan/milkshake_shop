class PagesController < ApplicationController

    def home
        @flavour_count = Ingredient.flavour.count
        @topping_count = Ingredient.topping.count
    end

end