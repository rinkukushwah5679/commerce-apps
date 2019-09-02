class AddDescriptionToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :description, :text
    add_column :categories, :user_id, :integer
    add_column :categories, :image, :string
    add_column :categories, :status, :string, default: "pending"
    add_column :categories, :is_active, :boolean, default: false
  end
end
