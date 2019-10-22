class AddUserToMilkshakes < ActiveRecord::Migration[5.2]
  def change
    add_reference :milkshakes, :user, foreign_key: true
  end
end
