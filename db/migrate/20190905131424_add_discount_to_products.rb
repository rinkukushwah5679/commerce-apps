class AddDiscountToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :discount_price, :string
  end
end
