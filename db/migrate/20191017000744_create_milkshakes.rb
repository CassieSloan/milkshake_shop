class CreateMilkshakes < ActiveRecord::Migration[5.2]
  def change
    create_table :milkshakes do |t|
      t.integer :price
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
