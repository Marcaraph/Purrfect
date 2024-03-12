json.extract! cart, :id, :price, :created_at, :updated_at
json.url cart_url(cart, format: :json)
