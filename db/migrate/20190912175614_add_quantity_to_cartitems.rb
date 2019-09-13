class AddQuantityToCartitems < ActiveRecord::Migration[5.2]
  def change
  	add_column :cart_items, :quantity, :integer, default: 1
  	remove_column :cart_items, :quintey, :string
  end
end
