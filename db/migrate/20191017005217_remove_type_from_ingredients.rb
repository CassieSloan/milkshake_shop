class RemoveTypeFromIngredients < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :type, :integer
  end
end
