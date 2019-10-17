ingredients = [
    { name: "milk", kind: "base" },
    { name: "soy", kind: "base"},
    { name: "almond", kind: "base"},
    { name: "coconut", kind: "base"},
    { name: "chocolate", kind: "flavour"},
    { name: "vanilla", kind: "flavour"},
    { name: "strawberry", kind: "flavour"},
    { name: "banana", kind: "flavour"},
    { name: "sprinkles", kind: "topping"},
    { name: "fudge", kind: "topping"},
    { name: "waffer", kind: "topping"},
    { name: "m&m", kind: "topping"}
]

if Ingredient.count == 0 
    for ingredient in ingredients
        ingredient = Ingredient.create(ingredient)
        ingredient.create_image(url: Faker::LoremPixel.image + "?random=" + rand(1..1000).to_s)
        puts "created ingredient #{ingredient.name}"
    end
end

base_ids = Ingredient.where(kind: "base").pluck(:id)
flavour_ids = Ingredient.where(kind: "flavour").pluck(:id)
topping_ids = Ingredient.where(kind: "topping").pluck(:id)

for i in 1..50
    milkshake = Milkshake.create(
        price: rand(500..1000),
        name: Faker::Dessert.topping,
        description: Faker::Lorem.paragraph
    )

    milkshake.create_image(url: Faker::LoremPixel.image + "?random=" + rand(1..1000).to_s)

    puts "created milkshake #{milkshake.name}"

    milkshake_base_id = base_ids.sample
    milkshake_flavour_ids = flavour_ids.sample(rand(1..flavour_ids.length))
    milkshake_topping_ids = topping_ids.sample(rand(1..topping_ids.length))

    ingredient_ids = [milkshake_base_id] + milkshake_flavour_ids + milkshake_topping_ids

    ingredients = Ingredient.where(id: ingredient_ids)
    milkshake.ingredients = ingredients

    puts "added milkshake ingredients #{ingredient_ids}"
end