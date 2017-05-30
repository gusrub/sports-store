json.extract! product, :id, :name, :description, :category_id, :enabled, :created_at, :updated_at
json.url product_url(product, format: :json)
