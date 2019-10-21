class Milkshake < ApplicationRecord
    has_many :ingredients_milkshakes
    has_many :ingredients, through: :ingredients_milkshakes
    validates :name, :price, presence: true
    has_one_attached :pic
end
