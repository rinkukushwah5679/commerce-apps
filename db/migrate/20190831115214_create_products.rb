class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :image
      t.string :price
      t.string :size
      t.boolean :is_active, default: false
      t.string :status, default: "pending"
      t.text :description

      t.timestamps
    end
  end
end
