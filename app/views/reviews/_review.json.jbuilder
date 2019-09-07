json.extract! review, :id, :rating, :comment, :user_id, :product_id, :image, :created_at, :updated_at
json.url review_url(review, format: :json)
