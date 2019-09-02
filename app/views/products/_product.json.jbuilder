json.extract! product, :id, :title, :image, :price, :size, :is_active, :status, :description, :created_at, :updated_at
json.url product_url(product, format: :json)
