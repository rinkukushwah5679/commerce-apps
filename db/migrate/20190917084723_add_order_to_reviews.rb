class AddOrderToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :order_id, :integer
  end
end
