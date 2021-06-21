json.extract! product, :id, :name, :price, :description, :quota, :interest, :active, :onsale, :stock, :discountPercentage, :bank_id, :delivery_id, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
