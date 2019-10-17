class CreateIngredientsMilkshakes < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients_milkshakes do |t|
      t.refrences :milkshake
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
