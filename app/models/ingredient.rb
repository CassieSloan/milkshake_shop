class Ingredient < ApplicationRecord
    has_many :ingredients_milkshakes
    has_many :milkshakes, through: :ingredients_milkshakes
    enum kind: { base: 0, flavour: 1, topping: 2 }
    has_one_attached :pic
end
