json.extract! order, :id, :name, :email, :address, :created_at, :updated_at
json.url order_url(order, format: :json)
