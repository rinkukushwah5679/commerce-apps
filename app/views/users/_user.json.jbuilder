json.extract! user, :id, :first_name, :last_name, :image, :role, :is_admin, :is_active, :avtar, :sulg, :created_at, :updated_at
json.url user_url(user, format: :json)
