class Milkshake < ApplicationRecord
    has_many :ingredients_milkshakes
    has_many :ingredients, through: :ingredients_milkshakes
    has_one :image, as: :imageable
end
