class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.references :imagable, polymorphic: true
      t.string :url

      t.timestamps
    end
  end
end
