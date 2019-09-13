class AddIsdoneToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :is_done, :boolean, default: false
    remove_column :carts, :product_id, :integer
  end
end
