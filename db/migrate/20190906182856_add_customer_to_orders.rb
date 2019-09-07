class AddCustomerToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :customer, :string
    add_column :orders, :description, :text
  end
end
