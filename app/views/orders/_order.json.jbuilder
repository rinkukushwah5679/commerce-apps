json.extract! order, :id, :user_id, :cart_id, :product_id, :price, :status, :quantity, :first_name, :last_name, :email, :phone, :country, :address, :town, :postal_code, :is_active, :created_at, :updated_at
json.url order_url(order, format: :json)
