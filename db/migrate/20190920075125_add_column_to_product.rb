class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :soft_delete, :boolean, default: false
  end
end
