class AddKindToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :kind, :integer
  end
end
