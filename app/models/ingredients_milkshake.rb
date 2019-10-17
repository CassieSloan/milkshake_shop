class IngredientsMilkshake < ApplicationRecord
  belongs_to :milkshake
  belongs_to :ingredient
end
