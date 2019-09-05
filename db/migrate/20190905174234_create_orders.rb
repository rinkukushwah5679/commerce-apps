class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :cart_id
      t.integer :product_id
      t.decimal :price
      t.string :status, default: "pending"
      t.integer :quantity
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :country
      t.string :address
      t.string :town
      t.string :district
      t.string :postal_code
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
